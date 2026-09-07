# Cheat Sheet 03 — Business & Application

## Business Layer

### Active Structure

| Élément | Rôle | Exemple MayaBank |
|---|---|---|
| Business Actor | entité organisationnelle/humaine | MayaBank, Payments Department |
| Business Role | responsabilité | Fraud Analyst, Settlement Manager |
| Business Collaboration | regroupement coopérant | Payment Operations Team |
| Business Interface | point d’accès métier | Customer Service Desk |

### Behavior

| Élément | Rôle | Exemple |
|---|---|---|
| Business Process | séquence structurée | Execute Instant Payment |
| Business Function | comportement regroupé par finalité | Fraud Management |
| Business Interaction | comportement collectif | Joint Fraud Review |
| Business Event | fait déclencheur métier | Payment Request Received |
| Business Service | comportement métier exposé | Instant Payment Service |

### Passive Structure

| Élément | Rôle | Exemple |
|---|---|---|
| Business Object | concept métier | Payment Order |
| Representation | forme perceptible d’un objet | Payment Confirmation PDF |
| Contract | accord/spécification formelle | Instant Payment Contract |
| Product | offre cohérente de valeur | Instant Payment Product |

## Application Layer

### Active Structure

| Élément | Rôle | Exemple |
|---|---|---|
| Application Component | unité logicielle logique | Payment Orchestrator |
| Application Collaboration | composants coopérant | Payment Processing Suite |
| Application Interface | point d’accès | Payment REST API |

### Behavior

| Élément | Rôle | Exemple |
|---|---|---|
| Application Function | comportement interne regroupé | Payment Validation |
| Application Process | séquence applicative | Process Payment Instruction |
| Application Interaction | comportement collectif | Fraud Check Coordination |
| Application Event | fait/changement d’état applicatif | Payment Authorized |
| Application Service | fonctionnalité exposée | Payment Orchestration Service |

### Passive Structure

| Élément | Rôle | Exemple |
|---|---|---|
| Data Object | information logique applicative | Payment Transaction |

## Chaîne Business → Application

```text
Business Actor / Role
→ assigned to
Business Process
→ realizes
Business Service
→ served by
Application Service
← realized by
Application Component / behavior
```

Exemple :

```text
Payment Operator
→ Execute Instant Payment
→ Instant Payment Service
← Payment Orchestration Service
← Payment Orchestrator
```

## API : modèle minimal correct

```text
Application Component
Payment Orchestrator
   ↓ realizes
Application Service
Payment Initiation Service
   ↓ exposed through
Application Interface
Payment REST API
```

Ne pas modéliser systématiquement “API” comme Component. Le type dépend du concern :
- fonctionnalité exposée → Application Service ;
- point d’accès → Application Interface ;
- logiciel API Gateway → Application Component ou System Software selon responsabilité/concern.

## Event-driven

```text
Application Event = fait / changement d’état
Data Object       = contenu logique / payload
Kafka Topic       = construction technique de messaging
Kafka             = System Software
Event Streaming   = Technology Service
```

Exemple :

```text
Payment Orchestrator
→ triggers Payment Authorized
→ Flow de Payment Event Envelope
→ Fraud/Notification Consumers
```

## Distinctions critiques

### Actor vs Role
Actor = qui est l’entité ?
Role = quelle responsabilité ?

### Process vs Function
Process = séquence/ordre.
Function = comportement regroupé par finalité.

### Service vs Interface
Service = ce qui est fourni.
Interface = où/comment on y accède.

### Business Service vs Application Service
Business Service = valeur/fonctionnalité métier visible.
Application Service = fonctionnalité logicielle exposée.

### Business Object vs Data Object
Business Object = concept métier.
Data Object = représentation logique au niveau applicatif.

### Component vs Service
Component = structure logicielle.
Service = comportement exposé.

## Pattern paiement

```text
Customer
→ Business Service: Instant Payment
← Business Process: Execute Instant Payment
← Application Service: Payment Orchestration
← Application Component: Payment Orchestrator
→ Application Service: Fraud Scoring
← Application Component: Fraud Engine
```

## Pièges d’examen

- “service” dans une phrase métier n’indique pas automatiquement le type ArchiMate Service : identifier le niveau.
- une équipe n’est pas un Business Service ;
- un microservice logiciel est généralement Application Component, tandis que ce qu’il expose est Application Service ;
- une UI/endpoint peut être Application Interface ;
- un message Kafka n’est pas automatiquement Application Event : l’événement est le fait, le message peut être Data Object/Artifact selon le niveau.