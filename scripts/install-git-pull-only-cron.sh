#!/usr/bin/env bash

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PULL_SCRIPT="$REPO_ROOT/scripts/git-pull-only.sh"
OLD_SYNC_SCRIPT="$REPO_ROOT/scripts/git-auto-sync.sh"
BRANCH="${1:-main}"
CRON_SCHEDULE="${CRON_SCHEDULE:-*/15 * * * *}"
LOG_FILE="${LOG_FILE:-$REPO_ROOT/.git-pull-only.log}"
CRON_LINE="$CRON_SCHEDULE bash $PULL_SCRIPT $BRANCH >> $LOG_FILE 2>&1"

CURRENT_CRONTAB="$(mktemp)"
trap 'rm -f "$CURRENT_CRONTAB"' EXIT

crontab -l 2>/dev/null \
  | grep -vF "$OLD_SYNC_SCRIPT" \
  | grep -vF "$PULL_SCRIPT" \
  > "$CURRENT_CRONTAB" || true

printf '%s\n' "$CRON_LINE" >> "$CURRENT_CRONTAB"
crontab "$CURRENT_CRONTAB"

echo "[install-git-pull-only-cron] Cron installe :"
echo "$CRON_LINE"
