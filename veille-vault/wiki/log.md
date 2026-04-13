# Journal de bord (Log)

Historique des actions de veille.

Note :
ce journal est append-only. Certaines entrées anciennes mentionnent l'ancienne taxonomie du vault avant la simplification vers `wiki/notes/`.

## [2026-04-13] init | Initialisation du système
- Création de la structure du wiki.
- Définition du SCHEMA.md basé sur les principes du cours.

## [2026-04-13] [ACTIVE] ingest | LLM Wiki (Karpathy)
- Dépôt de la source brute dans `raw/active/llm-wiki.md`.
- Analyse 5W+H et rédaction de la fiche technologie en pyramide inversée `wiki/technologies/llm-wiki.md`.
- Création des notes Zettelkasten associées : `pkm.md`, `rag.md`.
- Mise à jour de l'index et du log.

## [2026-04-13] architecture | Formalisation du veille-vault
- Mise à jour de `SCHEMA.md` pour définir les couches `raw -> wiki -> règles`.
- Création de `AGENTS.md` pour donner à l'agent des règles permanentes de maintenance du wiki.
- Ajout des dashboards `technology-radar.md`, `bias-journal.md` et `rituals.md`.
- Réorganisation de `wiki/index.md` pour distinguer dashboards, technologies, concepts et queries.
- Correction des conventions de liens Obsidian et préparation du vault pour une utilisation durable dans Obsidian.

## [2026-04-13] [QUERY] respect | Pourquoi ce vault respecte LLM Wiki
- Création de `wiki/queries/respect-llm-wiki.md` pour expliquer l'alignement entre le pattern LLM Wiki et l'architecture actuelle du vault.
- Mise à jour de `wiki/queries/index.md` et `wiki/index.md`.
- Capitalisation d'une réponse de chat en artefact durable du wiki.

## [2026-04-13] simplification | Recentrage sur une architecture plus proche du cours
- Simplification du vault autour de `raw/` et `wiki/notes/`.
- Réécriture de `SCHEMA.md` pour distinguer collecte automatisée et note finale humaine assistée.
- Réécriture de `AGENTS.md` pour réduire la complexité de l'architecture.
- Déplacement des notes existantes dans un dossier unique `wiki/notes/`.
- Mise à jour de `wiki/index.md` pour refléter la nouvelle structure simple.

## [2026-04-13] passive-format | Standardisation de la sortie n8n
- Définition d'un format Markdown standard pour les fichiers de veille passive dans `raw/passive/`.
- Ajout du template `raw/passive/passive-capture-template.md`.
- Mise à jour de `SCHEMA.md` et `AGENTS.md` pour expliciter la règle `JSON dans n8n, Markdown dans le vault`.

## [2026-04-13] skills | Canonicalisation des skills du repo
- Déplacement des skills de veille dans `skills/` à la racine du repo.
- Conservation d'un format `SKILL.md` portable pour export vers d'autres agents et CLI.
- Mise à jour de la documentation d'installation vers `~/.agents/skills`.
