# Template de decision d'incorporation

## Usage

Ce template sert a decider si une capture dans `raw/passive/` ou `raw/active/` doit devenir une vraie note dans `wiki/notes/`.

Objectif :

- eviter d'incorporer du bruit ;
- garder seulement les sujets utiles ;
- suivre une logique coherente avec le cours ;
- transformer une capture en note seulement si elle apporte une vraie valeur.

## Regle simple

- si la capture est peu utile ou peu fiable : ne pas creer de note
- si la capture est interessante mais encore faible : surveiller plus tard
- si la capture apporte une comprehension, une tendance ou une decision : creer une note

## Checklist rapide

Repondre a ces questions avant d'incorporer :

- la source est-elle suffisamment fiable ?
- l'information est-elle vraiment nouvelle ?
- est-ce utile pour mon sujet de veille ?
- est-ce que je peux en tirer une action, une decision ou une tendance ?
- puis-je relier cette future note a d'autres notes du vault ?

Si la reponse est majoritairement `non`, la capture ne devient pas une note.

## Grille de pertinence

Noter chaque critere de `1` a `5`.

| Critere | Question |
| --- | --- |
| Utilite | Est-ce utile pour mon travail, mes projets ou mon sujet de veille ? |
| Nouveaute | Est-ce que j'apprends quelque chose de reellement nouveau ? |
| Fiabilite | La source est-elle credible et verifiable ? |
| Actionabilite | Est-ce que cela peut mener a une action concrete ? |
| Durabilite | Est-ce que cette information sera encore utile dans quelques mois ? |

### Score total

- `0 a 10` : ignorer
- `11 a 14` : conserver la capture, mais ne pas faire de note pour l'instant
- `15 a 19` : note possible si le sujet s'insere bien dans le vault
- `20 a 25` : note recommandee

## Decision finale

Choisir une seule issue :

- `Ignorer`
  - la capture reste dans `raw/`
  - pas de note dans `wiki/notes/`

- `Surveiller`
  - la capture reste dans `raw/`
  - le sujet peut revenir plus tard si d'autres signaux apparaissent

- `Incorporer`
  - creation ou mise a jour d'une note dans `wiki/notes/`
  - ajout de liens vers les notes connexes
  - mise a jour de `wiki/index.md`
  - ajout d'une entree dans `wiki/log.md`

## Cas particulier : GitHub Trending

`GitHub Trending` ne doit pas etre incorpore comme une preuve a lui seul.

Il sert surtout a :

- detecter un signal faible ou fort ;
- faire emerger un sujet ;
- orienter une exploration plus profonde.

Donc :

- ne pas creer une note juste parce qu'un repo est populaire ;
- preferer une note sur la tendance detectee ;
- mentionner le biais de popularite si la note vient principalement de GitHub Trending.

## Modele a remplir

```md
# Decision d'incorporation

- Capture source :
- Date :
- Type de source : primaire / secondaire / communautaire

## Checklist rapide
- Fiable :
- Nouveau :
- Utile :
- Actionnable :
- Reliable a d'autres notes :

## Grille de pertinence
- Utilite :
- Nouveaute :
- Fiabilite :
- Actionabilite :
- Durabilite :
- Total :

## Decision
- Ignorer / Surveiller / Incorporer

## Si j'incorpore
- Titre probable de la note :
- Liens probables :
- Decision finale dans la note : Adopter / Experimenter / Surveiller / Ignorer
```

## Liens utiles

- [[pipeline-de-veille]]
- [[technology-radar]]
- [[bias-journal]]
- [[rituals]]
