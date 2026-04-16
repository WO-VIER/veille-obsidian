# LLM Wiki Pattern

## En une phrase
Un modèle d'architecture où l'IA gère la maintenance d'un wiki personnel persistant, remplaçant la méthode RAG classique par une accumulation structurée de connaissances.

## Contexte
La gestion des connaissances personnelles ([[pkm|PKM]]) est souvent abandonnée car la maintenance (mise à jour des liens, synthèses) devient plus coûteuse que la valeur générée. De plus, les systèmes classiques basés sur les LLM ([[rag|RAG]]) recréent la connaissance à chaque question sans jamais rien capitaliser. Le LLM Wiki résout cela en déléguant le "bookkeeping" à l'IA.

## Détails techniques
- **Architecture en 3 couches** :
  - *Raw sources* : Documents bruts immuables (la source de vérité).
  - *The wiki* : Fichiers Markdown générés et maintenus par l'IA.
  - *The schema* : Règles définissant le comportement de l'IA (le fichier `SCHEMA.md`).
- **Opérations principales** :
  - *Ingest* : L'IA lit une source, crée une synthèse, met à jour l'index et tisse des liens Zettelkasten.
  - *Query* : L'utilisateur pose des questions, l'IA répond et peut créer de nouvelles fiches.
  - *Lint* : Vérification périodique de la santé du wiki (liens orphelins, contradictions).

## Analyse 5W+H & Pertinence
- **Who (Qui)** : Concept partagé dans la communauté IA (notamment attribué à Andrej Karpathy).
- **What (Quoi)** : Utilisation de l'IA pour écrire et maintenir un wiki persistant plutôt que de faire du RAG à la volée.
- **When (Quand)** : Tendance très actuelle grâce aux LLM de nouvelle génération.
- **Where (Où)** : Écosystème local, souvent couplé à Obsidian.
- **Why (Pourquoi)** : Le maintien manuel d'un wiki est trop lourd. L'IA ne s'ennuie jamais et maintient la cohérence.
- **How (Comment)** : L'IA agit comme un programmeur dont le code est le Wiki Markdown, pendant que l'utilisateur joue le rôle de curateur.
- **Pertinence** : 23/25 (Utilité: 5, Nouveauté: 5, Fiabilité: 4, Actionabilité: 5, Durabilité: 4)

## Action / Conclusion
- [x] **Adopter** : C'est le cœur même de notre système actuel pour le cours.

## Sources
- [LLM Wiki (Raw Source)](../../raw/active/Github/llm-wiki.md)
