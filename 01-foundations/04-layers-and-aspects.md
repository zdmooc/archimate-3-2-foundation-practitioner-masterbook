# 4 — Couches et aspects

## 4.1 Pourquoi les couches existent

Les couches permettent de séparer les préoccupations sans perdre leurs relations.

Une entreprise ne doit pas être modélisée comme un seul bloc. Les décisions stratégiques, les activités métier, les logiciels et les plateformes techniques ne sont pas de même nature.

ArchiMate organise ces concepts de façon à permettre une lecture progressive.

---

## 4.2 Motivation — pourquoi changer ?

La couche Motivation décrit les facteurs qui influencent l’architecture.

Elle répond à des questions telles que :

- qui a un intérêt dans l’architecture ?
- quelles pressions ou opportunités motivent le changement ?
- quels objectifs voulons-nous atteindre ?
- quelles exigences doivent être satisfaites ?
- quelles contraintes limitent les choix ?

Exemple MayaBank :

```text
Stakeholder: Head of Payments
Driver: Instant payment market pressure
Assessment: Legacy platform cannot scale 24/7
Goal: Provide resilient real-time payments
Requirement: End-to-end traceability
Constraint: Legacy clearing coexistence for 18 months
```

La Motivation n’explique pas encore comment la banque implémente la cible. Elle explique **pourquoi** l’architecture existe.

---

## 4.3 Strategy — que doit savoir faire l’entreprise ?

La couche Strategy décrit les moyens stratégiques permettant de répondre aux motivations.

Concepts principaux :

- Resource ;
- Capability ;
- Value Stream ;
- Course of Action.

Exemple :

```text
Capability: Real-Time Payment Processing
Capability: Fraud Detection
Capability: Payment Observability
Value Stream: Initiate → Validate → Screen → Route → Clear → Confirm
Course of Action: Modernize payment processing incrementally
```

Une capability ne décrit pas une application particulière.

Elle décrit une aptitude de l’entreprise.

---

## 4.4 Business — que fait l’organisation ?

La couche Business représente :

- les acteurs ;
- les rôles ;
- les collaborations ;
- les interfaces ;
- les comportements métier ;
- les services exposés ;
- les objets métier ;
- les produits.

Exemple :

```text
Business Actor: MayaBank
Business Role: Payment Operations
Business Process: Execute Instant Payment
Business Service: Instant Payment Service
Business Object: Payment Instruction
```

---

## 4.5 Application — comment le logiciel supporte-t-il le métier ?

La couche Application représente les systèmes logiciels d’un point de vue architectural.

Exemple :

```text
Application Component: Payment Orchestrator
Application Component: Fraud Engine
Application Service: Payment Validation Service
Application Service: Payment Routing Service
Data Object: Payment Event
```

Attention :

`Payment Routing Service` ne représente pas nécessairement un microservice déployé. Il représente un comportement applicatif exposé.

Le composant qui le réalise peut être un microservice, un module ou un système plus large.

---

## 4.6 Technology — où et grâce à quoi l’application fonctionne-t-elle ?

La couche Technology décrit les ressources et services techniques.

Exemple :

```text
Node: OpenShift Worker
System Software: Kubernetes Runtime
Technology Service: Container Execution
Technology Service: Event Streaming
Artifact: Payment Orchestrator Container Image
```

La Technology Layer est plus large qu’une simple liste de serveurs.

Elle décrit également les comportements techniques exposés sous forme de services.

---

## 4.7 Physical — le monde matériel

La Physical Layer permet de représenter des éléments physiques non purement informatiques.

Concepts :

- Equipment ;
- Facility ;
- Distribution Network ;
- Material.

Exemple dans une entreprise industrielle :

```text
Equipment: Packaging Machine
Facility: Distribution Center
Distribution Network: Conveyor Network
Material: Packaged Product
```

Dans une banque purement numérique, cette couche est souvent moins centrale, mais elle peut servir pour datacenters, équipements physiques ou environnements hybrides lorsqu’une modélisation matérielle est pertinente.

---

## 4.8 Implementation & Migration — comment transformer l’existant ?

Cette couche permet de modéliser le changement.

Exemple MayaBank :

```text
Work Package: Deploy Payment Platform Foundation
Work Package: Migrate Payment Routing
Deliverable: Production Platform
Plateau: Hybrid Payment Processing
Gap: No real-time orchestration in Baseline
Implementation Event: Legacy Routing Decommissioned
```

Le **Plateau** est particulièrement important : il représente un état relativement stable de l’architecture dans le temps.

---

