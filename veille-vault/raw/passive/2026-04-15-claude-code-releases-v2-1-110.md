---
kind: passive-capture
source_name: "Claude Code Releases"
source_type: primaire
category: cli-release
tags: [ia, claude-code, cli, release]
title: "v2.1.110"
url: "https://github.com/anthropics/claude-code/releases/tag/v2.1.110"
published_at: "2026-04-15T23:21:43.000Z"
collected_at: "2026-04-16T08:39:15.395Z"
confidence: high
major_update: true
workflow: passive-news-cli
status: a-traiter
---

# v2.1.110

## Metadonnees
- Source : Claude Code Releases
- Type : primaire
- Categorie : cli-release
- URL : https://github.com/anthropics/claude-code/releases/tag/v2.1.110
- Publie le : 2026-04-15T23:21:43.000Z
- Collecte le : 2026-04-16T08:39:15.395Z
- Niveau de confiance : high

## Extrait brut
What's changed Added /tui command and tui setting — run /tui fullscreen to switch to flicker-free rendering in the same conversation Changed Ctrl+O to toggle between normal and verbose transcript only; focus view is now toggled separately with the new /focus command Added push notification tool — Claude can send mobile push notifications when Remote Control and "Push when Claude decides" config are enabled Added autoScrollEnabled config to disable conversation auto-scroll in fullscreen mode Added option to show Claude's last response as commented context in the Ctrl+G external editor (enable via /config) Improved /plugin Installed tab — items needing attention and favorites appear at the top, disabled items are hidden behind a fold, and f favorites the selected item Improved /doctor to warn when an MCP server is defined in multiple config scopes with different endpoints --resume/--continue now resurrects unexpired scheduled tasks /autocompact, /context, /exit, and /reload-plugins now work from Remote Control (mobile/web) clients Write tool now informs the model when you edit the proposed content in the IDE diff before accepting Bash tool now enforces the documented maximum timeout instead of accepting arbitrarily large values SDK/headless sessions now read TRACEPARENT/TRACESTATE from the environment for distributed trace linking Session recap is now enabled for users with telemetry disabled (Bedrock, Vertex, Foundry, DISABLE_TELEMETRY). Opt out via /config or CLAUDE_CODE_ENAB

## Resume IA preliminaire
- Nouvelle version v2.1.110 de Claude Code
- Ajout de la commande /tui et du paramètre tui
- Amélioration de la gestion des plugins et des notifications push

## Points a verifier
- Fonctionnalité de rendu sans flicker en mode plein écran
- Comportement des raccourcis clavier (Ctrl+O, Ctrl+G)
- Fonctionnement des notifications push sur les appareils mobiles

## Action possible
- [ ] Decider si cette entree merite une vraie note dans `wiki/notes/`
