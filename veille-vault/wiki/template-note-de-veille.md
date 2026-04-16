# Template note de veille

## Usage

Ce Template sert quand une capture a déjà passe la phase de décision et mérite d'entrer dans `wiki/notes/`.

Il doit rester :

- simple ;
- lisible ;
- compatible avec le cours ;
- assez court pour rester `low friction`.

## Regle

Une note dans `wiki/notes/` n'est pas une copie de la capture brute.

Elle doit :

- reformuler avec tes propres mots ;
- extraire les points vraiment importants ;
- donner un contexte ;
- relier le sujet a d'autres notes ;
- aboutir a une decision claire.

## Template minimal recommande

```md
# [Titre de la note]

## En une phrase
[Resume du sujet en une phrase maximum]

## Contexte
[Pourquoi ce sujet existe, d'ou il vient, dans quel cadre il est pertinent]

## Points cles
- Point 1
- Point 2
- Point 3

## Analyse 5W+H & pertinence
- **Who (Qui)** :
- **What (Quoi)** :
- **When (Quand)** :
- **Where (Ou)** :
- **Why (Pourquoi)** :
- **How (Comment)** :
- **Pertinence** : [score /25 avec mini justification]

## Impact pour moi / mon equipe
- [Consequence concrete]
- [Ce que cela change dans ma veille, mon travail ou mes choix]

## Action / Conclusion
- [ ] Adopter
- [ ] Experimenter
- [ ] Surveiller
- [ ] Ignorer

## Liens connexes
- [[note-liee-1]]
- [[note-liee-2]]

## Sources
- [Capture de depart](../raw/passive/cli/nom-du-fichier.md)
- [Source primaire ou secondaire]
```

## Version courte

Si le sujet est plus simple, tu peux utiliser cette version reduite :

```md
# [Titre]

## En une phrase
[Resume]

## Points cles
- Point 1
- Point 2

## Decision
- [ ] Adopter
- [ ] Experimenter
- [ ] Surveiller
- [ ] Ignorer

## Liens
- [[note-liee]]

## Sources
- [Capture ou article]
```

## Quand utiliser ce template

- pour une actu importante reperee via `RSS`
- pour une release notable de `Codex`, `Claude Code`, `Gemini CLI` ou `OpenCode`
- pour une tendance detectee via `GitHub Trending`
- pour une synthese issue d'une source deposee dans `raw/active/`

## Quand ne pas l'utiliser

- si la capture est encore trop faible ou trop floue ;
- si la source est peu fiable ;
- si tu n'as rien a en tirer pour ta veille ;
- si le sujet ne merite qu'une surveillance passive pour l'instant.

## Conseils pratiques

- partir d'une capture, pas d'une page blanche ;
- garder `3 a 5` points cles maximum ;
- ne pas surcharger la note ;
- preferer une note claire a une note exhaustive ;
- si le sujet vient de `GitHub Trending`, rappeler que c'est un signal de popularite, pas une preuve de pertinence a lui seul.

## Liens utiles

- [[template-decision-incorporation]]
- [[pipeline-de-veille]]
- [[technology-radar]]
- [[bias-journal]]
