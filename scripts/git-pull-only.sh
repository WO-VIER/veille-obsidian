#!/usr/bin/env bash

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BRANCH="${1:-main}"

cd "$REPO_ROOT"

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "[git-pull-only] Ce dossier n'est pas un depot git: $REPO_ROOT" >&2
  exit 1
fi

CURRENT_BRANCH="$(git branch --show-current)"
if [ "$CURRENT_BRANCH" != "$BRANCH" ]; then
  echo "[git-pull-only] Branche locale inattendue: $CURRENT_BRANCH (attendu: $BRANCH)" >&2
  exit 1
fi

echo "[git-pull-only] Pull du depot $REPO_ROOT depuis origin/$BRANCH"

if ! git diff --quiet || ! git diff --cached --quiet; then
  echo "[git-pull-only] Changements locaux detectes; autostash utilise si necessaire."
fi

UNTRACKED_COUNT="$(git ls-files --others --exclude-standard | wc -l | tr -d ' ')"
if [ "$UNTRACKED_COUNT" != "0" ]; then
  echo "[git-pull-only] Fichiers non suivis presents: $UNTRACKED_COUNT"
fi

git pull --ff-only --autostash origin "$BRANCH"

echo "[git-pull-only] Pull termine. Aucun commit ni push effectue."
