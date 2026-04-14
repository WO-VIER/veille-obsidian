# Skills

Ce dossier est l'emplacement canonique des skills du repo.

Objectif :

- garder les skills à la racine du projet ;
- pouvoir les exporter facilement vers n'importe quel agent ou CLI compatible `SKILL.md` ;
- éviter une structure trop spécifique à un seul outil.
- piloter un vault de veille centre sur l'ecosysteme agentique.

## Skills fournis

- `ingest`
- `query`
- `lint`

Ces skills sont pensés pour un vault qui suit surtout :

- les CLI agentiques ;
- les modeles IA et leurs annonces ;
- les releases ;
- les signaux de tendance comme `GitHub Trending` ;
- les notes de synthese et de decision dans Obsidian.

## Installation portable

Si tu veux les rendre disponibles globalement pour d'autres agents :

```bash
mkdir -p ~/.agents/skills
ln -s /chemin/vers/le/repo/skills/ingest ~/.agents/skills/ingest
ln -s /chemin/vers/le/repo/skills/query ~/.agents/skills/query
ln -s /chemin/vers/le/repo/skills/lint ~/.agents/skills/lint
```

Sur ton VPS actuel, ça donnerait :

```bash
mkdir -p ~/.agents/skills
ln -s /root/veille-obsidian/skills/ingest ~/.agents/skills/ingest
ln -s /root/veille-obsidian/skills/query ~/.agents/skills/query
ln -s /root/veille-obsidian/skills/lint ~/.agents/skills/lint
```

## Compatibilité Hermes

Hermes peut scanner `~/.agents/skills/` comme répertoire externe.

Ajouter dans `~/.hermes/config.yaml` :

```yaml
skills:
  external_dirs:
    - ~/.agents/skills
```

Ensuite les slash commands suivantes deviennent disponibles :

- `/ingest`
- `/query`
- `/lint`

## Compatibilité multi-agent

Les fichiers `SKILL.md` restent portables :

- frontmatter simple ;
- procédures basées sur le terminal et les fichiers ;
- aucune dépendance forte à un runtime unique.

Les champs `metadata.hermes` sont gardés comme bonus d'intégration.
Les autres agents peuvent simplement les ignorer.

## Hypothèse par défaut

Les skills supposent, si rien d'autre n'est configuré, que le vault est ici :

`/root/veille-obsidian/veille-vault`

Si tu exportes les skills ailleurs :

- passe le chemin du vault dans la requête ;
- ou adapte la valeur par défaut dans le `SKILL.md`.
