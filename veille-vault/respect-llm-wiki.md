# Pourquoi ce vault respecte le pattern LLM Wiki

## En une phrase

Oui : ce vault respecte bien le pattern [[wiki/notes/llm-wiki|LLM Wiki]], parce qu'il sépare les sources brutes, le wiki maintenu par l'IA et les règles de maintenance, tout en adaptant le système au contexte du cours de veille technologique.

## Le pattern d'origine

Dans [[wiki/notes/llm-wiki|LLM Wiki]], l'idée centrale est simple :

- `raw sources` : les documents bruts sont la source de vérité ;
- `the wiki` : l'IA maintient une couche intermédiaire persistante en Markdown ;
- `the schema` : un fichier de règles guide la manière dont l'IA lit, écrit, relie et met à jour le wiki.

Le point important n'est pas seulement de résumer des documents, mais de faire croître un artefact durable qui s'améliore au fil des ingests, des questions et des vérifications.

## Correspondance avec notre architecture

### 1. Les sources brutes sont bien séparées

Le dossier `raw/` joue exactement le rôle des `raw sources` du pattern :

- `raw/passive/` reçoit les sources collectées automatiquement ;
- `raw/active/` reçoit les sources déposées manuellement ;
- `raw/assets/` stocke les images et pièces jointes locales.

Les fichiers bruts ne sont pas réécrits par l'IA. Ils restent la base factuelle du système.

### 2. Le wiki est bien une couche maintenue par l'IA

Le dossier `wiki/` joue exactement le rôle du `persistent wiki` décrit dans [[wiki/notes/llm-wiki|LLM Wiki]] :

- `wiki/notes/` pour les notes de veille, les fiches de synthèse, les notes atomiques et les notes de méthode ;
- `wiki/index.md` pour garder une vue d'ensemble ;
- `wiki/log.md` pour garder la mémoire chronologique des opérations.

Le wiki n'est donc pas un simple espace de stockage. C'est une couche de connaissance compilée, enrichie et reliée.

### 3. Les règles sont explicites

Le pattern LLM Wiki insiste sur l'importance du `schema`.

Dans notre vault, ce rôle est assuré par :

- [SCHEMA.md](../../SCHEMA.md), qui définit l'architecture, les workflows et les conventions ;
- [AGENTS.md](../../AGENTS.md), qui donne les règles permanentes de comportement à l'agent.

Autrement dit, on n'a pas seulement une idée de wiki. On a un contrat de fonctionnement.

### 4. On retrouve bien les opérations du pattern

Le pattern d'origine repose sur trois opérations majeures :

- `Ingest`
- `Query`
- `Lint`

Notre vault les respecte directement :

- `Ingest` : une source entre dans `raw/`, puis l'IA met à jour le wiki ;
- `Query` : une réponse utile peut devenir une note durable dans `wiki/notes/` ;
- `Lint` : le wiki peut être contrôlé pour repérer contradictions, doublons, pages orphelines ou zones non sourcées.

### 5. Index et log sont bien présents

Le pattern LLM Wiki repose aussi sur deux fichiers structurants :

- [index.md](../index.md) pour naviguer dans le contenu ;
- [log.md](../log.md) pour garder la mémoire chronologique des opérations.

Notre vault utilise exactement cette logique.

## Ce que nous avons adapté pour le cours

Nous avons ajouté une spécialisation métier, mais sans casser le pattern original :

- séparation entre veille passive et veille active ;
- hiérarchie de confiance des sources : primaire, secondaire, communautaire ;
- notes utiles au cours : radar, biais, rituels ;
- conclusion explicite des fiches : `Adopter`, `Expérimenter`, `Surveiller`, `Ignorer`.

Ces ajouts ne contredisent pas le pattern LLM Wiki. Ils l'instancient pour la veille technologique et pour la grille d'évaluation du cours 5XVTE.

## Pourquoi c'est cohérent pédagogiquement

Cette architecture permet de montrer clairement :

- la collecte avec `raw/passive/` et `raw/active/` ;
- l'analyse et la synthèse avec `wiki/notes/` ;
- la diffusion et la capitalisation avec `wiki/index.md`, `wiki/log.md` et les notes reliées ;
- la continuité du système grâce aux règles inscrites dans `SCHEMA.md` et `AGENTS.md`.

Autrement dit, le vault ne sert pas seulement à stocker des documents. Il démontre un vrai système de veille structuré.

## Conclusion

La bonne formulation est la suivante :

Nous respectons bien [[wiki/notes/llm-wiki|LLM Wiki]], mais nous l'avons rendu concret pour un cas d'usage précis : un système personnel de veille technologique, démontrable dans Obsidian, compatible avec n8n, et aligné avec les attentes du cours.

## Sources

- [LLM Wiki (source brute)](../../raw/active/Github/llm-wiki.md)
- [SCHEMA.md](../../SCHEMA.md)
- [AGENTS.md](../../AGENTS.md)
