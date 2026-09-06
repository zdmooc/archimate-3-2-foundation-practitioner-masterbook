# MayaBank — Technology Architecture complète

Ce chapitre assemble la Technology Layer autour du cas fil rouge **MayaBank Instant Payments**.

L’objectif est de relier les besoins de résilience, performance, sécurité et exploitation aux services de plateforme puis aux technologies qui les réalisent.

---

## 1. Contexte

MayaBank remplace une chaîne legacy de paiement par une plateforme moderne orientée API, événements et conteneurs.

### Baseline

- applications Java sur VM ;
- WebSphere ;
- Oracle ;
- intégrations point-à-point ;
- déploiements semi-manuels ;
- supervision fragmentée ;
- secrets dispersés ;
- reprise multi-site complexe.

### Target

- OpenShift ;
- services applicatifs découplés ;
- Kafka ;
- PostgreSQL/Oracle selon domaines ;
- GitOps ;
- observabilité unifiée ;
- secrets centralisés ;
- API management ;
- architecture HA/DR multi-site.

---

## 2. Requirements principaux

```text
R1 — disponibilité 24/7
R2 — survivre à la perte d’un worker
R3 — RTO paiement critique ≤ 15 min
R4 — RPO transactionnel proche de zéro selon données critiques
R5 — traçabilité bout en bout
R6 — secrets gérés centralement
R7 — mTLS ou authentification forte entre workloads critiques
R8 — déploiement reproductible et auditable
R9 — capacité à absorber les pics de volume
R10 — isolation des workloads et flux critiques
```

Ces Requirements appartiennent à Motivation mais pilotent la Technology Architecture.

---

## 3. Services technologiques cibles

MayaBank standardise les services suivants :

### Runtime

- Container Execution Service
- Scheduling Service
- Service Discovery Service
- Ingress Service

### Data

- Relational Database Service
- Object Storage Service
- Backup Service

### Integration

- Event Streaming Service
- API Routing Service

### Security

- Identity Service
- Secrets Management Service
- Certificate Management Service
- Network Isolation Service
- Policy Enforcement Service

### Operations

- Observability Service
- Alerting Service
- GitOps Deployment Service
- Artifact Storage Service

### Resilience

- High Availability Runtime Service
- Database Disaster Recovery Service
- Multi-Site Recovery Service

---

## 4. Runtime OpenShift

```text
Node: MayaBank OpenShift Production Platform
  ├─ Node: Control Plane
  ├─ Node: Payment Worker Pool
  └─ Node: Shared Services Worker Pool

System Software:
- Red Hat OpenShift
- Kubernetes
- CRI-O
- Linux

Technology Services:
- Container Execution Service
- Scheduling Service
- Service Discovery Service
- Ingress Service
```

---

## 5. Payment workloads

```text
Application Components:
- Payment API Facade
- Payment Orchestrator
- Fraud Engine
- Limit Management Adapter
- Payment Ledger
- Clearing Adapter
- Notification Service
```

Chaque composant est réalisé par un Artifact de type container image.

```text
Payment Orchestrator
   → Artifact: payment-orchestrator:2.4.1
   → Node: Payment Runtime
```

---

## 6. GitOps

```text
System Software: Argo CD
Artifact: Desired State Manifests
Technology Process: Reconcile Desired State
Technology Service: GitOps Deployment Service
```

Le code et les manifests sont versionnés ; le cluster converge vers l’état désiré.

---

## 7. Registry

```text
System Software: Container Registry
Technology Service: Artifact Storage Service
Technology Interface: Registry Endpoint
Artifacts:
- payment-api image
- payment-orchestrator image
- fraud-engine image
- notification image
```

---

## 8. API ingress

```text
Application Interface: Payment REST API
        ↓
Technology Interface: Payment Public Endpoint
        ↓
Technology Service: API Routing / Ingress Service
        ↓
System Software: API Gateway / Ingress Controller
```

---

## 9. API security

```text
Technology Service: Authentication Service
Technology Service: Token Validation Service
Technology Service: WAF / API Protection Service
```

Côté requirement :

```text
Requirement: externally exposed payment APIs must authenticate callers
```

---

## 10. Event Streaming

```text
Node: Event Streaming Cluster
System Software: Kafka
Technology Interface: Kafka Bootstrap Endpoint
Technology Service: Event Streaming Service
Technology Function: Message Persistence
Technology Function: Partition Replication
```

Application Events :

```text
Payment Received
Payment Authorized
Payment Rejected
Payment Sent To Clearing
Payment Settled
Payment Failed
```

