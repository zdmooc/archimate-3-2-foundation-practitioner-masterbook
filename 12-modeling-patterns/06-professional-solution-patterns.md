# Patterns de solutions professionnelles — API, microservices, Kafka, OpenShift, Data, IAM, Observability, HA/DR et Green IT

Cette fiche applique ArchiMate 3.2 à des architectures contemporaines. Les technologies citées sont des exemples : **ArchiMate ne prescrit ni OpenShift, ni Kafka, ni Oracle, ni une architecture microservices**.

---

## 1. Pattern API

### Question

Comment représenter une API sans confondre service, interface et fournisseur ?

```text
Application Component: Payment Orchestrator
  Assignment → Application Function: Initiate Payment

Initiate Payment Function
  Realization → Application Service: Payment Initiation Service

Application Interface: Payment REST API
  exposes → Payment Initiation Service

Payment Initiation Service
  Serving → Business Process: Execute Payment
```

### Propriétés utiles

```text
protocol = HTTPS
style = REST
contract = OpenAPI
version = v2
```

### Anti-pattern

```text
Application Component: POST /payments
```

Un endpoint n’est généralement pas le composant applicatif.

---

## 2. Pattern API Gateway

```text
Application Component: Payment API Consumer
  uses
Application Service: Payment Initiation Service

Application Interface: External Payment API

Application Component: API Gateway
  supports/exposes interfaces

Technology Service: API Management Service
System Software: API Management Platform
```

Le choix entre Application Component et System Software pour un gateway dépend du rôle joué dans le modèle : gateway métier/configuration applicative vs plateforme technique générique.

---

## 3. Pattern microservice

Un microservice architecturalement significatif peut être représenté comme `Application Component`.

```text
Application Component: Fraud Scoring Service
  Assignment → Application Function: Calculate Fraud Score

Calculate Fraud Score
  Realization → Application Service: Fraud Scoring Service
```

### Anti-pattern

Représenter 250 microservices dans une vue exécutive.

Le **modèle** peut contenir le détail ; la **vue** doit rester adaptée au concern.

---

## 4. Pattern event-driven / Kafka

```text
Application Component: Payment Orchestrator
Application Event: Payment Authorized
Data Object: PaymentAuthorized Payload
Technology Service: Event Streaming Service
System Software: Kafka
Application Component: Notification Service
```

Chaîne de lecture :

```text
Payment Orchestrator
→ produces Payment Authorized
→ payload PaymentAuthorized
→ transported via Event Streaming Service
→ realized by Kafka
→ consumed by Notification Service
```

### Anti-patterns

- Kafka = Application Event ;
- topic = Business Service ;
- JSON payload = Event ;
- broker = Application Component sans justification.

---

## 5. Pattern orchestration vs choreography

### Orchestration

Un composant/processus central contrôle la séquence.

```text
Application Process: Orchestrate Payment
  Triggering → Validate
  Triggering → Fraud Check
  Triggering → Execute
```

### Choreography

Plusieurs composants réagissent aux événements sans orchestrateur central unique.

```text
Payment Authorized Event
  Triggering → Ledger Update
  Triggering → Notification
  Triggering → Analytics Update
```

ArchiMate peut représenter les deux styles sans ajouter de stéréotype propriétaire obligatoire.

---

## 6. Pattern OpenShift / Kubernetes

```text
Application Component: Payment Orchestrator
  realized by
Artifact: payment-orchestrator container image

Technology Service: Container Platform Service
System Software: OpenShift
Node: Worker Pool
Device: Compute Infrastructure
```

Services complémentaires :

```text
Technology Service: GitOps Deployment Service
System Software: Argo CD

Technology Service: Service Mesh Service
System Software: Service Mesh

Technology Service: Secret Management Service
System Software: Secret / Vault Platform
```

### Anti-pattern

`Pod`, `Deployment`, `Namespace`, `Worker`, `Operator` ne doivent pas être automatiquement tous modélisés dans chaque vue. Sélectionner uniquement ceux qui répondent au concern.

---

## 7. Pattern GitOps

```text
Requirement: Reproducible Deployments
Technology Service: GitOps Deployment Service
System Software: Argo CD
Artifact: Deployment Manifests
Artifact: Helm/Kustomize Configuration
Node: OpenShift Cluster
Implementation Event: Production Deployment Completed
```

Le Git repository peut être documenté comme Artifact/repository selon le niveau de détail, sans transformer ArchiMate en modèle Git.

---

## 8. Pattern Database / Oracle / PostgreSQL

```text
Business Object: Payment Order
  realized by
Data Object: Payment Transaction

Application Component: Payment Ledger
  Access(read/write) → Payment Transaction

Technology Service: Relational Database Service
System Software: PostgreSQL / Oracle Database
Node: Database Cluster
```

Pour RAC/Data Guard :

```text
Technology Service: Highly Available Database Service
System Software: Oracle RAC
Technology Service: Replication / DR Service
System Software: Data Guard
Nodes: Primary Site / Standby Site
```

### Anti-pattern

`Oracle` = Data Object.

---

## 9. Pattern Object Storage / S3

```text
Application Component: Document/Archive Service
Data Object: Payment Evidence
Technology Service: Object Storage Service
System Software / platform: S3-compatible Storage
Artifact: stored object representation if useful
```

