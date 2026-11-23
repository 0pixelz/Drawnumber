# Pixelo

Pixelo : jeu de coloriage par numéros, en une seule page web (`index.html`) accompagnée de ses icônes, sans dépendance ni étape de build.

- 1039 dessins intégrés : seize catégories (Noël, Sports, Contes et royaumes, Mots en images, Pieuvres, Lettres, Chiffres, Mots, Formes, Nature, Animaux, Nourriture, Transports, Fêtes et jeux, Découvertes, Mes photos) et six planètes de 10 dessins
- Sous-catégories : Animaux (Ferme, Savane et jungle, Forêt, Animaux de compagnie), Nourriture (Fruits, Légumes), Transports (Sur la route, Dans l'air et sur l'eau), Fêtes et jeux (Fêtes, Sports et jeux), Découvertes (Drapeaux, Émotions, Météo, École, Vêtements), Contes et royaumes (Royaume, Magie, Créatures, Hiver enchanté — personnages originaux), Noël (Personnages, Décorations, Sapins, Cadeaux et bas, Gourmandises, Traditions), Chiffres (0 à 9, 10 à 20)
- Tiroir réorganisé : tuiles de modes, catégories regroupées, sous-catégories dépliables et cliquables
- Catégorie Mots : 468 mots français faciles classés par lettre initiale (20 par lettre, moins pour K, W, X, Y, Z), avec accents et cédille
- Mode Monde : planètes à thème (Eau, Jardin, Glace, Feu, Bonbons, Cosmos), 100 points par dessin, 1 000 points par planète complétée, déblocage après 3 dessins
- Import d'une photo, convertie en grille numérotée (taille et nombre de couleurs au choix)
- Écran de chargement, menu principal (reprendre, dessin au hasard, tuiles de catégories) et tiroir de catégories masquable
- Mise en page adaptée au téléphone et à l'iPad (palette sur le côté en paysage)
- Mode libre sans numéros : pinceau, pot de peinture, dégradé entre deux couleurs, gomme, annulation, couleurs personnalisées, pages blanches
- Icône d'application (`apple-touch-icon.png`, `icon-192.png`, `icon-512.png`) et `manifest.webmanifest`
- Page d'accueil : création d'un joueur (prénom + avatar), plusieurs joueurs sur le même appareil avec progression séparée
- Duel 1 contre 1 en direct (Supabase Realtime) : partie par code à 4 chiffres, recherche d'un joueur, ou robot à trois vitesses ; vignette de l'adversaire en direct
- Mode chrono : 24 niveaux en 4 étapes, temps limite selon la taille du dessin, 1 à 3 étoiles, 50 points par étoile
- Sauvegarde en ligne par code de famille (Supabase, projet scan-prix, table `coloriage_saves` ; voir `supabase/coloriage_saves.sql`)
- Jeu hors ligne : `sw.js` met le jeu en cache après la première visite (réseau d'abord, cache en secours)
- Étoiles : chaque dessin vaut de 1 à 5 étoiles selon sa difficulté (cases × couleurs), gagnées quand il est terminé
- Magasin : les étoiles se dépensent en avatars (12), cadres d'avatar (9) et tableaux de fond pour dessiner (10) ; achats enregistrés par joueur (`cpn.shop`)
- Replay : l'ordre des cases coloriées est gardé et rejoué (pause, vitesse ×1/×2/×4) ; en duel, les deux dessins se rejouent côte à côte (12 derniers duels gardés sur l'appareil)
- Étoiles bonus : chaque trophée gagné se réclame (★ 2 à ★ 60 selon la difficulté), cadeau du jour avec série de connexions (★ 1 à ★ 10 sur 7 jours), trois défis du jour tirés au hasard (★ 3 à ★ 8)
- Magasin étendu : brillances, sons de coloriage, confettis de fin et thèmes du menu, en onglets
- Collections : chaque sous-catégorie, catégorie ou lettre complétée donne des étoiles (★ 3 à ★ 30) et souvent un avatar exclusif
- Défi de la semaine : un grand dessin 44 × 44 (quatre dessins assemblés) qui change le lundi, ★ 40
- Duel : cadre d'avatar visible par l'adversaire et au classement, choix du dessin, meilleur de 3, revanche en un bouton
- Duel par code QR : l'hôte affiche un code QR (généré dans la page, sans service externe) et un lien `?duel=1234` qui fait rejoindre la partie directement
- Icônes maison : une icône devant le texte des boutons d'outils (masques SVG), et une icône en pixels à côté de 425 des 468 mots (dessin du jeu ou icône 16 × 16 dessinée exprès) ; aucun émoji
- Mon dessin : éditeur de grille (12, 16 ou 20 cases de côté), enregistré comme coloriage par numéros, envoyé à un ami par code à 4 chiffres ou code QR (`?recu=1234`, canal Realtime `coloriage-share-<code>`)
- Coloriage à deux : un même grand dessin colorié en direct par deux joueurs (ou avec le robot), ★ 2 chacun
- Compagnon : la pieuvre du joueur grandit en six étapes avec les étoiles gagnées et réagit sur l'accueil et l'écran de fin
- École : dictée en images, première lettre, anglais (8 questions, voix), plus un jeu de multiplications et divisions dans Calcul
- Histoires : quatre histoires de cinq chapitres à écouter et à colorier, ★ 10 par histoire
- Album : tous les dessins terminés avec date, temps, replay et image PNG à enregistrer ou partager
- Accueil : trois gros boutons (Colorier, Jouer à deux, Apprendre), tiroir rangé par groupes, tutoriel au premier lancement
- Étoiles seulement : plus de points ; le mode Monde donne ★ 10 par planète complétée, le dessin du jour ★ 3 en bonus, les avatars à débloquer se comptent en étoiles gagnées ; neuf accessoires en pixels pour la pieuvre (onglet Compagnon du magasin), qui bouge et répond quand on la touche
- Compagnon virtuel : dix espèces au choix, barres de faim, d'énergie et de joie qui descendent avec le temps, pommes gagnées en coloriant, sieste, jeu de saut d'obstacles, et un monde de 24 × 14 cases que le joueur peint lui-même (décor de la scène et du jeu)
- Objets du monde : 25 objets en pixels à acheter (★ 3 à ★ 40), à poser, déplacer, ranger ou revendre à moitié prix
- Compagnon : âge et anniversaire chaque semaine (5 pommes), six évolutions visibles pour toutes les espèces (taille, étincelles, aura, arc-en-ciel) avec animation d'évolution, barre de propreté et bain, bulle qui montre le besoin, ombre, marche dans les deux sens, cœurs au toucher, nuit étoilée selon l'heure
- Compagnon : six aliments aux effets différents (pomme gratuite, les autres ★ 1 à ★ 4), jeu des pommes à attraper (30 s), visite du monde d'un ami par code ou QR (`?visite=1234`, canal `coloriage-visit-<code>`) avec une pomme à offrir
- Trophées : 20 badges, 12 avatars à débloquer avec les points
- Dessin du jour avec série de jours consécutifs (+50 points)
- Aides en jeu : Indice (les cases de la couleur clignotent) et Baguette (colorie une zone, 3 par dessin)
- Mots en images : 64 dessins avec leur mot à colorier dessous
- Calcul : les cases montrent une addition ou une soustraction au lieu du numéro (27 dessins)
- Sons (case, couleur terminée, dessin terminé) avec bouton muet, et brillance sur chaque case remplie
- Progression enregistrée dans le navigateur (localStorage), et en ligne si la sauvegarde est activée

## Lancer

Ouvrir `index.html` dans un navigateur, ou déployer le repo tel quel sur Vercel ou GitHub Pages.
