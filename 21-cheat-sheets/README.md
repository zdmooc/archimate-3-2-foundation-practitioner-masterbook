# Partie XXI — Cheat Sheets

Cette partie condense le masterbook en fiches de révision utilisables avant un examen, un entretien ou une revue d’architecture.

## Pack de révision

1. [Carte complète du langage](01-language-map.md)
2. [Motivation & Strategy](02-motivation-strategy.md)
3. [Business & Application](03-business-application.md)
4. [Technology & Physical](04-technology-physical.md)
5. [Implementation & Migration](05-implementation-migration.md)
6. [Relationships](06-relationships.md)
7. [Views & Viewpoints](07-views-viewpoints.md)
8. [Confusions critiques](08-critical-confusions.md)
9. [Patterns professionnels](09-professional-patterns.md)
10. [Réflexes Foundation / Practitioner](10-exam-reflexes.md)
11. [MayaBank en une page](11-mayabank-one-page.md)
12. [Révision express 15 minutes](12-final-rapid-review.md)

## Usage recommandé

- **Foundation** : 01 → 08 → 10 → 12.
- **Practitioner** : 06 → 07 → 08 → 09 → 10 → 11.
- **Entretien Architecte Solution** : 08 → 09 → 11.
- **Revue de modèle** : 06 → 07 → 08.

## Principe central

```text
Pourquoi ?              Motivation
Que devons-nous savoir faire ?  Strategy
Que fait le métier ?    Business
Comment le SI le supporte ? Application
Où et sur quoi cela tourne ? Technology / Physical
Comment passe-t-on de l’existant à la cible ? Implementation & Migration
```

## Règle de lecture universelle

Pour chaque élément, poser quatre questions :

1. Quel est son **niveau d’abstraction** ?
2. Est-il **structure**, **behavior**, **service/interface** ou **passive structure** ?
3. Quelle **relation** exprime précisément le lien ?
4. Quelle **vue** répond au concern du stakeholder ?

Ces fiches sont des synthèses pédagogiques ; elles ne remplacent pas la spécification ArchiMate 3.2.