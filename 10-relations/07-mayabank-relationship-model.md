# MayaBank — modèle de relations de bout en bout

Ce chapitre utilise le cas MayaBank pour montrer comment les relations construisent une architecture cohérente du besoin métier jusqu’à l’infrastructure et la migration.

## 1. Motivation

```text
Stakeholder: Head of Payments
  Association → Driver: Instant Payment Growth

Driver: Instant Payment Growth
  Influence(+) → Goal: Scale Real-Time Payments

Assessment: Legacy platform reaches capacity limits
  Influence → Goal: Modernize Payment Processing
```

## 2. Strategy

```text
Capability: Real-Time Payment Processing
Value Stream: Deliver Instant Payment
Course of Action: Modernize Payments Incrementally
```

Les relations exactes sont choisies selon la sémantique recherchée et les possibilités du métamodèle ; le but est de conserver la traçabilité entre motivation, aptitude et direction choisie.

## 3. Business Layer

```text
Business Actor: Payments Operations Team
  Assignment → Business Role: Payment Operator

Business Role: Payment Operator
  Assignment → Business Process: Resolve Payment Exception

Business Process: Execute Instant Payment
  Realization → Business Service: Instant Payment Service

Business Process: Execute Instant Payment
  Access(read/write) → Business Object: Payment Order
```

## 4. Application Layer

```text
Application Component: Payment Orchestrator
  Assignment → Application Function: Orchestrate Payment

Application Function: Orchestrate Payment
  Realization → Application Service: Payment Orchestration Service

Application Service: Payment Orchestration Service
  Serving → Business Process: Execute Instant Payment

Application Function: Orchestrate Payment
  Access(read/write) → Data Object: Payment Transaction
```

## 5. Dynamic behavior

```text
Application Event: Payment Received
  Triggering → Application Function: Validate Payment

Application Function: Validate Payment
  Flow(Payment Context) → Application Function: Fraud Scoring

Application Event: Payment Authorized
  Triggering → Application Process: Submit to Clearing
```

## 6. Data lineage

```text
Data Object: Payment Transaction
  Realization → Business Object: Payment Order

Artifact: payment-event.avsc
  Realization → Data Object: Payment Event Payload
```

Cette chaîne distingue concept métier, représentation logique et réalisation technique.

## 7. Technology

```text
Technology Service: Event Streaming Service
  Serving → Application Component: Payment Orchestrator

System Software: Kafka Platform
  Assignment → Technology Function: Event Streaming

Technology Function: Event Streaming
  Realization → Technology Service: Event Streaming Service
```

## 8. Deployment

```text
Artifact: payment-orchestrator container image
  Realization → Application Component: Payment Orchestrator

Node: OpenShift Worker Pool
  Assignment → Technology Function: Container Execution
```

La vue de déploiement doit utiliser les relations autorisées appropriées par l’outil et la spécification, sans réduire toutes les dépendances à `Association`.

## 9. Infrastructure physique

```text
Device: Compute Server
  Composition/Aggregation selon modèle → Node: OpenShift Worker

Facility: MayaBank DC-A
  Aggregation → Device: Compute Server
```

Le niveau physique est montré uniquement lorsqu’il sert le concern : résilience, capacité, Green IT ou localisation.

## 10. Migration

```text
Gap: No Event Backbone
  Association → Work Package: Establish Event Streaming Platform

Work Package: Establish Event Streaming Platform
  Realization → Deliverable: Production-ready Kafka Platform

Implementation Event: Kafka Production Ready
  Triggering → Work Package: Migrate Payment Events
```

La relation exacte entre concepts d’Implementation & Migration doit rester alignée sur la matrice ArchiMate ; le modèle doit surtout montrer qui traite quel gap et quel état est atteint.

## 11. Vue service-to-infrastructure

```text
Business Service: Instant Payment Service
  ← Realization — Business Process: Execute Instant Payment
  ← Serving — Application Service: Payment Orchestration Service
  ← Realization — Application Function: Orchestrate Payment
  ← Assignment — Application Component: Payment Orchestrator
  ← Realization — Artifact: payment-orchestrator image
  → depends on Technology Service: Container Platform Service
  → realized by System Software: OpenShift
  → hosted on Node/Device infrastructure
```

Cette vue permet d’expliquer la chaîne de dépendance sans confondre les différents types de relations.

## 12. Vue incident

Supposons un incident Kafka.

Le modèle permet de remonter :

```text
Kafka Platform
→ Event Streaming Service
→ Payment Orchestrator
→ Payment Orchestration Service
→ Execute Instant Payment
→ Instant Payment Service
```

L’intérêt des relations est ici analytique : elles permettent de comprendre l’impact métier d’une panne technique.

## 13. Vue Green IT

```text
Facility: DC-A
→ Device: Compute Server
→ Node: OpenShift Worker
→ Artifact: Payment workload
→ Application Component: Payment Orchestrator
→ Business Service: Instant Payment Service
```

Les métriques énergie/carbone peuvent être portées comme propriétés ou données externes. Les relations ArchiMate donnent le chemin d’allocation et d’impact.

## 14. Vue transformation

```text
Driver
→ Goal
→ Capability
→ Business Target
→ Application Target
→ Technology Target
→ Gap
→ Work Package
→ Deliverable
→ Plateau
```

Cette chaîne de lecture montre la vraie valeur d’un modèle d’entreprise : relier la raison du changement à sa réalisation.

## 15. Ce qu’un bon modèle MayaBank évite

- des dizaines d’`Association` sans sens ;
- des flèches inversées ;
- `Realization` utilisé pour dire « utilise » ;
- `Serving` utilisé pour dire « implémente » ;
- `Flow` utilisé pour dire « lit une base » ;
- `Triggering` utilisé pour dire « dépend de » ;
- `Composition` utilisé pour n’importe quel nesting.

## 16. Règle finale

> **Le modèle MayaBank doit pouvoir être lu comme une série de phrases vraies.**

Chaque flèche doit apporter une information exploitable pour l’analyse, la décision ou la communication.
