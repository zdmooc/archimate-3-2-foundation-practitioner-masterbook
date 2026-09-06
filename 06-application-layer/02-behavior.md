# Application Behavior — Function, Process, Interaction, Event et Service

La partie comportementale de la couche Application décrit **ce que les applications font**.

Elle contient :

- `Application Function`
- `Application Process`
- `Application Interaction`
- `Application Event`
- `Application Service`

Ces concepts paraissent proches, mais ils répondent à des questions différentes.

---

## 1. Application Function

Une **Application Function** représente un comportement automatisé pouvant être exécuté par un Application Component.

Elle regroupe généralement une responsabilité fonctionnelle stable.

### Exemples MayaBank

- Validate Payment
- Calculate Fees
- Detect Fraud
- Check Limit
- Route Payment
- Reconcile Transaction

### Question à poser

> Quelle capacité comportementale interne ce composant possède-t-il ?

---

## 2. Application Process

Un **Application Process** représente une séquence de comportements applicatifs qui conduit à un résultat.

### Exemple

```text
Orchestrate Instant Payment
  1. validate
  2. fraud check
  3. limit check
  4. reserve funds
  5. route
  6. persist status
```

ArchiMate ne vise pas le même niveau de séquençage qu’un diagramme BPMN ou UML Sequence.

On montre le processus applicatif lorsqu’il a une signification architecturale.

---

## 3. Function vs Process

### Function

Organisation d’un comportement par responsabilité.

```text
Fraud Detection Function
```

### Process

Organisation d’un comportement par flux ou résultat.

```text
Process Payment Fraud Decision
```

La même activité réelle peut être vue sous ces deux angles selon le concern.

### Test simple

Si la question est :

> Quelle responsabilité applicative existe ?

→ Function.

Si la question est :

> Quelle séquence mène au résultat ?

→ Process.

---

## 4. Application Interaction

Une **Application Interaction** représente un comportement collectif exécuté par une collaboration de plusieurs composants.

### Exemple MayaBank

```text
Application Collaboration:
Payment Risk Decision Collaboration

Participants:
- Payment Orchestrator
- Fraud Engine
- Limit Service

Application Interaction:
Evaluate Payment Risk
```

Le concept devient utile lorsque le comportement appartient réellement au collectif plutôt qu’à un composant unique.

---

## 5. Interaction vs Process

Un process peut appartenir à un composant ou être structuré en comportements.

Une interaction met explicitement l’accent sur **plusieurs participants coopérant**.

### Exemple

```text
Application Process: Orchestrate Payment
Application Interaction: Exchange Fraud Decision
```

Le premier décrit le flux applicatif global.
Le second décrit une coopération entre composants.

---

## 6. Application Event

Un **Application Event** représente un changement d’état applicatif.

### Exemples

- Payment Request Received
- Payment Validated
- Fraud Detected
- Funds Reserved
- Payment Sent to Clearing
- Clearing Response Received
- Payment Settled
- Payment Rejected

Un événement peut :

- déclencher un comportement ;
- être produit par un comportement ;
- permettre de représenter une architecture event-driven sans confondre événement et message.

---

## 7. Event vs message

C’est essentiel dans Kafka.

### Application Event

```text
Payment Authorized
```

Cela signifie : **un changement d’état ou un fait applicatif s’est produit**.

### Data Object

```text
PaymentAuthorized Event Payload
```

Cela signifie : **les données structurées qui décrivent ce fait**.

### Technology construct

Le topic Kafka ou l’artefact physique appartient à un autre niveau.

Ne pas tout appeler « event ».

---

## 8. Application Service

Un **Application Service** représente un comportement applicatif explicitement exposé à l’environnement.

### Exemples

- Payment Initiation Service
- Payment Status Service
- Fraud Scoring Service
- Customer Verification Service
- Limit Verification Service
- Notification Service

Le service décrit ce qui est fourni à un consommateur.

---

## 9. Service vs Function

### Function

Comportement interne.

```text
Calculate Fraud Score
```

### Service

Comportement exposé.

```text
Fraud Scoring Service
```

Une fonction peut réaliser un service.

Le consommateur n’a pas besoin de connaître toute l’implémentation interne.

---

## 10. Service vs Process

### Process

Déroulement interne.

```text
Orchestrate Payment
```

### Service

Résultat comportemental disponible à l’extérieur.

```text
Payment Orchestration Service
```

