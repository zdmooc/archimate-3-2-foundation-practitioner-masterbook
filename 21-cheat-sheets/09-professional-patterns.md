# Cheat Sheet 09 — Patterns professionnels

## 1. API Banking

```text
Business Service
← realized by Business Process
← supported by Application Service
← realized by Application Component
Application Service
→ exposed through Application Interface
```

Questions : qui consomme ? quelle fonctionnalité ? quel point d’accès ? quel composant réalise ?

## 2. Event-Driven / Kafka

```text
Application Event
→ triggers behavior
Data Object
→ carries logical payload
Application Components
→ exchange through
Technology Service: Event Streaming
← realized by
System Software: Kafka
```

Ne pas confondre event, message, topic, payload et broker.

## 3. OpenShift / Kubernetes

```text
Application Component
→ represented/deployed as Artifact
→ deployed on Node
System Software: OpenShift
→ provides Technology Service: Container Platform
```

Optionnel selon concern : worker Nodes/Devices, ingress, storage, network, observability.

## 4. IAM / Zero Trust

```text
Driver: regulatory/security pressure
→ Goal: trusted access
→ Requirement: strong authentication / least privilege
→ Application/Technology Services: Identity, Authentication, Authorization
→ IAM components/system software
→ Interfaces / trust boundaries
```

Secrets et credentials ne deviennent pas un nouveau “security layer”. Utiliser les concepts existants + Requirements/Constraints.

## 5. Observability / SRE

```text
Goal: Reliable Payments
→ Requirement: SLO / observability
→ Technology Service: Observability Service
← System Software: metrics/logs/traces stack
→ serves Application Components / Operations Roles
```

SLI/SLO = propriétés/requirements selon concern, pas Technology Services par nature.

## 6. Multi-site / DR

```text
Requirement: RTO/RPO
→ Target Technology Architecture
Facilities A/B
→ Devices/Nodes/System Software
→ Replication Path/Network
→ Application Services
→ Business Services
```

Ajouter Work Packages, DR test Deliverables et Implementation Events si le concern est la transformation ou la preuve de résilience.

## 7. Cloud Migration

```text
Driver / Assessment
→ Goal
→ Course of Action: adopt cloud platform
→ Gap catalogue
→ Work Packages
→ Transition Plateaus
→ Target Plateau
```

Toujours garder visibles les dépendances hybrides et le decommissioning.

## 8. Data Platform

```text
Business Object
→ represented/manipulated as Data Objects
→ accessed by Application Processes/Functions
→ stored/processed through Technology Services
```

Ajouter lineage, ownership, retention, residency sous forme de relations/propriétés/requirements adaptées.

## 9. Fraud & Risk

```text
Driver: fraud/regulation
→ Goal: secure compliant payments
→ Capability: Fraud Detection
→ Business Process: Fraud Review
→ Application Service: Fraud Scoring
← Application Component: Fraud Engine
→ Data Object: Fraud Score / Decision
```

## 10. GenAI Platform

```text
Business/Strategy Capability
→ Application Service: AI Assistance / Generation
← Application Components: orchestration, guardrails, retrieval
→ Technology Services: model serving, vector/search, observability
← System Software / Nodes
```

LLM/model ≠ Capability. Séparer l’aptitude métier de la technologie.

## 11. Green IT

```text
Driver: sustainability / cost
→ Goal: reduce avoidable footprint
→ Assessment: under-utilized legacy estate
→ Course of Action: consolidate / right-size
→ Work Packages
→ decommissioning event
→ Outcome measured with CO2e/kWh/etc.
```

La causalité est essentielle.

## 12. Strangler Pattern

```text
Baseline Plateau: Legacy
→ Work Package: introduce API / facade
→ Transition Plateau: Hybrid
→ Work Package: migrate capabilities/flows
→ Implementation Event: final cutover
→ Work Package: decommission legacy
→ Target Plateau
```

## 13. GitOps

```text
Application/Technology Components
→ Artifacts/configuration
→ deployment automation
Technology Service: Delivery/Deployment Service
System Software: GitOps controller
Work Package / Deliverable si transformation
```

## 14. Incident Impact Analysis

Partir du point de panne et remonter :

```text
Facility / Network / Node / System Software
→ Technology Service
→ Application Component / Service
→ Business Process / Service
→ Capability / Goal
```

## 15. Portfolio Rationalization

```text
Goal / Capability
→ Business Services
→ Application Services
→ Application Components
→ Technology dependencies
→ cost / obsolescence / risk properties
→ Gap / Work Package de rationalisation
```

## Pattern de soutenance

Pour expliquer n’importe quelle architecture en entretien :

1. Driver / business problem.
2. Target capability/outcome.
3. Business services/processes.
4. Application responsibilities and interfaces.
5. Data/events.
6. Technology/runtime.
7. Security/resilience/observability.
8. Baseline gaps.
9. Migration roadmap.
10. Risks/trade-offs.