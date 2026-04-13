---
name: query
description: Interroger le wiki de veille et repondre a partir des notes avant les sources brutes
version: 1.0.0
platforms: [linux]
metadata:
  hermes:
    tags: [veille, obsidian, wiki, query]
    category: knowledge
    requires_toolsets: [terminal]
    config:
      - key: veille.vault_path
        description: Racine du vault de veille
        default: /root/veille-obsidian/veille-vault
        prompt: Chemin du vault de veille
---

# Query

Interroger le wiki de veille pour répondre rapidement et proprement à une question.

Ce skill est pensé pour rester compatible avec plusieurs agents/CLI.
Les champs `metadata.hermes` servent seulement à améliorer son intégration dans Hermes.

## When to Use

Utiliser ce skill quand l'utilisateur veut :

- retrouver ce que le wiki dit déjà sur un sujet ;
- comparer plusieurs notes ;
- répondre à une question sans repartir de zéro dans `raw/`.

Déclencheurs typiques :

- `/query que dit mon wiki sur llm wiki`
- `/query compare codex et claude code dans mes notes`
- `/query quelles actus ia récentes méritent une note`

## Procedure

1. Résoudre `vault_path`.
   - Si l'agent supporte la config du skill, utiliser cette valeur.
   - Sinon, utiliser la valeur par défaut `/root/veille-obsidian/veille-vault`.
   - Si le contexte de travail montre clairement un autre vault, l'utiliser.
   - Si plusieurs candidats plausibles existent, demander confirmation.
2. Lire dans cet ordre :
   - `${vault_path}/wiki/index.md`
   - les sections pertinentes de `${vault_path}/wiki/log.md`
   - les notes de `${vault_path}/wiki/notes/` liées à la question
3. Répondre d'abord à partir du wiki.
4. Si le wiki ne suffit pas, remonter vers les sources dans `raw/`.
5. Citer clairement :
   - les notes utilisées ;
   - et si nécessaire les sources brutes associées.
6. Si la réponse produit une connaissance durable, proposer de la sauver comme nouvelle note dans `wiki/notes/`.

## Important Rules

- Partir du wiki avant de repartir dans les sources brutes.
- Répondre avec précision plutôt qu'avec volume.
- Distinguer clairement ce qui vient d'une note et ce qui vient d'une source brute.
- Ne pas créer une note automatiquement sauf si l'utilisateur le demande ou si la demande implique explicitement une capitalisation.

## Pitfalls

- Ne pas ignorer `wiki/index.md`.
- Ne pas répondre uniquement depuis la mémoire conversationnelle.
- Ne pas inventer que le wiki contient quelque chose si ce n'est pas le cas.

## Verification

Confirmer :

- les notes consultées ;
- les sources consultées si besoin ;
- si une nouvelle note doit être créée ou non ;
- et le `vault_path` réellement utilisé.
