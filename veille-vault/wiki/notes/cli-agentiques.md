# CLI agentiques pour développeurs

## En une phrase
Les CLI agentiques forment un écosystème en évolution rapide que je suis par une veille continue, en croisant releases officielles, documentation et signaux communautaires.

## Périmètre
Cette note ne cherche pas à désigner un "meilleur" outil une fois pour toutes.

Elle sert à :

- repérer les outils qui structurent actuellement le paysage ;
- suivre leurs évolutions dans le temps ;
- distinguer les sources primaires des signaux communautaires ;
- garder une vision à jour sans repartir de zéro à chaque nouvelle release.

## Outils suivis
- [[codex|Codex]]
- [[claude-code|Claude Code]]
- [[gemini-cli|Gemini CLI]]

Outils aperçus dans les signaux communautaires, mais pas encore au centre de la veille :

- `Aider`
- `OpenCode`
- `Goose`

## Signaux que je suis
- releases et changelogs officiels ;
- documentation officielle quand elle éclaire le positionnement ou le fonctionnement ;
- signaux communautaires comme `Reddit` ou `GitHub Trending` ;
- indices d'écosystème autour des outils, par exemple extensions, skills ou workflows complémentaires.

## Ce que montre déjà la veille
- Le sujet est suffisamment vivant pour justifier une veille continue : plusieurs releases rapprochées apparaissent déjà dans `raw/passive/`.
- Les sources primaires sont hétérogènes : certaines releases sont riches en détails, d'autres sont très pauvres et demandent un recoupement.
- Les signaux communautaires sont utiles pour faire émerger des critères concrets de comparaison : prix, limites, ouverture, support `MCP`, qualité perçue, usages réels.
- Le paysage n'est pas figé : les outils évoluent vite, les opinions d'usage changent vite, et une conclusion définitive serait artificielle à ce stade.
- Les nouvelles captures du 16 avril confirment que les signaux à suivre ne sont pas seulement des ajouts de fonctionnalités : ils touchent aussi les plugins, la mémoire, le `TUI`, le contrôle distant, les sandboxes et l'observabilité.

## Signal secondaire récent : GitHub Trending
La capture `GitHub Trending Weekly - 2026-04-15` montre plusieurs dépôts liés à l'écosystème agentique :

- `andrej-karpathy-skills` autour des instructions pour `Claude Code` ;
- `hermes-agent` et `multica` autour d'agents persistants ou gérés ;
- `Archon`, présenté comme un harness builder pour rendre le codage IA plus déterministe ;
- `claude-mem`, plugin autour de la mémoire de sessions `Claude Code`.

Ce signal ne prouve pas l'adoption, mais il confirme que l'écosystème évolue aussi autour des outils : skills, mémoire, harness, orchestration et capitalisation de contexte.

## Apport du post Reddit comparatif
Le post `I compared all 6 major CLI coding agents` m'apporte un signal communautaire utile, non pas comme preuve définitive, mais comme grille de lecture du paysage.

Ce qu'il apporte concrètement :

- un élargissement du périmètre au-delà du noyau `Codex` / `Claude Code` / `Gemini CLI`, avec `Aider`, `OpenCode` et `Goose` ;
- des critères pratiques de comparaison visibles dans les usages réels : prix d'entrée, ouverture du code, liberté sur les backends, support `MCP`, type d'usage mis en avant ;
- une hypothèse intéressante sur les pratiques d'usage : certains utilisateurs combinent plusieurs agents selon la tâche plutôt que de n'en utiliser qu'un seul ;
- un rappel utile sur les benchmarks : comparer des outils agentiques ne revient pas simplement à comparer des modèles.

## Axes de comparaison utiles
- type de source disponible : release, doc, billet produit, retour d'expérience ;
- fréquence d'évolution visible dans les releases ;
- clarté du positionnement de l'outil ;
- modèle économique et niveau d'entrée pour commencer à l'utiliser ;
- ouverture de l'écosystème ;
- degré de fermeture ou de liberté sur les backends utilisables ;
- place du support `MCP` dans l'outil et dans son écosystème ;
- signaux de maturité d'usage dans la communauté.

## Réflexions provisoires
- `Codex`, `Claude Code` et `Gemini CLI` constituent un noyau crédible pour la veille, car ils apparaissent déjà dans la collecte passive.
- `GitHub Trending` est utile pour détecter des sujets émergents, mais ne doit pas être traité comme une preuve à lui seul.
- Les posts `Reddit` apportent un vocabulaire de terrain intéressant, mais ils doivent rester classés comme sources communautaires.
- Mon objectif n'est pas de trancher trop vite, mais de maintenir une vision structurée du paysage et de ses mouvements.
- La veille passive joue bien son rôle : elle fait remonter des micro-signaux que je peux ensuite consolider dans les notes par outil.

## Limites actuelles
- le corpus passif est encore modeste ;
- toutes les releases n'ont pas le même niveau de détail ;
- certaines informations de comparaison viennent de sources communautaires et doivent être recoupées ;
- le post Reddit comparatif est utile pour faire émerger des critères, mais il contient aussi des corrections et des débats dans les commentaires ;
- la veille est plus solide sur le suivi des signaux que sur l'évaluation fine des usages réellement comparables.

## Liens
- [[pipeline-de-veille]]
- [[codex]]
- [[claude-code]]
- [[gemini-cli]]
- [[technology-radar]]
- [[bias-journal]]

## Sources
- [Capture passive : Codex 0.119.0](../../raw/passive/cli/2026-04-10-codex-releases-0-119-0.md)
- [Capture passive : Codex 0.120.0](../../raw/passive/cli/2026-04-11-codex-releases-0-120-0.md)
- [Capture passive : Codex 0.121.0](../../raw/passive/cli/2026-04-15-codex-releases-0-121-0.md)
- [Capture passive : Claude Code v2.1.101](../../raw/passive/cli/2026-04-10-claude-code-releases-v2-1-101.md)
- [Capture passive : Claude Code v2.1.110](../../raw/passive/cli/2026-04-15-claude-code-releases-v2-1-110.md)
- [Capture passive : Gemini CLI v0.37.1](../../raw/passive/cli/2026-04-09-gemini-cli-releases-release-v0-37-1.md)
- [Capture passive : Gemini CLI v0.38.1](../../raw/passive/cli/2026-04-15-gemini-cli-releases-release-v0-38-1.md)
- [Capture passive : GitHub Trending Weekly](../../raw/passive/trending/2026-04-14-github-trending-weekly.md)
- [Capture passive : GitHub Trending Weekly 2026-04-15](../../raw/passive/trending/2026-04-15-github-trending-weekly.md)
- [Source active : comparaison communautaire des CLI coding agents](../../raw/active/Reddit/I%20compared%20all%206%20major%20CLI%20coding%20agents.md)
- [Source active : Claude Code et proxy CLI](../../raw/active/Reddit/I%20saved%2010M%20tokens%20%2889%25%29%20on%20my%20Claude%20Code%20sessions%20with%20a%20CLI%20proxy.md)
- [Source active : LLM Wiki](../../raw/active/Github/llm-wiki.md)