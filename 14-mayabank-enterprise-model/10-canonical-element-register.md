# MayaBank — Canonical Element Register

Ce registre définit les principaux éléments canoniques du modèle MayaBank. Les identifiants sont une convention locale destinée à stabiliser l’identité des objets dans les différentes vues.

> Ces identifiants ne font pas partie du standard ArchiMate.

## 1. Motivation

| ID | Type | Name |
|---|---|---|
| MB-MOT-001 | Driver | 24/7 Instant Payments |
| MB-MOT-002 | Driver | Cyber Risk |
| MB-MOT-003 | Driver | Time-to-Market Pressure |
| MB-MOT-004 | Driver | Estate Cost & Sustainability |
| MB-MOT-005 | Assessment | Legacy Lacks Elastic Real-Time Processing |
| MB-MOT-006 | Assessment | Static Secret Exposure |
| MB-MOT-007 | Assessment | Observability Fragmentation |
| MB-MOT-008 | Goal | Resilient Real-Time Payments |
| MB-MOT-009 | Goal | Reduce MTTR |
| MB-MOT-010 | Goal | Reduce Credential Exposure |
| MB-MOT-011 | Goal | Simplify Payment Estate |
| MB-MOT-012 | Principle | Observable by Default |
| MB-MOT-013 | Principle | Security by Design |
| MB-MOT-014 | Principle | API First |
| MB-MOT-015 | Requirement | End-to-End Correlation ID |
| MB-MOT-016 | Requirement | Externalize Workload Secrets |
| MB-MOT-017 | Requirement | Tolerate Single Worker Failure |
| MB-MOT-018 | Constraint | Legacy Coexistence During Transition |

## 2. Strategy

| ID | Type | Name |
|---|---|---|
| MB-STR-001 | Capability | Real-Time Payment Processing |
| MB-STR-002 | Capability | Fraud Detection |
| MB-STR-003 | Capability | Transaction Observability |
| MB-STR-004 | Capability | Partner Onboarding |
| MB-STR-005 | Capability | Resilience Engineering |
| MB-STR-006 | Capability | GitOps Delivery |
| MB-STR-007 | Capability | Disaster Recovery |
| MB-STR-008 | Capability | Event Streaming Platform Engineering |
| MB-STR-009 | Value Stream | Instant Payment Value Stream |
| MB-STR-010 | Course of Action | Modernize Payments Incrementally |
| MB-STR-011 | Course of Action | Adopt Event-Driven Integration Where Appropriate |
| MB-STR-012 | Course of Action | Consolidate Platforms |

## 3. Business

| ID | Type | Name |
|---|---|---|
| MB-BUS-001 | Business Actor | Customer |
| MB-BUS-002 | Business Actor | Payments Department |
| MB-BUS-003 | Business Actor | Fraud Operations Team |
| MB-BUS-004 | Business Actor | Settlement Operations Team |
| MB-BUS-005 | Business Role | Payment Operator |
| MB-BUS-006 | Business Role | Fraud Analyst |
| MB-BUS-007 | Business Role | Settlement Manager |
| MB-BUS-008 | Business Process | Validate Payment |
| MB-BUS-009 | Business Process | Assess Fraud Risk |
| MB-BUS-010 | Business Process | Execute Instant Payment |
| MB-BUS-011 | Business Process | Confirm Payment |
| MB-BUS-012 | Business Process | Reconcile Settlement |
| MB-BUS-013 | Business Process | Resolve Payment Exception |
| MB-BUS-014 | Business Service | Instant Payment Service |
| MB-BUS-015 | Business Service | Payment Tracking Service |
| MB-BUS-016 | Business Service | Exception Resolution Service |
| MB-BUS-017 | Business Object | Payment Order |
| MB-BUS-018 | Business Object | Payment Status |
| MB-BUS-019 | Business Object | Fraud Case |
| MB-BUS-020 | Business Object | Settlement Record |
| MB-BUS-021 | Product | MayaBank Instant Payments |

## 4. Application

| ID | Type | Name |
|---|---|---|
| MB-APP-001 | Application Component | Payment API Gateway |
| MB-APP-002 | Application Component | Payment Orchestrator |
| MB-APP-003 | Application Component | Fraud Engine |
| MB-APP-004 | Application Component | Limit Service |
| MB-APP-005 | Application Component | Payment Ledger Adapter |
| MB-APP-006 | Application Component | Clearing Adapter |
| MB-APP-007 | Application Component | Payment Status Service |
| MB-APP-008 | Application Component | Notification Service |
| MB-APP-009 | Application Component | Operations Portal |
| MB-APP-010 | Application Component | Reconciliation Service |
| MB-APP-011 | Application Interface | Payment REST API |
| MB-APP-012 | Application Interface | Partner Payment API |
| MB-APP-013 | Application Service | Payment Initiation Service |
| MB-APP-014 | Application Service | Payment Validation Service |
| MB-APP-015 | Application Service | Fraud Scoring Service |
| MB-APP-016 | Application Service | Payment Orchestration Service |
| MB-APP-017 | Application Service | Clearing Integration Service |
| MB-APP-018 | Application Service | Payment Status Service |
| MB-APP-019 | Data Object | Payment Instruction |
| MB-APP-020 | Data Object | Payment Transaction |
| MB-APP-021 | Data Object | Fraud Decision |
| MB-APP-022 | Data Object | Customer Limit Record |
| MB-APP-023 | Data Object | Settlement Entry |
| MB-APP-024 | Data Object | Correlation Context |
| MB-APP-025 | Application Event | Payment Authorized |
| MB-APP-026 | Application Event | Payment Rejected |
| MB-APP-027 | Application Event | Payment Settled |
| MB-APP-028 | Application Event | Payment Failed |

