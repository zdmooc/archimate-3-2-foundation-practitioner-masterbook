# Matrice transversale des use cases professionnels

Cette matrice sert à comparer rapidement les 12 cas de la Partie XV.

| Use case | Driver dominant | Capability centrale | Application concern | Technology concern | Migration concern | Vue prioritaire |
|---|---|---|---|---|---|---|
| Instant Payment | temps réel / résilience | Real-Time Payment Processing | orchestration / fraud / status | OpenShift, Kafka, DB | coexistence legacy | Layered |
| API Banking | exposition / partenaires | API Product Management | services / interfaces | API management / IAM | retrait interfaces legacy | Application Usage |
| Kafka/Event Streaming | découplage | Event Integration | events / producers / consumers | Kafka / Schema Registry | migration point-to-point | Application Cooperation |
| OpenShift/Kubernetes | standardisation | Container Platform Engineering | workload deployment | cluster / GitOps / storage | migration VM→containers | Technology Usage |
| Cloud Migration | élasticité / modernisation | Cloud Platform Engineering | cloud-ready apps | landing zone / managed services | waves / exit | Migration |
| IAM/Zero Trust | cyber risk | Identity & Access Management | protected interfaces/apps | IdP / PAM / Secrets | identity consolidation | Security cross-layer |
| Fraud & Risk | pertes fraude | Fraud Detection | scoring / case mgmt | model serving / data | real-time modernization | Layered |
| Data Platform | fragmentation data | Data Product Management | ingestion/catalog | storage/compute/query | pipeline migration | Information Structure |
| Observability/SRE | incidents | Reliability Engineering | instrumented services | metrics/logs/traces | instrumentation rollout | Incident Impact |
| Multi-site/DR | continuité | Disaster Recovery | critical apps | replication/backup/sites | DR build/tests | Layered Dependency |
| GenAI Platform | adoption IA | AI Platform Engineering | RAG / gateway / evaluation | model serving/GPU/vector | POC→platform | Layered |
| Green IT | empreinte/coût | Sustainable Architecture | rationalization | consolidation/physical | decommissioning | Baseline/Target |

## 1. Les chaînes conceptuelles communes

### Motivation vers capability

```text
Driver
→ Assessment
→ Goal
→ Requirement / Principle
→ Capability
```

### Business vers application

```text
Business Process / Service
→ Application Service
→ Application Component
→ Data Object / Event
```

### Application vers technology

```text
Application Component
→ Artifact
→ Technology Service
→ System Software
→ Node / Device
```

### Transformation

```text
Baseline Plateau
→ Gap
→ Work Package
→ Deliverable / Implementation Event
→ Transition Plateau
→ Target Plateau
```

## 2. Choix rapide du viewpoint

| Question | Viewpoint / vue utile |
|---|---|
| Pourquoi investir ? | Motivation / Strategy |
| De quoi devons-nous être capables ? | Capability |
| Qui fait quoi ? | Organization / Business Process |
| Quelles applications supportent le métier ? | Application Usage |
| Comment les applications coopèrent-elles ? | Application Cooperation |
| Où s'exécute la solution ? | Technology / Deployment |
| Quelle dépendance cross-layer existe ? | Layered |
| Comment migrer ? | Implementation & Migration |
| Où circule la donnée ? | Information Structure / Lineage |
| Quel est l'impact d'une panne ? | Incident Impact custom view |
| Quel contrôle protège quoi ? | Security custom view |
| Quel gain environnemental est réellement obtenu ? | Physical + Migration + properties |

## 3. Confusions par use case

### Instant Payment

- Payment Service ≠ Payment API
- Business Event ≠ Kafka topic
- HA ≠ DR

### API Banking

- Service ≠ Interface
- API Gateway product ≠ Capability
- OpenAPI spec ≠ Service

### Kafka

- Event ≠ topic
- Payload ≠ event
- Broker ≠ application behavior

### OpenShift

- Pod ≠ Application Component automatically
- Worker Node ≠ physical Device automatically
- Namespace ≠ Capability

### Cloud

- Cloud ≠ single Node
- managed service ≠ absence of architecture
- target diagram ≠ migration plan

### IAM

- authentication ≠ authorization
- IdP ≠ secrets platform
- Business Role ≠ identity account

### Fraud

- ML model ≠ Capability
- score ≠ Business Event
- Fraud Service ≠ Rules Engine

### Data Platform

- database ≠ Data Object
- data lake ≠ one generic Component
- data product typing depends on concern

### Observability

- SLO ≠ Technology Service
- dashboard ≠ observability capability
- technical alert ≠ business impact

### DR

- backup ≠ HA
- two sites ≠ validated DR
- database replication ≠ application recovery

### GenAI

- LLM ≠ Capability
- vector DB ≠ Data Object
- prompt ≠ Business Process

### Green IT

- carbon measure ≠ ArchiMate element type
- migration ≠ realized reduction
- optimization without decommissioning may not reduce physical footprint

## 4. Architecture interview matrix

When an interviewer gives a technology name, answer in this order :

```text
1. What concern are we modeling?
2. Which layer?
3. Structure, behavior, service, interface or information?
4. Who consumes it?
5. What does it realize or serve?
6. Where is it deployed?
7. What business capability depends on it?
8. What happens during failure or migration?
```

Example : `Kafka`.

Do not answer immediately “System Software”. Say :

- as platform product → System Software ;
- as capability delivered to apps → Technology Service ;
- event carried by it → Application/Business Event ;
- payload → Data Object ;
- cluster nodes → Nodes/Devices.

## 5. Maturité du modèle

### Niveau 1 — topology only

Components and arrows.

### Niveau 2 — semantic application model

Correct Application elements and relationships.

### Niveau 3 — cross-layer

Business + Application + Technology.

### Niveau 4 — traceable

Motivation + Requirements + Capability + solution.

### Niveau 5 — transformable

Baseline + Gaps + Work Packages + Target.

### Niveau 6 — governable

View catalog, ownership, security, resilience, quality gates, measurable properties.

The professional target is not to draw more boxes. It is to move the model toward **traceable and governable architecture**.
