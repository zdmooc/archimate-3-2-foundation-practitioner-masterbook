# MayaBank — catalogue de patterns réutilisables

Cette section consolide les patterns précédents dans un même cas fil rouge. Chaque pattern répond à une question d’architecture précise.

---

## Pattern 1 — Why → What

```text
Driver: Instant Payment Market Pressure
→ Assessment: Current platform too slow and tightly coupled
→ Goal: Real-Time and Resilient Payments
→ Outcome: 99.99% successful processing
→ Requirement: End-to-end processing < target latency
```

## Pattern 2 — Strategy

```text
Goal: Real-Time and Resilient Payments
→ Capability: Real-Time Payment Processing
→ Value Stream: Receive → Validate → Execute → Confirm
→ Course of Action: Adopt Incremental Event-Driven Modernization
```

## Pattern 3 — Organization

```text
Business Actor: Payments Department
  Assignment → Business Role: Payment Operator

Business Actor: Fraud Operations
  Assignment → Business Role: Fraud Analyst
```

## Pattern 4 — Business behavior

```text
Business Role: Payment Operator
  Assignment → Business Process: Execute Instant Payment

Execute Instant Payment
  Realization → Business Service: Instant Payment Service
```

## Pattern 5 — Business → Application

```text
Business Process: Execute Instant Payment
  served by
Application Service: Payment Orchestration Service

Application Function: Orchestrate Payment
  Realization → Payment Orchestration Service

Application Component: Payment Orchestrator
  Assignment → Orchestrate Payment
```

## Pattern 6 — API

```text
Application Interface: Payment REST API
  exposes
Application Service: Payment Initiation Service

Application Component: Payment Orchestrator
  provides/realizes via behavior
Payment Initiation Service
```

## Pattern 7 — Fraud integration

```text
Payment Orchestrator
→ Payment Validation
→ Flow(Payment Context)
→ Fraud Engine

Fraud Engine
  Assignment → Calculate Fraud Score

Calculate Fraud Score
  Realization → Fraud Scoring Service
```

## Pattern 8 — Event-driven

```text
Application Event: Payment Authorized
Data Object: PaymentAuthorized Payload
Technology Service: Event Streaming Service
System Software: Kafka
Application Components: Ledger / Notification / Analytics Consumers
```

## Pattern 9 — Data lineage

```text
Business Object: Payment Order
← Realization — Data Object: Payment Transaction

Payment Orchestrator
  Access(write) → Payment Transaction

Ledger Adapter
  Access(read/write) → Payment Transaction
```

## Pattern 10 — Database

```text
Data Object: Payment Transaction
Technology Service: Relational Database Service
System Software: PostgreSQL / Oracle
Node: Database Cluster
```

## Pattern 11 — OpenShift deployment

```text
Application Component: Payment Orchestrator
← Realization — Artifact: payment-orchestrator image

Technology Service: Container Platform Service
System Software: OpenShift
Node: Worker Pool
Device: Compute Infrastructure
Facility: Data Center A / B
```

## Pattern 12 — GitOps

```text
Requirement: Reproducible Deployments
Technology Service: GitOps Deployment Service
System Software: Argo CD
Artifact: Deployment Manifests
```

## Pattern 13 — IAM

```text
Requirement: Strong Authentication
Application Service: Customer Authentication Service
Technology Service: Identity Federation Service
Technology Interface: OIDC Endpoint
System Software: IAM Platform
```

## Pattern 14 — Observability

```text
Requirement: End-to-End Traceability
Application Components
  Flow(Telemetry) → Observability Platform
Technology Services: Metrics / Logs / Traces
System Software: Observability Stack
Outcome: Reduced MTTD / MTTR
```

## Pattern 15 — Availability

```text
Requirement: Availability target
Payment Application Components
→ redundant instances
→ OpenShift Service
→ Worker Nodes across failure domains
→ resilient database/messaging
```

## Pattern 16 — DR