---

## 10. Pattern IAM / OIDC

```text
Driver: Regulatory Security Expectations
Goal: Strong Access Control
Requirement: MFA for privileged operations
Requirement: Federated authentication

Application Service: Authentication Service
Technology Service: Identity Federation Service
Technology Interface: OIDC/OAuth Endpoint
System Software: IAM Platform
Data Object: Identity Claims
```

### Séparation importante

```text
Authentication = qui es-tu ?
Authorization  = que peux-tu faire ?
```

Ces préoccupations peuvent donner lieu à des services/requirements distincts.

---

## 11. Pattern secrets et cryptographie

```text
Requirement: Secrets shall not be stored in application images
Technology Service: Secret Management Service
System Software: Vault / Secret Platform
Technology Service: Key Management Service
Device / Equipment: HSM appliance selon le concern
```

---

## 12. Pattern observability

```text
Requirement: End-to-End Traceability

Application Components
  Flow(telemetry) → Observability Platform

Technology Service: Metrics Service
Technology Service: Logging Service
Technology Service: Tracing Service
System Software: Observability Stack
```

Pour le métier :

```text
Outcome: Mean Time to Detect < 5 min
Outcome: Payment failure localization < 10 min
```

---

## 13. Pattern HA intra-site

```text
Requirement: Availability ≥ target
Application Components
→ redundant application instances
→ Technology Service: Container Platform Service
→ Nodes: Worker A / B / C
→ redundant network/storage dependencies
```

Le modèle doit montrer les dépendances critiques, pas simplement écrire « HA » dans un coin du diagramme.

---

## 14. Pattern DR multi-site

```text
Requirement: RPO ≤ 1 min
Requirement: RTO ≤ 15 min

Site A Facility
  hosts Primary Platform

Site B Facility
  hosts Recovery Platform

Technology Service: Replication Service
Communication Network: Inter-site Network

Work Package: Implement DR
Deliverable: Validated DR Capability
Implementation Event: DR Exercise Passed
```

---

## 15. Pattern incident impact

```text
Technology Event: Kafka Cluster Unavailable
→ impacts Technology Service: Event Streaming Service
→ impacts Application Components
→ impacts Business Process: Execute Instant Payment
→ impacts Business Service: Instant Payment Service
→ impacts Outcome / SLA
```

Une vue d’impact peut utiliser les relations directes ou dérivées appropriées pour remonter de la technologie vers le métier.

---

## 16. Pattern Green IT

```text
Driver: Reduce Environmental Footprint
Assessment: Legacy platform underutilized
Goal: Reduce infrastructure footprint
Requirement: Consolidate workloads where resilience permits
Course of Action: Migrate and Decommission
Work Package: Retire Legacy Platform
Implementation Event: Legacy Servers Powered Off
Outcome: Reduced energy and infrastructure footprint
```

Physical/Technology :

```text
Device: Physical Servers
Equipment: UPS / Cooling
Facility: Data Center
Distribution Network: Electrical Distribution
```

Propriétés externes possibles :

```text
avgPowerW
utilizationPct
embodiedCarbonKgCO2e
annualUseCarbonKgCO2e
PUE
```

### Règle

ArchiMate **structure la causalité architecturale**. Un outil Green IT ou une calculette fournit les mesures.

---

## 17. Pattern FinOps

```text
Driver: Cloud Cost Growth
Assessment: Low utilization / duplicated environments
Goal: Improve Cost Efficiency
Capability: Cloud Cost Management
Requirement: Cost allocation by product
Technology elements with properties: costCenter, monthlyCost, utilization
Work Package: Rightsize Platform
Outcome: Reduced unit cost
```

---

## 18. Pattern modernisation legacy

```text
Baseline Plateau: Legacy Payments
Gap: Tight coupling / manual deployment / batch integration
Course of Action: Incremental Modernization
Work Package: Introduce API Facade
Work Package: Introduce Event Backbone
Work Package: Extract Payment Orchestrator
Transition Plateau: Legacy + Target Coexistence
Target Plateau: Modern Payment Platform
```

---

## 19. Pattern Strangler

```text
Legacy Application
   ↓ existing services
API Facade / Routing Component
   ├─→ Legacy Function
   └─→ New Application Service

Migration waves
→ progressively redirect flows
→ decommission legacy functions
```

La partie Implementation & Migration montre les étapes ; Application montre la coexistence.

---

## 20. Pattern GenAI / AI Platform

ArchiMate peut modéliser une plateforme IA sans inventer une couche « AI » :

```text
Capability: AI-Assisted Decision Support
Application Component: RAG Application
Application Service: Knowledge Answering Service
Data Object: Embedding / Knowledge Chunk model
Technology Service: Model Serving Service
Technology Service: Vector Search Service
System Software: AI Platform / Vector Database
Node: GPU Compute Pool
Requirement: Human Oversight
Requirement: Data Privacy
```

Le langage reste le même ; seules les technologies changent.

---

## À retenir

> **Les architectures modernes ne nécessitent pas de casser ArchiMate. Elles nécessitent de choisir le bon niveau d’abstraction et de séparer service, interface, application, donnée, plateforme, infrastructure et transformation.**
