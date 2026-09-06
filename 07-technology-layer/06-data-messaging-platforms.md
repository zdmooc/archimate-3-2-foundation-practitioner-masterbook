# Data, Database, Messaging & Platform Services — PostgreSQL, Oracle, Kafka et stockage

Ce chapitre montre comment utiliser la Technology Layer pour représenter des plateformes de données et de messaging sans mélanger logique applicative et réalisation technique.

---

## 1. Le principe à retenir

Toujours distinguer :

```text
Business Object
   ↓
Data Object
   ↓
Artifact
   ↓
System Software / Node
   ↓
Technology Service
```

Exemple :

```text
Business Object: Payment Order
Data Object: Payment Transaction
Artifact: PAYMENT_TX table
System Software: PostgreSQL
Node: Payment Database Cluster
Technology Service: Relational Database Service
```

---

## 2. PostgreSQL

### Plateforme

```text
System Software: PostgreSQL
Node: PostgreSQL Cluster
```

### Service exposé

```text
Technology Service: Relational Database Service
Technology Interface: PostgreSQL Endpoint
```

### Behavior

```text
Technology Function: Transaction Persistence
Technology Function: Replication
Technology Process: Backup and Restore
```

---

## 3. Oracle

Même logique :

```text
System Software: Oracle Database
Node: Oracle RAC Cluster
Technology Service: Relational Database Service
Technology Interface: Database Listener
```

Si RAC est important :

```text
Technology Collaboration: Oracle RAC Collaboration
Technology Interaction: RAC Instance Coordination
```

---

## 4. Exadata

Il faut séparer la plateforme d’infrastructure du moteur logique.

Exemple de vue :

```text
Node: Exadata Database Platform
Device: Database Server / Storage Server
System Software: Oracle Database
System Software: Grid Infrastructure
Technology Service: High-Performance Database Service
```

Une vue plus détaillée peut distinguer les cells de stockage si le concern le justifie.

---

## 5. Data Guard

```text
Node: Primary Database Cluster
Node: Standby Database Cluster
Technology Collaboration: Data Guard HA Pair
Technology Function: Redo Transport
Technology Interaction: Primary-Standby Replication
Technology Service: Database Disaster Recovery Service
```

Un `Technology Event` peut déclencher :

```text
Primary Unavailable
  → Failover Process
  → Promote Standby
```

---

## 6. Kafka

```text
System Software: Apache Kafka
Node: Kafka Cluster
Technology Service: Event Streaming Service
Technology Interface: Kafka Bootstrap Endpoint
```

### Functions

```text
Message Persistence
Partition Replication
Consumer Group Coordination
```

---

## 7. Kafka broker

Un broker individuel peut être :

```text
Node: Kafka Broker 1
System Software: Kafka Broker Software
```

Mais une vue solution peut se limiter au cluster.

---

## 8. Topic

Un topic est un mécanisme technique de stockage/routage des événements.

Il n’existe pas un concept ArchiMate unique imposé.

Selon le concern, on peut :

- l’exprimer comme Artifact logique/technique ;
- le représenter comme propriété du service de streaming ;
- ne pas le représenter ;
- utiliser un Data Object côté application pour le message et garder le topic hors de la vue.

Il faut privilégier la sémantique utile plutôt que forcer un mapping mécanique.

---

## 9. Event vs Message vs Topic vs Kafka

### Event

```text
Application Event: Payment Authorized
```

### Message

```text
Data Object: Payment Authorized Message
```

### Schema

```text
Artifact: payment-authorized.avsc
```

### Transport

```text
Technology Service: Event Streaming Service
```

### Technology

```text
System Software: Kafka
```

Cette séparation est essentielle.

---

## 10. Schema Registry

```text
System Software: Schema Registry
Technology Service: Event Schema Management Service
Technology Interface: Schema Registry API
Artifact: Payment Event Schema
```

---

## 11. Object Storage

```text
Technology Service: Object Storage Service
Technology Interface: S3 Endpoint
Node/System Software: Object Storage Platform
```

Côté données :

```text
Data Object: Payment Document
Artifact: Payment Document Object
```

---

## 12. Block Storage

```text
Technology Service: Block Storage Service
Device/Node: Storage Platform
Technology Interface: Storage Endpoint
```

