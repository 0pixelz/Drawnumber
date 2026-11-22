# Drawnumber

Jeu de coloriage par numéros, en une seule page web (`index.html`) accompagnée de ses icônes, sans dépendance ni étape de build.

- 945 dessins intégrés : quinze catégories (Noël, Contes et royaumes, Mots en images, Pieuvres, Lettres, Chiffres, Mots, Formes, Nature, Animaux, Nourriture, Transports, Fêtes et jeux, Découvertes, Mes photos) et six planètes de 10 dessins
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
- Trophées : 20 badges, 12 avatars à débloquer avec les points
- Dessin du jour avec série de jours consécutifs (+50 points)
- Aides en jeu : Indice (les cases de la couleur clignotent) et Baguette (colorie une zone, 3 par dessin)
- Mots en images : 64 dessins avec leur mot à colorier dessous
- Calcul : les cases montrent une addition ou une soustraction au lieu du numéro (27 dessins)
- Sons (case, couleur terminée, dessin terminé) avec bouton muet, et brillance sur chaque case remplie
- Progression enregistrée dans le navigateur (localStorage), et en ligne si la sauvegarde est activée

## Lancer

Ouvrir `index.html` dans un navigateur, ou déployer le repo tel quel sur Vercel ou GitHub Pages.