---

## 11. Event schemas

```text
Artifact: payment-received.avsc
Artifact: payment-authorized.avsc
Artifact: payment-settled.avsc
```

```text
System Software: Schema Registry
Technology Service: Event Schema Management Service
```

---

## 12. Transaction database

```text
Node: Payment Database Cluster
System Software: PostgreSQL
Technology Interface: PostgreSQL Private Endpoint
Technology Service: Relational Database Service
Technology Function: Transaction Persistence
Technology Function: Replication
```

---

## 13. Data chain

```text
Business Object: Payment Order
        ↓
Data Object: Payment Transaction
        ↓
Artifact: PAYMENT_TRANSACTION table
        ↓
System Software: PostgreSQL
```

---

## 14. Oracle coexistence

Certaines fonctions legacy restent sur Oracle pendant la transition.

```text
Node: Legacy Oracle Platform
System Software: Oracle Database
Technology Service: Legacy Relational Database Service
```

Les adapters applicatifs permettent la coexistence jusqu’à extinction.

---

## 15. Object Storage

Les preuves, documents ou payloads volumineux peuvent être stockés via :

```text
Technology Service: Object Storage Service
Technology Interface: S3 Endpoint
```

Le détail de la plateforme physique n’est montré que si nécessaire.

---

## 16. Secrets

```text
System Software: Secrets Platform
Technology Service: Secrets Management Service
Technology Interface: Secrets API
Technology Process: Secret Rotation
```

Les workloads n’embarquent plus de credentials statiques dans les images ou fichiers.

---

## 17. Workload identity

```text
System Software: Identity Platform
Technology Service: Workload Identity Service
Technology Service: Token Service
```

Ce service peut être combiné à un service mesh pour les communications internes.

---

## 18. Service Mesh

```text
System Software: Service Mesh
Technology Service: Secure Service Connectivity
Technology Function: mTLS Enforcement
Technology Function: Traffic Policy Enforcement
```

---

## 19. Network segmentation

```text
Communication Networks:
- External/API Zone
- Payment Processing Zone
- Event Platform Zone
- Data Zone
- Management Zone
```

```text
Technology Service: Network Isolation Service
Artifact: Network Policy Bundle
```

---

## 20. Observability

```text
Technology Service: Observability Service
Technology Function: Metrics Collection
Technology Function: Log Aggregation
Technology Function: Trace Correlation
```

Chaque paiement possède un identifiant de corrélation partagé entre applications et traces.

---

## 21. End-to-end traceability

```text
Requirement: trace every payment end-to-end
        ↓
Application behavior emits trace context
        ↓
Technology Service: Distributed Tracing Service
        ↓
System Software: Observability Platform
```

---

## 22. Alerting

```text
Technology Event: Error Rate Threshold Exceeded
Technology Process: Generate Operational Alert
Technology Service: Alerting Service
```

---

## 23. Autoscaling

```text
Technology Function: Workload Autoscaling
Technology Event: CPU/Queue Threshold Reached
Technology Process: Scale Payment Workload
```

Le scaling répond à la croissance des volumes sans surdimensionnement permanent.

---

## 24. Worker failure

```text
Technology Event: Worker Node Failed
        ↓
Technology Process: Reschedule Workload
        ↓
Technology Service: Resilient Container Execution
```

Ce mécanisme satisfait R2.

---

## 25. Database HA

```text
Node: Primary Database Node/Cluster
Node: Standby Database Node/Cluster
Technology Collaboration: Payment Database HA
Technology Interaction: Replication
Technology Process: Automatic Failover
```

---

## 26. Multi-site architecture

```text
Site A
  ├─ OpenShift Cluster A
  ├─ Kafka Cluster A
  └─ Database Platform A

Site B
  ├─ OpenShift Cluster B
  ├─ Kafka/DR Platform B
  └─ Database Standby/Peer B

Communication Network: Inter-site WAN
Technology Collaboration: MayaBank Dual-Site Payment Platform
```

---

## 27. DR event

```text
Technology Event: Site A Unavailable
        ↓
Technology Process: Activate Site B
        ↓
Technology Interaction: Cross-Site Failover
        ↓
Technology Service: Disaster Recovery Service
```

---

## 28. Backup

```text
Technology Process: Backup Payment Database
Technology Service: Backup Service
Artifact: Payment Backup Set
```

Backup reste distinct du DR.

---

## 29. Application → Technology dependency map