Le choix `Device` vs `Node` dépend du niveau physique/logique.

---

## 13. File Storage

```text
Technology Service: File Storage Service
Technology Interface: NFS Endpoint
System Software: File Storage Platform
```

---

## 14. Cache

```text
System Software: Redis
Technology Service: Distributed Cache Service
Node: Redis Cluster
Technology Interface: Redis Endpoint
```

Le cache peut supporter plusieurs Application Components.

---

## 15. Search engine

```text
System Software: OpenSearch / Elasticsearch
Technology Service: Search and Indexing Service
Node: Search Cluster
```

---

## 16. API Management

```text
System Software: API Management Platform
Technology Service: API Routing Service
Technology Service: API Policy Enforcement Service
Technology Interface: External API Gateway Endpoint
```

Côté Application :

```text
Application Interface: Payment API
```

---

## 17. Identity

```text
System Software: Identity Provider
Technology Service: Authentication Service
Technology Service: Token Service
Technology Interface: OIDC Endpoint
```

L’application consomme ces services techniques.

---

## 18. PKI

```text
System Software: PKI Platform
Technology Service: Certificate Management Service
Technology Process: Certificate Issuance
Technology Event: Certificate Expiring
```

---

## 19. HSM

```text
Device: Hardware Security Module
Technology Service: Cryptographic Key Service
Technology Interface: HSM Interface
```

Si HSM est consommé comme service managé, le Technology Service peut être suffisant.

---

## 20. Backup

```text
Technology Service: Backup Service
Technology Process: Execute Backup
Technology Process: Restore Data
Artifact: Backup Set
Node: Backup Platform
```

---

## 21. MayaBank — persistence cible

```text
Application Component: Payment Ledger Adapter
Data Object: Payment Transaction
        ↓
Artifact: PAYMENT_TRANSACTION table
        ↓
System Software: PostgreSQL
        ↓
Node: Payment Database Cluster
        ↓
Technology Service: Relational Database Service
```

---

## 22. MayaBank — streaming cible

```text
Application Component: Payment Orchestrator
Application Event: Payment Authorized
Data Object: Payment Authorized Message
        ↓
Technology Service: Event Streaming Service
        ↓
System Software: Kafka
        ↓
Node: Event Platform Cluster
```

---

## 23. MayaBank — DR database

```text
Primary DB Cluster
      ↕ replication
Standby DB Cluster
      ↓
Technology Collaboration: Payment Database DR
      ↓
Technology Service: Database Disaster Recovery Service
```

---

## 24. Shared database anti-pattern

Si plusieurs applications accèdent directement à la même base :

```text
App A ─┐
App B ─┼→ Data Object / Database Service
App C ─┘
```

La vue rend visible le couplage.

Elle peut ensuite comparer une cible :

```text
App A/B/C
   → Application Service
   → Data Owner Component
   → Database Service
```

---

## 25. Data ownership

ArchiMate permet de montrer :

```text
Application Component: Payment Ledger
  realizes
Application Service: Payment Ledger Service
  accesses
Data Object: Payment Transaction
```

Puis la Technology Layer montre la persistence.

Cela sépare ownership logique et technologie de stockage.

---

## 26. Questions de contrôle

### Q1
PostgreSQL ?

**Réponse : System Software.**

### Q2
PostgreSQL managé offert aux applications ?

**Réponse : Technology Service**, dans une vue consommateur.

### Q3
Oracle RAC ?

**Réponse : Node/System Software + éventuellement Technology Collaboration**, selon le concern.

### Q4
Kafka ?

**Réponse : System Software.**

### Q5
Event Streaming ?

**Réponse : Technology Service.**

### Q6
Payment Authorized ?

**Réponse : Application Event.**

### Q7
payment-authorized.avsc ?

**Réponse : Artifact.**

### Q8
S3 ?

**Réponse : Technology Service pour l’Object Storage Service et Technology Interface pour l’endpoint, selon le niveau.**

---

## À retenir

> **Data Object = donnée logique ; Artifact = matérialisation ; System Software = moteur ; Technology Service = capacité technique consommable.**

Cette séparation rend les architectures Data, Kafka et Database beaucoup plus faciles à lire et à gouverner.