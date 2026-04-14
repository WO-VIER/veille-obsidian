---
name: ingest
description: Ingest de sources de veille agentique depuis raw/passive ou raw/active vers wiki/notes
version: 1.1.0
platforms: [linux]
metadata:
  hermes:
    tags: [veille, obsidian, wiki, ingest, agents]
    category: knowledge
    requires_toolsets: [terminal]
    config:
      - key: veille.vault_path
        description: Racine du vault de veille
        default: /root/veille-obsidian/veille-vault
        prompt: Chemin du vault de veille
---

# Ingest

Ingest des sources de veille agentique depuis `raw/passive/` ou `raw/active/` vers des notes exploitables dans `wiki/notes/`.

Ce skill est pensé pour rester compatible avec plusieurs agents/CLI.
Les champs `metadata.hermes` servent seulement à améliorer son intégration dans Hermes.

## When to Use

Utiliser ce skill quand l'utilisateur veut :

- transformer une ou plusieurs entrées de `raw/passive/` en vraies notes ;
- transformer une source déposée dans `raw/active/` en note de veille ;
- faire l'étape `collecte -> note Obsidian` ;
- consolider plusieurs captures sur un meme outil ou une meme tendance.

Déclencheurs typiques :

- `/ingest latest passive`
- `/ingest raw/active/llm-wiki.md`
- `/ingest traite les 3 dernières entrées`

## Procedure

1. Résoudre `vault_path`.
   - Si l'agent supporte la config du skill, utiliser cette valeur.
   - Sinon, utiliser la valeur par défaut `/root/veille-obsidian/veille-vault`.
   - Si le contexte de travail montre clairement un autre vault, l'utiliser.
   - Si plusieurs candidats plausibles existent, demander confirmation.
2. Lire :
   - `${vault_path}/SCHEMA.md`
   - `${vault_path}/wiki/index.md`
   - les dernières entrées de `${vault_path}/wiki/log.md`
3. Déterminer la cible :
   - si l'utilisateur donne un chemin précis, l'utiliser ;
   - sinon, lister les fichiers récents de `raw/passive/` et `raw/active/` ;
   - si plusieurs candidats existent et que la demande est ambiguë, proposer le plus récent ou les 3 plus récents.
4. Lire la source choisie.
5. Determiner le type de source :
   - `raw/passive/` : matériau automatisé, résumé IA préliminaire possible ;
   - `raw/active/` : source à analyser plus profondément.
6. Classer la source dans une de ces familles :
   - release officielle ;
   - annonce produit ou modele ;
   - thread ou article d'analyse ;
   - signal secondaire comme `GitHub Trending`.
7. Avant de creer une note, verifier si le meilleur resultat est :
   - pas de note ;
   - mise a jour d'une note existante ;
   - creation d'une nouvelle note de synthese ;
   - creation d'une note de tendance.
8. Produire ou mettre a jour une note dans `wiki/notes/` avec une structure simple et exploitable.
9. Relier la note aux autres notes pertinentes avec des liens Obsidian.
10. Mettre à jour `${vault_path}/wiki/index.md`.
11. Ajouter une entrée dans `${vault_path}/wiki/log.md`.

## Important Rules

- Ne jamais modifier la source dans `raw/`.
- Ne jamais faire passer le résumé IA préliminaire pour une vérité source.
- Reformuler avec des mots propres quand la note finale va dans `wiki/notes/`.
- Préférer enrichir une note existante plutôt que créer un doublon.
- Si l'entrée est purement passive et peu importante, rester concis.
- Ne pas creer une note pour chaque micro-release si une note de suivi par outil serait plus utile.
- Pour `GitHub Trending`, preferer une note sur la tendance detectee plutot qu'une note par repo.
- Garder en tete que l'humain valide en dernier ressort la pertinence editoriale.

## Pitfalls

- Ne pas créer dix notes pour dix micro-updates sans intérêt.
- Ne pas copier-coller un article entier dans la note.
- Ne pas oublier la source originale.
- Ne pas inventer des liens entre notes si la connexion n'est pas réelle.
- Ne pas traiter un signal de popularite comme une preuve d'adoption.

## Verification

Confirmer :

- le chemin de la source ingérée ;
- le chemin de la note créée ou mise à jour ;
- si la decision prise est `pas de note`, `mise a jour` ou `nouvelle note` ;
- les liens Obsidian ajoutés ;
- la mise à jour de `wiki/index.md` et `wiki/log.md`.
- et le `vault_path` réellement utilisé.
