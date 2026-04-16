# Template note de veille

## Usage

Ce Template sert quand une capture a déjà passé la phase de décision et mérite d'entrer dans `wiki/notes/`.

Il doit rester :

- simple ;
- lisible ;
- compatible avec le cours ;
- assez court pour rester `low friction`.

## Règle

Une note dans `wiki/notes/` n'est pas une copie de la capture brute.

Elle doit :

- reformuler avec tes propres mots ;
- extraire les points vraiment importants ;
- donner un contexte ;
- relier le sujet à d'autres notes ;
- aboutir à une décision claire.

## Template minimal recommandé

```md
# [Titre de la note]

## En une phrase
[Résumé du sujet en une phrase maximum]

## Contexte
[Pourquoi ce sujet existe, d'où il vient, dans quel cadre il est pertinent]

## Points clés
- Point 1
- Point 2
- Point 3

## Analyse 5W+H & pertinence
- **Who (Qui)** :
- **What (Quoi)** :
- **When (Quand)** :
- **Where (Où)** :
- **Why (Pourquoi)** :
- **How (Comment)** :
- **Pertinence** : [score /25 avec mini justification]

## Impact pour moi / mon équipe
- [Conséquence concrète]
- [Ce que cela change dans ma veille, mon travail ou mes choix]

## Action / Conclusion
- [ ] Adopter
- [ ] Expérimenter
- [ ] Surveiller
- [ ] Ignorer

## Liens connexes
- [[note-liee-1]]
- [[note-liee-2]]

## Sources
- [Capture de départ](../raw/passive/cli/nom-du-fichier.md)
- [Source primaire ou secondaire]
```

## Version courte

Si le sujet est plus simple, tu peux utiliser cette version réduite :

```md
# [Titre]

## En une phrase
[Résumé]

## Points clés
- Point 1
- Point 2

## Décision
- [ ] Adopter
- [ ] Expérimenter
- [ ] Surveiller
- [ ] Ignorer

## Liens
- [[note-liee]]

## Sources
- [Capture ou article]
```

## Quand utiliser ce template

- pour une actu importante repérée via `RSS`
- pour une release notable de `Codex`, `Claude Code`, `Gemini CLI` ou `OpenCode`
- pour une tendance détectée via `GitHub Trending`
- pour une synthèse issue d'une source déposée dans `raw/active/`

## Quand ne pas l'utiliser

- si la capture est encore trop faible ou trop floue ;
- si la source est peu fiable ;
- si tu n'as rien à en tirer pour ta veille ;
- si le sujet ne mérite qu'une surveillance passive pour l'instant.

## Conseils pratiques

- partir d'une capture, pas d'une page blanche ;
- garder `3 à 5` points clés maximum ;
- ne pas surcharger la note ;
- préférer une note claire à une note exhaustive ;
- si le sujet vient de `GitHub Trending`, rappeler que c'est un signal de popularité, pas une preuve de pertinence à lui seul.

## Liens utiles

- [[template-decision-incorporation]]
- [[pipeline-de-veille]]
- [[technology-radar]]
- [[bias-journal]]