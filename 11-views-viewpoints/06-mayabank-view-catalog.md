# MayaBank — catalogue de vues d’architecture

Ce chapitre montre comment un même modèle d’entreprise peut produire plusieurs vues adaptées à des audiences différentes.

---

## 1. Executive Transformation View

### Stakeholders

- CIO
- COO
- Head of Payments

### Concern

Comprendre pourquoi la transformation existe et ce qu’elle change au niveau global.

### Contenu

```text
Driver: Instant Payments Regulation
Driver: Legacy Complexity
↓
Goal: Real-Time Resilient Payments
↓
Capability: Real-Time Payment Processing
↓
Application Platform: Target Payment Platform
↓
Technology Platform: OpenShift + Kafka
↓
Plateau: Target 2028
```

### Ce qu’on masque

- endpoints ;
- topics ;
- tables ;
- pods ;
- détails réseau.

---

## 2. Capability Heatmap View

### Stakeholders

- Enterprise Architect
- Transformation Director

### Concern

Quelles capacités nécessitent l’investissement le plus important ?

### Capacités

```text
Payment Initiation        mature
Fraud Decisioning         medium
Real-Time Orchestration   weak
Payment Observability     weak
Settlement Automation     medium
```

Cette vue peut utiliser des propriétés pour représenter maturité, criticité ou priorité.

---

## 3. Business Process View

### Stakeholders

- Head of Payments
- Operations Manager

### Concern

Comprendre l’exécution du paiement instantané.

```text
Receive Payment Request
→ Validate Payment
→ Fraud Check
→ Authorize Payment
→ Execute Payment
→ Confirm Status
```

Avec :

- rôles ;
- événements ;
- business objects ;
- business services.

---

## 4. Application Usage View

### Stakeholders

- Solution Architect
- Business Architect

### Concern

Comment les applications supportent-elles le processus métier ?

```text
Execute Instant Payment
↑ served by Payment Orchestration Service
↑ realized by Payment Orchestrator

Fraud Control
↑ served by Fraud Scoring Service
↑ realized by Fraud Detection Engine
```

---

## 5. Application Cooperation View

### Stakeholders

- Solution Architect
- Integration Architect

### Concern

Quelles dépendances existent entre composants applicatifs ?

```text
Mobile Banking
→ API Gateway
→ Payment Orchestrator
→ Fraud Engine
→ Limit Service
→ Ledger Adapter
```

Avec événements :

```text
Payment Authorized
Payment Settled
Payment Rejected
```

---

## 6. Event-Driven View

### Stakeholders

- Integration Architect
- Kafka Platform Team

### Concern

Quels événements relient quels producteurs et consommateurs ?

```text
Payment Orchestrator
→ Payment Authorized Event
→ Notification Service
→ Analytics Platform
→ Fraud Monitoring
```

La vue distingue :

- Application Event ;
- Data Object payload ;
- Technology Service event streaming ;
- System Software Kafka.

---

## 7. Deployment View

### Stakeholders

- Platform Architect
- SRE

### Concern

Où les composants applicatifs sont-ils déployés ?

```text
Payment Orchestrator
↓ realized by
container image
↓ deployed on
OpenShift
↓ hosted by
Worker Nodes
```

---

## 8. Resilience / DR View

### Stakeholders

- CISO
- Operations
- Resilience Officer

### Concern

Quelles dépendances critiques déterminent le RTO/RPO ?

Contenu :

- application components ;
- Kafka ;
- databases ;
- sites ;
- replication ;
- backup services ;
- requirements RTO/RPO.

---

## 9. Security View

### Stakeholders

- CISO
- Security Architect

### Concern

Comment identité, chiffrement et segmentation soutiennent-ils le paiement ?

```text
Requirement: Strong Authentication
Requirement: Encryption in Transit
Requirement: Least Privilege
↓
IAM Service
mTLS Service
Secrets Management
Network Segmentation
```

---

## 10. Data Lineage View

### Stakeholders

- Data Architect
- Risk / Compliance

### Concern

Comment le concept métier Payment Order est-il représenté dans les systèmes ?

```text
Business Object: Payment Order
↓
Data Object: Payment Transaction
↓
Artifact: PAYMENT_TX
↓
PostgreSQL / Oracle
```

---

## 11. Migration Roadmap View

### Stakeholders

- Program Director
- Architecture Board

### Concern

Comment atteindre la cible sans rupture de service ?

```text
Baseline
↓
OpenShift + Kafka Foundation
↓
Pilot Plateau
↓
Hybrid Plateau
↓
Target Plateau
↓
Legacy Decommissioned
```

---

## 12. Green IT View

### Stakeholders

- Green IT Lead
- CIO
- Infrastructure Architect

### Concern

Quels choix de transformation permettent de réduire l’empreinte physique ?

```text
Goal: Reduce Carbon Footprint
↓
Course of Action: Consolidate Platforms
↓
Work Package: Migrate Legacy Workloads
↓
Application: Legacy Payment Engine
↓
Nodes: Legacy Servers
↓
Implementation Event: Legacy Shutdown
```

---

## 13. Incident Impact View

### Stakeholders

- Operations
- SRE
- Business Continuity

### Concern

Quel impact métier découle d’une panne technique ?

```text
Kafka Cluster Failure
↓ impacts
Payment Orchestrator
↓ impacts
Execute Instant Payment
↓ impacts
Instant Payment Service
```

---

## 14. Portfolio Rationalization View

### Stakeholders

- CIO
- Enterprise Architect

### Concern

Quels composants sont redondants, stratégiques ou à retirer ?

Catégories :

- keep ;
- invest ;
- migrate ;
- retire ;
- replace.

---

## À retenir

> **MayaBank n’a pas une architecture “dessinée une fois” : il possède un modèle partagé qui produit une famille de vues cohérentes pour des décisions différentes.**
