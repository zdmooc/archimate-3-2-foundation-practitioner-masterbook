# MayaBank — Business & Information Architecture

Cette fiche relie la création de valeur, les responsabilités métier, les processus, les services et l’information manipulée.

## 1. Organization

### Business Actors
- MayaBank
- Customer
- Partner Institution
- Payments Department
- Fraud Operations Team
- Settlement Operations Team
- Customer Support

### Business Roles
- Payment Initiator
- Payment Operator
- Fraud Analyst
- Settlement Manager
- Exception Manager
- Customer Support Agent

### Collaborations
- Instant Payment Processing Collaboration
- Fraud Decision Collaboration
- Settlement Reconciliation Collaboration

## 2. Actor vs Role

Exemple :

```text
Business Actor: Fraud Operations Team
  Assignment → Business Role: Fraud Analyst
```

Le rôle exprime la responsabilité ; l’Actor exprime l’entité qui la porte.

## 3. End-to-end Business Process

```text
Payment Received
  Triggering → Validate Payment
Validate Payment
  Triggering → Assess Fraud Risk
Assess Fraud Risk
  Triggering → Execute Payment
Execute Payment
  Triggering → Confirm Payment
Confirm Payment
  Triggering → Reconcile Settlement
```

Branches d’exception :

```text
Fraud Alert Raised
→ Handle Fraud Case

Payment Rejected
→ Notify Rejection

Settlement Mismatch Detected
→ Resolve Settlement Exception
```

## 4. Business Functions

- Payment Operations
- Fraud Management
- Settlement Management
- Customer Support
- Partner Management

Les Functions représentent des regroupements durables de comportements ; les Processes montrent davantage l’enchaînement vers un résultat.

## 5. Business Services

- Instant Payment Service
- Payment Tracking Service
- Fraud Review Service
- Exception Resolution Service
- Partner Payment Service
- Settlement Reconciliation Service

Pattern :

```text
Business Process: Execute Instant Payment
  Realization → Business Service: Instant Payment Service
```

## 6. Business Interfaces

- Mobile Banking Channel
- Partner API Channel
- Operations Portal
- Customer Service Channel

Un channel/interface n’est pas le service lui-même.

## 7. Business Objects

- Payment Order
- Customer
- Beneficiary
- Payment Status
- Fraud Case
- Settlement Record
- Partner Agreement

Le Business Object exprime le concept d’information métier indépendamment de son implémentation technique.

## 8. Representations

- ISO 20022 Payment Message
- Payment Receipt
- Customer Statement
- Fraud Case Report
- Settlement Report

Exemple :

```text
Representation: ISO 20022 Message
  Realization → Business Object: Payment Order
```

## 9. Contracts

- Partner Payment Agreement
- Payment Service SLA
- Scheme Participation Agreement

Les Contracts peuvent contraindre ou formaliser l’offre de services.

## 10. Product

```text
Product: MayaBank Instant Payments
```

peut agréger :

- Instant Payment Service ;
- Payment Tracking Service ;
- Payment Notification Service ;
- Partner Payment Service ;
- SLA/Contract.

Le Product n’est pas le Payment Orchestrator ni l’application mobile.

## 11. Information chain

```text
Business Object: Payment Order
  realized by
Data Object: Payment Instruction
  realized by / serialized as
Representation or Artifact depending on concern
```

Exemples de Data Objects applicatifs :

- Payment Instruction
- Payment Transaction
- Payment Status Record
- Fraud Decision
- Customer Limit Record
- Settlement Entry
- Audit Event
- Correlation Context

## 12. Source of Truth

Le modèle doit explicitement documenter la responsabilité sur la donnée.

Exemple cible :

```text
Payment Transaction
Source of Truth → Payment Ledger
```

Pendant la transition, la source of truth peut être différente selon le flux. Ce point doit apparaître dans les vues de migration afin d’éviter un état hybride ambigu.

## 13. Access patterns

```text
Validate Payment
  Access(read) → Customer Limit

Execute Payment
  Access(write) → Payment Transaction

Assess Fraud Risk
  Access(read/write) → Fraud Case

Reconcile Settlement
  Access(read/write) → Settlement Record
```

## 14. Business Event vs Data

```text
Business Event: Payment Received
Business Object: Payment Order
```

L’événement exprime qu’un fait s’est produit ; l’objet exprime l’information métier manipulée.

## 15. Value Stream ↔ Process

```text
Value Stream Stage: Validate
  supported by
Business Process: Validate Payment
```

Un Value Stream décrit la création de valeur par étapes ; le Process décrit le comportement opérationnel.

## 16. Capability ↔ Business

```text
Capability: Fraud Detection
→ Business Function: Fraud Management
→ Business Process: Assess Fraud Risk
→ Business Service: Fraud Review Service
```

Cette chaîne montre comment une aptitude stratégique devient un comportement et un service métier.

## 17. Stakeholder questions

### Head of Payments
- où se situe le délai ?
- quel service est réellement fourni ?
- quelles exceptions nécessitent une intervention humaine ?

### Fraud Operations
- à quel moment intervient la fraude ?
- quelles données sont utilisées ?

### Data Governance
- quelles informations sont critiques ?
- quelle application est propriétaire/source de référence ?

## 18. Business anti-patterns

### Process = Function sans concern
Ne pas dupliquer mécaniquement tous les comportements comme Process et Function.

### Application exposée comme Product
Une application supporte le produit ; elle n’est pas nécessairement le produit commercial.

### Data Object à la place de Business Object
Ne pas introduire des tables ou payloads dans une vue métier lorsque le concept métier suffit.

## 19. Vue métier de référence

```text
Customer
  ↓
Instant Payment Service
  ↓ realized by
Execute Instant Payment Process
  ↓ accesses
Payment Order
  ↓ supported by
Payment Orchestration Application Service
```

La dernière relation ouvre la transition vers la couche Application.

> **La Business Architecture doit rester compréhensible sans connaître OpenShift, Kafka ou Oracle.**