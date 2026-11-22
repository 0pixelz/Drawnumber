-- Classement des duels du jeu « Coloriage par numéros ».
-- Appliqué dans le projet Supabase « scan-prix » (migration coloriage_duel_scores).
-- Une ligne par joueur : prénom affiché, avatar, victoires et défaites déclarées par le jeu (non vérifiées).
create table public.coloriage_duel_scores (
  player_id  text primary key,
  key_hash   text not null,
  name       text not null,
  av         text not null default '',
  wins       integer not null default 0,
  losses     integer not null default 0,
  updated_at timestamptz not null default now()
);

alter table public.coloriage_duel_scores enable row level security;
revoke all on public.coloriage_duel_scores from anon, authenticated;

-- Enregistre le score d'un joueur. La clé secrète du joueur empêche un autre appareil d'écraser sa ligne.
create or replace function public.coloriage_duel_report(p_id text, p_key text, p_name text, p_av text, p_wins integer, p_losses integer)
returns void language plpgsql security definer set search_path = '' as $$
declare
  h text;
  existing text;
begin
  if p_id is null or length(p_id) < 4 or length(p_id) > 40 or p_key is null or length(p_key) < 16 or length(p_key) > 80 then
    raise exception 'identifiant invalide';
  end if;
  if p_wins is null or p_losses is null or p_wins < 0 or p_losses < 0 or p_wins > 100000 or p_losses > 100000 then
    raise exception 'score invalide';
  end if;
  h := encode(sha256(convert_to(p_key, 'utf8')), 'hex');
  select s.key_hash into existing from public.coloriage_duel_scores s where s.player_id = p_id;
  if existing is not null and existing <> h then
    raise exception 'cle invalide';
  end if;
  if existing is null and (select count(*) from public.coloriage_duel_scores) >= 50000 then
    raise exception 'limite atteinte';
  end if;
  insert into public.coloriage_duel_scores (player_id, key_hash, name, av, wins, losses, updated_at)
  values (p_id, h, left(coalesce(nullif(btrim(p_name), ''), 'Joueur'), 14), left(coalesce(p_av, ''), 40), p_wins, p_losses, now())
  on conflict (player_id) do update
    set name = excluded.name, av = excluded.av, wins = excluded.wins, losses = excluded.losses, updated_at = now();
end;
$$;

-- Les 50 meilleurs : plus de victoires d'abord, puis meilleur pourcentage.
create or replace function public.coloriage_duel_top()
returns jsonb language sql security definer set search_path = '' as $$
  select coalesce(jsonb_agg(jsonb_build_object('id', t.player_id, 'name', t.name, 'av', t.av, 'w', t.wins, 'l', t.losses)
                            order by t.wins desc, (t.wins::numeric / greatest(t.wins + t.losses, 1)) desc, t.updated_at asc), '[]'::jsonb)
  from (
    select s.player_id, s.name, s.av, s.wins, s.losses, s.updated_at
    from public.coloriage_duel_scores s
    where s.wins + s.losses > 0
    order by s.wins desc, (s.wins::numeric / greatest(s.wins + s.losses, 1)) desc, s.updated_at asc
    limit 50
  ) t;
$$;

revoke all on function public.coloriage_duel_report(text, text, text, text, integer, integer) from public;
revoke all on function public.coloriage_duel_top() from public;
grant execute on function public.coloriage_duel_report(text, text, text, text, integer, integer) to anon, authenticated;
grant execute on function public.coloriage_duel_top() to anon, authenticated;
