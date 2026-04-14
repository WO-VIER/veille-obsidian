crontab -l
*/15 * * * * bash /root/veille-obsidian/scripts/git-auto-sync.sh main >> /root/veille-obsidian/.git-auto-sync.log 2>&1

