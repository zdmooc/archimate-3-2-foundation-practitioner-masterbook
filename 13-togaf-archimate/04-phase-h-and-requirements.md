# Phase H + Requirements Management — maintenir l'architecture vivante

## 1. Phase H — Architecture Change Management

La Phase H traite l'évolution de l'architecture après mise en œuvre : nouveaux drivers, changements réglementaires, obsolescence, incidents majeurs, nouvelles opportunités et écarts émergents.

Questions :
- qu'est-ce qui a changé ?
- quel impact sur l'architecture ?
- faut-il une nouvelle itération ADM ?
- quelles parties de la cible sont encore valides ?

Concepts ArchiMate utiles :

```text
Driver
Assessment
Goal
Requirement
Constraint
Gap
Plateau
Capability
```

Relations et analyses utiles :
- Influence ;
- Serving ;
- Realization ;
- Access ;
- dépendances cross-layer ;
- impact analysis.

## 2. Exemple MayaBank — nouveau driver

Après mise en production :

```text
Driver: New Fraud Regulation
Assessment: Current fraud decision lacks explainability
Goal: Explainable Fraud Decisions
Requirement: Store decision rationale for each high-risk payment
```

Impact :

```text
Fraud Capability
→ Fraud Decision Service
→ Fraud Engine
→ Fraud Decision Data Object
→ Storage Technology
→ Work Package: Add Explainability Controls
```

ArchiMate rend l'impact visible sans refaire tout le modèle.

## 3. Requirements Management est transversal

Requirements Management n'est pas seulement « une phase après H » : il traverse l'ADM.

Pattern :

```text
Driver
→ Goal
→ Requirement
→ Business/Application/Technology element
→ Work Package
→ Deliverable
```

Chaque changement dans une exigence doit permettre de retrouver les éléments impactés.

## 4. Requirement vs Constraint

```text
Requirement = propriété nécessaire à satisfaire
Constraint = restriction imposée au design ou à la réalisation
```

Exemple :

```text
Requirement: Payment Service Availability ≥ 99.99%
Constraint: Payment data hosted only in approved EU regions
```

## 5. Requirement vs Goal

```text
Goal: Improve Payment Resilience
Requirement: RTO ≤ 15 min
```

Le Goal exprime l'intention ; le Requirement formalise une propriété à satisfaire.

## 6. Impact Analysis

Exemple : « Kafka cluster supprimé ».

Le bon raisonnement n'est pas :

```text
Kafka → applications
```

mais :

```text
System Software: Kafka
→ Technology Service: Event Streaming Service
→ Application Components consuming service
→ Application Services
→ Business Processes
→ Capabilities / Outcomes
```

La chaîne permet d'identifier l'impact métier d'un changement technique.

## 7. Boucle H → nouveau cycle ADM

```text
New Driver
→ Assessment
→ Change Request / decision
→ New or partial ADM iteration
→ Updated Architecture
→ Updated Plateaus / Work Packages
```

ArchiMate peut conserver la continuité du modèle entre les itérations.

## Questions

### Q1
Quel concept modélise « le marché impose désormais un service 24/7 » ?

**Driver**, si on représente la force externe motivant le changement.

### Q2
« L'architecture actuelle ne supporte pas le nouveau SLA » ?

**Assessment.**

### Q3
« Le service doit restaurer en moins de 15 minutes » ?

**Requirement.**

### Q4
Pourquoi Requirements Management est-il transversal ?

Parce que les exigences sont découvertes, modifiées, vérifiées et tracées pendant plusieurs phases de l'ADM.

## À retenir

> **Phase H surveille les changements ; Requirements Management maintient la traçabilité de ce que l'architecture doit satisfaire tout au long de l'ADM.**