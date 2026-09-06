# MayaBank — Application Architecture complète

Cette étude rassemble la couche Application autour du cas fil rouge **Instant Payments**.

L’objectif est de construire une architecture lisible de bout en bout :

**Business need → Application Services → Components → Interfaces → Events → Data Objects → Baseline/Target → Transition.**

---

## 1. Contexte

MayaBank possède une plateforme de paiement legacy fortement couplée.

Les principales limites observées :

- traitement batch encore présent ;
- règles métier dupliquées ;
- faible découplage ;
- dépendance à une base partagée ;
- difficulté de montée en charge ;
- APIs hétérogènes ;
- faible observabilité ;
- exceptions manuelles nombreuses ;
- intégrations point-to-point.

La cible vise une plateforme de paiement instantané 24/7, API-first et event-driven.

---

## 2. Drivers et Goals

```text
Driver: Growth of Instant Payments
Driver: 24/7 customer expectation
Driver: Regulatory pressure
Driver: Operational risk

Goal: Resilient real-time processing
Goal: Reduce manual exceptions
Goal: Improve traceability
Goal: Accelerate partner onboarding
```

---

## 3. Capabilities

```text
Real-Time Payment Processing
Payment Risk Management
Payment Status Management
Payment Exception Management
Clearing Connectivity
Payment Observability
```

Ces capabilities sont supportées par plusieurs éléments Business et Application.

---

## 4. Business Processes

```text
Initiate Instant Payment
Validate Payment
Perform Fraud Check
Authorize Payment
Submit to Clearing
Track Payment Status
Handle Payment Exception
Notify Customer
```

---

## 5. Business Services

```text
Instant Payment Service
Payment Status Service
Payment Exception Service
Partner Payment Service
```

---

## 6. Target Application Components

### Channel domain

- Mobile Banking Application
- Web Banking Application
- Partner Banking Application

### API domain

- Payment API Facade
- Partner API Facade

### Payment domain

- Payment Orchestrator
- Payment Validation Component
- Payment Status Component
- Payment Ledger Component

### Risk domain

- Fraud Detection Engine
- Limit Management Component
- AML Screening Adapter

### Integration domain

- Clearing Adapter
- Legacy Payment Adapter
- Notification Component

### Operations

- Payment Operations Portal
- Reconciliation Component

---

## 7. Application Services

### Payment

- Payment Initiation Service
- Payment Validation Service
- Payment Orchestration Service
- Payment Status Service
- Payment Ledger Service

### Risk

- Fraud Scoring Service
- Limit Verification Service
- AML Screening Service

### Integration

- Clearing Connectivity Service
- Legacy Compatibility Service
- Notification Service

### Operations

- Payment Investigation Service
- Payment Replay Service
- Reconciliation Service

---

## 8. Interfaces

### Customer-facing

```text
Payment Mobile Interface
Payment Web Interface
```

### API

```text
Payment Public REST API
Partner Payment API
Payment Status API
Fraud Scoring API
Limit Verification API
```

### Event

```text
Payment Events Interface
Settlement Events Interface
```

Les interfaces ne sont pas les services eux-mêmes : elles constituent les points d’accès.

---

## 9. Data Objects

```text
Payment Request
Payment Transaction
Payment Status
Fraud Assessment
Limit Decision
AML Decision
Clearing Instruction
Clearing Response
Payment Exception
Customer Notification
```

### Business realization

```text
Business Object: Payment Order
   realized by
Data Object: Payment Transaction
```

---

## 10. Application Events

```text
Payment Request Received
Payment Validated
Payment Rejected
Fraud Cleared
Fraud Rejected
Limit Approved
Limit Rejected
Payment Authorized
Clearing Submitted
Clearing Accepted
Clearing Rejected
Payment Settled
Payment Failed
Payment Exception Created
Customer Notified
```

---

## 11. Core synchronous flow

```text
Mobile Banking Application
    ↓
Payment Public REST API
    ↓
Payment Initiation Service
    ↓
Payment Orchestrator
    ↓
Fraud Scoring Service
    ↓
Fraud Detection Engine
    ↓
Limit Verification Service
    ↓
Limit Management Component
```

Ce flux représente les dépendances synchrones majeures.

---

## 12. Core asynchronous flow

```text
Payment Orchestrator
    ↓ produces
Payment Authorized
    ↓
Settlement Adapter
    ↓ produces
Clearing Submitted
    ↓
Payment Status Component
    ↓
Notification Component
```

