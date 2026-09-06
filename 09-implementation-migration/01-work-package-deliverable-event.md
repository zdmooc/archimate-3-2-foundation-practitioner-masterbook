# Work Package, Deliverable et Implementation Event

Ces trois éléments décrivent le **travail de transformation**, ses **résultats** et les **jalons de changement d’état**.

---

## 1. Work Package

Un `Work Package` représente un ensemble d’actions identifiées et conçues pour atteindre un résultat dans des contraintes de temps et de ressources.

Il peut représenter :

- un projet ;
- un lot de transformation ;
- une vague de migration ;
- un chantier de plateforme ;
- un lot de décommissionnement ;
- une initiative structurée.

### Exemples MayaBank

- Build OpenShift Foundation
- Establish Event Streaming Platform
- Implement Payment Orchestrator
- Migrate Instant Payment Wave 1
- Deploy End-to-End Observability
- Decommission Legacy Payment Engine

### Work Package vs tâche

Un Work Package n’est pas nécessairement une tâche élémentaire.

```text
Work Package: Build Event Streaming Platform
```

peut regrouper :

- provisioning Kafka ;
- sécurité ;
- Schema Registry ;
- monitoring ;
- DR ;
- intégration GitOps.

Le niveau de détail doit rester adapté au concern architectural.

---

## 2. Work Package vs Course of Action

Cette distinction est fondamentale.

### Course of Action

Direction stratégique choisie.

```text
Modernize Payments Incrementally
Adopt Event-Driven Integration
Cloud-First for New Workloads
```

### Work Package

Travail concret permettant d’exécuter cette direction.

```text
WP1 Build Kafka Platform
WP2 Migrate Fraud Events
WP3 Migrate Payment Status Events
```

### Chaîne mentale

```text
Course of Action
      ↓
Work Packages
```

La Strategy explique **la direction**.
Implementation & Migration explique **les travaux**.

---

## 3. Deliverable

Un `Deliverable` représente un résultat précisément défini d’un Work Package.

Le mot important est **résultat**.

### Exemples

```text
Work Package: Build OpenShift Foundation
Deliverable: Production-ready OpenShift Platform
```

```text
Work Package: Implement Payment Orchestrator
Deliverable: Payment Orchestrator Release 1
```

```text
Work Package: Establish DR
Deliverable: Validated DR Capability
```

---

## 4. Deliverable vs Artifact

Cette confusion est fréquente.

### Deliverable

Résultat produit dans un contexte de transformation.

### Artifact

Élément technologique concret ou déployable.

Exemple :

```text
Deliverable: Payment Orchestrator Release 1
Artifact: payment-orchestrator:1.0 container image
```

Le Deliverable peut inclure :

- application livrée ;
- documentation ;
- configurations ;
- tests ;
- runbooks ;
- evidence pack ;
- formation ;
- composants déployables.

L’Artifact représente une réalisation technologique plus spécifique.

---

## 5. Deliverable vs TOGAF Deliverable

Le mot `Deliverable` existe aussi dans le vocabulaire TOGAF.

Dans ArchiMate, il est utilisé comme élément de modélisation Implementation & Migration.

Dans TOGAF, un deliverable est un produit de travail contractuellement ou formellement défini pouvant contenir plusieurs artifacts.

Les deux usages sont conceptuellement proches, mais il faut conserver le contexte du langage utilisé.

---

## 6. Implementation Event

Un `Implementation Event` représente un changement d’état lié à l’implémentation ou à la migration.

Exemples :

- Platform Ready for Production
- Wave 1 Cutover Completed
- First Customer Migrated
- Legacy Read-Only Mode Enabled
- Data Migration Completed
- Legacy Platform Decommissioned

### Pourquoi ce concept est utile

Parce qu’un programme possède des moments qui changent réellement l’état architectural.

```text
Before event:
Legacy handles 100% payments

Implementation Event:
Wave 1 Cutover Completed

After event:
Target handles 30% payments
Legacy handles 70%
```

