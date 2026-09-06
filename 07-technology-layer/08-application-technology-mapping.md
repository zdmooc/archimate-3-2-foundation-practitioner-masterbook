# Application ↔ Technology Mapping — relier le logiciel à sa plateforme

Le passage de l’Application Layer à la Technology Layer est l’un des usages les plus importants d’ArchiMate.

Il répond à la question :

> **De quelles capacités techniques une application dépend-elle, sous quelle forme est-elle déployée et sur quels environnements fonctionne-t-elle ?**

---

## 1. Pattern minimal

```text
Application Component
        ↓ realized by
Artifact
        ↓ deployed on
Node
        ↓ supported by
System Software
        ↓ provides
Technology Service
```

Exemple :

```text
Payment Orchestrator
  → payment-orchestrator:2.4.1
  → OpenShift Production Cluster
  → OpenShift
  → Container Execution Service
```

---

## 2. Application Service → Technology Service

Un Application Service peut dépendre de plusieurs Technology Services.

```text
Application Service: Payment Orchestration Service
  uses
Technology Service: Container Execution Service
Technology Service: Database Service
Technology Service: Event Streaming Service
Technology Service: Secrets Management Service
Technology Service: Observability Service
```

La vue montre les dépendances de plateforme.

---

## 3. Application Interface → Technology Interface

```text
Application Interface: Payment REST API
        ↓ exposed through
Technology Interface: Payment Ingress Endpoint
        ↓
Technology Service: Ingress Service
```

La séparation évite de confondre API métier et endpoint de plateforme.

---

## 4. Data Object → Artifact → Database Service

```text
Data Object: Payment Transaction
        ↓ realized by
Artifact: PAYMENT_TX table
        ↓ managed by
System Software: PostgreSQL
        ↓ exposes
Technology Service: Relational Database Service
```

---

## 5. Application Event → Event Streaming

```text
Application Event: Payment Authorized
Data Object: Payment Authorized Message
        ↓
Technology Service: Event Streaming Service
        ↓
System Software: Kafka
```

L’événement reste applicatif ; Kafka reste technique.

---

## 6. Component → multiple runtimes

Un même composant peut être déployé dans plusieurs environnements :

```text
Application Component: Payment Orchestrator
  ├─ Artifact v2.4.1 → Node: Preprod Cluster
  └─ Artifact v2.4.1 → Node: Prod Cluster
```

Les environnements ne constituent pas des composants applicatifs différents.

---

## 7. Baseline vs Target

### Baseline

```text
Legacy Payment Engine
 → payment.ear
 → Payment VM
 → WebSphere
 → Oracle Database
```

### Target

```text
Payment Orchestrator
 → container image
 → OpenShift
 → Container Execution Service
 → PostgreSQL / Kafka / Observability / Secrets Services
```

La vue révèle le changement de dépendances techniques.

---

## 8. Mapping capability → application → technology

```text
Capability: Real-Time Payment Processing
  ↓
Business Process: Execute Instant Payment
  ↓
Application Service: Payment Orchestration Service
  ↓
Application Component: Payment Orchestrator
  ↓
Technology Service: Container Execution Service
  ↓
System Software: OpenShift
```

Ce type de chaîne explique pourquoi la technologie existe.

---

## 9. Mapping requirement → technology

```text
Requirement: survive one worker failure
  ↓
Technology Service: Resilient Container Execution
  ↓
Technology Function: Workload Rescheduling
  ↓
System Software: OpenShift
```

La technologie devient la réalisation d’un besoin, pas une décision arbitraire.

---

## 10. Mapping security

```text
Requirement: workloads must use strong identity
  ↓
Technology Service: Workload Identity Service
  ↓
System Software: Identity / Service Mesh Platform
```

---

## 11. Mapping observability

```text
Requirement: trace payment end-to-end
  ↓
Technology Service: Distributed Tracing Service
  ↓
Technology Function: Trace Collection
  ↓
System Software: Observability Platform
```

---

## 12. Mapping DR

```text
Requirement: RTO ≤ 15 min
  ↓
Technology Service: Disaster Recovery Service
  ↓
Technology Process: Activate Secondary Site
  ↓
Technology Collaboration: Dual-Site Platform
```

---

## 13. Mapping Kafka

```text
Application Component: Payment Orchestrator
Application Event: Payment Authorized
Data Object: Payment Event Message
  ↓
Technology Service: Event Streaming Service
  ↓
System Software: Kafka
  ↓
Node: Kafka Cluster
```

---

## 14. Mapping database

```text
Application Component: Payment Ledger
Data Object: Payment Transaction
  ↓
Technology Service: Relational Database Service
  ↓
System Software: PostgreSQL
  ↓
Node: Database Cluster
```

---

## 15. Mapping storage

```text
Application Component: Document Service
Data Object: Payment Evidence
  ↓
Technology Service: Object Storage Service
  ↓
Technology Interface: S3 Endpoint
```

---

## 16. Mapping API Gateway

```text
Application Interface: Payment API
  ↓
Technology Service: API Routing Service
  ↓
System Software: API Gateway Platform
  ↓
Technology Interface: External Gateway Endpoint
```

---

## 17. Mapping GitOps

```text
Artifact: Desired State Manifest
  ↓
System Software: Argo CD
  ↓
Technology Process: Reconcile Desired State
  ↓
Node: OpenShift Cluster
```

---

## 18. Matrice de dépendances

Une vue peut être complétée par une matrice :

| Application | Runtime | DB | Messaging | Secrets | Observability |
|---|---|---|---|---|---|
| Payment Orchestrator | OpenShift | PostgreSQL | Kafka | Vault | OTel |
| Fraud Engine | OpenShift | PostgreSQL | Kafka | Vault | OTel |
| Notification | OpenShift | - | Kafka | Vault | OTel |

La matrice est complémentaire au modèle graphique.

---

## 19. Analyse d’impact

Si le `Event Streaming Service` est indisponible, le modèle permet d’identifier :

- les Application Components dépendants ;
- les Application Services impactés ;
- les Business Processes concernés ;
- les Business Services potentiellement dégradés.

C’est la valeur du cross-layer modeling.

---

## 20. Analyse de concentration

Si 80 applications dépendent d’un seul Technology Service, ce service devient un point critique.

ArchiMate peut rendre visible :

- concentration des dépendances ;
- blast radius ;
- mutualisation ;
- besoin de HA ;
- impact d’une migration de plateforme.

---

## 21. Anti-pattern : sauter directement de Business à Node

```text
Business Process → Server
```

Ce raccourci masque :

- l’application ;
- le service applicatif ;
- l’artifact ;
- le runtime ;
- le service technique.

Une vue simplifiée peut masquer certains niveaux visuellement, mais le modèle sous-jacent doit rester cohérent.

---

## 22. Questions de contrôle

### Q1
Quel concept relie le composant logique à son image de conteneur ?

**Réponse : Artifact comme réalisation déployable.**

### Q2
Quel concept représente l’environnement OpenShift ?

**Réponse : Node pour le cluster/runtime et System Software pour OpenShift.**

### Q3
Quel concept représente le service Kafka consommé par l’application ?

**Réponse : Technology Service: Event Streaming Service.**

### Q4
Comment montrer l’endpoint d’ingress ?

**Réponse : Technology Interface.**

---

## À retenir

> **Le mapping Application→Technology doit permettre de remonter d’un serveur ou d’un service de plateforme jusqu’au métier qu’il supporte.**

C’est ce qui transforme un inventaire technique en véritable modèle d’architecture d’entreprise.