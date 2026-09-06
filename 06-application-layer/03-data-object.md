# Data Object — la donnée logique dans ArchiMate

Le **Data Object** est l’élément de structure passive de la couche Application.

Il représente une donnée structurée destinée à un traitement automatisé.

Il permet de répondre à :

> **Quelle information logique les applications lisent, écrivent, échangent ou transforment ?**

---

## 1. Exemples MayaBank

- Payment Transaction
- Payment Status
- Fraud Assessment
- Customer Profile
- Account Balance Snapshot
- Clearing Instruction
- ISO 20022 Payment Message
- Customer Limit

Le Data Object ne représente pas automatiquement une table, un fichier ou un topic.

---

## 2. Business Object vs Data Object

### Business Object

Concept métier.

```text
Payment Order
```

### Data Object

Représentation logique structurée utilisée par les applications.

```text
Payment Transaction Record
```

On peut exprimer qu’un Data Object **réalise** un Business Object lorsqu’il en constitue la représentation applicative logique.

```text
Business Object: Payment Order
       ↑ realized by
Data Object: Payment Transaction
```

---

## 3. Data Object vs Representation

### Representation

Forme perceptible d’une information métier.

```text
Payment Confirmation PDF
```

### Data Object

Donnée structurée pour traitement automatisé.

```text
Payment Confirmation JSON
```

La distinction dépend du point de vue : ce qui est présenté à l’humain vs ce qui est traité par le système.

---

## 4. Data Object vs Artifact

### Data Object

Niveau logique applicatif.

```text
Payment Transaction
```

### Artifact

Réalisation technologique/déployable ou forme physique de données/logiciel.

```text
PAYMENT_TX table
payment-event.avsc
payment-service.jar
```

Le même concept peut traverser plusieurs niveaux :

```text
Business Object: Payment Order
        ↓
Data Object: Payment Transaction
        ↓
Artifact: PAYMENT_TX table
```

---

## 5. Data Object vs database

Une base de données n’est pas un Data Object.

### Logical data

```text
Data Object: Customer Profile
```

### Database engine

```text
System Software: PostgreSQL
```

### Physical schema/table

Peut être détaillé via Artifact si le concern le nécessite.

Cette séparation évite le diagramme :

```text
App → DB
```

qui mélange souvent données, moteur et stockage.

---

## 6. Access relationship

Les comportements et structures applicatives peuvent accéder aux Data Objects.

Les modes typiques sont :

- read ;
- write ;
- read/write.

### MayaBank

```text
Payment Validation Function
   reads Payment Transaction

Payment Status Function
   writes Payment Status

Fraud Detection Function
   reads Payment Transaction
   writes Fraud Assessment
```

Cela rend l’architecture de données beaucoup plus explicite qu’une simple flèche générique.

---

## 7. Data lineage simplifié

ArchiMate n’est pas un outil spécialisé de data lineage, mais il peut montrer les dépendances majeures.

```text
Payment Request
   ↓ transformed into
Payment Transaction
   ↓ used by
Fraud Assessment
   ↓ influences
Payment Decision
   ↓ produces
Clearing Instruction
```

Pour du lineage colonne par colonne, il faudra un outil plus spécialisé.

---

## 8. ISO 20022

MayaBank traite des messages ISO 20022.

Plusieurs niveaux sont possibles.

### Métier

```text
Business Object: Payment Instruction
```

### Application

```text
Data Object: pacs.008 Payment Message
```

### Physique

```text
Artifact: pacs008.xml
```

La notation choisie dépend du concern.

---

## 9. Event payload

Dans une architecture Kafka :

```text
Application Event: Payment Authorized
Data Object: PaymentAuthorized Payload
```

Le fait métier/applicatif et son contenu sont distincts.

Le Data Object peut contenir :

- paymentId ;
- amount ;
- currency ;
- debtor ;
- creditor ;
- status ;
- timestamp.

ArchiMate ne remplace pas Avro/JSON Schema pour décrire les champs.

---

## 10. Canonical data model

Un Data Object peut être utilisé pour représenter un modèle logique canonique.

Exemple MayaBank :

```text
Canonical Payment
Canonical Customer
Canonical Account
Canonical Party
```

