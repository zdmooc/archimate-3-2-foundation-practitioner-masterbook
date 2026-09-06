# MayaBank — TOGAF + ArchiMate de bout en bout

Ce chapitre applique l'ADM à un cas unique : moderniser la plateforme de paiements de MayaBank.

## 1. Preliminary

```text
Stakeholders: CIO, Head of Payments, CISO, Operations
Capability: Architecture Governance
Principles:
- Contract-First Integration
- Observable by Default
- Security by Design
- Reuse Before Build
- Automation First
```

## 2. Phase A — Vision

```text
Driver: Instant Payment Regulation
Driver: Customer Expectation for Real-Time Status
Assessment: Legacy platform cannot meet latency and observability goals
Goal: Real-Time, Resilient and Compliant Payments
Outcome: 99.99% availability and near-real-time status
Capability: Real-Time Payment Processing
Capability: Payment Observability
```

## 3. Phase B — Business Target

```text
Business Roles:
- Payment Operator
- Fraud Analyst
- Settlement Manager

Business Processes:
- Initiate Payment
- Validate Payment
- Fraud Control
- Execute Payment
- Handle Exception
- Notify Customer

Business Services:
- Instant Payment Service
- Payment Status Service
```

## 4. Phase C — Data Target

```text
Business Object: Payment Order
Business Object: Fraud Decision
Data Object: Payment Transaction
Data Object: Payment Status
Data Object: Fraud Score
Data Object: Event Envelope
```

Data concerns :
- system of record ;
- idempotency ;
- lineage ;
- retention ;
- schema versioning ;
- data residency.

## 5. Phase C — Application Target

```text
Payment API Gateway
Payment Orchestrator
Fraud Engine
Limit Management
Payment Ledger Adapter
Clearing Adapter
Notification Service
Event Consumers
```

Services :

```text
Payment Initiation Service
Payment Orchestration Service
Fraud Scoring Service
Payment Status Service
Notification Service
```

## 6. Phase D — Technology Target

```text
OpenShift
Kafka
Schema Registry
API Management
OIDC/IAM
Secrets Management
PostgreSQL / Oracle where required
Object Storage
Observability Stack
GitOps
Multi-site connectivity
```

Technology services :

```text
Container Platform Service
Event Streaming Service
Identity Service
Database Service
Observability Service
Secrets Service
```

## 7. Gap Analysis

```text
G1 No Standard API Layer
G2 No Event Backbone
G3 Point-to-Point Coupling
G4 Manual Deployment
G5 Weak End-to-End Observability
G6 Legacy Database Coupling
G7 Insufficient DR Automation
```

## 8. Phase E — Work Package Candidates

```text
WP1 Build OpenShift Foundation
WP2 Establish API Management
WP3 Establish Event Streaming
WP4 Implement Payment Orchestrator
WP5 Implement Observability
WP6 Prepare Data Migration
WP7 Migrate Instant Payment Wave 1
WP8 Migrate Remaining Flows
WP9 Decommission Legacy
```

## 9. Phase F — Migration Roadmap

### Plateau P0 — Baseline

Legacy monolith + point-to-point + manual deployment.

### Plateau P1 — Foundations Ready

OpenShift + API management + Kafka + observability available.

### Plateau P2 — Hybrid Payments

Selected flows use target platform; legacy remains active for others.

### Plateau P3 — Target Core Active

Most flows on target; legacy read-only or restricted.

### Plateau P4 — Target

Legacy retired; event-driven, API-first, observable platform standard.

## 10. Phase G — Governance

Traceability examples :

```text
Requirement: Payment API must be strongly authenticated
→ Payment API Service
→ IAM Technology Service
→ Work Package WP2
→ Deliverable: Governed API Platform
```

```text
Requirement: RTO ≤ 15 min
→ Target Multi-Site Architecture
→ DR Work Package
→ DR Test Deliverable
```

## 11. Phase H — Change

Nouveau besoin : fraud explainability.

```text
Driver: New Fraud Regulation
→ Assessment: Current decision model insufficiently explainable
→ Goal: Explainable Fraud Decisions
→ Requirement: Persist decision rationale
→ Fraud Engine / Data Objects / Storage impacted
→ New Work Package
```

## 12. Vue cross-layer finale

```text
Driver
→ Goal
→ Capability
→ Business Process
→ Application Service
→ Application Component
→ Data Object
→ Technology Service
→ System Software
→ Node
→ Gap
→ Work Package
→ Plateau
```

## 13. Ce que TOGAF apporte ici

- séquencement du travail d'architecture ;
- gouvernance ;
- gestion des exigences ;
- décisions de migration ;
- contrôle d'implémentation ;
- gestion du changement.

## 14. Ce qu'ArchiMate apporte ici

- langage partagé ;
- visualisation ;
- relations explicites ;
- traçabilité ;
- impact analysis ;
- vues adaptées aux stakeholders ;
- continuité du modèle entre les phases.

## À retenir

> **Le même modèle MayaBank évolue pendant l'ADM ; on ne recrée pas un schéma isolé à chaque phase.**