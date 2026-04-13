---
kind: passive-capture
source_name: "Claude Code Releases"
source_type: primaire
category: cli-release
tags: [ia, claude-code, cli, release]
title: "v2.1.101"
url: "https://github.com/anthropics/claude-code/releases/tag/v2.1.101"
published_at: "2026-04-10T19:03:41.000Z"
collected_at: "2026-04-13T19:45:50.402Z"
confidence: high
major_update: false
workflow: passive-news-cli
status: a-traiter
---

# v2.1.101

## Metadonnees
- Source : Claude Code Releases
- Type : primaire
- Categorie : cli-release
- URL : https://github.com/anthropics/claude-code/releases/tag/v2.1.101
- Publie le : 2026-04-10T19:03:41.000Z
- Collecte le : 2026-04-13T19:45:50.402Z
- Niveau de confiance : high

## Extrait brut
What's changed Added /team-onboarding command to generate a teammate ramp-up guide from your local Claude Code usage Added OS CA certificate store trust by default, so enterprise TLS proxies work without extra setup (set CLAUDE_CODE_CERT_STORE=bundled to use only bundled CAs) /ultraplan and other remote-session features now auto-create a default cloud environment instead of requiring web setup first Improved brief mode to retry once when Claude responds with plain text instead of a structured message Improved focus mode: Claude now writes more self-contained summaries since it knows you only see its final message Improved tool-not-available errors to explain why and how to proceed when the model calls a tool that exists but isn't available in the current context Improved rate-limit retry messages to show which limit was hit and when it resets instead of an opaque seconds countdown Improved refusal error messages to include the API-provided explanation when available Improved claude -p --resume to accept session titles set via /rename or --name Improved settings resilience: an unrecognized hook event name in settings.json no longer causes the entire file to be ignored Improved plugin hooks from plugins force-enabled by managed settings to run when allowManagedHooksOnly is set Improved /plugin and claude plugin update to show a warning when the marketplace could not be refreshed, instead of silently reporting a stale version Improved plan mode to hide the "Refine with Ultraplan

## Resume IA preliminaire
- Resume IA non structure disponible, a relire manuellement.

## Points a verifier
- Confirmer les details techniques si cette entree devient une vraie note.

## Action possible
- [ ] Decider si cette entree merite une vraie note dans `wiki/notes/`
