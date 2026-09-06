# Event-Driven Architecture et Kafka avec ArchiMate

Les architectures event-driven sont souvent mal modélisées parce que plusieurs concepts sont mélangés sous le mot « event » : le fait métier, le changement d’état applicatif, le message, le topic, le broker et le service de messaging.

ArchiMate permet de séparer ces niveaux.

---

## 1. Les cinq choses à distinguer

### 1. Application Event

Le changement d’état applicatif.

```text
Payment Authorized
```

### 2. Data Object

Les données structurées décrivant cet événement.

```text
PaymentAuthorized Payload
```

### 3. Application Component producteur

```text
Payment Orchestrator
```

### 4. Application Component consommateur

```text
Settlement Adapter
```

### 5. Technology Layer

Le mécanisme technique de transport.

```text
Technology Service: Event Streaming Service
System Software: Kafka
```

---

## 2. Pattern conceptuel

```text
Payment Orchestrator
   produces
Application Event: Payment Authorized
   described by
Data Object: PaymentAuthorized Payload

Settlement Adapter
   reacts to
Application Event: Payment Authorized

Technology Layer
   provides Event Streaming Service
   realized by Kafka
```

Ce pattern garde le sens de chaque couche.

---

## 3. Event vs message

### Event

```text
Payment Settled
```

Exprime qu’un fait s’est produit.

### Message

```text
PaymentSettledMessage
```

Exprime la structure de données transportée.

Un événement peut être représenté par plusieurs messages ou formats selon les systèmes.

---

## 4. Event vs command

DDD distingue souvent :

- Event = fait passé ;
- Command = demande d’action.

ArchiMate n’a pas de concept natif `Command`.

On peut modéliser :

```text
Application Service: Submit Payment Command
Data Object: Payment Command
```

et :

```text
Application Event: Payment Accepted
Data Object: PaymentAccepted Event Payload
```

La convention doit être explicite.

---

## 5. Topic Kafka

Un topic Kafka ne doit pas être confondu avec un Application Event.

```text
Application Event: Payment Authorized
Kafka topic: payments.authorized.v1
```

Le premier appartient au modèle comportemental.
Le second est une structure technique de messaging.

Selon le niveau de détail, le topic peut être représenté comme Artifact ou via une convention technologique adaptée.

---

## 6. Producer / consumer

### Producer

```text
Application Component: Payment Orchestrator
```

### Consumer

```text
Application Component: Settlement Adapter
```

Le modèle doit montrer :

- pourquoi le producteur publie ;
- quel événement est produit ;
- quelle donnée est transportée ;
- qui consomme ;
- quel service technologique transporte.

---

## 7. Publish/subscribe

Un événement peut avoir plusieurs consommateurs :

```text
Payment Authorized
 ├─ Settlement Adapter
 ├─ Notification Service
 ├─ Fraud Analytics
 └─ Customer Timeline Service
```

Cela montre l’intérêt de l’event-driven : le producteur ne dépend pas nécessairement de la connaissance de tous les consommateurs.

---

## 8. Event choreography

### Exemple MayaBank

```text
Payment Received
   ↓
Payment Validated
   ↓
Fraud Cleared
   ↓
Funds Reserved
   ↓
Payment Authorized
   ↓
Clearing Submitted
   ↓
Payment Settled
```

Cette chaîne peut être représentée comme événements et comportements déclenchés.

Elle ne doit pas être confondue avec une séquence technique détaillée de messages.

---

## 9. Orchestration vs choreography

### Orchestration

Un composant central coordonne le flux.

```text
Payment Orchestrator
   calls Fraud
   calls Limits
   calls Ledger
```

### Choreography

Les composants réagissent à des événements.

```text
Payment Accepted
   → Fraud Engine

Fraud Cleared
   → Limit Service

Limit Approved
   → Settlement
```

ArchiMate peut représenter les deux styles au niveau architectural.

---

## 10. Hybrid architecture

La plupart des systèmes réels sont hybrides.

MayaBank peut utiliser :

- API synchrone pour initier ;
- appels synchrones pour certaines validations ;
- événements asynchrones pour statut, settlement et notifications.

```text
POST /payments
    ↓
Payment Orchestrator
    ↓ sync
Fraud Scoring Service
    ↓
Payment Accepted Event
    ↓ async
Settlement Adapter
```