Un service peut être réalisé par un process, une function, une interaction ou une combinaison de comportements selon le modèle.

---

## 11. Event-driven chain MayaBank

```text
Application Event: Payment Request Received
        ↓ triggers
Application Process: Orchestrate Payment
        ↓ invokes/uses
Application Service: Fraud Scoring Service
        ↓
Application Event: Payment Authorized
        ↓ triggers
Application Process: Publish Clearing Instruction
        ↓
Application Event: Payment Sent
```

Cette représentation fait apparaître la logique comportementale sans détailler le code.

---

## 12. Business Process vs Application Process

### Business Process

```text
Execute Instant Payment
```

Décrit le comportement métier.

### Application Process

```text
Orchestrate Instant Payment Transaction
```

Décrit l’automatisation logicielle qui supporte une partie du comportement métier.

Les deux ne doivent pas être fusionnés.

---

## 13. Business Service vs Application Service

### Business Service

```text
Instant Payment Service
```

Ce que MayaBank fournit comme service métier.

### Application Service

```text
Payment Orchestration Service
```

Ce que le système fournit pour supporter le métier.

Le service applicatif peut servir le processus métier qui réalise le service métier.

---

## 14. Exemple : fraude

### Business

```text
Business Function: Fraud Management
Business Process: Handle Suspicious Payment
Business Service: Fraud Review Service
```

### Application

```text
Application Function: Calculate Fraud Score
Application Process: Evaluate Transaction Risk
Application Service: Fraud Scoring Service
Application Event: High Risk Detected
```

La séparation permet de voir ce qui reste humain/métier et ce qui est automatisé.

---

## 15. Exemple : paiement synchrone API

```text
Application Component: Mobile Banking App
       ↓ uses
Application Service: Payment Initiation Service
       ↓ realized by
Application Process: Validate and Initiate Payment
       ↓ assigned to
Application Component: Payment Orchestrator
```

La vue peut ensuite ajouter l’interface REST si nécessaire.

---

## 16. Exemple : paiement asynchrone

```text
Payment Orchestrator
   → produces Application Event: Payment Accepted

Settlement Adapter
   ← reacts to Application Event: Payment Accepted
```

On peut ajouter des Data Objects pour montrer la donnée échangée et la Technology Layer pour montrer Kafka.

---

## 17. Anti-pattern : fonction = endpoint

Mauvais :

```text
Application Function: POST /payments
```

L’endpoint est plutôt un point d’accès/interface.

Meilleur :

```text
Application Function: Initiate Payment
Application Service: Payment Initiation Service
Application Interface: POST /payments
```

---

## 18. Anti-pattern : event = topic Kafka

Mauvais :

```text
Application Event: payments.v1.authorized
```

si le nom désigne réellement le topic technique.

Meilleur découpage :

```text
Application Event: Payment Authorized
Data Object: Payment Authorized Message
Technology/Artifact or service construct: payments.v1.authorized topic
```

---

## 19. Anti-pattern : interaction utilisée pour toute intégration

Une dépendance entre deux composants ne signifie pas automatiquement qu’il existe une `Application Interaction`.

Utilise ce concept lorsqu’un **comportement collectif** est réellement ce que tu veux représenter.

Sinon, des services, interfaces, flows ou autres relations peuvent suffire.

---

## 20. Méthode de choix

### Étape 1

Demande si le concept est interne ou exposé.

- interne → Function / Process / Interaction
- exposé → Service

### Étape 2

Si interne, demande :

- responsabilité stable → Function
- séquence vers résultat → Process
- comportement collectif → Interaction

### Étape 3

Si c’est un changement d’état :

→ Event.

---

## 21. Questions

### Q1
`Validate Payment` comme responsabilité interne du Payment Orchestrator ?

**Application Function.**

### Q2
`Orchestrate Instant Payment` comme suite d’étapes automatisées ?

**Application Process.**

### Q3
`Fraud Decision Exchange` comme comportement collectif entre deux composants ?

**Application Interaction.**

### Q4
`Payment Authorized` ?

**Application Event.**

### Q5
`Payment Status Service` ?

**Application Service.**

### Q6
Quelle différence entre Service et Function ?

**Le Service est exposé ; la Function représente un comportement interne.**

---

## À retenir

> **Function = responsabilité interne. Process = séquence. Interaction = comportement collectif. Event = changement d’état. Service = comportement exposé.**

Cette grille est la plus efficace pour choisir correctement un élément comportemental Application.