La plateforme Kafka sera modélisée plus tard en Technology Layer comme réalisation de l’Event Streaming Service.

---

## 13. Payment Orchestrator

### Structure

```text
Application Component: Payment Orchestrator
```

### Functions

- Validate Request
- Coordinate Risk Checks
- Decide Routing
- Manage Payment State
- Trigger Settlement

### Process

```text
Application Process: Orchestrate Instant Payment
```

### Services

- Payment Orchestration Service
- Payment Initiation Service

### Data

- reads Payment Request
- reads Fraud Assessment
- reads Limit Decision
- writes Payment Status

### Events

- Payment Request Received
- Payment Authorized
- Payment Rejected

---

## 14. Fraud Engine

```text
Application Component: Fraud Detection Engine
Application Function: Calculate Fraud Score
Application Service: Fraud Scoring Service
Application Interface: Fraud Scoring API
Data Object: Fraud Assessment
Application Event: High Risk Detected
```

Business mapping :

```text
Business Function: Fraud Management
   supported by
Fraud Scoring Service
```

---

## 15. Limit Management

```text
Application Component: Limit Management Component
Application Function: Check Payment Limit
Application Service: Limit Verification Service
Data Object: Customer Limit
Data Object: Limit Decision
```

La séparation entre Customer Limit et Limit Decision rend l’architecture de donnée explicite.

---

## 16. Payment Ledger

Le Payment Ledger devient la source logique principale pour l’état transactionnel.

```text
Application Component: Payment Ledger Component
Application Service: Payment Ledger Service
Application Function: Record Payment State
Data Object: Payment Transaction
Data Object: Payment Status
```

Cela élimine les écritures directes multi-applications vers une base partagée.

---

## 17. Clearing Adapter

```text
Application Component: Clearing Adapter
Application Service: Clearing Connectivity Service
Application Function: Transform Clearing Message
Data Object: Clearing Instruction
Data Object: Clearing Response
```

L’adapter isole la logique de protocole externe.

---

## 18. Payment Status Component

```text
Application Component: Payment Status Component
Application Function: Consolidate Payment Timeline
Application Service: Payment Status Service
Application Interface: Payment Status API
Data Object: Payment Status
```

Il consomme les événements de cycle de vie et expose une vue consolidée.

---

## 19. Payment Operations Portal

```text
Application Component: Payment Operations Portal
Application Service: Payment Investigation Service
Application Service: Payment Replay Service
Application Interface: Operations UI
```

Il supporte :

```text
Business Role: Payment Operations Specialist
Business Process: Handle Payment Exception
```

---

## 20. Reconciliation Component

```text
Application Component: Reconciliation Component
Application Function: Compare Ledger and Clearing
Application Process: Reconcile Settlement
Application Service: Reconciliation Service
Application Event: Reconciliation Difference Detected
```

Il devient critique pour l’exploitation event-driven.

---

## 21. API View

```text
Mobile App
  → Payment Public REST API
  → Payment Initiation Service
  → Payment Orchestrator

Partner App
  → Partner Payment API
  → Payment Initiation Service

Operations Portal
  → Payment Status Service
```

Cette vue est orientée consumers/providers.

---

## 22. Event View

```text
Payment Orchestrator
   → Payment Authorized
      ├→ Clearing Adapter
      ├→ Payment Status Component
      └→ Analytics

Clearing Adapter
   → Payment Settled
      ├→ Payment Ledger
      ├→ Payment Status Component
      └→ Notification Component
```

---

## 23. Data Usage View

```text
Payment Orchestrator
   R/W Payment Transaction

Fraud Engine
   R Payment Transaction
   W Fraud Assessment

Limit Management
   R Customer Limit
   W Limit Decision

Payment Ledger
   W Payment Status

Status Component
   R Payment Status
```

---

## 24. Baseline Application Architecture

```text
Mobile App
    ↓
Legacy Payment Engine
    ├─ embedded validation
    ├─ embedded fraud rules
    ├─ shared payment database
    ├─ batch settlement
    └─ proprietary partner interfaces
```

Autres caractéristiques :

- tight coupling ;
- synchronous chain ;
- duplicated data ;
- limited APIs ;
- weak traceability.

---

## 25. Target Application Architecture

```text
Channels
   ↓
API Facades
   ↓
Payment Orchestrator
   ├→ Fraud Scoring Service
   ├→ Limit Verification Service
   ├→ Payment Ledger Service
   └→ Event Publishing
          ↓
      Settlement / Status / Notification / Analytics
```

