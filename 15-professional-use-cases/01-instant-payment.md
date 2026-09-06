# Use case 1 — Instant Payment

## 1. Contexte

MayaBank veut traiter des paiements instantanés avec disponibilité élevée, décision de fraude en temps réel, confirmation rapide et résilience multi-site.

## 2. Stakeholders et concerns

| Stakeholder | Concern |
|---|---|
| Head of Payments | disponibilité et délai de traitement |
| Risk Officer | fraude et contrôles |
| Solution Architect | orchestration et dépendances |
| Platform Architect | scalabilité et haute disponibilité |
| Operations | observabilité et incidents |
| Program Director | migration progressive |

## 3. Motivation

```text
Driver: Customer Expectation for Real-Time Payments
Driver: Regulatory Pressure
Driver: Legacy Platform Obsolescence

Goal: Reliable Real-Time Payments
Goal: Reduce Payment Processing Time
Goal: Improve Operational Resilience

Requirement: 24x7 processing
Requirement: strong customer authentication
Requirement: fraud decision before execution
Requirement: auditable payment lifecycle
```

## 4. Capabilities

- Payment Initiation
- Real-Time Payment Orchestration
- Fraud Decisioning
- Clearing & Settlement
- Payment Status Management
- Exception Handling
- Payment Observability

## 5. Business

```text
Business Process: Execute Instant Payment

Receive Payment Order
→ Validate Payment
→ Check Fraud
→ Authorize Payment
→ Execute Payment
→ Update Status
→ Notify Customer
```

Business services :

- Instant Payment Service
- Payment Status Service
- Payment Exception Resolution Service

Business objects :

- Payment Order
- Customer Mandate
- Payment Status
- Fraud Case

## 6. Application

```text
Mobile Banking Application
Corporate Banking Portal
        ↓
Payment Initiation API
        ↓
Payment Orchestrator
   ├─ Payment Validation
   ├─ Fraud Decision
   ├─ Routing
   └─ Status Management
        ↓
Clearing Adapter
Core Banking Adapter
Notification Application
```

Application services :

- Payment Initiation Application Service
- Payment Orchestration Service
- Fraud Decision Service
- Payment Status Application Service

## 7. Event-driven

Business facts :

- Payment Order Received
- Payment Rejected
- Payment Completed

Application events :

- Payment Validation Completed
- Fraud Decision Available
- Payment Execution Completed

Data objects :

- Payment Instruction Data
- Fraud Decision Data
- Payment Status Data

Important :

```text
Payment Completed     = event/fact
payment.completed.v1  = topic technique
payload JSON/Avro     = Data Object / Artifact selon le concern
Kafka                 = System Software / Technology
```

## 8. Technology

- API Gateway
- OpenShift
- Kafka
- Schema Registry
- PostgreSQL / Oracle services
- IAM/OIDC
- Secrets service
- Observability service
- Service Mesh

## 9. Resilience

```text
Site A
  OpenShift cluster
  Kafka nodes
  Database primary/services

Site B
  OpenShift recovery/active workloads
  Kafka replication
  Database standby
```

Concerns :

- RPO/RTO ;
- loss of one worker ;
- loss of one availability zone/site ;
- Kafka partition availability ;
- database failover ;
- retry/idempotency ;
- duplicate payment protection.

## 10. Baseline

- monolithic payment engine ;
- synchronous point-to-point integrations ;
- manual deployment ;
- limited observability ;
- tight database coupling.

## 11. Target

- API-first initiation ;
- orchestrated payment domain ;
- event-driven status propagation ;
- OpenShift ;
- standardized IAM ;
- centralized observability ;
- multi-site resilience.

## 12. Gaps

- no event backbone ;
- no standardized API contracts ;
- no container platform ;
- insufficient end-to-end traceability ;
- weak automated failover.

## 13. Work Packages

1. Establish API foundation
2. Establish OpenShift platform
3. Establish Event Streaming platform
4. Build Payment Orchestrator
5. Integrate Fraud Engine
6. Migrate payment flows wave 1
7. Validate DR
8. Decommission legacy engine

## 14. Views utiles

- Capability View
- Business Process Cooperation View
- Application Usage View
- Application Cooperation View
- Technology View
- Deployment View
- Layered View
- Implementation & Migration View
- Incident Impact View

## 15. Anti-patterns

### Anti-pattern 1

`Kafka` modélisé comme `Application Event`.

Correction : Kafka est une plateforme ; l’événement est le fait transporté.

### Anti-pattern 2

`Payment API` modélisée uniquement comme service.

Correction : séparer le service exposé et l’interface par laquelle il est accessible.

### Anti-pattern 3

Un diagramme cible sans transition.

Correction : représenter le plateau hybride lorsque legacy et cible coexistent.

## 16. Questions d’entretien

1. Pourquoi distinguer Payment Service et Payment API ?
2. Comment représenter Kafka sans confondre plateforme et événement ?
3. Comment montrer la dépendance métier à l’OpenShift Platform ?
4. Comment représenter un cutover progressif ?
5. Comment analyser l’impact de la panne du Kafka Service ?

## 17. Mini-cas Practitioner

Le métier demande de savoir quels composants supportent le processus `Execute Instant Payment` et sur quelles plateformes ils s’exécutent.

Vue recommandée : **Layered / cross-layer view**, contenant :

```text
Business Process
→ Application Services
→ Application Components
→ Technology Services
→ System Software / Nodes
```

Le but n’est pas de montrer toute l’entreprise, mais de répondre précisément au concern de dépendance end-to-end.
