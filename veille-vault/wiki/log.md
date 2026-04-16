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

## [2026-04-14] methode | Ajout du pipeline de veille du cours
- Création de `wiki/notes/pipeline-de-veille.md` pour expliciter les étapes `collecte -> tri -> analyse -> synthèse -> diffusion`.
- Ajout d'un schéma Mermaid réutilisable pour la démonstration du système de veille.
- Mise à jour de `wiki/index.md` pour intégrer cette note de méthode au point d'entrée du vault.

## [2026-04-14] methode | Ajout du template de decision d'incorporation
- Création de `wiki/template-decision-incorporation.md` pour décider si une capture mérite une vraie note dans `wiki/notes/`.
- Ajout d'une checklist rapide, d'une grille de pertinence et d'une règle spécifique pour `GitHub Trending`.
- Mise à jour de `wiki/index.md` pour rendre ce template visible depuis le point d'entrée du vault.

## [2026-04-14] methode | Ajout du template de note de veille
- Création de `wiki/template-note-de-veille.md` comme gabarit normalisé pour écrire une vraie note dans `wiki/notes/`.
- Ajout d'une version complète et d'une version courte pour garder une friction faible.
- Mise à jour de `wiki/index.md` pour exposer ce template de rédaction depuis le point d'entrée du vault.

## [2026-04-14] methode | Ajout du pipeline d'incorporation d'une note
- Création de `wiki/pipeline-incorporation-note.md` pour expliciter le passage `raw/active ou raw/passive -> décision -> wiki/notes/`.
- Ajout d'un schéma Mermaid et d'une checklist opérationnelle orientée Obsidian Clipper et veille passive.
- Mise à jour de `wiki/index.md` pour relier ce pipeline aux autres méthodes du vault.

## [2026-04-14] [ACTIVE] ingest | LLM Wiki et veille technologique
- Lecture des sources `raw/active/llm-wiki.md` et `raw/active/Thread by @karpathy.md`.
- Transformation du brouillon `wiki/LLM wiki et veille.md` en vraie note `wiki/notes/llm-wiki-et-veille.md`.
- Mise à jour de `wiki/index.md` pour référencer cette nouvelle note et correction du lien Obsidian vers `llm-wiki`.

## [2026-04-14] cadrage | CLI agentiques pour développeurs
- Création de `wiki/notes/cli-agentiques.md` comme note centrale pour le sujet de veille.
- Sélection d'un noyau de sources passives sur `Codex`, `Claude Code`, `Gemini CLI` et `GitHub Trending`.
- Ajout de sources actives communautaires `Reddit` comme signaux complémentaires, sans les traiter comme preuves principales.
- Mise à jour de `wiki/index.md` pour référencer cette note de cadrage.

## [2026-04-14] [ACTIVE] ingest | Comparaison communautaire des CLI coding agents
- Lecture de `raw/active/Reddit/I compared all 6 major CLI coding agents.md`.
- Mise à jour de `wiki/notes/cli-agentiques.md` pour intégrer les critères de comparaison issus du terrain : prix, ouverture, backends, support `MCP` et usages hybrides.
- Conservation du statut communautaire de la source, avec mention explicite de ses limites et des corrections apparues dans les commentaires.

## [2026-04-14] [PASSIVE] ingest | Notes satellites des CLI agentiques
- Création de `wiki/notes/codex.md`, `wiki/notes/claude-code.md` et `wiki/notes/gemini-cli.md` comme notes de suivi appendables par outil.
- Incorporation des captures passives principales pour chaque outil dans une section `Mises à jour`.
- Mise à jour de `wiki/notes/cli-agentiques.md` pour relier la note centrale aux trois notes satellites.
- Mise à jour de `wiki/index.md` pour référencer ces nouvelles notes.

## [2026-04-15] [ACTIVE] ingest | Documentation officielle Claude Code et Gemini CLI
- Ajout de `raw/active/Official/claude-code-official-docs.md` comme bundle de documentation officielle sur le positionnement, les settings et l'usage des données.
- Ajout de `raw/active/Official/gemini-cli-official-docs.md` comme bundle de documentation officielle sur l'overview, l'authentification et le README du projet.
- Mise à jour de `wiki/notes/claude-code.md` et `wiki/notes/gemini-cli.md` pour intégrer les apports des sources officielles.
- Correction des liens de la section `Sources & Outils` dans `wiki/index.md`.

