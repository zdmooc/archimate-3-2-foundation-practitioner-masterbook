# Technology Behavior — Function, Process, Interaction, Event et Service

La Technology Layer ne se limite pas aux machines, réseaux et plateformes. Elle permet aussi de décrire **ce que la technologie fait**.

Les cinq concepts de comportement sont :

- `Technology Function`
- `Technology Process`
- `Technology Interaction`
- `Technology Event`
- `Technology Service`

---

## 1. Technology Function

Une **Technology Function** représente un comportement technologique regroupé selon un critère choisi, souvent une responsabilité technique stable.

### Exemples

- Container Scheduling
- Secret Distribution
- Log Collection
- Metrics Collection
- Message Persistence
- Data Replication
- Backup Management
- Traffic Routing

La Function met l’accent sur **une responsabilité technique**, pas sur une séquence temporelle.

---

## 2. Technology Process

Un **Technology Process** représente une séquence de comportements technologiques qui produit un résultat particulier.

### Exemples

- Backup and Restore Process
- Certificate Rotation Process
- Node Provisioning Process
- Disaster Recovery Activation
- Container Deployment Process

### Function vs Process

```text
Technology Function: Backup Management
Technology Process : Execute Nightly Backup
```

La Function représente la responsabilité.
Le Process représente le déroulement.

---

## 3. Technology Interaction

Une **Technology Interaction** représente un comportement collectif exécuté par plusieurs Nodes.

### Exemples

- Cluster Failover
- Database Replication Interaction
- Active/Active Traffic Distribution
- Kafka Replica Synchronization

Ce concept est particulièrement utile pour représenter des comportements HA distribués.

---

## 4. Technology Event

Un **Technology Event** représente un changement d’état technologique.

### Exemples

- Worker Node Failed
- Replica Became Leader
- Certificate Expired
- Storage Threshold Reached
- Network Link Lost
- Backup Completed
- Pod Runtime Unavailable

Le Technology Event peut déclencher un comportement technique.

```text
Technology Event: Worker Node Failed
        ↓ triggers
Technology Process: Reschedule Workload
```

---

## 5. Technology Service

Un **Technology Service** est un comportement technologique explicitement exposé à son environnement.

### Exemples

- Container Execution Service
- Event Streaming Service
- Relational Database Service
- Object Storage Service
- Name Resolution Service
- Secrets Management Service
- Load Balancing Service
- Monitoring Service
- Identity Service

Le service décrit **ce que le consommateur obtient**.

---

## 6. Function vs Service

### Function

Comportement interne.

```text
Technology Function: Message Persistence
```

### Service

Comportement exposé.

```text
Technology Service: Event Streaming Service
```

Le service peut être réalisé par une ou plusieurs functions.

---

## 7. Process vs Service

Un processus technique peut contribuer à fournir un service, mais les deux concepts ne sont pas synonymes.

```text
Technology Process: Restore Database
Technology Service: Database Recovery Service
```

Le premier décrit un déroulement.
Le second décrit une capacité technique exposée.

---

## 8. Interaction vs Process

### Process

Peut être exécuté dans un contexte technique unique ou distribué, mais met l’accent sur la séquence.

### Interaction

Met l’accent sur **la coopération de plusieurs structures actives**.

Exemple :

```text
Technology Interaction: Cross-Site Failover
```

réalisée collectivement par deux clusters.

---

## 9. MayaBank — Container Platform

```text
System Software: OpenShift
Technology Function: Container Scheduling
Technology Function: Workload Isolation
Technology Service: Container Execution Service
Technology Interface: Kubernetes API
```

Les applications consomment le service, tandis que la plateforme exécute des functions internes.

---

## 10. MayaBank — Kafka

```text
System Software: Kafka
Technology Function: Message Persistence
Technology Function: Partition Replication
Technology Interaction: Broker Replication
Technology Service: Event Streaming Service
Technology Event: Broker Failed
```

Cela permet de modéliser la résilience sans confondre la technologie avec l’événement applicatif.

---

## 11. MayaBank — Base de données

```text
System Software: PostgreSQL
Technology Function: Transaction Persistence
Technology Function: Replication
Technology Service: Relational Database Service
Technology Event: Primary Database Unavailable
Technology Process: Promote Standby
```

---

## 12. MayaBank — Observability

```text
System Software: Observability Platform
Technology Function: Metrics Collection
Technology Function: Log Aggregation
Technology Function: Trace Processing
Technology Service: Observability Service
```

Un Application Component peut dépendre de ce Technology Service sans que l’outil de monitoring soit modélisé comme composant applicatif.

---

## 13. Identity et secrets

```text
System Software: Vault / Secrets Platform
Technology Function: Secret Storage
Technology Function: Secret Rotation
Technology Service: Secrets Management Service
```

```text
System Software: Identity Platform
Technology Function: Authentication
Technology Service: Identity Service
```

Les noms commerciaux peuvent être ajoutés, mais le modèle doit d’abord exprimer la fonction architecturale.

---

## 14. Technology Event vs Application Event

### Application Event

```text
Payment Authorized
```

Changement d’état applicatif.

### Technology Event

```text
Kafka Broker Failed
```

Changement d’état technique.

Le premier appartient à la logique du système.
Le second à l’infrastructure d’exécution.

---

## 15. Technology Event vs Monitoring Alert

Une alerte peut être la représentation ou le signal associé à un Technology Event, mais il faut choisir le niveau.

```text
Technology Event: Worker Node Failed
```

est plus architectural que :

```text
Alert ID #72918
```

Le modèle ne doit pas devenir un historique d’incidents.

---

## 16. Service Level concerns

Les services technologiques peuvent être associés à des exigences :

```text
Requirement: Container Execution Service available 99.99%
Requirement: Database Service RPO ≤ 30s
Requirement: Event Streaming Service survives one broker failure
```

La couche Motivation peut donc gouverner directement des services Technology.

---

## 17. HA pattern

```text
Technology Event: Worker Node Failed
        ↓ triggers
Technology Process: Reschedule Workload
        ↓ contributes to
Technology Service: Resilient Container Execution
```

Ce pattern relie panne, réaction technique et service fourni.

---

## 18. DR pattern

```text
Technology Event: Primary Site Unavailable
        ↓
Technology Process: Activate Secondary Site
        ↓
Technology Interaction: Cross-Site Failover
        ↓
Technology Service: Disaster Recovery Service
```

---

## 19. Questions de contrôle

### Q1
`Container Scheduling` ?

**Réponse : Technology Function.**

### Q2
`Rotate Certificates` comme séquence ?

**Réponse : Technology Process.**

### Q3
`Cross-Site Database Replication` réalisé collectivement ?

**Réponse : Technology Interaction** peut être approprié.

### Q4
`Worker Node Failed` ?

**Réponse : Technology Event.**

### Q5
`Object Storage Service` ?

**Réponse : Technology Service.**

### Q6
`Kafka` ?

**Réponse : System Software**, pas Technology Service.

---

## À retenir

> **Function = responsabilité technique interne ; Process = séquence ; Interaction = comportement collectif ; Event = changement d’état ; Service = comportement technique exposé.**

Comprendre cette famille évite de réduire la Technology Layer à un inventaire d’infrastructure.