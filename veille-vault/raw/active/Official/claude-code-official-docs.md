---
title: "Claude Code official docs"
source: "https://docs.anthropic.com/en/docs/claude-code/overview"
author:
published:
created: 2026-04-15
description: "Bundle de documentation officielle Anthropic sur Claude Code, avec extraits d'overview, de settings et de data usage."
tags:
  - "clippings"
  - "official-docs"
  - "claude-code"
---
# Claude Code official docs

## Overview
Source : https://docs.anthropic.com/en/docs/claude-code/overview

Extrait capture :

> Claude Code est l'outil de codage agentique d'Anthropic qui vit dans le terminal.

Points visibles dans la documentation :

- il peut construire des fonctionnalites a partir d'une demande en langage naturel ;
- il peut deboguer, naviguer dans un codebase, editer des fichiers, lancer des commandes et creer des commits ;
- il met en avant `MCP`, la composabilite shell et l'automatisation dans `CI` ;
- Anthropic le presente comme un outil terminal-first et enterprise-ready.

## Settings
Source : https://docs.anthropic.com/en/docs/claude-code/settings

Points visibles dans la documentation :

- configuration hierarchique via `~/.claude/settings.json`, `.claude/settings.json` et `.claude/settings.local.json` ;
- gestion des permissions avec des regles `allow`, `ask` et `deny` ;
- prise en charge de `hooks`, `MCP`, `CLAUDE.md`, sous-agents et variables d'environnement ;
- possibilite d'appliquer des politiques gerees en entreprise.

## Data usage
Source : https://docs.anthropic.com/en/docs/claude-code/data-usage

Points visibles dans la documentation :

- la politique de donnees depend du type de compte ;
- la documentation distingue les cas consumer et commerciaux ;
- de la telemetrie operationnelle existe et peut etre desactivee via variable d'environnement ;
- l'angle securite / conformite fait partie du positionnement officiel du produit.
