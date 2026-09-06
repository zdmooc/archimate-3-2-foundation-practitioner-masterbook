# Quick Reference — Modeling Patterns

## Choisir l’élément

```text
Pourquoi ?                    → Motivation
Aptitude ?                    → Capability
Qui agit ?                    → Actor / Role / Component / Node
Que fait-il ?                 → Function / Process / Interaction
Qu’est-ce qui est exposé ?    → Service
Par où ?                      → Interface
Quelle information ?          → Business Object / Data Object / Artifact
Quelle plateforme ?           → Technology Service / System Software
Quel calcul/hébergement ?     → Node / Device
Quelle infra physique ?       → Facility / Equipment / Distribution Network
Quel travail de transformation ? → Work Package
Quel état ?                   → Plateau
Quelle différence ?           → Gap
```

## Confusions critiques

```text
Actor ≠ Role
Capability ≠ Process
Process ≠ Function
Function ≠ Service
Service ≠ Interface
Product ≠ Application
Business Object ≠ Data Object ≠ Artifact
Application Component ≠ System Software
Technology Service ≠ System Software
Node ≠ Device ≠ Equipment
Communication Network ≠ Distribution Network
Event ≠ Payload
Course of Action ≠ Work Package
Goal ≠ Outcome ≠ Requirement
Gap ≠ Assessment
Plateau ≠ Environment
Application Event ≠ Technology Event ≠ Implementation Event
```

## Relations

```text
Composition = partie forte
Aggregation = regroupement
Assignment = exécute / porte
Realization = concrétise / met en œuvre
Serving = fournit une fonctionnalité à
Access = lit / écrit
Triggering = déclenche / précède causalement
Flow = transfère quelque chose
Influence = affecte
Specialization = est un sous-type de
Association = lien générique si aucun sens plus précis n’est requis
```

## Pattern service

```text
Active Structure
→ Assignment → Internal Behavior
→ Realization → Service
→ Interface
→ Serving → Consumer
```

## Pattern information

```text
Business Object
← Realization — Data Object
← Realization — Artifact
```

## Pattern application → technologie

```text
Application Component
← Artifact
→ Technology Service
→ System Software
→ Node
→ Device
→ Facility
```

## Pattern event-driven

```text
Application Event = fait
Data Object = payload
Technology Service = transport événementiel
System Software = Kafka / broker platform
```

## Pattern transformation

```text
Driver
→ Goal
→ Course of Action
→ Gap
→ Work Package
→ Deliverable
→ Implementation Event
→ Plateau
```

## Pattern View

```text
Stakeholder
→ Concern
→ Viewpoint
→ View
```

## Test en 30 secondes

Avant de valider une vue :

1. Quel stakeholder ?
2. Quel concern ?
3. Même niveau d’abstraction ?
4. Chaque élément est-il dans la bonne couche ?
5. Chaque relation peut-elle être lue comme une phrase ?
6. Les directions sont-elles correctes ?
7. Une relation plus précise existe-t-elle ?
8. Le cross-layer est-il traçable ?
9. Les dérivations ont-elles été validées ?
10. Peut-on retirer 20 % des éléments sans perdre la décision ?

> **Modéliser = choisir. Une vue de qualité montre uniquement ce qui aide le stakeholder à comprendre ou décider.**
