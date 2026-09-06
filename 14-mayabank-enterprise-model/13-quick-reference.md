# MayaBank — Quick Reference

Cette fiche résume le modèle d’entreprise complet en une lecture.

## Motivation

```text
Drivers
→ Assessments
→ Goals
→ Principles / Requirements
```

Exemples :

- 24/7 Instant Payments
- Cyber Risk
- Time-to-Market
- Estate Cost & Sustainability

## Strategy

```text
Goals
→ Capabilities
→ Value Stream
→ Courses of Action
```

Capabilities clés :

- Real-Time Payment Processing
- Fraud Detection
- Transaction Observability
- Resilience Engineering
- GitOps Delivery
- Disaster Recovery

## Business

```text
Customer / Partners
→ Business Services
→ Processes
→ Roles
→ Business Objects
```

Parcours principal :

```text
Initiate
→ Validate
→ Assess Risk
→ Execute
→ Confirm
→ Resolve / Reconcile
```

## Information

```text
Business Object
→ Data Object
→ owner/source of truth
→ readers/writers
→ representations/events
```

Données critiques :

- Payment Order
- Payment Transaction
- Fraud Decision
- Customer Limit
- Settlement Record
- Payment Status

## Application

```text
Business Process
← served by Application Service
← realized by Application Function
← assigned to Application Component
```

Composants :

- Payment API Gateway
- Payment Orchestrator
- Fraud Engine
- Limit Service
- Ledger Adapter
- Clearing Adapter
- Status Service
- Notification Service

## API

```text
Application Interface
→ exposes Application Service
→ provided by Component
→ consumed by Actor/Application
```

## Event-driven

```text
Application Event ≠ Payload ≠ Topic ≠ Kafka
```

- Event = fait
- Data Object = payload
- topic = mécanisme de transport détaillé
- Kafka = System Software

## Technology

```text
Application
→ Technology Service
→ System Software
→ Node
→ Communication Network
```

Technologies :

- OpenShift
- Kafka
- PostgreSQL
- Oracle
- IAM/OIDC
- secrets platform
- service mesh
- observability
- GitOps

## Physical

```text
Node
→ Device
→ Facility
→ Equipment / Distribution Network dependencies
```

Important :

- serveur IT = Device ;
- UPS/chiller = Equipment ;
- IP network = Communication Network ;
- power network = Distribution Network.

## Security

```text
Driver
→ Goal
→ Requirement
→ Application consumers
→ Technology Service
→ System Software
```

Contrôles : identity, authorization, mTLS, secrets, audit.

## Observability

```text
Goal: Reduce MTTR
→ Requirement: End-to-End Correlation
→ instrumented applications
→ metrics/logs/traces
→ Operations consumers
```

## Resilience / DR

```text
Business Service
→ RTO/RPO
→ Applications
→ Data
→ Technology Services
→ Sites A/B
```

## Transformation

```text
Baseline Plateau
→ Gaps
→ Work Packages
→ Deliverables
→ Implementation Events
→ Hybrid Plateau
→ Target Core
→ Decommission
→ Target Stable
```

## Key Plateaus

1. Baseline Legacy Payments
2. Foundation Ready
3. Hybrid Payments
4. Target Core Active
5. Target Stable

## Green IT

```text
Migration alone ≠ saving
Migration
→ zero legacy traffic
→ decommission
→ capacity released
→ assets retired/avoided/consolidated
→ measurable effect
```

## Core relationship reminders

```text
Assignment = exécute / porte
Realization = concrétise
Serving = fournit à
Access = lit/écrit
Triggering = déclenche
Flow = transfère
Influence = influence
```

## View rule

```text
Stakeholder
→ Concern
→ Viewpoint
→ View
```

Le modèle est riche ; chaque vue doit rester ciblée.

## Traceability rule

On doit pouvoir parcourir le modèle dans les deux sens :

```text
Why?
→ Goal
→ Capability
→ Business
→ Application
→ Technology
→ Physical
→ Migration
```

et inversement :

```text
Technology / Asset
→ consumers
→ Business impact
→ Goal justification
```

## Final test

Pour n’importe quel élément MayaBank, savoir répondre :

- pourquoi existe-t-il ?
- qui le consomme ?
- que réalise-t-il ?
- de quoi dépend-il ?
- quelle donnée manipule-t-il ?
- dans quel Plateau existe-t-il ?
- quel stakeholder a besoin de le voir ?

> **MayaBank sert de modèle de référence pour raisonner de bout en bout, pas de schéma à copier mécaniquement.**