## [2026-04-15] [PASSIVE] ingest | Nouvelles captures Claude Code et Gemini CLI
- Ajout local des captures passives `2026-04-15-claude-code-releases-v2-1-109.md` et `2026-04-14-gemini-cli-releases-release-v0-39-0-preview-0.md`.
- Mise à jour des notes satellites `claude-code.md` et `gemini-cli.md` pour intégrer ces nouveaux signaux de release.

## [2026-04-15] [ACTIVE] ingest | Documentation officielle Codex
- Ajout de `raw/active/Official/codex-official-docs.md` à partir de sources OpenAI officielles sur la `CLI`, l'annonce initiale et la general availability.
- Mise à jour de `wiki/notes/codex.md` pour intégrer le positionnement officiel de `Codex`, son lien avec `AGENTS.md` et son extension vers `Slack`, `SDK` et l'administration.
- Mise à jour de `wiki/index.md` pour référencer cette source active officielle.

## [2026-04-16] [PASSIVE] ingest | Nouvelles releases CLI agentiques
- Synchronisation locale des nouvelles captures passives depuis le VPS : `Codex 0.121.0`, `Claude Code v2.1.110`, `Gemini CLI v0.38.1`, `GitHub Trending Weekly 2026-04-15` et `The next evolution of the Agents SDK`.
- Mise à jour de `wiki/notes/codex.md`, `wiki/notes/claude-code.md` et `wiki/notes/gemini-cli.md` par append dans les sections `Mises à jour`.
- Mise à jour de `wiki/notes/cli-agentiques.md` avec le signal secondaire `GitHub Trending` autour des skills, harness, mémoires et agents gérés.
- Correction de liens relatifs vers la source active `raw/active/Github/llm-wiki.md` dans les notes concernées.
- La capture `Trusted Access for Cyber` est laissée en source passive non ingérée pour ce sujet, car elle est hors périmètre de la présentation CLI agentiques.

## [2026-04-16] [PASSIVE] ingest | Signal ecosysteme Gemini 3.1 Flash TTS
- Synchronisation locale de `raw/passive/provider-news/2026-04-15-google-ai-blog-gemini-3-1-flash-tts-the-next-generation-of-expressive-ai-speech.md`.
- Création de `wiki/notes/gemini.md` comme note de contexte sur l'écosystème Gemini.
- Retrait du signal `Gemini 3.1 Flash TTS` de `wiki/notes/gemini-cli.md` pour garder une séparation claire entre l'écosystème Gemini et l'outil `Gemini CLI`.
- Mise à jour de `wiki/index.md` pour référencer cette nouvelle note.

## [2026-04-16] workflow | Separation CLI releases et model releases
- Correction du flux OpenCode dans `n8n-workflows/passive-news-cli.json` : remplacement de `opencode-ai/opencode` par `anomalyco/opencode`.
- Vérification du flux Atom `https://github.com/anomalyco/opencode/releases.atom` depuis le VPS.
- Création de `n8n-workflows/passive-model-releases.json` pour collecter séparément les annonces de modèles par provider.
- Objectif : garder les releases CLI dans le workflow CLI, et isoler les signaux modèles dans des captures `category: model-release`.
- Import dans n8n du nouveau workflow `Passive Model Releases`.
- Réimport de `Passive News CLI` avec sélection d'une capture récente par source, pour éviter qu'une seule source masque `OpenCode`.
- Correction du header OpenRouter dans `Passive News CLI` pour utiliser `$env.OPENROUTER_API_KEY` au lieu d'un placeholder.

## [2026-04-16] workflow | Separation provider news hors du workflow CLI
- Renommage fonctionnel de `Passive News CLI` en `Passive CLI Releases`.
- Retrait des flux `OpenAI News` et `Google AI Blog` du workflow CLI afin de réduire le bruit dans la veille sur les CLI agentiques.
- Création de `n8n-workflows/passive-provider-news.json` pour conserver les news providers dans un workflow séparé.
- Import dans n8n de `Passive CLI Releases` et `Passive Provider News`.
- État cible : `Passive CLI Releases` pour les releases d'outils, `Passive Model Releases` pour les modèles, `Passive Provider News` pour les annonces générales providers.

