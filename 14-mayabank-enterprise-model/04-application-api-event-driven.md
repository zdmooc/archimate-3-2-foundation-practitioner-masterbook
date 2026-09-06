# MayaBank — Application, API & Event-Driven Architecture

Cette fiche montre comment les services métier MayaBank sont supportés par une architecture applicative cible cohérente, mêlant APIs synchrones et événements asynchrones.

## 1. Application Components

- Mobile Banking Application
- Payment API Gateway
- Payment Orchestrator
- Fraud Engine
- Limit Service
- Payment Ledger Adapter
- Clearing Adapter
- Payment Status Service
- Notification Service
- Operations Portal
- Reconciliation Service

## 2. Application Services

- Payment Initiation Service
- Payment Validation Service
- Fraud Scoring Service
- Payment Orchestration Service
- Clearing Integration Service
- Payment Status Service
- Notification Service
- Reconciliation Service

## 3. Component → Function → Service

Pattern :

```text
Payment Orchestrator
  Assignment → Orchestrate Payment Function

Orchestrate Payment Function
  Realization → Payment Orchestration Service

Payment Orchestration Service
  Serving → Execute Instant Payment Process
```

Ce pattern sépare correctement :

- le composant ;
- son comportement interne ;
- le service exposé ;
- le consommateur métier.

## 4. APIs

### Payment REST API

```text
Application Interface: Payment REST API
  exposes → Payment Initiation Service
```

### Partner API

```text
Application Interface: Partner Payment API
  exposes → Partner Payment Service
```

### Operations API

```text
Application Interface: Operations API
  exposes → Exception Management Service
```

Une API n’est pas automatiquement un Application Service. L’Interface représente le point d’accès ; le Service représente la fonctionnalité fournie.

## 5. Application Cooperation

```text
Payment API Gateway
  → Payment Orchestrator
  → Fraud Engine
  → Limit Service
  → Payment Ledger Adapter
  → Clearing Adapter
```

La vue de coopération doit préciser le sens des relations : `Serving`, `Flow`, `Triggering`, `Access`, etc., plutôt que de tracer des lignes génériques.

## 6. Synchronous flow

```text
Customer Request
→ Payment API Gateway
→ Payment Orchestrator
→ Limit Service
→ Fraud Engine
→ immediate accept/reject response
```

Les interactions synchrones sont appropriées lorsque la réponse immédiate fait partie du contrat de service.

## 7. Asynchronous flow

Après acceptation :

```text
Application Event: Payment Authorized
  → Kafka
  → Clearing Adapter
  → Payment Status Service
  → Notification Service
```

L’event backbone découple les consommateurs qui n’ont pas besoin de participer à la transaction synchrone initiale.

## 8. Event taxonomy

Exemples :

- Payment Received
- Payment Validated
- Fraud Check Completed
- Payment Authorized
- Payment Rejected
- Payment Submitted to Clearing
- Payment Settled
- Payment Failed
- Settlement Mismatch Detected

## 9. Event ≠ Payload ≠ Topic

```text
Application Event: Payment Authorized
Data Object: Payment Authorized Event Payload
Technology mechanism: Kafka topic
System Software: Kafka
```

Ces quatre niveaux ne doivent pas être mélangés.

## 10. Payload examples

- PaymentAuthorizedEvent
- PaymentRejectedEvent
- PaymentSettledEvent
- FraudDecisionEvent

Chaque payload peut contenir :

- paymentId ;
- correlationId ;
- eventTime ;
- status ;
- reasonCode ;
- sourceSystem ;
- business metadata minimale.

La modélisation ArchiMate ne remplace pas un schéma Avro/JSON Schema détaillé.

## 11. Ownership de données

### Payment Orchestrator
Coordonne le workflow mais ne doit pas devenir automatiquement propriétaire de toutes les données.

### Ledger / system of record
Détient l’état financier autoritatif selon le domaine retenu.

### Fraud Engine
Détient les objets relatifs aux décisions et cas de fraude.

### Status Service
Peut construire une projection optimisée pour la consultation sans devenir source de vérité du ledger.

## 12. Shared Database anti-pattern

Mauvaise cible :

```text
Payment Orchestrator
Fraud Engine
Notification Service
Status Service
   ↓
Same shared schema
```

Cela recrée le couplage du legacy.

Meilleure approche : responsabilités de données explicites + APIs/events pour l’échange.

## 13. Orchestration vs Choreography

### Orchestration
Le Payment Orchestrator contrôle une partie du chemin critique.

### Choreography
Des consommateurs réagissent à des événements sans être pilotés directement par l’orchestrateur.

MayaBank combine les deux :

- orchestration pour le parcours critique ;
- choreography pour notifications, projections, audit, certains traitements post-transaction.

## 14. Failure patterns

### Fraud Engine unavailable
Le modèle doit montrer si :

- l’appel échoue immédiatement ;
- un fallback existe ;
- le paiement est bloqué ;
- la décision est mise en attente.

### Kafka unavailable
Le modèle doit clarifier :

- persistance locale/outbox ;
- retry ;
- DLQ si applicable ;
- reprise après incident.

### Clearing unavailable
Le statut métier et les mécanismes de reprise doivent être explicites.

## 15. Correlation and observability

Le `correlationId` traverse :

```text
API Gateway
→ Orchestrator
→ Fraud Engine
→ Kafka events
→ Clearing Adapter
→ Status
→ Notification
```

Il supporte le Requirement d’observabilité end-to-end.

## 16. Security concerns

- authentification utilisateur au bord ;
- authentification service-to-service ;
- autorisation par scope/role ;
- chiffrement en transit ;
- secrets externalisés ;
- audit des actions sensibles.

Ces concerns seront reliés à la Technology Layer dans la fiche suivante.

## 17. Legacy coexistence

Pendant la migration :

```text
Target API Gateway
  → Target Orchestrator for migrated flows
  → Legacy Adapter for non-migrated flows
```

Le routage doit être visible dans le Transition Plateau.

## 18. Business ↔ Application mapping

| Business | Application support |
|---|---|
| Initiate Payment | Payment Initiation Service |
| Validate Payment | Payment Validation Service |
| Assess Fraud Risk | Fraud Scoring Service |
| Execute Payment | Payment Orchestration Service |
| Track Payment | Payment Status Service |
| Resolve Exception | Operations Service |
| Reconcile Settlement | Reconciliation Service |

## 19. Anti-patterns

- `Application Component: Kafka` lorsque l’on parle du produit de middleware ;
- confondre API Interface et Application Service ;
- utiliser Flow pour représenter un accès persistant à une donnée ;
- modéliser chaque microservice comme une capability ;
- afficher les noms de topics comme concepts métier dans une vue exécutive ;
- créer un diagramme d’intégration sans ownership de données.

## 20. Vue applicative cible de référence

```text
Channels
  ↓
Payment API Gateway
  ↓
Payment Orchestrator
  ├─ Fraud Engine
  ├─ Limit Service
  ├─ Ledger Adapter
  └─ Clearing Adapter
       ↓
Application Events
       ↓
Status / Notification / Reconciliation
```

> **L’architecture applicative cible doit montrer à la fois services, responsabilités, données, dépendances et modes d’interaction.**