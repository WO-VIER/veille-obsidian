# SCHEMA - Veille simple et crédible pour le cours

Ce vault suit l'esprit de `LLM Wiki`, mais dans une version volontairement simple et adaptée au cours 5XVTE.

Le principe est le suivant :

- `raw/` reçoit les sources et les sorties automatisées ;
- `wiki/notes/` contient les vraies notes Obsidian de veille ;
- `index.md` et `log.md` gardent la vue d'ensemble du système.

L'objectif n'est pas d'avoir une taxonomie compliquée.
L'objectif est d'avoir un système de veille régulier, lisible, démontrable et soutenable.

## 1. Architecture retenue

```text
veille-vault/
├── AGENTS.md
├── SCHEMA.md
├── raw/
│   ├── passive/
│   ├── active/
│   └── assets/
└── wiki/
    ├── notes/
    ├── index.md
    └── log.md
```

### `raw/passive/`

Contient les éléments produits automatiquement par la veille passive.

Exemples :

- entrée RSS récupérée par n8n ;
- changelog ou release détectée automatiquement ;
- fichier Markdown généré par n8n avec métadonnées source ;
- résumé IA préliminaire.

Important :

- ces fichiers ne sont pas encore les notes finales du wiki ;
- ils servent d'entrée à un traitement humain ou humain + IA.

### `raw/active/`

Contient les sources déposées manuellement par l'utilisateur.

Exemples :

- article intéressant ;
- documentation ;
- note clippée depuis le web ;
- lien qu'on veut analyser plus en profondeur.

### `raw/assets/`

Contient les images et pièces jointes locales liées aux sources.

### `wiki/notes/`

Contient toutes les vraies notes Obsidian du système.

Une note peut être :

- une note de veille issue d'une actu passive ;
- une fiche de synthèse ;
- une note plus atomique de type Zettelkasten ;
- une note méta sur les rituels, les biais ou le radar ;
- une réponse importante capitalisée.

On ne multiplie pas les sous-dossiers tant qu'il n'y a pas un besoin réel.

### `wiki/index.md`

Catalogue simple des notes importantes du wiki.

### `wiki/log.md`

Journal chronologique des opérations importantes :

- nouvelle source ;
- nouvelle note ;
- restructuration ;
- nettoyage ;
- question capitalisée.

## 2. Pourquoi cette architecture est plus adaptée au cours

Le cours insiste sur plusieurs points :

- avoir un système à faible friction ;
- utiliser Obsidian comme espace de notes interconnectées ;
- produire des notes de veille lisibles ;
- faire de l'automatisation avec n8n pour la collecte ;
- garder une part d'analyse et de synthèse réelle.

Le cours ne demande pas une architecture complexe avec beaucoup de catégories techniques.
Il demande surtout :

- une structure cohérente ;
- des notes reliées ;
- des fiches de synthèse ;
- une démonstration claire du système.

Cette version est donc plus crédible et plus naturelle :

- `n8n` nourrit `raw/passive/` ;
- l'utilisateur nourrit `raw/active/` ;
- le travail de veille aboutit dans `wiki/notes/`.

## 3. Place de l'automatisation

Le cours parle bien d'automatisation avec n8n, mais il la présente comme une automatisation de collecte et de préparation, pas comme une délégation totale de la pensée.

Le passage le plus important est celui-ci :

- n8n peut récupérer des flux RSS ;
- filtrer des articles ;
- suivre des releases GitHub ;
- générer automatiquement une note Markdown dans un vault Obsidian ;
- appeler un LLM pour produire un résumé.

Mais le cours demande aussi :

- des notes de veille rédigées ;
- des liens entre les notes ;
- une synthèse ;
- une réflexion personnelle ;
- des décisions ou actions.

Conclusion pratique :

- l'automatisation peut produire des fichiers Markdown utiles ;
- la note finale du wiki doit rester un espace d'analyse, de reformulation et de connexion.

Autrement dit :

- `n8n` automatise une partie de la collecte ;
- l'IA peut aider à résumer ;
- la vraie note de veille reste un travail humain assisté.

## 4. Règles pour la veille passive

Quand n8n écrit dans `raw/passive/`, il peut produire un fichier Markdown avec :

