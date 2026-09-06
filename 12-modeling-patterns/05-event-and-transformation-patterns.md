# Patterns Event, State et Transformation

Les mots « événement », « état », « changement », « cible » et « migration » existent dans plusieurs couches. Cette fiche permet de ne pas les mélanger.

## 1. Business Event

Changement d’état pertinent pour le métier.

```text
Business Event: Payment Request Received
Business Event: Customer Complaint Received
```

Il peut déclencher un Business Process.

## 2. Application Event

Changement d’état dans le comportement applicatif.

```text
Application Event: Payment Authorized
Application Event: Fraud Score Produced
```

Il peut déclencher un autre comportement applicatif.

## 3. Technology Event

Changement d’état technique.

```text
Technology Event: Node Unavailable
Technology Event: Replication Lag Threshold Exceeded
```

Il est pertinent lorsque la vue s’intéresse au comportement de la plateforme.

## 4. Implementation Event

Changement d’état de la transformation.

```text
Implementation Event: Wave 1 Cutover Completed
Implementation Event: Legacy Platform Decommissioned
```

## 5. Règle de discrimination des Events

Question : « Qu’est-ce qui change d’état ? »

```text
métier          → Business Event
application     → Application Event
technologie     → Technology Event
transformation  → Implementation Event
```

## 6. Event vs Data Object

```text
Application Event: Payment Authorized
Data Object: PaymentAuthorizedMessage
```

L’événement est le fait.
Le Data Object représente l’information structurée associée.

## 7. Event vs Flow

`Event` est un élément.
`Flow` est une relation.

```text
Payment Authorized
  Triggering → Send Confirmation

Payment Orchestrator
  Flow(Payment Status) → Notification Service
```

## 8. Baseline / Transition / Target

Ces mots décrivent des rôles joués par des états d’architecture, souvent représentés par `Plateau`.

```text
Plateau: Baseline 2026
Plateau: Hybrid Transition
Plateau: Target 2028
```

## 9. Gap pattern

```text
Baseline Plateau
   ↓ compare
Target Plateau
   ↓
Gap: No Event Streaming Capability
```

Un Gap n’est pas nécessairement un défaut absolu : il exprime la différence pertinente entre deux états.

## 10. Transformation pattern complet

```text
Driver
→ Goal
→ Course of Action
→ Target Architecture
→ Gap
→ Work Package
→ Deliverable
→ Implementation Event
→ Transition Plateau
→ Target Plateau
```

## 11. Course of Action vs Work Package

```text
Course of Action: Modernize Payments Incrementally
Work Package: Migrate Instant Payment Wave 1
```

Direction vs exécution.

## 12. Deliverable vs Artifact

```text
Deliverable: Production-ready Payment Orchestrator Release
Artifact: payment-orchestrator:2.0 image
```

Le Deliverable peut englober plusieurs artifacts, documents, tests et résultats.

## 13. Cutover pattern

```text
Work Package: Cutover Wave 1
→ Deliverable: Wave 1 Production Configuration
→ Implementation Event: Wave 1 Go-Live
→ Plateau: Hybrid 30/70
```

## 14. Rollback pattern

ArchiMate ne possède pas un élément « rollback » spécifique.

On peut représenter :

```text
Requirement: Rollback capability within 30 min
Work Package: Prepare rollback mechanism
Deliverable: Validated rollback runbook and automation
Implementation Event: Rollback test passed
```

## 15. Decommissioning pattern

```text
Gap: Legacy technology remains after migration
Work Package: Decommission Legacy Payment Platform
Deliverable: Legacy dependencies removed
Implementation Event: Legacy Platform Shutdown
Plateau: Target without legacy
```

## 16. Green IT transformation pattern

```text
Driver: Reduce IT Carbon Footprint
Assessment: Legacy estate is underutilized
Goal: Reduce infrastructure footprint
Course of Action: Consolidate and decommission
Gap: Duplicate legacy and target capacity
Work Package: Decommission Legacy Servers
Implementation Event: Legacy Servers Powered Off
Outcome: Lower annual energy and embodied footprint allocation
```

Les valeurs de consommation ou carbone sont plutôt portées par des propriétés, mesures ou sources externes ; elles ne nécessitent pas de faux éléments ArchiMate.

## 17. Anti-pattern : Target = Work Package

La cible décrit un **état**.
Le Work Package décrit le **travail** pour y arriver.

## 18. Anti-pattern : Gap = Requirement

```text
Gap: No centralized observability
Requirement: All critical payment flows shall provide end-to-end tracing
```

Différence entre états vs propriété à satisfaire.

## À retenir

> **Un modèle de transformation doit distinguer clairement raison, direction stratégique, état cible, écart, travail, résultat et jalon.**