---

## 26. Application Gaps

### Gap 1 — Monolithic processing

Target : decoupled application services.

### Gap 2 — Shared database

Target : explicit data ownership.

### Gap 3 — Batch settlement

Target : near-real-time/event processing.

### Gap 4 — Proprietary partner interfaces

Target : governed APIs.

### Gap 5 — No end-to-end status model

Target : Payment Status Component.

### Gap 6 — Weak observability

Target : correlation and event traceability.

### Gap 7 — Manual exception handling

Target : Operations Portal + workflow services.

---

## 27. Transition Architecture 1 — API Facade

```text
Channels
  → New API Facade
  → Legacy Payment Engine
```

Objectif : standardiser l’accès sans modifier immédiatement le cœur.

---

## 28. Transition Architecture 2 — New Orchestrator

```text
API Facade
  → Routing
      ├→ Legacy Payment Engine
      └→ New Payment Orchestrator
```

Nouveaux paiements migrés progressivement.

---

## 29. Transition Architecture 3 — Event Backbone

```text
New Orchestrator
  → Event Streaming
  → Status / Notification / Settlement
```

Le legacy reste présent pour certains flux.

---

## 30. Transition Architecture 4 — Ledger Migration

```text
Payment Ledger Component
   becomes source of truth
```

Les accès directs au shared DB sont supprimés.

---

## 31. Target final

Legacy Payment Engine décommissionné.

```text
Business
  ↓
Application Services
  ↓
Domain Components
  ↓
Events / APIs / Data Contracts
  ↓
Technology Platform
```

---

## 32. Traceability example

```text
Driver
24/7 Instant Payments
  ↓
Goal
Resilient real-time processing
  ↓
Capability
Real-Time Payment Processing
  ↓
Business Process
Execute Instant Payment
  ↓
Application Service
Payment Orchestration Service
  ↓
Application Component
Payment Orchestrator
  ↓
Data Object
Payment Transaction
```

---

## 33. Security requirements

```text
Strong Authentication
API Authorization
Data Confidentiality
End-to-End Traceability
Least Privilege
```

Application impact :

- Payment Public API ;
- Partner API ;
- Payment Orchestrator ;
- Payment Ledger ;
- Fraud Engine.

---

## 34. Resilience requirements

```text
24/7 Availability
No single application point of failure
Idempotent payment processing
Recoverable event processing
Controlled rollback
```

Ces exigences seront ensuite reliées à la Technology Architecture.

---

## 35. Observability requirements

```text
Correlation ID
Transaction timeline
Service metrics
Application logs
Distributed traces
Event traceability
```

Le modèle applicatif identifie les composants qui doivent participer à cette chaîne.

---

## 36. Questions d’analyse

### Q1
Pourquoi Payment Status est-il un composant séparé dans cette cible ?

**Pour consolider la timeline transactionnelle et exposer un service de statut découplé de l’orchestrateur.**

### Q2
Pourquoi ne pas représenter Kafka comme Payment Application Component ?

**Parce qu’il constitue ici une technologie de plateforme réalisant un service de streaming.**

### Q3
Pourquoi Fraud Scoring est-il un Application Service ?

**Parce qu’il s’agit d’un comportement applicatif explicitement fourni à d’autres composants.**

### Q4
Pourquoi Payment Authorized est-il un Application Event ?

**Parce qu’il représente un changement d’état/fait applicatif.**

### Q5
Pourquoi PaymentAuthorized Payload est-il distinct ?

**Parce qu’il représente la donnée transportée, pas le fait lui-même.**

---

## 37. Vue synthétique finale

```text
MOTIVATION
24/7 + Regulation + Resilience
       ↓
STRATEGY
Real-Time Payment Processing
       ↓
BUSINESS
Execute Instant Payment
       ↓
APPLICATION SERVICES
Initiation / Orchestration / Fraud / Limit / Status
       ↓
APPLICATION COMPONENTS
API Facade / Orchestrator / Fraud / Limits / Ledger / Status
       ↓
DATA + EVENTS
Payment Transaction / Fraud Assessment / Payment Authorized / Payment Settled
       ↓
TECHNOLOGY
Event Streaming / Container Platform / Database / Observability
```

---

## À retenir

> **La cible MayaBank n’est pas une liste de microservices : c’est une chaîne traçable entre besoin métier, services, composants, données, événements et transformation.**

C’est cette cohérence de modèle qui permet ensuite d’analyser impacts, risques, migration et gouvernance.