- titre ;
- URL ;
- source ;
- date de publication ;
- date de collecte ;
- extrait ou contenu brut ;
- résumé IA préliminaire ;
- tags ou catégorie ;
- niveau de confiance estimé.

Mais ce fichier n'est pas une note de veille finale.
C'est un matériau de travail.

### Format standard recommandé pour `raw/passive/`

Le workflow n8n peut manipuler du JSON en interne, mais le fichier final écrit dans le vault doit être un Markdown lisible dans Obsidian.

Le standard retenu est :

```md
---
kind: passive-capture
source_name: OpenAI News
source_type: primaire
category: model-update
tags: [ia, model-update, openai]
title: Enterprises power agentic workflows in Cloudflare Agent Cloud with OpenAI
url: https://openai.com/index/cloudflare-openai-agent-cloud
published_at: 2026-04-13T06:00:00Z
collected_at: 2026-04-13T18:05:12Z
confidence: high
workflow: passive-news-cli
status: a-traiter
---

# Enterprises power agentic workflows in Cloudflare Agent Cloud with OpenAI

## Métadonnées
- Source : OpenAI News
- Type : primaire
- Catégorie : model-update
- URL : https://openai.com/index/cloudflare-openai-agent-cloud
- Publié le : 2026-04-13T06:00:00Z
- Collecté le : 2026-04-13T18:05:12Z
- Niveau de confiance : high

## Extrait brut
Cloudflare brings OpenAI's GPT-5.4 and Codex to Agent Cloud...

## Résumé IA préliminaire
- Point 1
- Point 2
- Point 3

## Points à vérifier
- Point de vigilance 1
- Point de vigilance 2

## Action possible
- [ ] Décider si cette entrée mérite une vraie note dans `wiki/notes/`
```

Règles associées :

- le JSON reste interne à n8n ;
- le vault ne stocke que la version Markdown finale ;
- la section `Résumé IA préliminaire` doit être explicitement présentée comme une aide, pas comme une vérité source ;
- le nom du fichier doit être en `kebab-case` et idéalement préfixé par la date ;
- exemple : `2026-04-13-openai-agent-cloud.md`.

## 5. Règles pour les notes du wiki

Une note dans `wiki/notes/` est une vraie note Obsidian.

Dans l'esprit du cours, une note peut suivre ce type de structure :

- `# Titre`
- `## En une phrase`
- `## Points clés`
- `## Réflexions`
- `## Liens`
- `## Sources`

Si la note est plus atomique, elle peut être encore plus simple.

Règle importante :

- une note Zettelkasten n'est pas un dossier spécial ;
- c'est une note Markdown Obsidian bien faite, autonome et reliée.

## 6. Workflow recommandé

### Veille passive

1. n8n collecte et filtre.
2. n8n écrit un fichier dans `raw/passive/`.
3. l'utilisateur lit ou survole les entrées utiles.
4. une ou plusieurs entrées deviennent des notes dans `wiki/notes/`.

### Veille active

1. l'utilisateur dépose une source dans `raw/active/`.
2. il l'analyse lui-même ou avec l'aide de l'IA.
3. il produit une note dans `wiki/notes/`.
4. il crée des liens avec les autres notes.

## 7. Règles de confiance

Classer les sources en trois niveaux :

- `primaire` : documentation officielle, changelog, release, source originale ;
- `secondaire` : article de synthèse, newsletter, blog d'expert ;
- `communautaire` : forum, Reddit, Hacker News, commentaire.

Règles :

- une source communautaire peut signaler un sujet, mais pas prouver seule un fait important ;
- une source secondaire peut être utile, mais les points critiques doivent être recoupés ;
- une source primaire est à privilégier pour les faits techniques.

## 8. Conventions simples

- noms de fichiers en `kebab-case.md` ;
- français par défaut ;
- liens Obsidian explicites ;
- une note = un sujet clair ;
- éviter les doublons ;
- mettre à jour `wiki/index.md` et `wiki/log.md` quand on ajoute une note importante.

## 9. Ce que l'IA ne doit pas faire

- modifier un fichier dans `raw/` après dépôt ;
- faire passer un résumé IA pour une vérité source ;
- créer une architecture compliquée sans besoin réel ;
- remplacer la réflexion personnelle exigée par le cours ;
- inventer des faits non vérifiés ;
- multiplier les notes inutiles.
