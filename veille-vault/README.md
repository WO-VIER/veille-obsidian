# Raw Passive

Ce dossier accueille les sources collectées automatiquement par RSS, alertes et workflows n8n.

Organisation actuelle :

- `cli/` : releases et changelogs des outils CLI suivis ;
- `model/` : annonces de modeles detectees par workflow dedie ;
- `provider-news/` : news generales providers conservees hors du flux CLI ;
- `trending/` : signaux faibles communautaires de type `GitHub Trending`.

Règles :

- les fichiers déposés ici sont des sources brutes ;
- ils ne sont pas modifiés par l'IA après ingestion ;
- ils servent d'entrée au workflow de veille passive.
