# CLI agentiques pour developpeurs

## En une phrase
Les CLI agentiques forment un ecosysteme en evolution rapide que je suis par une veille continue, en croisant releases officielles, documentation et signaux communautaires.

## Perimetre
Cette note ne cherche pas a designer un "meilleur" outil une fois pour toutes.

Elle sert a :

- reperer les outils qui structurent actuellement le paysage ;
- suivre leurs evolutions dans le temps ;
- distinguer les sources primaires des signaux communautaires ;
- garder une vision a jour sans repartir de zero a chaque nouvelle release.

## Outils suivis
- [[codex|Codex]]
- [[claude-code|Claude Code]]
- [[gemini-cli|Gemini CLI]]

Outils apercus dans les signaux communautaires, mais pas encore au centre de la veille :

- `Aider`
- `OpenCode`
- `Goose`

## Signaux que je suis
- releases et changelogs officiels ;
- documentation officielle quand elle eclaire le positionnement ou le fonctionnement ;
- signaux communautaires comme `Reddit` ou `GitHub Trending` ;
- indices d'ecosysteme autour des outils, par exemple extensions, skills ou workflows complementaires.

## Ce que montre deja la veille
- Le sujet est suffisamment vivant pour justifier une veille continue : plusieurs releases rapprochees apparaissent deja dans `raw/passive/`.
- Les sources primaires sont heterogenes : certaines releases sont riches en details, d'autres sont tres pauvres et demandent un recoupement.
- Les signaux communautaires sont utiles pour faire emerger des criteres concrets de comparaison : prix, limites, ouverture, support `MCP`, qualite percue, usages reels.
- Le paysage n'est pas fige : les outils evoluent vite, les opinions d'usage changent vite, et une conclusion definitive serait artificielle a ce stade.
- Les nouvelles captures du 16 avril confirment que les signaux a suivre ne sont pas seulement des ajouts de fonctionnalites : ils touchent aussi les plugins, la memoire, le `TUI`, le controle distant, les sandboxes et l'observabilite.

## Signal secondaire recent : GitHub Trending
La capture `GitHub Trending Weekly - 2026-04-15` montre plusieurs depots lies a l'ecosysteme agentique :

- `andrej-karpathy-skills` autour des instructions pour `Claude Code` ;
- `hermes-agent` et `multica` autour d'agents persistants ou geres ;
- `Archon`, presente comme un harness builder pour rendre le codage IA plus deterministe ;
- `claude-mem`, plugin autour de la memoire de sessions `Claude Code`.

Ce signal ne prouve pas l'adoption, mais il confirme que l'ecosysteme evolue aussi autour des outils : skills, memoire, harness, orchestration et capitalisation de contexte.

## Apport du post Reddit comparatif
Le post `I compared all 6 major CLI coding agents` m'apporte un signal communautaire utile, non pas comme preuve definitive, mais comme grille de lecture du paysage.

Ce qu'il apporte concretement :

- un elargissement du perimetre au-dela du noyau `Codex` / `Claude Code` / `Gemini CLI`, avec `Aider`, `OpenCode` et `Goose` ;
- des criteres pratiques de comparaison visibles dans les usages reels : prix d'entree, ouverture du code, liberte sur les backends, support `MCP`, type d'usage mis en avant ;
- une hypothese interessante sur les pratiques d'usage : certains utilisateurs combinent plusieurs agents selon la tache plutot que de n'en utiliser qu'un seul ;
- un rappel utile sur les benchmarks : comparer des outils agentiques ne revient pas simplement a comparer des modeles.

## Axes de comparaison utiles
- type de source disponible : release, doc, billet produit, retour d'experience ;
- frequence d'evolution visible dans les releases ;
- clarte du positionnement de l'outil ;
- modele economique et niveau d'entree pour commencer a l'utiliser ;
- ouverture de l'ecosysteme ;
- degre de fermeture ou de liberte sur les backends utilisables ;
- place du support `MCP` dans l'outil et dans son ecosysteme ;
- signaux de maturite d'usage dans la communaute.

## Reflexions provisoires
- `Codex`, `Claude Code` et `Gemini CLI` constituent un noyau credible pour la veille, car ils apparaissent deja dans la collecte passive.
- `GitHub Trending` est utile pour detecter des sujets emergents, mais ne doit pas etre traite comme une preuve a lui seul.
- Les posts `Reddit` apportent un vocabulaire de terrain interessant, mais ils doivent rester classes comme sources communautaires.
- Mon objectif n'est pas de trancher trop vite, mais de maintenir une vision structuree du paysage et de ses mouvements.
- La veille passive joue bien son role : elle fait remonter des micro-signaux que je peux ensuite consolider dans les notes par outil.

## Limites actuelles
- le corpus passif est encore modeste ;
- toutes les releases n'ont pas le meme niveau de detail ;
- certaines informations de comparaison viennent de sources communautaires et doivent etre recoupees ;
- le post Reddit comparatif est utile pour faire emerger des criteres, mais il contient aussi des corrections et des debats dans les commentaires ;
- la veille est plus solide sur le suivi des signaux que sur l'evaluation fine des usages reellement comparables.

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