---

## 7. Implementation Event vs Application Event

### Application Event

Changement d’état dans le comportement d’une application.

```text
Payment Authorized
Payment Rejected
```

### Implementation Event

Changement d’état dans la transformation.

```text
Payment API Production Go-Live
Legacy Queue Disabled
```

Même si les deux utilisent le mot Event, ils appartiennent à des préoccupations différentes.

---

## 8. Implementation Event vs milestone projet

Un milestone peut être représenté comme Implementation Event s’il marque un changement d’état pertinent pour l’architecture.

Mais tous les milestones de projet ne méritent pas forcément d’être modélisés.

### Pertinent

```text
New Database Becomes System of Record
```

### Peu pertinent architecturalement

```text
Steering Committee Meeting #17
```

---

## 9. Pattern Work Package → Deliverable → Event

```text
Work Package
Build OpenShift Foundation
    ↓
Deliverable
Production-ready OpenShift Platform
    ↓
Implementation Event
OpenShift Production Service Opened
```

Le pattern permet de distinguer :

- ce qu’on fait ;
- ce qu’on produit ;
- le moment où l’état change.

---

## 10. Dépendances entre Work Packages

Une transformation possède souvent des dépendances.

```text
WP1 Build OpenShift
        ↓
WP2 Build Payment Orchestrator
        ↓
WP3 Migrate Wave 1
```

Mais toutes les dépendances ne sont pas purement séquentielles.

Exemple :

```text
WP Kafka Foundation ─┐
WP API Foundation   ─┼→ WP Payment Orchestrator
WP IAM Foundation   ─┘
```

Le modèle peut rendre visibles les travaux structurants communs.

---

## 11. Work Package et Requirement

Un Work Package ne remplace pas un Requirement.

```text
Requirement: all critical flows must support end-to-end tracing
```

peut être réalisé par :

```text
Work Package: Deploy Distributed Observability
```

Le Requirement explique **ce qui doit être satisfait**.
Le Work Package explique **quel travail contribue à le satisfaire**.

---

## 12. Work Package et Gap

Un Gap peut motiver un ou plusieurs Work Packages.

```text
Gap: No Event Streaming Capability
    ↓
WP: Establish Kafka Platform
WP: Define Event Governance
WP: Migrate Priority Events
```

Un même Work Package peut traiter plusieurs gaps.

---

## 13. Exemple complet MayaBank

### WP1 — Platform Foundation

**Deliverables**
- OpenShift Production Cluster
- GitOps Foundation
- Secrets Management Integration
- Observability Stack

**Implementation Event**
- Platform Ready for Application Onboarding

### WP2 — Event Foundation

**Deliverables**
- Kafka Platform
- Schema Registry
- Event Governance Rules

**Implementation Event**
- Event Platform Opened to Production Producers

### WP3 — Payment Core

**Deliverables**
- Payment API
- Payment Orchestrator
- Fraud Integration
- Ledger Adapter

**Implementation Event**
- Payment Core Ready for Pilot

### WP4 — Wave 1

**Deliverables**
- Migrated pilot payment flows
- Rollback runbook
- Reconciliation controls

**Implementation Event**
- Wave 1 Cutover Completed

---

## 14. Questions de contrôle

1. « Migration des flux paiement entreprises » → **Work Package**.
2. « Release 2 validée » → **Deliverable**.
3. « La base cible devient source de vérité » → **Implementation Event**.
4. « Adopter une migration incrémentale » → **Course of Action**, pas Work Package.
5. « Image OCI du Payment Orchestrator » → **Artifact**, pas Deliverable.
6. « Réduire la latence à moins de 100 ms » → **Requirement/Outcome selon contexte**, pas Work Package.

---

## À retenir

> **Work Package = travail ; Deliverable = résultat ; Implementation Event = changement d’état.**

Cette distinction suffit déjà à rendre une roadmap d’architecture beaucoup plus lisible.