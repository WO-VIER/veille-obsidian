#!/usr/bin/env bash

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SYNC_SCRIPT="$REPO_ROOT/scripts/git-auto-sync.sh"
BRANCH="${1:-main}"
CRON_SCHEDULE="${CRON_SCHEDULE:-*/15 * * * *}"
LOG_FILE="${LOG_FILE:-$REPO_ROOT/.git-auto-sync.log}"
CRON_LINE="$CRON_SCHEDULE bash $SYNC_SCRIPT $BRANCH >> $LOG_FILE 2>&1"

CURRENT_CRONTAB="$(mktemp)"
trap 'rm -f "$CURRENT_CRONTAB"' EXIT

crontab -l 2>/dev/null | grep -vF "$SYNC_SCRIPT" > "$CURRENT_CRONTAB" || true
printf '%s\n' "$CRON_LINE" >> "$CURRENT_CRONTAB"
crontab "$CURRENT_CRONTAB"

echo "[install-git-auto-sync-cron] Cron installe :"
echo "$CRON_LINE"
