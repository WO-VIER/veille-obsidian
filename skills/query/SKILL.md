---
name: query
description: Interroger le wiki de veille agentique en partant des notes avant les sources brutes
version: 1.1.0
platforms: [linux]
metadata:
  hermes:
    tags: [veille, obsidian, wiki, query, agents]
    category: knowledge
    requires_toolsets: [terminal]
    config:
      - key: veille.vault_path
        description: Racine du vault de veille
        default: /root/veille-obsidian/veille-vault
        prompt: Chemin du vault de veille
---

# Query

Interroger le wiki de veille pour repondre rapidement et proprement a une question sur l'ecosysteme agentique.

Ce skill est pensé pour rester compatible avec plusieurs agents/CLI.
Les champs `metadata.hermes` servent seulement à améliorer son intégration dans Hermes.

## When to Use

Utiliser ce skill quand l'utilisateur veut :

- retrouver ce que le wiki dit déjà sur un sujet ;
- comparer plusieurs notes ;
- répondre à une question sans repartir de zéro dans `raw/`.
- faire le point sur un outil, une release, un modele ou une tendance deja couverts.

Déclencheurs typiques :

- `/query que dit mon wiki sur llm wiki`
- `/query compare codex et claude code dans mes notes`
- `/query quelles actus ia récentes méritent une note`
- `/query que dit mon wiki sur les cli agentiques`

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
3. Prioriser les notes de synthese et les notes de tendance avant les captures brutes.
4. Répondre d'abord à partir du wiki.
5. Si le wiki ne suffit pas, remonter vers les sources dans `raw/`.
6. Citer clairement :
   - les notes utilisées ;
   - et si nécessaire les sources brutes associées.
7. Si la réponse produit une connaissance durable, proposer de la sauver comme nouvelle note dans `wiki/notes/`.

## Important Rules

- Partir du wiki avant de repartir dans les sources brutes.
- Répondre avec précision plutôt qu'avec volume.
- Distinguer clairement ce qui vient d'une note et ce qui vient d'une source brute.
- Ne pas créer une note automatiquement sauf si l'utilisateur le demande ou si la demande implique explicitement une capitalisation.
- Mentionner explicitement les zones d'incertitude quand le wiki reste trop factuel ou incomplet.
- Pour les questions de tendance, separer les faits verifies des hypotheses.

## Pitfalls

- Ne pas ignorer `wiki/index.md`.
- Ne pas répondre uniquement depuis la mémoire conversationnelle.
- Ne pas inventer que le wiki contient quelque chose si ce n'est pas le cas.
- Ne pas surinterpreter une simple accumulation de releases comme une tendance lourde sans le dire.

## Verification

Confirmer :

- les notes consultées ;
- les sources consultées si besoin ;
- si une nouvelle note doit être créée ou non ;
- et le `vault_path` réellement utilisé.
