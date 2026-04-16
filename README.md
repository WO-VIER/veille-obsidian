# veille-obsidian

Le poste local est la source principale pour les notes, l'index et les sources actives.

Le VPS sert surtout a faire tourner les workflows et a suivre le depot GitHub.

## Synchronisation VPS recommandee

Le VPS ne doit pas commiter automatiquement.
Il doit seulement recuperer les changements pousses depuis le local :

```bash
bash /root/veille-obsidian/scripts/install-git-pull-only-cron.sh main
```

Cron attendu :

```cron
*/15 * * * * bash /root/veille-obsidian/scripts/git-pull-only.sh main >> /root/veille-obsidian/.git-pull-only.log 2>&1
```

L'ancien `git-auto-sync.sh` existe encore comme outil manuel, mais il ne doit pas etre installe en cron sauf besoin explicite.
