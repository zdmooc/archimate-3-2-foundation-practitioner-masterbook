# 1 — Architecture as Code : principes

## 1.1 Définition

Architecture as Code consiste à représenter une partie de l’architecture sous forme de fichiers texte versionnés et générables.

Pour ArchiMate, cela permet de décrire :

- les éléments ;
- les relations ;
- les groupements ;
- la disposition ;
- les vues ;
- certains styles.

Le modèle textuel devient une source contrôlée par Git.

## 1.2 Les trois niveaux

### Niveau 1 — Diagram as Code

On code uniquement le visuel.

### Niveau 2 — Model View as Code

Le fichier représente une vue avec des concepts ArchiMate nommés et des relations explicites.

### Niveau 3 — Architecture Repository as Code

Plusieurs vues partagent des conventions, identifiants, includes, règles CI et documentation.

Le masterbook vise surtout les niveaux 2 et 3.

## 1.3 Avantages

### Versioning

Git permet d’identifier :

```text
qui
→ a modifié quoi
→ quand
→ pourquoi
```

### Revue

Une pull request permet de discuter :

- ajout d’un composant ;
- suppression d’une dépendance ;
- changement de relation ;
- évolution d’une architecture cible.

### Reproductibilité

Le même fichier `.puml` doit produire le même diagramme logique indépendamment du poste de travail, sous réserve d’utiliser une version cohérente de l’outil.

### Automatisation

Une CI peut :

```text
chercher les .puml
→ compiler
→ échouer si syntaxe invalide
→ produire SVG/PNG
→ publier les artefacts
```

## 1.4 Limites

Architecture as Code ne remplace pas :

- le travail de modélisation ;
- les viewpoints ;
- l’analyse stakeholder/concern ;
- la gouvernance du référentiel ;
- les validations sémantiques du langage.

Un pipeline vert signifie seulement qu’un ensemble de contrôles techniques a réussi.

## 1.5 Git comme outil de gouvernance

Chaque évolution doit pouvoir répondre à :

1. Quel concern change ?
2. Quelle vue change ?
3. Quels éléments sont ajoutés/supprimés ?
4. Quelles relations changent ?
5. Quel impact downstream ?
6. Le changement modifie-t-il Baseline, Target ou Transition ?

## 1.6 Convention MayaBank

Les fichiers sont classés par concern :

```text
models/
├── executive/
├── business/
├── application/
├── technology/
├── security/
├── operations/
├── migration/
└── greenit/
```

Une vue = un fichier principal.

Exemple :

```text
models/application/APP-01-payment-orchestration.puml
```

## 1.7 Definition of Done

Une vue as-code est acceptable lorsque :

- le fichier compile ;
- le nom indique son concern ;
- les éléments sont correctement typés ;
- les relations ont été relues ;
- le diagramme reste lisible ;
- un reviewer comprend la décision architecturale ;
- la documentation indique Baseline/Target si nécessaire.
