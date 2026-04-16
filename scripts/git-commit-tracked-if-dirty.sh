#!/usr/bin/env bash

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BRANCH="${1:-main}"
LOCK_FILE="$REPO_ROOT/.git-sync.lock"
COMMIT_PREFIX="${COMMIT_PREFIX:-sync tracked vps changes}"
TIMESTAMP="$(date '+%Y-%m-%d %H:%M:%S %Z')"

cd "$REPO_ROOT"

exec 9>"$LOCK_FILE"
if ! flock -n 9; then
  echo "[git-commit-tracked] Un autre sync git est deja en cours."
  exit 0
fi

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "[git-commit-tracked] Ce dossier n'est pas un depot git: $REPO_ROOT" >&2
  exit 1
fi

CURRENT_BRANCH="$(git branch --show-current)"
if [ "$CURRENT_BRANCH" != "$BRANCH" ]; then
  echo "[git-commit-tracked] Branche locale inattendue: $CURRENT_BRANCH (attendu: $BRANCH)" >&2
  exit 1
fi

echo "[git-commit-tracked] Pull prudent depuis origin/$BRANCH"
git pull --ff-only --autostash origin "$BRANCH"

UNTRACKED_COUNT="$(git ls-files --others --exclude-standard | wc -l | tr -d ' ')"
if [ "$UNTRACKED_COUNT" != "0" ]; then
  echo "[git-commit-tracked] Fichiers non suivis ignores: $UNTRACKED_COUNT"
fi

if git diff --quiet && git diff --cached --quiet; then
  echo "[git-commit-tracked] Aucun changement sur fichiers suivis."
  exit 0
fi

echo "[git-commit-tracked] Changements suivis detectes:"
git status --short --untracked-files=no

git add -u

if git diff --cached --quiet; then
  echo "[git-commit-tracked] Rien a committer apres git add -u."
  exit 0
fi

git commit -m "$COMMIT_PREFIX ($TIMESTAMP)"
git push origin "$BRANCH"

echo "[git-commit-tracked] Commit/push termine."
