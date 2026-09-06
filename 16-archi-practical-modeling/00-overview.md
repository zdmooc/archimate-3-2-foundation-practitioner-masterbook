# Partie XVI — Archi et modélisation pratique

Cette partie transforme le masterbook en pratique outillée avec **Archi**, l'outil open source de modélisation ArchiMate.

L'objectif n'est pas d'apprendre à cliquer dans une interface. Il est de savoir construire, maintenir, analyser et partager un **référentiel d'architecture cohérent**.

## Objectifs

À la fin de cette partie, on doit savoir :

- installer et configurer Archi ;
- créer un modèle propre ;
- organiser les éléments dans l'arbre ;
- réutiliser un même élément dans plusieurs vues ;
- créer et vérifier les relations ;
- construire des vues adaptées aux stakeholders ;
- documenter éléments et propriétés ;
- rechercher et analyser les dépendances ;
- importer/exporter ;
- collaborer avec coArchi ;
- versionner avec Git ;
- maintenir un grand modèle MayaBank ;
- ouvrir le fichier `mayabank-enterprise.archimate` fourni dans ce dépôt.

## Archi en 2026

Le guide est aligné sur **Archi 5.8**, version GA publiée en mars 2026. Cette version apporte notamment les Legends dynamiques, des améliorations de performance et diverses améliorations visuelles. Le dépôt source Archi contient déjà une branche de développement 5.9.0-SNAPSHOT ; ce livre cible volontairement la version stable 5.8.

## Principe central

Dans Archi, il faut distinguer :

```text
Model element
≠
Diagram object
```

Un `Application Component: Payment Orchestrator` existe une seule fois dans le modèle logique. Il peut apparaître dans plusieurs vues sous plusieurs objets graphiques.

Créer un nouvel élément à chaque diagramme produit des doublons et détruit la traçabilité.

## Workflow recommandé

```text
1. Define the concern
2. Reuse or create canonical elements
3. Create valid relationships
4. Build the view
5. Add documentation/properties
6. Review semantics
7. Review readability
8. Commit the model
```

## Le fichier livré

Cette partie contient :

`models/mayabank-enterprise.archimate`

Il fournit une base réellement ouvrable dans Archi avec :

- Motivation ;
- Strategy ;
- Business ;
- Application ;
- Technology ;
- Implementation & Migration ;
- relations ;
- vues MayaBank.

Ce modèle n'essaie pas de reproduire tout le masterbook en un fichier géant dès la première version. Il constitue une **baseline maintenable** que l'on peut enrichir progressivement.

## Règle d'or

> Un bon modèle Archi n'est pas celui qui contient le plus d'objets. C'est celui où les éléments sont canoniques, les relations sémantiquement correctes et les vues répondent à des concerns explicites.
