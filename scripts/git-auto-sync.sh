#!/usr/bin/env bash

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BRANCH="${1:-main}"
TIMESTAMP="$(date '+%Y-%m-%d %H:%M:%S %Z')"
COMMIT_PREFIX="${COMMIT_PREFIX:-chore: sync veille vault}"
DRY_RUN="${DRY_RUN:-0}"

cd "$REPO_ROOT"

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Ce dossier n'est pas un depot git: $REPO_ROOT" >&2
  exit 1
fi

echo "[git-auto-sync] Sync du depot $REPO_ROOT sur la branche $BRANCH"

# Rebase sur l'etat distant avant de preparer un commit local.
git pull --rebase --autostash origin "$BRANCH"

git add -A

if git diff --cached --quiet; then
  echo "[git-auto-sync] Aucun changement a synchroniser."
  exit 0
fi

if [ "$DRY_RUN" = "1" ]; then
  echo "[git-auto-sync] DRY_RUN=1, changements detectes :"
  git diff --cached --stat
  exit 0
fi

git commit -m "$COMMIT_PREFIX ($TIMESTAMP)"
git push origin "$BRANCH"

echo "[git-auto-sync] Synchronisation terminee."
