# Cross-layer relationships et confusions critiques

La valeur d’ArchiMate vient surtout de sa capacité à relier les couches. Cette section montre comment conserver une sémantique propre lorsqu’on traverse Motivation, Strategy, Business, Application, Technology, Physical et Implementation & Migration.

## 1. Chaîne cross-layer MayaBank

```text
Driver: Growth of Instant Payments
  Influence → Goal: Scale Payment Processing

Goal
  associated/linked through architecture reasoning → Capability: Real-Time Payment Processing

Business Process: Execute Instant Payment
  served by ← Application Service: Payment Orchestration Service

Application Function: Orchestrate Payment
  Realization → Application Service

Application Component: Payment Orchestrator
  Assignment → Application Function

Artifact: payment-orchestrator image
  Realization → Application Component

Artifact deployed on → OpenShift Node / System Software
```

Le point important n’est pas de forcer une chaîne unique, mais de garder le sens de chaque relation.

## 2. Capability vs Application Component

Une `Capability` n’est pas réalisée simplement parce qu’une application existe.

Une capability représente une aptitude organisationnelle. Elle peut dépendre de comportements métier, applications, technologies et ressources.

Éviter :

```text
Payment Orchestrator = Real-Time Payment Processing Capability
```

Préférer un modèle où la capability est reliée à l’architecture qui la rend possible via des comportements et éléments adaptés.

## 3. Business Service vs Application Service

```text
Business Service: Instant Payment Service
Application Service: Payment Orchestration Service
```

Le second peut servir un processus métier qui réalise le premier.

Ne pas utiliser `Realization` entre n’importe quel Application Service et Business Service sans vérifier la sémantique et la validité dans le contexte du modèle.

## 4. Business Object vs Data Object vs Artifact

```text
Business Object: Payment Order
Data Object: Payment Transaction Record
Artifact: PAYMENT_TX table / Avro schema / file
```

Pattern conceptuel :

```text
Data Object
  Realization → Business Object

Artifact
  Realization → Data Object
```

Cela permet de suivre un concept métier jusqu’à sa réalisation technique.

## 5. Application Component vs System Software

```text
Payment Orchestrator = Application Component
Kafka Platform = System Software
OpenShift = System Software / platform technology
```

Un `Technology Service` peut servir un `Application Component`.

```text
Event Streaming Service
  Serving → Payment Orchestrator
```

## 6. Work Package vs architecture cible

Un `Work Package` ne « devient » pas un Application Component.

Il produit un `Deliverable`, lequel peut contribuer à réaliser la cible.

```text
Work Package: Build Payment Orchestrator
  Realization / produces conceptually → Deliverable: Payment Orchestrator Release 1
```

La relation exacte doit rester conforme à la matrice du langage.

## 7. Confusion Realization vs Serving

Question :

> A implémente-t-il B, ou A fournit-il une fonctionnalité à B ?

```text
Payment Validation Function
  Realization → Payment Validation Service

Payment Validation Service
  Serving → Execute Payment Process
```

C’est probablement la confusion la plus importante de la couche Application.

## 8. Confusion Assignment vs Realization

```text
Application Component
  Assignment → Application Function

Application Function
  Realization → Application Service
```

Le composant **exécute** la fonction ; la fonction **réalise** le service.

## 9. Confusion Flow vs Access

```text
Fraud Function
  Access(read) → Fraud Rules
```

signifie qu’elle utilise ces données.

```text
Payment Validation
  Flow(Payment Context) → Fraud Function
```

signifie qu’une information est transférée.

## 10. Confusion Triggering vs Serving

```text
Payment Authorized
  Triggering → Submit to Clearing
```

exprime une causalité.

```text
Clearing Service
  Serving → Submit to Clearing
```

exprime une fonctionnalité fournie.

## 11. Confusion Composition vs Specialization

```text
Retail Customer
  Specialization → Customer
```

mais :

```text
Payment Platform
  Composition → Payment Orchestrator
```

Sous-type et tout/partie sont deux notions totalement différentes.

## 12. Confusion Association vs tout le reste

`Association` doit rester rare dans les vues où la sémantique peut être précisée.

Mauvais modèle :

```text
Business Process — Association — Application
Application — Association — Database
Database — Association — Server
```

Meilleur modèle :

```text
Application Service Serving → Business Process
Application Component Assignment → Application Function
Application Function Access → Data Object
Artifact deployed on → Node
```

## 13. Cross-layer impact analysis

Une architecture bien reliée permet de répondre à :

- quel processus métier dépend de Kafka ?
- quelle capability est affectée si un service applicatif disparaît ?
- quels Work Packages corrigent un Gap technologique ?
- quels services métier sont exposés par des applications arrivant en fin de vie ?
- quels composants sont affectés par la fermeture d’un datacenter ?

Le modèle devient alors une base d’analyse, pas seulement un dessin.

## 14. Règle professionnelle

> **Chaque relation doit pouvoir être défendue oralement en une phrase simple.**

Si l’architecte ne peut pas expliquer pourquoi la relation est `Serving` plutôt que `Association`, le modèle doit être revu.