```text
Requirement: RTO < 15 min
Requirement: RPO < 1 min
Facility: Site A
Facility: Site B
Technology Service: Replication Service
Communication Network: Inter-site Network
Work Package: Implement and Validate DR
Implementation Event: DR Test Passed
```

## Pattern 17 — Incident impact

```text
Technology Event: Kafka unavailable
→ Event Streaming Service unavailable
→ Payment Orchestrator/consumers impacted
→ Business Process degraded
→ Instant Payment Service impacted
```

Le modèle peut utiliser relations explicites et relations dérivées validées pour obtenir une vue d’impact plus abstraite.

## Pattern 18 — Baseline / Target

### Baseline

```text
Monolithic Payment Engine
Point-to-point integration
Manual deployment
Limited observability
```

### Target

```text
Payment Orchestrator
API-first
Kafka Event Backbone
OpenShift
GitOps
End-to-end observability
```

### Gap

```text
No standardized API layer
No event backbone
No container platform
No distributed tracing
```

## Pattern 19 — Transformation

```text
Course of Action: Incremental Modernization
→ WP1 OpenShift Foundation
→ WP2 API Foundation
→ WP3 Event Streaming Foundation
→ WP4 Payment Orchestrator
→ WP5 Flow Migration
→ WP6 Legacy Decommissioning
```

## Pattern 20 — Coexistence

```text
Plateau: Hybrid Payments
Legacy Payment Engine active for selected flows
Target Platform active for migrated flows
Temporary synchronization/routing components
Rollback capability retained
```

## Pattern 21 — Strangler

```text
Channel
→ API Facade
   ├→ Legacy Payment Engine
   └→ Target Payment Orchestrator
```

Au fil des Implementation Events, le routage bascule vers la cible.

## Pattern 22 — Green IT

```text
Driver: Reduce IT Footprint
Assessment: Duplicate legacy + target infrastructure
Goal: Reduce infrastructure footprint
Gap: Legacy remains powered after migration
Work Package: Decommission Legacy Estate
Implementation Event: Legacy Servers Powered Off
Outcome: Lower energy and allocated carbon footprint
```

## Pattern 23 — Executive view

Pour le CIO :

```text
Driver
→ Goal
→ Capability
→ Target Application Platform
→ Target Technology Platform
→ Work Packages
→ Target Plateau
```

Pas de pods, topics, tables ou endpoints.

## Pattern 24 — Solution Architect view

```text
Business Process
→ Application Services
→ Components
→ Data Objects
→ Integration Events/APIs
→ Technology Services
```

## Pattern 25 — Platform view

```text
Artifacts
→ OpenShift
→ Kafka
→ DB
→ IAM
→ Observability
→ Nodes
→ Networks
→ Sites
```

## Pattern 26 — Operations view

```text
Critical Application Components
→ Technology Services
→ System Software
→ Nodes
→ Monitoring
→ Failure Events
→ DR dependencies
```

## Pattern 27 — Security view

```text
Driver / Assessment
→ Security Goals
→ Requirements
→ Application Interfaces
→ Identity Services
→ Secrets / Key Management
→ Network / Platform Controls
```

## Pattern 28 — Data view

```text
Business Objects
→ Data Objects
→ Application accesses
→ Flows
→ DB/platform realization
```

## Pattern 29 — Migration view

```text
Baseline Plateau
→ Gaps
→ Work Packages
→ Implementation Events
→ Transition Plateaus
→ Target Plateau
```

## Pattern 30 — Green IT decision view

```text
Applications / Workloads
→ Technology Services
→ Nodes / Devices
→ Facilities / Energy dependencies
→ Utilization / energy / carbon properties
→ Migration / decommissioning work packages
```

---

# Principe de réutilisation

Ces 30 patterns ne sont pas 30 diagrammes à copier intégralement. Ils sont des **fragments de raisonnement** à combiner selon :

- stakeholder ;
- concern ;
- scope ;
- niveau de détail ;
- décision attendue.

> **Le modèle MayaBank devient ainsi une bibliothèque de solutions de modélisation, pas seulement un cas d’école.**