## 5. Technology

| ID | Type | Name |
|---|---|---|
| MB-TEC-001 | Technology Service | Container Execution Service |
| MB-TEC-002 | Technology Service | Event Streaming Service |
| MB-TEC-003 | Technology Service | Relational Database Service |
| MB-TEC-004 | Technology Service | API Management Service |
| MB-TEC-005 | Technology Service | Identity Federation Service |
| MB-TEC-006 | Technology Service | Secrets Management Service |
| MB-TEC-007 | Technology Service | Distributed Observability Service |
| MB-TEC-008 | Technology Service | Disaster Recovery Service |
| MB-TEC-009 | System Software | OpenShift |
| MB-TEC-010 | System Software | Kafka |
| MB-TEC-011 | System Software | PostgreSQL |
| MB-TEC-012 | System Software | Oracle Database |
| MB-TEC-013 | System Software | GitOps Controller |
| MB-TEC-014 | Node | OpenShift Production Cluster |
| MB-TEC-015 | Node | Payments Worker Pool |
| MB-TEC-016 | Communication Network | Application Network |
| MB-TEC-017 | Communication Network | Inter-Site Network |

## 6. Physical

| ID | Type | Name |
|---|---|---|
| MB-PHY-001 | Facility | MayaBank Site A |
| MB-PHY-002 | Facility | MayaBank Site B |
| MB-PHY-003 | Device | OpenShift Worker Server A1 |
| MB-PHY-004 | Device | OpenShift Worker Server B1 |
| MB-PHY-005 | Device | Kafka Server A1 |
| MB-PHY-006 | Device | Kafka Server B1 |
| MB-PHY-007 | Equipment | UPS A |
| MB-PHY-008 | Equipment | UPS B |
| MB-PHY-009 | Equipment | Cooling Unit A |
| MB-PHY-010 | Equipment | Cooling Unit B |
| MB-PHY-011 | Distribution Network | Electrical Distribution A |
| MB-PHY-012 | Distribution Network | Electrical Distribution B |

## 7. Implementation & Migration

| ID | Type | Name |
|---|---|---|
| MB-MIG-001 | Plateau | Baseline Legacy Payments |
| MB-MIG-002 | Plateau | Foundation Ready |
| MB-MIG-003 | Plateau | Hybrid Payments |
| MB-MIG-004 | Plateau | Target Core Active |
| MB-MIG-005 | Plateau | Target Stable |
| MB-MIG-006 | Gap | Real-Time Orchestration Gap |
| MB-MIG-007 | Gap | API Governance Gap |
| MB-MIG-008 | Gap | Event Backbone Gap |
| MB-MIG-009 | Gap | Observability Gap |
| MB-MIG-010 | Gap | Data Ownership Gap |
| MB-MIG-011 | Work Package | Build OpenShift Foundation |
| MB-MIG-012 | Work Package | Establish Event Streaming Platform |
| MB-MIG-013 | Work Package | Establish Distributed Observability |
| MB-MIG-014 | Work Package | Build Payment Orchestrator |
| MB-MIG-015 | Work Package | Migrate Retail Payment Flow |
| MB-MIG-016 | Work Package | Execute Data Cutover |
| MB-MIG-017 | Work Package | Validate Multi-Site DR |
| MB-MIG-018 | Work Package | Decommission Legacy Payment Platform |
| MB-MIG-019 | Implementation Event | First Target Payment Processed |
| MB-MIG-020 | Implementation Event | Target Ledger Becomes Source of Truth |
| MB-MIG-021 | Implementation Event | Legacy Payment Platform Decommissioned |

## 8. Core relationship backbone

Exemples de relations structurantes :

```text
MB-MOT-001 → influences → MB-MOT-008
MB-MOT-008 → associated/trace → MB-STR-001
MB-STR-001 → realized/supported by → MB-BUS-010
MB-BUS-010 → realizes → MB-BUS-014
MB-APP-016 → serves → MB-BUS-010
MB-APP-002 → assigned to → Orchestrate Payment Function
Orchestrate Payment Function → realizes → MB-APP-016
MB-APP-002 → accesses → MB-APP-020
MB-APP-002 → served by → MB-TEC-001
MB-TEC-009 → enables/provides → MB-TEC-001
MB-TEC-014 → hosts → MB-TEC-009
MB-PHY-003 → realizes/hosts physical execution context for → MB-TEC-015
MB-MIG-014 → addresses → MB-MIG-006
MB-MIG-014 → contributes to → MB-MIG-003 / MB-MIG-004
```

Les libellés `trace`, `hosts`, `contributes to` ci-dessus décrivent l’intention métier de la chaîne ; lors de l’implémentation dans un modèle ArchiMate formel, chaque lien doit être matérialisé avec une relation ArchiMate autorisée et appropriée.

## 9. Register governance

Avant d’ajouter un nouvel élément :

1. vérifier s’il existe déjà ;
2. vérifier son type ;
3. vérifier son niveau d’abstraction ;
4. vérifier son owner ;
5. vérifier les vues qui l’utiliseront ;
6. vérifier les relations minimales attendues.

## 10. Règle

> **Le registre canonique empêche le modèle de devenir une collection de doublons créés vue par vue.**