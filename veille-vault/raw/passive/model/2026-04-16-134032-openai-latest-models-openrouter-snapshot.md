---
kind: passive-capture
source_name: "OpenRouter Models API - OpenAI"
source_type: secondaire
category: model-snapshot
provider: openai
signal_type: model-snapshot
tags: [ia, openai, model-snapshot, openrouter]
title: "Latest OpenAI models snapshot"
url: "https://openrouter.ai/api/v1/models"
published_at: "2026-04-16T13:40:32.389Z"
collected_at: "2026-04-16T13:40:32.389Z"
confidence: medium
major_update: true
workflow: manual-provider-models-snapshot
status: a-traiter
---

# Latest OpenAI models snapshot

## Metadonnees
- Provider : openai
- Source : OpenRouter Models API - OpenAI
- Type : secondaire
- Categorie : model-snapshot
- URL : https://openrouter.ai/api/v1/models
- Collecte le : 2026-04-16T13:40:32.389Z

## Modeles detectes
- OpenAI: GPT-5.4 Nano (openai/gpt-5.4-nano, added 2026-03-17)
- OpenAI: GPT-5.4 Mini (openai/gpt-5.4-mini, added 2026-03-17)
- OpenAI: GPT-5.4 Pro (openai/gpt-5.4-pro, added 2026-03-05)
- OpenAI: GPT-5.4 (openai/gpt-5.4, added 2026-03-05)
- OpenAI: GPT-5.3 Chat (openai/gpt-5.3-chat, added 2026-03-03)
- OpenAI: GPT-5.3-Codex (openai/gpt-5.3-codex, added 2026-02-24)
- OpenAI: GPT Audio (openai/gpt-audio, added 2026-01-19)
- OpenAI: GPT Audio Mini (openai/gpt-audio-mini, added 2026-01-19)

## Extrait brut
OpenAI: GPT-5.4 Nano - GPT-5.4 nano is the most lightweight and cost-efficient variant of the GPT-5.4 family, optimized for speed-critical and high-volume tasks. It supports text and image inputs and is designed for low-
OpenAI: GPT-5.4 Mini - GPT-5.4 mini brings the core capabilities of GPT-5.4 to a faster, more efficient model optimized for high-throughput workloads. It supports text and image inputs with strong performance across reas
OpenAI: GPT-5.4 Pro - GPT-5.4 Pro is OpenAI's most advanced model, building on GPT-5.4's unified architecture with enhanced reasoning capabilities for complex, high-stakes tasks. It features a 1M+ token context window (9
OpenAI: GPT-5.4 - GPT-5.4 is OpenAI’s latest frontier model, unifying the Codex and GPT lines into a single system. It features a 1M+ token context window (922K input, 128K output) with support for...
OpenAI: GPT-5.3 Chat - GPT-5.3 Chat is an update to ChatGPT's most-used model that makes everyday conversations smoother, more useful, and more directly helpful. It delivers more accurate answers with better contextualiz
OpenAI: GPT-5.3-Codex - GPT-5.3-Codex is OpenAI’s most advanced agentic coding model, combining the frontier software engineering performance of GPT-5.2-Codex with the broader reasoning and professional knowledge capabil
OpenAI: GPT Audio - The gpt-audio model is OpenAI's first generally available audio model. The new snapshot features an upgraded decoder for more natural sounding voices and maintains better voice consistency. Audio is p
OpenAI: GPT Audio Mini - A cost-efficient version of GPT Audio. The new snapshot features an upgraded decoder for more natural sounding voices and maintains better voice consistency. Input is priced at $0.60 per million.

## Resume IA preliminaire
- Snapshot manuel des derniers modeles visibles sur OpenRouter pour OpenAI.
- Cette capture sert a peupler raw/passive/model/ pour la veille provider.
- OpenRouter est utilise comme agregateur secondaire : verifier les modeles importants contre les docs officielles avant synthese.

## Points a verifier
- Verifier dans la documentation officielle du provider si ces modeles sont bien les plus recents ou les plus pertinents.
- Decider si une note provider doit etre creee ou mise a jour.

## Action possible
- [ ] Decider si cette entree merite une mise a jour dans wiki/notes/openai.md ou wiki/notes/modeles-ia.md