| Application Component | Runtime | Messaging | Database | Security | Observability |
|---|---|---|---|---|---|
| Payment API Facade | OpenShift | - | - | IAM/WAF | OTel |
| Payment Orchestrator | OpenShift | Kafka | PostgreSQL | Secrets/mTLS | OTel |
| Fraud Engine | OpenShift | Kafka | PostgreSQL | Secrets/mTLS | OTel |
| Payment Ledger | OpenShift | Kafka | PostgreSQL | Secrets | OTel |
| Clearing Adapter | OpenShift | Kafka | - | Secrets/mTLS | OTel |
| Notification | OpenShift | Kafka | - | Secrets | OTel |

---

## 30. Baseline architecture

```text
Channels
  ↓
Legacy Payment Engine
  ↓
WebSphere on VM
  ↓
Oracle
  ↓
Point-to-point integrations
```

Risques :

- dépendances fortes ;
- scalabilité limitée ;
- déploiement lent ;
- faible observability ;
- failover complexe ;
- coûts fixes élevés.

---

## 31. Target architecture

```text
Channels
  ↓
API Management / Ingress
  ↓
Payment Services on OpenShift
  ↔ Kafka Event Streaming
  ↔ PostgreSQL / Oracle transition
  ↔ Identity / Secrets
  ↔ Observability
  ↔ Object Storage
```

---

## 32. Transition Architecture 1

- OpenShift introduit ;
- certaines fonctions legacy restent sur WebSphere ;
- API Facade masque la coexistence ;
- Kafka utilisé pour nouveaux événements ;
- Oracle reste source pour certains domaines.

---

## 33. Transition Architecture 2

- Payment Orchestrator cible actif ;
- fraude et notifications découplées ;
- Payment Ledger migré ;
- PostgreSQL utilisé pour nouvelles données ;
- legacy réduit à quelques adapters.

---

## 34. Target finale

- workloads conteneurisés ;
- event streaming standard ;
- API gouvernées ;
- services techniques mutualisés ;
- observabilité transverse ;
- GitOps ;
- HA/DR testé ;
- dépendances legacy supprimées.

---

## 35. Architecture decision examples

### ADR — OpenShift comme runtime cible

Drivers : standardisation, automatisation, résilience, portabilité.

Trade-offs : complexité plateforme, compétences, coûts de cluster.

### ADR — Kafka pour intégration événementielle

Drivers : découplage, temps réel, replay.

Trade-offs : gouvernance schemas, ordering, observability, capacité.

### ADR — GitOps

Drivers : auditabilité, reproductibilité, drift control.

Trade-offs : discipline Git, secrets, promotion des versions.

---

## 36. Analysis questions

### Si Kafka tombe

Impact possible :

- Orchestrator ;
- Fraud Engine ;
- Notification ;
- status propagation ;
- certains Business Processes.

### Si Identity Service tombe

Impact :

- appels API externes ;
- potentiellement communications workload selon design.

### Si Observability tombe

Le paiement peut continuer mais la capacité de diagnostic/SLO se dégrade.

Cette différence est importante pour la criticité.

---

## 37. Architecture views recommandées

- Technology Landscape
- Deployment View
- OpenShift Platform View
- Event Streaming View
- Data Platform View
- Security Services View
- Observability View
- Network Zones View
- HA View
- DR View
- Baseline vs Target
- Application↔Technology Dependency View

---

## 38. Questions de contrôle

### Q1
Pourquoi Kafka n’est-il pas Application Component ?

**Réponse :** parce que dans cette architecture Kafka fournit un environnement de plateforme ; il est modélisé comme System Software réalisant un Event Streaming Technology Service.

### Q2
Pourquoi l’image de l’Orchestrator est-elle Artifact ?

**Réponse :** parce qu’elle est la forme déployable du composant applicatif.

### Q3
Pourquoi OpenShift Cluster est-il Node ?

**Réponse :** parce qu’il représente l’environnement computationnel sur lequel les artifacts sont déployés.

### Q4
Pourquoi Observability est-elle Technology Service ?

**Réponse :** parce que la plateforme expose un comportement technique consommable par les workloads et équipes.

### Q5
Pourquoi le RTO n’est-il pas un Technology Service ?

**Réponse :** c’est une exigence de récupération, satisfaite par des services/processus de résilience.

---

## À retenir

> **La Technology Architecture MayaBank n’est pas une liste de produits. C’est un ensemble de services techniques reliés aux besoins, réalisés par des plateformes et consommés par les applications.**

Le modèle permet de naviguer de **Requirement → Technology Service → System Software/Node → Artifact/Application → Business impact**.