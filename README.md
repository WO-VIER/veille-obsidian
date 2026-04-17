# Veille Obsidian & PKM Agentique

Système de veille technologique et de gestion de connaissances (PKM) automatisé, articulé autour d'un Vault Obsidian et d'agents IA.

## Concept : Le "LLM Wiki" (Andrej Karpathy)

Ce projet implémente une approche inspirée par la vision d'**Andrej Karpathy** sur la gestion de connaissances : déléguer la maintenance lourde (le "bookkeeping") à des modèles de langage (LLM).

- **Le LLM comme Bibliothécaire** : Plutôt que de simplement indexer des documents (RAG classique), l'IA agit comme un mainteneur actif du wiki. Elle lit les sources brutes (`raw/`), les synthétise, crée des liens bidirectionnels et met à jour les index thématiques.
- **Réduction de la Friction** : L'humain se concentre sur la capture initiale et l'analyse finale, tandis que l'agent IA s'occupe du résumé, du tagging et du "nettoyage" continu du vault.
- **Croissance Cumulative** : Grâce à cette maintenance automatisée, la base de connaissances reste structurée et exploitable sur le long terme, évitant l'entropie habituelle des dossiers de veille.

## Architecture

- **Capture Passive (n8n)** : Flux RSS, GitHub Releases et Reddit agrégés automatiquement dans `raw/passive/`.
- **Vault Obsidian** : Le cerveau central, structuré pour la lecture humaine et machine.
- **CLI Agentiques & Skills** : Utilisation d'outils comme `Gemini CLI` ou `Claude Code` pour manipuler le vault via des commandes (`/ingest`, `/lint`, `/query`).
- **Présentation (Slidev)** : Support de présentation auto-généré situé dans le dossier `presentation/`.

## Infrastructure & Synchronisation

Le poste local est la source principale pour les notes, l'index et les sources actives. Le VPS sert à faire tourner les workflows et à assurer la persistance du dépôt.

### Synchronisation VPS

Le local reste la source principale de travail. Le VPS suit GitHub automatiquement.

```bash
bash /root/veille-obsidian/scripts/install-vps-git-crons.sh main
```

### Règles de Git
- Les commits automatiques ne concernent que les fichiers déjà suivis (`git add -u`).
- Les nouvelles captures brutes restent locales jusqu'à validation manuelle ou inclusion explicite.

---

## Guide Opérationnel (Workflow LLM Wiki)

Le système suit les trois boucles de rétroaction définies dans la méthodologie :

1.  **Ingest (Capture)** : Lorsqu'une nouvelle source arrive dans `raw/passive/`, l'agent IA :
    - Lit et synthétise le document.
    - Met à jour `index.md` et `log.md`.
    - Propage les connaissances sur les pages d'entités existantes (ex: mise à jour de la fiche "Claude Code" après une nouvelle release).
2.  **Query (Exploration)** : Les questions posées au vault ne sont pas de simples recherches. Les réponses pertinentes sont **réinjectées dans le wiki** sous forme de nouvelles notes de synthèse, faisant ainsi fructifier le capital de connaissances au fil des interactions.
3.  **Lint (Maintenance)** : Périodiquement, l'agent scanne le vault pour identifier les contradictions, les liens brisés ou les concepts qui mériteraient une page dédiée, garantissant que la santé du vault est maintenue sans effort humain.

---
*Note : Ce workflow est documenté en détail dans `veille-vault/raw/active/llm-wiki.md`.*
