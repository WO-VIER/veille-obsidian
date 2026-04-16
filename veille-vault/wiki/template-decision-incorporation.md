# Template de décision d'incorporation

## Usage

Ce template sert à décider si une capture dans `raw/passive/` ou `raw/active/` doit devenir une vraie note dans `wiki/notes/`.

Objectif :

- éviter d'incorporer du bruit ;
- garder seulement les sujets utiles ;
- suivre une logique cohérente avec le cours ;
- transformer une capture en note seulement si elle apporte une vraie valeur.

## Règle simple

- si la capture est peu utile ou peu fiable : ne pas créer de note
- si la capture est intéressante mais encore faible : surveiller plus tard
- si la capture apporte une compréhension, une tendance ou une décision : créer une note

## Checklist rapide

Répondre à ces questions avant d'incorporer :

- la source est-elle suffisamment fiable ?
- l'information est-elle vraiment nouvelle ?
- est-ce utile pour mon sujet de veille ?
- est-ce que je peux en tirer une action, une décision ou une tendance ?
- puis-je relier cette future note à d'autres notes du vault ?

Si la réponse est majoritairement `non`, la capture ne devient pas une note.

## Grille de pertinence

Noter chaque critère de `1` à `5`.

| Critère | Question |
| --- | --- |
| Utilité | Est-ce utile pour mon travail, mes projets ou mon sujet de veille ? |
| Nouveauté | Est-ce que j'apprends quelque chose de réellement nouveau ? |
| Fiabilité | La source est-elle crédible et vérifiable ? |
| Actionnabilité | Est-ce que cela peut mener à une action concrète ? |
| Durabilité | Est-ce que cette information sera encore utile dans quelques mois ? |

### Score total

- `0 à 10` : ignorer
- `11 à 14` : conserver la capture, mais ne pas faire de note pour l'instant
- `15 à 19` : note possible si le sujet s'insère bien dans le vault
- `20 à 25` : note recommandée

## Décision finale

Choisir une seule issue :

- `Ignorer`
  - la capture reste dans `raw/`
  - pas de note dans `wiki/notes/`

- `Surveiller`
  - la capture reste dans `raw/`
  - le sujet peut revenir plus tard si d'autres signaux apparaissent

- `Incorporer`
  - création ou mise à jour d'une note dans `wiki/notes/`
  - ajout de liens vers les notes connexes
  - mise à jour de `wiki/index.md`
  - ajout d'une entrée dans `wiki/log.md`

## Cas particulier : GitHub Trending

`GitHub Trending` ne doit pas être incorporé comme une preuve à lui seul.

Il sert surtout à :

- détecter un signal faible ou fort ;
- faire émerger un sujet ;
- orienter une exploration plus profonde.

Donc :

- ne pas créer une note juste parce qu'un repo est populaire ;
- préférer une note sur la tendance détectée ;
- mentionner le biais de popularité si la note vient principalement de GitHub Trending.

## Modèle à remplir

```md
# Décision d'incorporation

- Capture source :
- Date :
- Type de source : primaire / secondaire / communautaire

## Checklist rapide
- Fiable :
- Nouveau :
- Utile :
- Actionnable :
- Reliable à d'autres notes :

## Grille de pertinence
- Utilité :
- Nouveauté :
- Fiabilité :
- Actionnabilité :
- Durabilité :
- Total :

## Décision
- Ignorer / Surveiller / Incorporer

## Si j'incorpore
- Titre probable de la note :
- Liens probables :
- Décision finale dans la note : Adopter / Expérimenter / Surveiller / Ignorer
```

## Liens utiles

- [[pipeline-de-veille]]
- [[technology-radar]]
- [[bias-journal]]
- [[rituals]]