---

## 11. Kafka comme Technology Service

Le consommateur applicatif ne devrait pas dépendre conceptuellement du produit Kafka lorsqu’on exprime le besoin.

On peut modéliser :

```text
Technology Service: Event Streaming Service
    realized by
System Software: Kafka
```

Ainsi, l’architecture distingue :

- besoin technique ;
- produit réalisant ce besoin.

---

## 12. Event contract

### Logical

```text
Data Object: PaymentAuthorized Event
```

### Physical

```text
Artifact: payment-authorized.avsc
```

### Schema registry

Le registry lui-même relève du niveau technologique/platform.

Cette séparation est utile pour les migrations de formats.

---

## 13. Schema evolution

MayaBank passe de :

```text
PaymentAuthorized v1
```

à :

```text
PaymentAuthorized v2
```

Le modèle d’architecture doit montrer la coexistence seulement si elle a un impact :

- anciens consommateurs ;
- migration progressive ;
- incompatibilité ;
- décommissionnement.

---

## 14. Event ownership

Un événement devrait avoir une source claire.

Exemple :

```text
Payment Orchestrator
   authoritative producer of Payment Authorized
```

Évite :

```text
5 applications publient le même Payment Authorized
```

sans règle claire.

Le modèle aide à révéler ces ambiguïtés.

---

## 15. Exactly-once, ordering, retention

Ces sujets sont techniques et ne sont pas des éléments ArchiMate spécifiques.

Ils peuvent être exprimés par :

- Requirements ;
- Constraints ;
- Properties ;
- Technology architecture.

Exemple :

```text
Requirement: Payment events must preserve ordering per payment aggregate.
Requirement: Duplicate processing must not create duplicate settlement.
```

Puis la solution technique réalise ces exigences.

---

## 16. Observability

Event-driven exige une forte traçabilité.

MayaBank peut avoir :

```text
Requirement: End-to-End Correlation
Requirement: Event Traceability
```

et :

```text
Data Object: Correlation Identifier
```

Les composants et technology services concernés sont ensuite reliés au besoin.

---

## 17. Failure handling

Concepts à représenter au niveau architecture :

- retry ;
- dead-letter handling ;
- idempotency ;
- replay ;
- reconciliation.

Exemple :

```text
Application Function: Retry Failed Settlement
Application Function: Reconcile Payment Events
Application Service: Operational Replay Service
```

Les paramètres techniques restent dans les artefacts de conception détaillée.

---

## 18. Dead-letter queue

Ne modélise pas nécessairement la DLQ comme Application Event.

Le rejet d’un message peut produire :

```text
Application Event: Event Processing Failed
```

La DLQ est un mécanisme technique de transport/stockage.

---

## 19. Event-driven Baseline vs Target

### Baseline

```text
Point-to-point
Batch files
Shared DB
Synchronous coupling
```

### Target

```text
Domain events
Canonical contracts
Event Streaming Service
Clear ownership
API + event hybrid
```

Le modèle doit montrer les bénéfices mais aussi les nouvelles dépendances.

---

## 20. MayaBank Payment Event Map

```text
Mobile Banking
   → Payment Initiation Service
   → Payment Orchestrator

Payment Orchestrator
   produces Payment Accepted

Payment Accepted
   → Fraud Analytics
   → Status Timeline
   → Settlement Adapter

Settlement Adapter
   produces Payment Submitted

Clearing Adapter
   produces Payment Settled

Payment Settled
   → Notification Service
   → Ledger Reporting
```

---

## 21. Questions

### Q1
`Payment Settled` comme fait applicatif ?

**Application Event.**

### Q2
Contenu JSON/Avro correspondant ?

**Data Object** au niveau logique.

### Q3
Kafka broker ?

**System Software** dans la Technology Layer.

### Q4
Capacité technique de publication/abonnement ?

**Technology Service: Event Streaming Service.**

### Q5
Topic `payments.settled.v1` ?

**Concept technique, pas Application Event.**

---

## À retenir

> **Event = fait. Payload = donnée. Topic = mécanisme technique. Kafka = technologie.**

Si ces quatre notions sont séparées, la modélisation event-driven devient beaucoup plus claire.
