---
name: lint
description: Verifier la coherence du vault de veille et signaler les problemes structurels
version: 1.0.0
platforms: [linux]
metadata:
  hermes:
    tags: [veille, obsidian, wiki, lint]
    category: knowledge
    requires_toolsets: [terminal]
    config:
      - key: veille.vault_path
        description: Racine du vault de veille
        default: /root/veille-obsidian/veille-vault
        prompt: Chemin du vault de veille
---

# Lint

Vérifier la santé du vault de veille.

Ce skill est pensé pour rester compatible avec plusieurs agents/CLI.
Les champs `metadata.hermes` servent seulement à améliorer son intégration dans Hermes.

## When to Use

Utiliser ce skill quand l'utilisateur veut :

- repérer les notes orphelines ;
- vérifier les liens cassés ;
- repérer les notes sans sources ;
- contrôler la cohérence entre `index.md`, `log.md` et `wiki/notes/`.

Déclencheurs typiques :

- `/lint`
- `/lint check le vault`
- `/lint trouve ce qui est cassé`

## Procedure

1. Résoudre `vault_path`.
   - Si l'agent supporte la config du skill, utiliser cette valeur.
   - Sinon, utiliser la valeur par défaut `/root/veille-obsidian/veille-vault`.
   - Si le contexte de travail montre clairement un autre vault, l'utiliser.
   - Si plusieurs candidats plausibles existent, demander confirmation.
2. Lire :
   - `${vault_path}/SCHEMA.md`
   - `${vault_path}/wiki/index.md`
   - `${vault_path}/wiki/log.md`
3. Lister les notes dans `${vault_path}/wiki/notes/`.
4. Vérifier au minimum :
   - notes présentes dans `wiki/notes/` mais absentes de `wiki/index.md` ;
   - liens Obsidian vers des notes inexistantes ;
   - notes sans section `Sources` quand elles devraient en avoir une ;
   - doublons évidents ;
   - entrées passives anciennes encore jamais transformées en notes ;
   - incohérences de nommage.
5. Produire d'abord un rapport de findings.
6. Ne corriger automatiquement que si l'utilisateur le demande explicitement.

## Important Rules

- Prioriser les findings réels et concrets.
- Donner les chemins de fichiers.
- Quand possible, mentionner la ligne ou au moins la section concernée.
- Ne pas faire de changements silencieux.

## Pitfalls

- Ne pas confondre une note peu liée et une note inutile.
- Ne pas exiger une section `Sources` pour un simple fichier purement opérationnel comme `README.md`.
- Ne pas réécrire le vault entier pour une anomalie mineure.

## Verification

Confirmer :

- le nombre de notes scannées ;
- les problèmes trouvés ;
- et, si demandé, les corrections effectivement appliquées ;
- ainsi que le `vault_path` réellement utilisé.
