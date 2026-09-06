# Viewpoints majeurs — Strategy, Business, Application, Technology

Les viewpoints standards constituent une bibliothèque de points de départ. Le plus important est de comprendre **la question à laquelle chacun répond**.

---

## 1. Strategy Viewpoint

Questions :

- quelles capacités devons-nous développer ?
- quelles ressources sont critiques ?
- quelles courses of action soutiennent les objectifs ?

Concepts fréquents :

- Resource ;
- Capability ;
- Value Stream ;
- Course of Action ;
- Goal / Outcome en contexte.

Exemple MayaBank :

```text
Goal: Reduce Payment Processing Time
↓
Capability: Real-Time Payment Processing
↓
Course of Action: Adopt Event-Driven Payments
```

Audience : direction, enterprise architects, transformation leads.

---

## 2. Capability Viewpoint

Question :

> De quoi l’entreprise doit-elle être capable ?

Il permet de représenter une carte de capacités, éventuellement avec des propriétés telles que :

- criticité ;
- maturité ;
- coût ;
- risque ;
- priorité de transformation.

Exemple :

```text
Payments
├─ Payment Initiation
├─ Fraud Detection
├─ Real-Time Orchestration
├─ Clearing & Settlement
└─ Payment Observability
```

Il est particulièrement utile pour :

- prioriser les investissements ;
- identifier les capability gaps ;
- aligner stratégie et architecture.

---

## 3. Value Stream Viewpoint

Question :

> Comment la valeur est-elle créée par étapes ?

Exemple :

```text
Receive Request
→ Validate
→ Authorize
→ Execute
→ Confirm
```

Le Value Stream ne remplace pas le Business Process. Il montre davantage les **étapes de création de valeur** que le détail opérationnel.

---

## 4. Organization Viewpoint

Questions :

- qui fait quoi ?
- quelles unités organisationnelles ?
- quels rôles ?
- quelles collaborations ?

Concepts fréquents :

- Business Actor ;
- Business Role ;
- Business Collaboration.

Exemple MayaBank :

```text
Payments Department
├─ Payment Operations Role
├─ Exception Manager Role
└─ Fraud Analyst Role
```

---

## 5. Business Process Cooperation Viewpoint

Questions :

- quels processus coopèrent ?
- quels événements les relient ?
- quels services sont produits ?

Exemple :

```text
Initiate Payment
→ Validate Payment
→ Fraud Control
→ Execute Payment
→ Notify Customer
```

Il est utile pour comprendre les dépendances métier sans descendre immédiatement dans les applications.

---

## 6. Product Viewpoint

Questions :

- quelle offre est proposée au client ?
- quels services et contrats la composent ?

Exemple :

```text
Product: MayaBank Premium Payments
├─ Instant Payment Service
├─ Payment Tracking Service
└─ Premium Banking Agreement
```

Attention : `Product` n’est pas une application.

---

## 7. Application Cooperation Viewpoint

Question :

> Comment les composants applicatifs coopèrent-ils ?

Concepts :

- Application Component ;
- Application Collaboration ;
- Application Interface ;
- Application Service ;
- Flow / Serving / Triggering selon le cas.

Exemple :

```text
Mobile Banking
→ API Gateway
→ Payment Orchestrator
→ Fraud Engine
→ Ledger Adapter
```

Ce viewpoint est très utile pour les architectures de solution.

---

## 8. Application Usage Viewpoint

Question :

> Comment les applications supportent-elles les processus métier ?

Exemple :

```text
Business Process: Execute Instant Payment
↑ served by
Application Service: Payment Orchestration Service
↑ realized by
Application Component: Payment Orchestrator
```

C’est l’un des meilleurs viewpoints pour expliquer le lien Business↔Application.

---

## 9. Information Structure Viewpoint

Question :

> Quelles structures informationnelles sont utilisées et comment sont-elles liées ?

Concepts possibles :

- Business Object ;
- Data Object ;
- Representation ;
- Artifact selon le niveau.

Exemple :

```text
Business Object: Payment Order
↓ realized by
Data Object: Payment Transaction
↓ realized by
Artifact: PAYMENT_TX table
```

---

## 10. Technology Viewpoint

Question :

> Quelle infrastructure et quels services techniques supportent les applications ?

Concepts :

- Node ;
- Device ;
- System Software ;
- Technology Service ;
- Communication Network ;
- Artifact.

Exemple MayaBank :

```text
OpenShift Cluster
├─ Worker Nodes
├─ Kafka Platform
├─ PostgreSQL
└─ Observability Platform
```

---

## 11. Technology Usage Viewpoint

Question :

> Comment les applications utilisent-elles les services technologiques ?

Exemple :

```text
Application Component: Payment Orchestrator
← served by Technology Service: Container Execution Service
← realized by System Software: OpenShift
```

Cette vue rend explicite le passage Application↔Technology.

---

## 12. Sélection rapide

| Question | Viewpoint utile |
|---|---|
| Pourquoi transformer ? | Motivation / Strategy |
| Quelles capacités ? | Capability |
| Comment crée-t-on de la valeur ? | Value Stream |
| Qui fait quoi ? | Organization |
| Quels processus coopèrent ? | Business Process Cooperation |
| Quelle offre ? | Product |
| Quelles applications coopèrent ? | Application Cooperation |
| Comment les applications supportent le métier ? | Application Usage |
| Quelles données ? | Information Structure |
| Où cela s’exécute ? | Technology |
| Comment l’application consomme la plateforme ? | Technology Usage |

---

## À retenir

> **Le bon viewpoint est celui qui répond au concern avec le minimum de complexité nécessaire.**
