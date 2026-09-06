# Phases B, C et D — Business, Data, Application et Technology Architecture

Les phases B, C et D constituent le cœur de la description Baseline/Target des domaines d'architecture.

## 1. Phase B — Business Architecture

Questions :
- qui fait quoi ?
- quels processus ?
- quels services métier ?
- quelles informations métier ?
- quelles capacités et value streams sont concernés ?

Concepts fréquents :

```text
Business Actor
Business Role
Business Collaboration
Business Process
Business Function
Business Interaction
Business Event
Business Service
Business Object
Contract
Product
Capability
Value Stream
```

Exemple MayaBank :

```text
Payment Operations Role
  Assignment → Execute Instant Payment Process

Execute Instant Payment Process
  Realization → Instant Payment Business Service

Execute Instant Payment Process
  Access → Payment Order
```

## 2. Phase C — Data Architecture

ArchiMate ne possède pas une « Data Layer » séparée équivalente à une couche TOGAF. La modélisation des données traverse plusieurs couches.

Pattern :

```text
Business Object
  ↓ realization
Data Object
  ↓ realization
Artifact / physical representation where relevant
```

Exemple :

```text
Business Object: Payment Order
Data Object: Payment Transaction Record
Artifact: payment-event.avsc
```

Questions de Data Architecture :
- quelles données sont nécessaires ?
- qui en est propriétaire ?
- quelles applications lisent/écrivent ?
- où est le system of record ?
- quels flux et transformations ?

Relations clés : `Access`, `Flow`, `Realization`.

## 3. Phase C — Application Architecture

Concepts :

```text
Application Component
Application Collaboration
Application Interface
Application Function
Application Process
Application Interaction
Application Event
Application Service
Data Object
```

Pattern :

```text
Business Process
  ← Serving — Application Service
  ← Realization — Application Function
  ← Assignment — Application Component
```

Exemple :

```text
Payment Orchestrator
  Assignment → Orchestrate Payment Function
Orchestrate Payment Function
  Realization → Payment Orchestration Service
Payment Orchestration Service
  Serving → Execute Instant Payment
```

## 4. Phase D — Technology Architecture

Concepts :

```text
Technology Service
Technology Interface
Technology Function
System Software
Node
Device
Communication Network
Path
Artifact
```

Exemple :

```text
OpenShift
  realizes/provides → Container Platform Service
Container Platform Service
  Serving → Payment Orchestrator
Artifact: payment-orchestrator image
  deployed on → OpenShift worker nodes
```

## 5. Baseline vs Target

Les mêmes types d'éléments peuvent être utilisés dans deux états différents.

### Baseline

```text
Legacy Payment Monolith
Point-to-Point Interfaces
Legacy Oracle Schema
Manual Deployment
```

### Target

```text
Payment Orchestrator
Event Streaming
Standardized APIs
OpenShift
GitOps
Distributed Observability
```

Les différences alimentent la Gap Analysis.

## 6. Layered View B–D

Une vue très utile relie les trois domaines :

```text
Business Process
   ↓ served by
Application Service
   ↓ realized by
Application Component
   ↓ uses
Technology Service
   ↓ provided by
System Software / Node
```

Elle permet de répondre à la question :

> « Quel impact métier si ce composant ou cette plateforme change ? »

## 7. Pièges TOGAF ↔ ArchiMate

1. Data Architecture TOGAF ≠ Data Object uniquement.
2. Application Architecture ≠ liste de logiciels.
3. Technology Architecture ≠ inventaire CMDB.
4. Baseline/Target ne nécessitent pas de nouveaux types d'éléments.
5. Une vue B–D doit conserver un niveau d'abstraction cohérent.

## À retenir

> **B décrit le métier, C les données et applications, D la technologie ; ArchiMate permet de les relier dans un modèle unique plutôt que dans trois silos.**