## [2026-04-16] workflow | Correction OpenRouter sans acces `$env`
- Correction du problème `access to env vars denied` dans le node `Summarize Passive Capture`.
- Les exports versionnés gardent le placeholder `Bearer __OPENROUTER_API_KEY__`.
- Sur le VPS, l'import n8n est fait via une copie temporaire où le placeholder est remplacé par la valeur de `.env`, puis cette copie temporaire est supprimée.
- Réimport de `Passive CLI Releases` et `Passive Provider News` après correction.

## [2026-04-16] structure | Sous-dossiers dans raw/passive
- Création des sous-dossiers `raw/passive/cli/`, `raw/passive/model/`, `raw/passive/provider-news/` et `raw/passive/trending/`.
- Déplacement des captures passives existantes dans le bon sous-dossier selon leur nature.
- Mise à jour des liens des notes et de la documentation du vault vers ces nouveaux chemins.
- Objectif : mieux séparer releases CLI, releases modèles, news providers et signaux communautaires.

## [2026-04-16] workflow | Correction du schedule Passive Model Releases
- Correction d'un intervalle invalide dans `Passive Model Releases` : `hoursInterval: 24` était refusé par n8n.
- Alignement sur un intervalle valide de `12` heures.
- Réimport du workflow dans n8n après correction.

## [2026-04-16] workflow | Snapshot manuel des derniers modeles providers
- Création de `n8n-workflows/manual-provider-models-snapshot.json`.
- Ce workflow est déclenché manuellement et ne dépend pas de la fraîcheur d'une actu récente.
- Objectif : récupérer les derniers modèles visibles par provider et peupler `raw/passive/model/`.
- Ajout initial de trois captures de snapshot : `openai`, `anthropic` et `google`.

## [2026-04-16] workflow | Correction runtime du snapshot manuel provider
- Correction du workflow `Manual Provider Models Snapshot` après erreur `fetch is not defined` dans le node Code.
- Remplacement du fetch dans le Code node par trois nodes `HTTP Request` dédiés : OpenAI, Anthropic et Google.
- Le Code node ne fait plus que parser les réponses et construire les captures Markdown.
- Réimport du workflow corrigé dans n8n.

## [2026-04-16] workflow | Correction 403 OpenAI dans snapshot manuel provider
- Correction du workflow `Manual Provider Models Snapshot` après erreur 403 sur `https://platform.openai.com/docs/models`.
- Retrait du node `HTTP OpenAI Models`.
- OpenAI utilise maintenant une liste statique de modèles visibles dans la capture initiale, tandis que Anthropic et Google restent récupérés par `HTTP Request`.
- Réimport du workflow corrigé dans n8n.

## [2026-04-16] workflow | Snapshot manuel providers via OpenRouter
- Remplacement de la liste statique OpenAI par un fetch dynamique de `https://openrouter.ai/api/v1/models`.
- Simplification de `Manual Provider Models Snapshot` : un node `HTTP OpenRouter Models`, puis parsing par provider dans un node Code.
- Le workflow produit une capture par provider (`openai`, `anthropic`, `google`) dans `raw/passive/model/`.
- Validation locale du parser avec la réponse OpenRouter réelle, puis réimport dans n8n.

## [2026-04-16] workflow | Correction ecriture snapshot modeles
- Correction du node `Write Model Snapshot Capture` après erreur `Cannot read properties of undefined (reading 'toString')`.
- Ajout d'un node `Restore Output Path` entre `Convert Markdown To File` et `Write Model Snapshot Capture`.
- Alignement du pattern d'écriture sur les workflows passifs existants qui convertissent le Markdown en binaire puis restaurent les métadonnées JSON.
- Réimport du workflow corrigé dans n8n.

## [2026-04-16] sync | Reconciliation local, VPS et GitHub
- Sauvegarde de l'état local avant synchronisation dans `_sync-backups/`.
- Réconciliation depuis une worktree propre basée sur `origin/main` pour éviter un pull destructif sur le dépôt local sale.
- Conservation de l'infrastructure GitHub/VPS existante : scripts d'auto-sync, workflows n8n et captures passives déjà suivies.
- Règle de merge retenue : `wiki/` et `raw/active/` viennent du local, `raw/passive/` vient du VPS/GitHub.
- Réalignement du vault sur la structure du cours : les notes finales restent dans `wiki/notes/`, pas à la racine du vault.
- Ajout des sources actives locales liées à la veille CLI agentiques dans `raw/active/`.
- Ajout de `veille-vault/.obsidian/` au `.gitignore` pour éviter de versionner la configuration locale de l'éditeur.