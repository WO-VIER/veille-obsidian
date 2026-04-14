# LLM Wiki et veille technologique

## En une phrase
Le pattern [[llm-wiki|LLM Wiki]] rend la veille plus durable en transformant des captures brutes en un wiki cumulatif, mais il ne remplace ni le tri critique ni la synthèse demandés par le cours.

## Contexte
Le pattern LLM Wiki, popularisé par Andrej Karpathy, décrit une architecture simple : des sources brutes dans `raw/`, un wiki persistant en Markdown, puis des opérations d'`ingest`, `query` et `lint` assurées en grande partie par l'IA. Dans le cadre du cours 5XVTE, cette idée est pertinente parce qu'elle donne une vraie colonne vertébrale au système de veille : `RSS` et `n8n` capturent, `Obsidian` centralise, et le wiki garde la mémoire des analyses au lieu de laisser les réponses disparaître dans le chat.

## Points cles
- Le pattern distingue clairement la **collecte** brute et la **connaissance** reformulée.
- Obsidian devient l'interface de lecture et de navigation, pendant que l'IA maintient le wiki comme un artefact vivant.
- Pour le cours, l'automatisation est utile surtout sur la collecte et la pré-synthèse, pas comme remplacement total de la réflexion.
- Le vrai gain n'est pas seulement de résumer des documents, mais de créer une mémoire cumulative avec des liens, des décisions et des pages durables.

## Analyse 5W+H & pertinence
- **Who (Qui)** : Andrej Karpathy et, plus largement, l'écosystème actuel des agents et des outils de knowledge management assistés par LLM.
- **What (Quoi)** : Une manière d'utiliser un LLM pour compiler des sources en un wiki Markdown persistant plutôt que de refaire du RAG à chaque question.
- **When (Quand)** : Sujet très actuel, cohérent avec la montée des agents, des workflows CLI et des outils comme Obsidian Web Clipper.
- **Where (Où)** : Dans un vault local Obsidian structuré autour de `raw/` et `wiki/notes/`.
- **Why (Pourquoi)** : Réduire le coût de maintenance du PKM et éviter que la veille reste un empilement de captures jamais réutilisées.
- **How (Comment)** : Ingestion de sources dans `raw/`, compilation ou mise à jour de notes dans `wiki/notes/`, puis interrogation et contrôle de cohérence via `query` et `lint`.
- **Pertinence** : 24/25 (Utilité : 5, Nouveauté : 4, Fiabilité : 5, Actionabilité : 5, Durabilité : 5)

## Impact pour moi / mon equipe
- Ce pattern donne une méthode crédible pour montrer `collecte -> analyse -> synthèse -> diffusion` dans le cadre du cours.
- Il justifie l'usage combiné de `n8n`, `Obsidian`, des captures `raw/active` via Clipper et des notes finales dans `wiki/notes/`.
- Il donne aussi un angle fort pour la présentation orale : la veille ne sert pas seulement à détecter des nouveautés, elle construit une mémoire réutilisable.

## Action / Conclusion
- [x] Adopter
- [ ] Experimenter
- [ ] Surveiller
- [ ] Ignorer

## Liens connexes
- [[llm-wiki|LLM Wiki]]
- [[pipeline-de-veille]]
- [[pipeline-incorporation-note]]
- [[pkm|PKM]]
- [[rag|RAG]]
- [[respect-llm-wiki]]

## Sources
- [LLM Wiki (source brute)](../../raw/active/llm-wiki.md)
- [Thread by @karpathy](../../raw/active/Thread%20by%20@karpathy.md)
