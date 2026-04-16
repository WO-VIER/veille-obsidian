# [Wallabag] Graphify — Knowledge Graph Skill for AI Coding Assistants

## Metadonnees
- ID Wallabag: 2
- Capture: 2026-04-16T08:00:02+00:00
- URL: https://graphify.net/
- Domaine: graphify.net
- Langue: en
- Temps de lecture estime: 3 min
- Archive: true
- Favori: false
- Tags: agent, llm, skills

## Extrait brut
Open-Source Knowledge Graph Skill Graphify is an open-source skill that helps AI coding assistants understand multi-modal codebases by building a queryable knowledge graph from code, docs, papers and diagrams. $ pip install graphifyy Core Capabilities Graphify unifies static analysis, semantic extraction and graph clustering into a single skill that any AI coding assistant can invoke. Multi-Modal Extraction Parses code (.py, .js, .go, .java, …), Markdown, PDFs and images. Tree-sitter extracts ASTs, call graphs and docstrings; LLMs extract concepts from prose; vision models read diagrams. Knowledge Graph Build Merges all extracted nodes and edges into a NetworkX graph and applies the Leiden algorithm for semantic community detection — no vector embeddings required. God Nodes & Surprises Identifies the highest-degree "god nodes" at the heart of the system and flags unexpected cross-file or cross-domain connections worth investigating. Interactive Outputs Exports an interactive graph.html , a queryable graph.json , and a human-readable GRAPH_REPORT.md audit report. Assistant Integration Ships with /graphify , /graphify query , /graphify path and /graphify explain commands for Claude Code, Codex, OpenCode and more. Secure by Design Strict input validation: only http/https URLs, size and timeout limits, path containment, HTML-escaped node labels — defending against SSRF, injection and XSS. Architecture & Pipeline Graphify is a multi-stage pipeline. Each stage is an isolated module so contributors can extend any step independently. detect — collect files extract — AST + LLM nodes/edges build — NetworkX graph cluster — Leiden communities analyze — god nodes & surprises report — GRAPH_REPORT.md export — HTML / JSON / Obsidian Supporting modules include ingest.py for URL fetching, cache.py for semantic caching, security.py for input validation, watch.py for live updates and serve.py for MCP-protocol service. Install & Run Graphify is distributed on PyPI. The package name is graphifyy ; the CLI command remains graphify . # Requires Python 3.10+ pip install graphifyy && graphify install # Build a knowledge graph for any project folder /graphify ./raw # Outputs land in graphify-out/ graphify-out/ ├── graph.html # interactive visualization ├── GRAPH_REPORT.md # core nodes, surprises, suggested questions ├── graph.json # persistent, queryable graph └── cache/ # incremental cache Graphify does not bundle an LLM. It uses the model API key already configured by your AI coding assistant (Claude, Codex, etc.) and only sends semantic content — never raw source code — to the upstream model. Worked Examples The repository ships with reproducible corpora demonstrating Graphify on both small libraries and large mixed code-and-paper collections. httpx (small) 6 Python files modeling an HTTP transport layer. Result: 144 nodes, 330 edges, 6 communities . God nodes: Client , AsyncClient , Response , Request . Surprise edge: DigestAuth → Response . Karpathy mixed corpus 3 GP

## Resume IA preliminaire
- Non genere automatiquement.

## Points a verifier
- Classer la source (primaire / secondaire / communautaire).
- Verifier les faits techniques critiques avant reutilisation.

## Action possible
- Si pertinent, creer ou enrichir une note dans `wiki/notes/`.
