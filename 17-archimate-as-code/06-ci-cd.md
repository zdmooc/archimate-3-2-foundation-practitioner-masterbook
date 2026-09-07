# 6 — CI/CD pour ArchiMate as Code

## 6.1 Objectif

La CI ne décide pas si une architecture est bonne. Elle automatise les contrôles répétables.

Pipeline recommandé :

```text
checkout
→ scan des .puml
→ compilation PlantUML
→ échec si syntaxe invalide
→ génération SVG
→ publication artefacts
```

## 6.2 GitHub Actions

Le dépôt fournit `.github/workflows/archimate-as-code.yml`.

Le workflow utilise l’image Docker officielle PlantUML avec une version pinée.

## 6.3 Pourquoi pinner la version ?

Avec `latest`, un pipeline peut changer sans modification du dépôt.

Avec :

```text
plantuml/plantuml:1.2026.7
```

on obtient une baseline contrôlée.

La montée de version devient une décision explicite et testable.

## 6.4 Build sur Pull Request

Un changement architecture doit compiler avant merge.

Exemples de déclencheurs :

```yaml
on:
  pull_request:
    paths:
      - '17-archimate-as-code/**'
  push:
    branches: [ main ]
    paths:
      - '17-archimate-as-code/**'
```

## 6.5 Artefacts

Les fichiers SVG générés peuvent être publiés comme artefacts GitHub Actions.

Cela évite de committer tous les fichiers générés.

## 6.6 Quality gates techniques

La CI peut vérifier :

- aucun `.puml` vide ;
- `@startuml` / `@enduml` présents ;
- compilation réussie ;
- aucun fichier généré dans un mauvais dossier ;
- conventions de nommage ;
- liens documentaires simples.

## 6.7 Quality gates sémantiques semi-automatisés

On peut écrire des règles personnalisées :

- interdire `Kafka` déclaré comme Application Event ;
- détecter `API` toujours déclaré comme Service sans Interface dans certains patterns ;
- vérifier les préfixes d’identifiants ;
- comparer les noms avec un registre canonique.

Ces contrôles restent des conventions locales, pas des règles officielles du langage.

## 6.8 Pipeline de publication documentaire

Option plus avancée :

```text
PlantUML sources
→ SVG
→ Markdown/MkDocs
→ static site
```

Le modèle devient partie intégrante de la documentation d’architecture.

## 6.9 Gestion des échecs

Un pipeline rouge doit indiquer clairement :

```text
file
line/error
command
version PlantUML
```

Éviter les pipelines complexes qui rendent le diagnostic plus difficile que la modélisation.

## 6.10 Architecture Governance

Le workflow technique peut être combiné à une revue humaine obligatoire :

```text
CI green
+
Architecture review approved
=
merge autorisé
```

C’est le modèle de gouvernance recommandé pour les vues structurantes.
