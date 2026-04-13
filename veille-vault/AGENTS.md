---
trigger: always_on
---

# AGENTS - Règles simples du veille-vault

Ce vault sert à la veille technologique dans Obsidian.
Il doit rester simple, lisible et fidèle au cours 5XVTE.

## Mission

- respecter la séparation entre collecte et synthèse ;
- garder une structure à faible friction ;
- aider à produire de vraies notes de veille ;
- éviter les architectures compliquées sans besoin réel ;
- faire du wiki un espace utile pour lire, relier et présenter.

## Architecture à respecter

```text
raw/
  passive/
  active/
  assets/
wiki/
  notes/
  index.md
  log.md
```

Règles :

- `raw/` contient les sources et les sorties automatisées ;
- `wiki/notes/` contient les notes Obsidian finales ;
- `index.md` sert de point d'entrée ;
- `log.md` garde la trace des changements importants.

## Avant toute modification importante

Lire dans cet ordre :

1. `SCHEMA.md`
2. `wiki/index.md`
3. les dernières entrées de `wiki/log.md`
4. les notes déjà existantes liées au sujet

## Règles absolues

- ne jamais modifier un fichier dans `raw/` après son dépôt ;
- ne jamais faire passer un résumé IA pour une source brute ;
- ne jamais inventer une source ou un fait ;
- distinguer les faits, les hypothèses et les interprétations ;
- préférer enrichir une note existante plutôt que créer un doublon ;
- écrire en français par défaut ;
- utiliser des noms de fichiers en `kebab-case.md` ;
- mettre à jour `wiki/index.md` et `wiki/log.md` après une modification importante.

## Place de l'automatisation

Le cours autorise et encourage l'automatisation d'une partie de la collecte avec n8n.
En revanche, la note de veille finale doit rester un travail humain ou humain assisté.

Donc :

- n8n peut écrire dans `raw/passive/` ;
- l'IA peut produire un résumé préliminaire ;
- la vraie note finale doit vivre dans `wiki/notes/`.

Pour la veille passive, la sortie attendue dans le vault est un fichier Markdown standardisé.
Le JSON peut exister dans n8n pendant le workflow, mais il ne doit pas être stocké tel quel dans le vault.

## Ce qu'est une bonne note ici

Une note du wiki est une note Obsidian normale.

Elle peut être :

- une fiche de synthèse ;
- une note de veille ;
- une note atomique de type Zettelkasten ;
- une note de méthode ;
- une note de réflexion.

Une note Zettelkasten n'est pas un type de dossier spécial.
C'est une note claire, autonome, reliée aux autres et sourcée.

## Structure recommandée d'une note

Forme simple possible :

- `# Titre`
- `## En une phrase`
- `## Points clés`
- `## Réflexions`
- `## Liens`
- `## Sources`

Si une note est plus courte, elle peut être plus simple.
L'important est qu'elle soit compréhensible, reliée et utile.

## Workflow passif

Quand un fichier arrive dans `raw/passive/` :

1. le traiter comme matériau de travail ;
2. vérifier si le sujet mérite une vraie note ;
3. si oui, créer ou enrichir une note dans `wiki/notes/` ;
4. relier cette note aux autres notes pertinentes ;
5. mettre à jour `wiki/index.md` et `wiki/log.md`.

Le fichier `raw/passive/` doit idéalement contenir :

- des métadonnées claires ;
- un extrait brut ;
- un résumé IA préliminaire ;
- une section `Points à vérifier` ;
- une section `Action possible`.

## Workflow actif

Quand une source arrive dans `raw/active/` :

1. lire la source ;
2. la reformuler avec ses propres mots ;
3. créer une note dans `wiki/notes/` ;
4. ajouter les liens utiles ;
5. garder la source visible dans la note.

## Confiance dans les sources

Classer les sources en :

- `primaire`
- `secondaire`
- `communautaire`

Règles :

- une source communautaire peut faire émerger un sujet ;
- une source secondaire peut nourrir la compréhension ;
- une source primaire est à privilégier pour les faits techniques.

## Ce qui fait un bon travail d'agent ici

- moins de friction ;
- moins de bruit ;
- plus de bonnes notes ;
- plus de liens utiles ;
- plus de clarté ;
- plus de cohérence avec le cours ;
- moins de complexité artificielle.
