# Quick Reference — Archi pratique

## Réflexe 1

```text
Element in repository
≠
Object in a view
```

Réutiliser l'élément canonique.

## Réflexe 2

```text
Stakeholder
→ Concern
→ Viewpoint
→ View
```

## Réflexe 3

Avant de créer un élément :

```text
Search → Check type → Check canonical-id → Reuse if identical
```

## Réflexe 4

Properties recommandées :

```text
canonical-id
owner
lifecycle
criticality
domain
status
```

## Réflexe 5

Nommage des views :

```text
EXEC-xx
BUS-xx
APP-xx
TEC-xx
SEC-xx
OPS-xx
MIG-xx
GREEN-xx
```

## Structure type

```text
Strategy
Business
Application
Technology & Physical
Motivation
Implementation & Migration
Other
Relations
Views
```

## MayaBank

```text
Capability
→ Business Process
→ Application Service
→ Application Component
→ Technology Service
→ System Software / Node
→ Plateau / Work Package
```

## Native vs Exchange

```text
.archimate = format natif Archi
Open Exchange XML = interopérabilité
```

## Git

Bon commit :

```text
feat: add payment target deployment view
```

Mauvais :

```text
update
```

## Review checklist

- bon type ?
- bonne relation ?
- bonne direction ?
- doublon ?
- bonne audience ?
- bon niveau d'abstraction ?
- properties renseignées ?
- lifecycle cohérent ?
- impact sur autres views ?

## Pièges

```text
API ≠ automatiquement Service
Kafka ≠ Event
OpenShift ≠ Application Component
Database ≠ Data Object
RTO/RPO ≠ Technology Service
PNG ≠ source de vérité
```

## Archi 5.8

Points notables :

- Legends dynamiques ;
- amélioration du Models Tree ;
- améliorations de performance ;
- runtime Java embarqué actualisé.

## Règle d'or

> Le référentiel porte la connaissance ; les views la présentent.
