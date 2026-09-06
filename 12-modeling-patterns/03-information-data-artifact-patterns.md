# Patterns Information — Business Object, Data Object, Artifact, Event et Flow

La même information traverse plusieurs niveaux d’abstraction. Le piège consiste à tout appeler « donnée ».

## 1. Business Object

Représentation conceptuelle d’une information métier.

```text
Business Object: Payment Order
Business Object: Customer Mandate
Business Object: Fraud Case
```

## 2. Data Object

Information structurée destinée au traitement automatisé.

```text
Data Object: Payment Transaction
Data Object: Customer Profile
Data Object: Fraud Assessment
```

## 3. Artifact

Réalisation technologique ou déployable.

```text
Artifact: PAYMENT_TX table
Artifact: payment-event.avsc
Artifact: payment-orchestrator image
```

## 4. Pattern de réalisation informationnelle

```text
Business Object
  ← Realization — Data Object
  ← Realization — Artifact
```

Exemple :

```text
Payment Order
  realized by Payment Transaction
  realized physically by PAYMENT_TX table / event schema
```

Le niveau exact de réalisation doit rester cohérent avec le concern de la vue.

## 5. Business Object vs Data Object

Question :

> « Est-ce une notion métier indépendante de l’implémentation ? »

→ Business Object.

> « Est-ce la représentation structurée utilisée par les systèmes ? »

→ Data Object.

## 6. Data Object vs Artifact

```text
Data Object = logique applicative
Artifact    = réalisation technologique concrète
```

Exemple :

```text
Data Object: Payment Transaction
Artifact: payment_transaction table
```

## 7. Event vs payload

Un événement représente un changement d’état.

```text
Application Event: Payment Authorized
```

Le payload transporte les informations associées :

```text
Data Object: PaymentAuthorizedMessage
```

Ne pas modéliser le JSON ou l’Avro comme l’événement lui-même.

## 8. Topic vs Event

```text
Application Event: Payment Authorized
Technology Service: Event Streaming Service
System Software: Kafka
Artifact / property: payment.authorized topic/schema selon le niveau de détail
```

Le topic est un mécanisme technique ; l’événement est le fait architectural.

## 9. Access vs Flow

### Access

Le comportement lit ou écrit un élément passif.

```text
Validate Payment
  Access(read) → Customer Limit
```

### Flow

Quelque chose est transféré d’un élément à un autre.

```text
Validate Payment
  Flow(Payment Instruction) → Fraud Check
```

## 10. Pattern CRUD

Pour un modèle orienté données :

```text
Create Payment
  Access(write) → Payment Transaction

Get Payment Status
  Access(read) → Payment Transaction

Update Settlement Status
  Access(write) → Payment Transaction
```

Une matrice Application Function × Data Object peut compléter la vue.

## 11. Pattern source of truth

Le modèle peut montrer :

```text
Payment Ledger
  Access(write) → Payment Transaction

Reporting Platform
  Access(read) → Payment Transaction
```

Puis documenter une propriété :

```text
systemOfRecord = Payment Ledger
```

ArchiMate n’impose pas un élément spécifique « source of truth » ; le concept est exprimé par le modèle et/ou des propriétés.

## 12. Pattern data lineage

```text
Business Object: Payment Order
↓ realization
Data Object: Payment Transaction
↓ accessed by
Payment Orchestrator
↓ Flow
Clearing Adapter
↓ Flow
Settlement Platform
```

La lineage combine donc :

- realization ;
- access ;
- flow ;
- application services/components.

## 13. Anti-pattern : base Oracle = Data Object

Oracle est généralement :

```text
System Software: Oracle Database
```

Les données manipulées sont des `Data Object`.

Les tables/schémas physiques peuvent être représentés par `Artifact` si utile.

## 14. Anti-pattern : fichier = toujours Artifact

Un fichier réel peut jouer plusieurs rôles selon la vue :

- document métier → Representation ;
- donnée structurée applicative → Data Object ;
- fichier déployable ou physique → Artifact.

Le nom de fichier ne suffit pas.

## À retenir

```text
Business Object = sens métier
Data Object     = représentation logique automatisée
Artifact        = réalisation technologique
Event           = fait/changement d’état
Payload         = information transportée
Access          = lit/écrit
Flow            = transfère
```