## 4.9 Les aspects fondamentaux

Les couches ne suffisent pas. À l’intérieur de plusieurs couches, ArchiMate distingue trois aspects majeurs.

### Active Structure

Ce qui peut exécuter un comportement.

```text
Business Role
Application Component
Node
```

### Behavior

Ce qui se passe.

```text
Business Process
Application Function
Technology Service
```

### Passive Structure

Ce qui est utilisé ou produit.

```text
Business Object
Data Object
Artifact
```

---

## 4.10 Matrice mentale

| Couche | Active Structure | Behavior | Passive Structure |
|---|---|---|---|
| Business | Actor, Role, Collaboration, Interface | Process, Function, Interaction, Event, Service | Business Object, Contract, Representation, Product* |
| Application | Component, Collaboration, Interface | Function, Process, Interaction, Event, Service | Data Object |
| Technology | Node, Device, System Software, Collaboration, Interface, Path, Network | Function, Process, Interaction, Event, Service | Artifact |
| Physical | Equipment, Facility, Distribution Network | — | Material |

`Product` est un concept composite et ne se réduit pas à un simple passive structure element.

---

## 4.11 Même mot, couche différente

Le mot “service” revient à plusieurs niveaux.

### Business Service

Valeur fonctionnelle exposée par le métier.

Exemple :

`Instant Payment Service`

### Application Service

Comportement applicatif exposé.

Exemple :

`Payment Validation Service`

### Technology Service

Comportement technologique exposé.

Exemple :

`Event Streaming Service`

Ils peuvent être reliés, mais ne sont pas interchangeables.

---

## 4.12 Même forme de raisonnement à plusieurs niveaux

ArchiMate est régulier.

Exemple :

```text
Business Role
   assigned to
Business Process
   realizes
Business Service
```

Puis :

```text
Application Component
   assigned to
Application Function
   realizes
Application Service
```

Puis :

```text
Node / System Software
   assigned to
Technology Function
   realizes
Technology Service
```

Cette répétition conceptuelle est volontaire.

---

## 4.13 Cross-layer : relier les couches

Une architecture devient réellement utile lorsque l’on relie les couches.

```text
Goal
Improve payment resilience
   ↓ realized by
Capability
Resilient Payment Processing
   ↓ realized by
Business Process
Execute Payment
   ↓ served by
Application Service
Payment Orchestration
   ↓ realized by
Application Component
Payment Orchestrator
   ↓ served by
Technology Service
Container Platform Service
```

Le choix exact des relations dépend du contexte et des règles du métamodèle, mais la logique d’analyse est celle-ci : **relier intention, capacité, comportement et réalisation**.

---

## 4.14 Comment reconnaître rapidement la bonne couche ?

Posez la question suivante :

### Motivation

> Pourquoi ? Qui veut quoi ? Quelles contraintes ?

### Strategy

> Quelle capacité ou orientation ?

### Business

> Que fait le métier et pour qui ?

### Application

> Quel logiciel fournit quelle fonctionnalité ?

### Technology

> Quelle plateforme/infrastructure fournit quels services techniques ?

### Implementation & Migration

> Comment passe-t-on de l’état actuel à la cible ?

---

## 4.15 Mini-exercice

Classer les concepts suivants.

### A. “Reduce payment fraud by 30%”

**Réponse :** Goal ou Outcome selon que l’on exprime l’intention ou le résultat attendu mesurable.

### B. “Fraud Detection”

**Réponse :** Capability si l’on exprime une aptitude de l’entreprise.

### C. “Screen Payment”

**Réponse :** Business Process/Function selon la nature du comportement.

### D. “Fraud Screening API”

**Réponse :** Application Service ou Application Interface selon que l’on modélise la fonctionnalité exposée ou son point d’accès.

### E. “Kafka Cluster”

**Réponse :** généralement System Software et/ou Nodes selon ce que l’on souhaite représenter.

### F. “Migrate fraud rules to new engine”

**Réponse :** Work Package.

---

## 4.16 Pièges d’examen

### Capability ≠ Application Component

Capability = aptitude.

Application Component = structure logicielle.

### Business Process ≠ Application Process

Le premier est métier, le second applicatif.

### Service ≠ Interface

Le service est le comportement exposé. L’interface est le point d’accès.

### Node ≠ Device

Node est plus général. Device représente une ressource physique IT.

### Plateau ≠ Work Package

Plateau = état de l’architecture.

Work Package = travail permettant de produire un changement.

---

## À retenir

> **Les couches disent où se situe le concept. Les aspects disent quelle nature de concept nous modélisons.**
