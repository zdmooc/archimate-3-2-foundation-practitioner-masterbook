# Relations dynamiques et autres — Triggering, Flow, Specialization

Cette famille répond à trois questions différentes :

- **qu’est-ce qui déclenche ou précède quoi ?** → `Triggering` ;
- **qu’est-ce qui circule de A vers B ?** → `Flow` ;
- **qu’est-ce qui est un sous-type de quoi ?** → `Specialization`.

---

## 1. Triggering

`Triggering` décrit une relation temporelle ou causale entre éléments de comportement.

### Exemple métier

```text
Business Event: Payment Order Received
  Triggering → Business Process: Validate Payment
```

### Exemple applicatif

```text
Application Event: Payment Authorized
  Triggering → Application Process: Submit to Clearing
```

### Exemple technologie

```text
Technology Event: Node Failure Detected
  Triggering → Technology Process: Failover
```

Le sens principal est : **un comportement ou événement conduit à l’activation d’un autre comportement**.

### Triggering ≠ Flow

```text
Triggering = séquence / causalité
Flow       = transfert de quelque chose
```

On peut avoir les deux entre les mêmes étapes conceptuelles si l’on veut représenter à la fois l’ordre et l’objet transféré, mais chaque relation apporte un sens distinct.

---

## 2. Flow

`Flow` exprime le transfert d’information, de valeur, de biens ou d’un autre objet entre éléments.

### Exemple application

```text
Validate Payment
  Flow(Payment Request) → Fraud Check
```

### Exemple métier

```text
Customer Authentication
  Flow(Authentication Result) → Execute Payment
```

### Exemple technologie

```text
API Gateway
  Flow(HTTPS Request) → Payment Service
```

Le libellé de la relation peut préciser ce qui circule.

### Flow ≠ Access

```text
Access = utilise un élément passif
Flow   = transfère quelque chose entre source et cible
```

Exemple :

```text
Fraud Check
  Access(read) → Fraud Rules
```

et :

```text
Payment Validation
  Flow(Payment Context) → Fraud Check
```

peuvent coexister.

---

## 3. Triggering et orchestration

Une séquence applicative peut être modélisée ainsi :

```text
Receive Payment
  Triggering → Validate Payment
  Triggering → Check Fraud
  Triggering → Reserve Funds
  Triggering → Submit Clearing
```

Mais un modèle trop détaillé risque de devenir un diagramme de workflow.

ArchiMate doit rester au niveau architectural utile au concern.

Pour la logique détaillée d’un processus métier, BPMN peut être plus adapté.

---

## 4. Flow et event-driven architecture

Dans une architecture event-driven, il faut distinguer :

```text
Application Event: Payment Authorized
Data Object: PaymentAuthorized Payload
Flow: PaymentAuthorized message
Technology Service: Event Streaming Service
```

Le fait métier/applicatif, son contenu informationnel, son transfert et le mécanisme technologique ne sont pas le même concept.

### Exemple

```text
Payment Orchestrator
  Flow(PaymentAuthorized Event Payload) → Notification Service
```

alors que :

```text
Payment Authorized Event
  Triggering → Send Notification
```

exprime la causalité.

---

## 5. Specialization

`Specialization` exprime qu’un élément est une version plus spécifique d’un autre élément du même type conceptuel compatible.

### Exemple métier

```text
Business Role: Corporate Customer
  Specialization → Business Role: Customer
```

### Exemple application

```text
Application Service: Instant Payment Status Service
  Specialization → Application Service: Payment Status Service
```

### Exemple technologie

```text
Technology Service: Managed Kafka Service
  Specialization → Technology Service: Event Streaming Service
```

### Specialization ≠ Composition

```text
Specialization = est un type plus spécifique de
Composition    = est une partie constitutive de
```

`Corporate Customer` n’est pas une partie de `Customer`.
C’est une forme spécialisée de `Customer`.

---

## 6. Héritage sémantique

Une spécialisation hérite conceptuellement des propriétés pertinentes du concept général.

Cela ne signifie pas que tous les détails d’un outil UML doivent être transposés dans ArchiMate.

Le but est architectural : montrer qu’un concept général possède plusieurs formes spécialisées.

---

## 7. Exemple MayaBank

```text
Business Role: Customer
  ↑ Specialization
Business Role: Retail Customer

Business Role: Customer
  ↑ Specialization
Business Role: Corporate Customer

Business Event: Payment Received
  Triggering → Business Process: Execute Payment

Application Process: Validate Payment
  Flow(Payment Context) → Application Function: Fraud Scoring
```

---

## 8. Cas de discrimination

### Cas A

« Lorsque le paiement est accepté, le traitement de clearing démarre. »

→ `Triggering`.

### Cas B

« Le contexte de paiement est transmis au moteur de fraude. »

→ `Flow`.

### Cas C

« Corporate Customer est une catégorie de Customer. »

→ `Specialization`.

### Cas D

« Le moteur de fraude lit les règles de fraude. »

→ `Access`, pas `Flow`.

### Cas E

« Une application fournit un service à un processus métier. »

→ `Serving`, pas `Triggering`.

---

## 9. Pièges d’examen

1. Une séquence n’implique pas forcément un transfert : `Triggering` suffit parfois.
2. Un transfert n’implique pas forcément une causalité métier : `Flow` peut suffire.
3. `Specialization` ne décrit jamais une décomposition structurelle.
4. Une chaîne de Triggering ne doit pas transformer ArchiMate en moteur de workflow.
5. Un libellé de Flow doit clarifier ce qui circule lorsque cela améliore la compréhension.

---

## À retenir

```text
Triggering    = déclenche / précède causalement
Flow          = transfère
Specialization = est une forme plus spécifique de
```
