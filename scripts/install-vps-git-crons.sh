#!/usr/bin/env bash

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PULL_SCRIPT="$REPO_ROOT/scripts/git-pull-only.sh"
TRACKED_COMMIT_SCRIPT="$REPO_ROOT/scripts/git-commit-tracked-if-dirty.sh"
OLD_SYNC_SCRIPT="$REPO_ROOT/scripts/git-auto-sync.sh"
BRANCH="${1:-main}"

PULL_SCHEDULE="${PULL_SCHEDULE:-*/15 * * * *}"
TRACKED_COMMIT_SCHEDULE="${TRACKED_COMMIT_SCHEDULE:-20 */12 * * *}"
WEEKLY_TRENDING_SCHEDULE="${WEEKLY_TRENDING_SCHEDULE:-20 9 * * 1}"

PULL_LOG="${PULL_LOG:-$REPO_ROOT/.git-pull-only.log}"
TRACKED_COMMIT_LOG="${TRACKED_COMMIT_LOG:-$REPO_ROOT/.git-commit-tracked.log}"

PULL_CRON="$PULL_SCHEDULE bash $PULL_SCRIPT $BRANCH >> $PULL_LOG 2>&1"
TRACKED_COMMIT_CRON="$TRACKED_COMMIT_SCHEDULE bash $TRACKED_COMMIT_SCRIPT $BRANCH >> $TRACKED_COMMIT_LOG 2>&1"
WEEKLY_TRENDING_CRON="$WEEKLY_TRENDING_SCHEDULE bash $TRACKED_COMMIT_SCRIPT $BRANCH >> $TRACKED_COMMIT_LOG 2>&1"

CURRENT_CRONTAB="$(mktemp)"
trap 'rm -f "$CURRENT_CRONTAB"' EXIT

crontab -l 2>/dev/null \
  | grep -vF "$OLD_SYNC_SCRIPT" \
  | grep -vF "$PULL_SCRIPT" \
  | grep -vF "$TRACKED_COMMIT_SCRIPT" \
  > "$CURRENT_CRONTAB" || true

printf '%s\n' "$PULL_CRON" >> "$CURRENT_CRONTAB"
printf '%s\n' "$TRACKED_COMMIT_CRON" >> "$CURRENT_CRONTAB"
printf '%s\n' "$WEEKLY_TRENDING_CRON" >> "$CURRENT_CRONTAB"
crontab "$CURRENT_CRONTAB"

echo "[install-vps-git-crons] Crons installes :"
echo "$PULL_CRON"
echo "$TRACKED_COMMIT_CRON"
echo "$WEEKLY_TRENDING_CRON"
