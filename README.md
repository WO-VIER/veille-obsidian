# veille-obsidian

Le poste local est la source principale pour les notes, l'index et les sources actives.

Le VPS sert surtout a faire tourner les workflows et a suivre le depot GitHub.

## Synchronisation VPS recommandee

Le local reste la source principale de travail.
Le VPS suit GitHub automatiquement et ne commit que comme filet de securite.

```bash
bash /root/veille-obsidian/scripts/install-vps-git-crons.sh main
```

Crons attendus :

```cron
*/15 * * * * bash /root/veille-obsidian/scripts/git-pull-only.sh main >> /root/veille-obsidian/.git-pull-only.log 2>&1
20 */12 * * * bash /root/veille-obsidian/scripts/git-commit-tracked-if-dirty.sh main >> /root/veille-obsidian/.git-commit-tracked.log 2>&1
20 9 * * 1 bash /root/veille-obsidian/scripts/git-commit-tracked-if-dirty.sh main >> /root/veille-obsidian/.git-commit-tracked.log 2>&1
```

Regle importante :

- `git-pull-only.sh` ne fait jamais de commit ni de push ;
- `git-commit-tracked-if-dirty.sh` fait un `git add -u`, donc seulement les fichiers deja suivis ;
- les fichiers non suivis sont ignores ;
- une nouvelle capture `raw/passive/` non suivie ne sera donc pas publiee automatiquement ;
- l'ancien `git-auto-sync.sh` existe encore comme outil manuel, mais il ne doit pas etre installe en cron sauf besoin explicite.
