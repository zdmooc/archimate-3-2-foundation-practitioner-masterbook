# Quick Reference — Use cases professionnels

## 1. Architecture mentale commune

```text
WHY
Driver / Assessment / Goal / Requirement

WHAT MUST EXIST
Capability / Value Stream

WHAT BUSINESS DOES
Business Actor / Role / Process / Service / Object

HOW APPLICATION SUPPORTS IT
Application Service / Interface / Component / Event / Data Object

WHERE IT RUNS
Technology Service / System Software / Node / Device / Facility

HOW IT CHANGES
Gap / Work Package / Deliverable / Event / Plateau
```

## 2. Produit technique → questions ArchiMate

| Mot terrain | Questions à poser |
|---|---|
| API | service ou interface ? composant fournisseur ? consumer ? |
| Kafka | event, payload, streaming service, software ou node ? |
| OpenShift | service plateforme, system software, node, artifact ? |
| Cloud | quel managed service, runtime, network, IAM, region ? |
| IAM | authentication, authorization, identity, secrets, PAM ? |
| ML/LLM | capability, application, model artifact, serving service ? |
| Database | business/data object ou DBMS/service de stockage ? |
| DR | business criticality, RTO/RPO, dependencies, sites, recovery ? |
| Observability | SLO, service telemetry, platform, incident impact ? |
| Green IT | value, usage, physical asset, decommissioning, measure ? |

## 3. Pièges à connaître

```text
Service ≠ Interface
Event ≠ Topic
Event ≠ Payload
Capability ≠ Product
Application Component ≠ System Software
Data Object ≠ Database
Artifact ≠ Data Object
Node ≠ Device
HA ≠ DR
Goal ≠ Requirement
Course of Action ≠ Work Package
Migration ≠ Decommissioning
Carbon measure ≠ ArchiMate element
```

## 4. Viewpoint par question

| Question | Vue |
|---|---|
| Pourquoi ? | Motivation |
| Quelles aptitudes ? | Capability |
| Qui fait quoi ? | Organization / Business Process |
| Quel support applicatif ? | Application Usage |
| Quelles dépendances applicatives ? | Application Cooperation |
| Quelle information ? | Information Structure |
| Où cela tourne ? | Technology / Deployment |
| Quel impact cross-layer ? | Layered |
| Comment migrer ? | Implementation & Migration |
| Quel impact d'incident ? | Incident Impact custom |
| Quel contrôle de sécurité ? | Security custom |
| Quel bénéfice Green IT ? | Physical + Migration custom |

## 5. Chaînes à réciter

### API

```text
Application Component
→ internal behavior
→ Application Service
→ Application Interface
→ Consumer
```

### Event-driven

```text
Business/Application Event
→ Data Object payload
→ Event Streaming Service
→ System Software Kafka
→ consumer application
```

### OpenShift

```text
Application Component
→ Artifact container image
→ Container Execution Service
→ OpenShift System Software
→ Worker Node
→ Device if physical concern
```

### Data

```text
Business Object
→ Data Object
→ transformation behavior
→ Data Object
→ storage/query Technology Service
```

### DR

```text
Business Service
→ Applications
→ Technology Services
→ Nodes / Networks / Storage
→ Facilities
→ recovery services / Site B
```

### Green IT

```text
Goal
→ Requirement
→ architecture change
→ Work Package
→ Implementation Event: decommission
→ Target Plateau
→ measured property
```

## 6. Réponse type en entretien

```text
Concern
→ Stakeholder
→ Correct ArchiMate abstraction
→ Relations
→ Viewpoint
→ Cross-layer trace
→ Baseline/Target if transformation
→ Risks / quality checks
```

## 7. Règle finale

> **Ne jamais répondre à une question d'architecture uniquement par un nom de produit. Relier le produit au service fourni, aux consommateurs, au métier, aux exigences et à la transformation.**
