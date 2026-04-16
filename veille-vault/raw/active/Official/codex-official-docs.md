---
title: "Codex official docs"
source: "https://developers.openai.com/codex/cli"
author:
published:
created: 2026-04-15
description: "Bundle de sources officielles OpenAI sur Codex, a partir de la doc CLI, de l'annonce initiale et de la general availability."
tags:
  - "clippings"
  - "official-docs"
  - "codex"
---
# Codex official docs

## Codex CLI docs
Source : https://developers.openai.com/codex/cli

Points visibles dans la documentation :

- `Codex CLI` est presente comme l'agent de code OpenAI utilisable localement depuis le terminal ;
- la doc insiste sur le fait qu'il peut lire, modifier et executer du code dans le repertoire courant ;
- le produit est decrit comme open source et implemente en `Rust` ;
- l'architecture documentaire montre un produit deja structure autour de la `CLI`, du web, de l'IDE, de la configuration, de `MCP`, des `hooks`, des `skills`, des sous-agents et de l'administration.

## Introducing Codex
Source : https://openai.com/index/introducing-codex/

Points visibles dans l'annonce initiale :

- OpenAI presente `Codex` comme un agent d'ingenierie logicielle capable de travailler en parallele sur plusieurs taches ;
- l'annonce explique que `Codex` peut etre guide par des fichiers `AGENTS.md` places dans un depot pour indiquer comment naviguer dans le codebase, quels tests lancer et quelles conventions respecter ;
- l'article relie explicitement le mode terminal `Codex CLI` au mouvement plus large des outils de pair-programming agentique ;
- OpenAI insiste aussi sur la verification humaine des sorties, des logs et des tests.

## Codex is now generally available
Source : https://openai.com/index/codex-now-generally-available/

Points visibles dans l'annonce de general availability :

- `Codex` evolue vers une plateforme plus large que la seule `CLI` ;
- l'annonce met en avant trois briques nouvelles : integration `Slack`, `Codex SDK` et fonctions d'administration pour les equipes ;
- OpenAI decrit un produit unifie entre terminal, editeur et cloud, connecte au compte `ChatGPT` ;
- l'article confirme aussi que `Codex CLI` peut servir de point d'entree shell pour des workflows plus automatisees, par exemple avec `codex exec`.