Des adapters peuvent transformer :

```text
Legacy Payment Record
    → Canonical Payment
    → ISO 20022 Message
```

Cette vue est utile pour les migrations et intégrations.

---

## 11. Data ownership

ArchiMate peut aider à montrer quel composant est responsable d’un Data Object.

Exemple :

```text
Customer Profile Service
   manages Customer Profile

Payment Ledger
   manages Payment Transaction
```

Mais il faut éviter d’inventer une sémantique de propriété non exprimée clairement par le langage.

Le modèle doit distinguer :

- qui lit ;
- qui écrit ;
- qui est source of truth ;
- qui expose la donnée.

Les deux derniers peuvent être documentés par propriétés/conventions si nécessaire.

---

## 12. Source of truth

MayaBank décide :

```text
Payment Ledger = source of truth for Payment Transaction
CRM = source of truth for Customer Profile
Limit Management = source of truth for Customer Limit
```

Une architecture de qualité évite plusieurs writers non maîtrisés sur la même donnée critique.

---

## 13. Shared database anti-pattern

### Baseline

```text
Application A ─┐
Application B ─┼→ Shared Payment DB
Application C ─┘
```

Plusieurs applications écrivent directement dans les mêmes structures.

Risques :

- couplage fort ;
- ownership flou ;
- impacts difficiles ;
- migrations complexes.

### Target

```text
Payment Ledger Component
   owns/manages Payment Transaction

Other components
   use Payment Data Service / events
```

ArchiMate permet de montrer ce changement de dépendance.

---

## 14. Data Object dans les APIs

Une API peut consommer et produire des Data Objects.

```text
Payment Initiation Service
   consumes Payment Request
   produces Payment Status
```

Cela permet de relier :

- service ;
- interface ;
- data contract logique.

OpenAPI reste nécessaire pour détailler le contrat technique complet.

---

## 15. Data Object et privacy

Un modèle peut distinguer les données sensibles :

- Customer Personal Data
- Authentication Data
- Payment Credentials
- Fraud Evidence

Puis relier requirements et principles :

```text
Requirement: Sensitive Data Encryption
    influences architecture

Data Object: Payment Credentials
```

ArchiMate permet de relier la Motivation à la donnée sans détailler tous les contrôles techniques.

---

## 16. Baseline vs Target data

### Baseline

- plusieurs formats propriétaires ;
- duplication Customer ;
- statuts incohérents ;
- batch files ;
- ownership diffus.

### Target

- canonical payment model ;
- master/reference ownership explicite ;
- API/event contracts ;
- séparation logical/physical ;
- traçabilité.

---

## 17. Confusions critiques

### Data Object vs Business Object

Métier vs logique applicative.

### Data Object vs Artifact

Logique vs réalisation physique/technologique.

### Data Object vs Application Component

Information vs structure logicielle.

### Data Object vs Application Event

Contenu vs changement d’état.

### Data Object vs Technology Service

Donnée vs capacité technique fournie.

---

## 18. Mini-cas : paiement instantané

```text
Business Object
Payment Order
      ↓ realized by
Data Object
Payment Transaction
      ↓ accessed by
Payment Orchestrator
      ↓ produces
Data Object
Clearing Instruction
      ↓
Settlement Adapter
```

Une vue complémentaire pourra montrer :

```text
Payment Transaction
      ↓ realized by
PAYMENT_TX table
      ↓ hosted by
PostgreSQL
```

---

## 19. Exercices

### Q1
`Customer` comme concept métier ?

**Business Object** si l’intention est le concept informationnel métier.

### Q2
`CustomerProfile` structure JSON utilisée par l’application ?

**Data Object** au niveau logique.

### Q3
`customer_profile` table PostgreSQL ?

**Artifact** si l’on modélise sa réalisation physique.

### Q4
`Payment Authorized` ?

**Application Event**, pas Data Object.

### Q5
Payload de cet événement ?

**Data Object.**

---

## À retenir

> **Business Object = sens métier. Data Object = représentation logique automatisée. Artifact = réalisation technologique/physique.**

Cette chaîne est indispensable pour modéliser correctement data platforms, APIs, Kafka, bases de données et migrations.
