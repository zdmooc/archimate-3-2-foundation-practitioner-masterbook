# Patterns Behavior / Service / Interface

Cette famille de patterns répond à une question récurrente : **qui fait quoi, qu’est-ce qui est exposé et par où ?**

## 1. Pattern générique

```text
Active Structure
  Assignment → Internal Behavior

Internal Behavior
  Realization → Service

Interface
  exposes → Service

Service
  Serving → Consumer
```

## 2. Business

```text
Business Role: Payment Operator
  Assignment → Business Process: Resolve Payment Exception

Business Process
  Realization → Business Service: Exception Resolution Service

Business Interface: Operations Portal
  exposes → Exception Resolution Service
```

## 3. Application

```text
Application Component: Payment Orchestrator
  Assignment → Application Function: Validate Payment

Validate Payment
  Realization → Application Service: Payment Validation Service

Application Interface: /payments/validate
  exposes → Payment Validation Service
```

## 4. Technology

```text
System Software: Kafka
  Assignment → Technology Function: Event Streaming

Event Streaming
  Realization → Technology Service: Event Streaming Service

Technology Interface: Kafka Listener Endpoint
  exposes → Event Streaming Service
```

## 5. Anti-pattern : Component → Serving → Function

Erreur fréquente : utiliser `Serving` pour dire qu’un composant exécute une fonction.

Préférer :

```text
Application Component
  Assignment → Application Function
```

Puis :

```text
Application Function
  Realization → Application Service
```

## 6. Anti-pattern : Interface = Service

Une API REST, un écran ou un endpoint n’est pas automatiquement le service lui-même.

```text
Service = fonctionnalité offerte
Interface = point d’accès
```

## 7. Pattern synchrone

```text
Business Process
  uses
Application Service
  exposed through
Application Interface
  provided by
Application Component
```

Exemple :

```text
Initiate Payment
→ Payment Initiation Service
→ REST API
→ Payment Orchestrator
```

## 8. Pattern asynchrone

```text
Producer Application
→ Application Event
→ Data Object payload
→ Technology Service: Event Streaming
→ Consumer Application
```

Le service technologique de messaging n’est pas le même concept que l’événement applicatif.

## 9. Pattern Collaboration / Interaction

Lorsque plusieurs acteurs ou composants réalisent conjointement un comportement :

```text
Application Collaboration
  Assignment → Application Interaction
```

Exemple :

```text
Payment-Fraud Collaboration
  Assignment → Fraud Decision Interaction
```

## 10. Process vs Function dans une même vue

Un Process peut appeler plusieurs Functions :

```text
Application Process: Orchestrate Payment
  ├─ Function: Validate
  ├─ Function: Route
  └─ Function: Record
```

Le Process donne la dynamique ; les Functions donnent les responsabilités internes.

## 11. Event pattern

```text
Application Event: Payment Received
  Triggering → Application Process: Validate Payment
```

Puis :

```text
Validate Payment
  Triggering → Fraud Check
```

Si l’on veut montrer ce qui est transféré :

```text
Validate Payment
  Flow(Payment Instruction) → Fraud Check
```

## 12. Test rapide

Demander :

- qui exécute ? → Assignment
- qu’est-ce qui est fourni ? → Service
- qui met en œuvre le service ? → Realization
- par où y accède-t-on ? → Interface
- qui consomme ? → Serving
- qu’est-ce qui se produit ensuite ? → Triggering
- qu’est-ce qui est transféré ? → Flow

> **La qualité d’un modèle repose souvent sur la séparation nette entre structure, comportement interne, service externe et interface.**
