-- Sauvegarde en ligne du jeu « Coloriage par numéros ».
-- Appliqué dans le projet Supabase « scan-prix » (migration coloriage_saves).
-- Une ligne par code de famille. Le code n'est jamais stocké : seulement son empreinte SHA-256.
create table public.coloriage_saves (
  code_hash  text primary key,
  data       jsonb not null,
  updated_at timestamptz not null default now()
);

-- Aucun accès direct : RLS activé sans politique. Tout passe par les deux fonctions ci-dessous.
alter table public.coloriage_saves enable row level security;
revoke all on public.coloriage_saves from anon, authenticated;

create or replace function public.coloriage_get(p_code text)
returns jsonb language sql security definer set search_path = '' as $$
  select jsonb_build_object(
           'data', s.data,
           'updated_at', to_char(s.updated_at at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.US'))
  from public.coloriage_saves s
  where length(p_code) between 16 and 64
    and s.code_hash = encode(sha256(convert_to(p_code, 'utf8')), 'hex');
$$;

create or replace function public.coloriage_put(p_code text, p_data jsonb)
returns text language plpgsql security definer set search_path = '' as $$
declare
  h text;
  t timestamptz;
begin
  if p_code is null or length(p_code) < 16 or length(p_code) > 64 then
    raise exception 'code invalide';
  end if;
  if p_data is null or jsonb_typeof(p_data) <> 'object' or pg_column_size(p_data) > 3000000 then
    raise exception 'donnees invalides';
  end if;
  h := encode(sha256(convert_to(p_code, 'utf8')), 'hex');
  if not exists (select 1 from public.coloriage_saves where code_hash = h)
     and (select count(*) from public.coloriage_saves) >= 20000 then
    raise exception 'limite atteinte';
  end if;
  insert into public.coloriage_saves as s (code_hash, data, updated_at)
  values (h, p_data, now())
  on conflict (code_hash) do update set data = excluded.data, updated_at = now()
  returning s.updated_at into t;
  return to_char(t at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.US');
end;
$$;

revoke all on function public.coloriage_get(text) from public;
revoke all on function public.coloriage_put(text, jsonb) from public;
grant execute on function public.coloriage_get(text) to anon, authenticated;
grant execute on function public.coloriage_put(text, jsonb) to anon, authenticated;
