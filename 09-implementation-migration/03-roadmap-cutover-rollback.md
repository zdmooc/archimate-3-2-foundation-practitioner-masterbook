# Roadmap, vagues de migration, cutover, rollback et décommissionnement

ArchiMate ne remplace pas un outil de planning, mais la couche Implementation & Migration permet de représenter les **dépendances architecturales** d’une transformation et les états atteints au fil du temps.

---

## 1. Roadmap d’architecture

Une roadmap d’architecture décrit le chemin de transformation à un niveau suffisamment abstrait pour :

- comprendre les grandes étapes ;
- identifier les dépendances ;
- visualiser les Plateaus ;
- relier les Work Packages aux Gaps ;
- montrer les jalons significatifs ;
- expliquer le passage Baseline → Target.

### Exemple

```text
2026 H2
WP1 Platform Foundation
WP2 API Foundation

2027 H1
WP3 Event Streaming
WP4 Payment Orchestrator

2027 H2
WP5 Migration Wave 1
WP6 Migration Wave 2

2028 H1
WP7 Legacy Decommission
```

La roadmap ne doit pas devenir un Gantt détaillé.

---

## 2. Les vagues de migration

Une migration complexe est souvent découpée en vagues.

### Pourquoi ?

Pour réduire :

- risque ;
- blast radius ;
- complexité de cutover ;
- volume de données à migrer simultanément ;
- charge opérationnelle ;
- difficulté de rollback.

### Exemple MayaBank

```text
Wave 0 — Internal pilot
Wave 1 — Low-volume instant payments
Wave 2 — Retail instant payments
Wave 3 — Corporate payments
Wave 4 — Residual products and decommission
```

Chaque vague peut être un `Work Package` si elle constitue un ensemble de travaux significatif.

---

## 3. Critères de découpage des vagues

Les vagues peuvent être définies selon :

- produit ;
- canal ;
- pays ;
- clientèle ;
- criticité ;
- volumétrie ;
- dépendances techniques ;
- type de transaction ;
- difficulté de migration ;
- risque opérationnel.

Le modèle doit montrer la logique de transformation, pas tous les détails du planning.

---

## 4. Cutover

Le **cutover** désigne le passage effectif d’une partie du service vers la nouvelle architecture.

Un cutover significatif peut être représenté comme `Implementation Event`.

```text
Implementation Event:
Retail Instant Payment Cutover Completed
```

Avant :

```text
Retail traffic → Legacy
```

Après :

```text
Retail traffic → Target
Fallback → Legacy
```

---

## 5. Rollback

Le rollback n’est pas un élément ArchiMate spécifique.

Il peut être représenté au moyen de :

- Requirement ;
- Work Package ;
- Deliverable ;
- Implementation Event ;
- Plateau ;
- relations entre éléments.

### Exemple

```text
Requirement: Wave 1 must support rollback within 30 minutes

Deliverable: Validated Rollback Runbook

Implementation Event: Rollback Triggered

Plateau: Restored Legacy Operating State
```

Le modèle montre ainsi la capacité de retour vers un état connu.

---

## 6. Coexistence

La coexistence est souvent la partie la plus difficile d’une migration.

### Questions d’architecture

- qui est source of truth ?
- comment les données restent-elles cohérentes ?
- quel système traite quel flux ?
- comment éviter les doubles traitements ?
- comment faire la réconciliation ?
- comment observer un flux traversant les deux mondes ?
- quels adaptateurs temporaires faut-il ?
- quand peuvent-ils être supprimés ?

### Plateau de coexistence

```text
Transition Plateau:
Legacy authoritative for product A
Target authoritative for product B
Dual reconciliation enabled
API facade routes by product
Kafka publishes migrated events only
```

Ce plateau mérite une architecture explicite.

---

## 7. Strangler pattern

Le Strangler pattern est une stratégie de modernisation progressive.

Il peut être représenté ainsi :

```text
Course of Action:
Incrementally replace legacy capabilities

Work Packages:
- Introduce API facade
- Extract payment validation
- Extract orchestration
- Extract status management
- Retire legacy modules
```

### Transition states

```text
P0: Legacy monolith
P1: API facade + legacy
P2: Orchestrator + legacy core
P3: Target core + residual legacy
P4: Legacy retired
```

---

## 8. Data migration

La migration de données possède ses propres Work Packages et Events.

### Work Packages

- Define target data model
- Build migration tooling
- Execute initial load
- Execute delta synchronization
- Validate reconciliation
- Switch source of truth

### Deliverables

- Migration scripts
- Reconciliation report
- Validated target dataset
- Data cutover runbook

### Events

- Initial Load Completed
- Delta Synchronization Enabled
- Target Database Becomes Authoritative

---

## 9. Décommissionnement

Le décommissionnement doit être explicitement modélisé.

Sinon la roadmap construit la cible mais ne supprime jamais la dette.

### Work Package

```text
Decommission Legacy Payment Platform
```

### Deliverables

- archived data ;
- shutdown plan ;
- license termination evidence ;
- CMDB update ;
- dependency closure report.

### Implementation Events

```text
Legacy Writes Disabled
Legacy Read-Only Period Ended
Legacy Platform Powered Off
```

### Target Plateau

Le Target Plateau ne contient plus les composants legacy.

---

## 10. Dépendances et chemin critique

ArchiMate peut montrer les dépendances architecturales importantes.

```text
OpenShift Foundation
        ↓
Payment Orchestrator
        ↓
Migration Wave 1
```

```text
Kafka Foundation
        ↓
Event Contracts
        ↓
Event Migration
```

```text
Target Database
        ↓
Data Migration
        ↓
Source-of-Truth Cutover
```

Il ne s’agit pas de calculer automatiquement un chemin critique comme un outil PPM, mais de rendre visibles les dépendances majeures.

---

## 11. Architecture Decision Gates

Un programme peut introduire des points de contrôle.

Exemples :

- Platform Readiness Gate ;
- Security Readiness Gate ;
- Data Reconciliation Gate ;
- DR Validation Gate ;
- Go/No-Go Cutover Gate.

Ces gates ne sont pas des éléments ArchiMate dédiés.

Selon l’intention, ils peuvent être représentés comme :

- Implementation Event ;
- Deliverable ;
- Requirement ;
- ou laissés hors du modèle si purement processuels.

---

## 12. Canary et progressive delivery

Une architecture de migration peut utiliser :

- canary ;
- blue/green ;
- feature flags ;
- traffic shifting ;
- shadow traffic.

ArchiMate doit représenter leur **impact architectural**, pas les commandes techniques.

### Exemple

```text
Transition Plateau:
10% traffic target / 90% legacy
```

Puis :

```text
Implementation Event:
Traffic Shift to 50% Completed
```

Puis :

```text
Target Plateau:
100% target
```

---

## 13. Exemple complet MayaBank

### Wave 0 — Foundation

- OpenShift
- Kafka
- IAM
- Observability
- GitOps

### Wave 1 — Pilot

- API facade
- Payment Orchestrator
- low-risk flows
- rollback enabled

### Wave 2 — Scale

- retail flows
- target data store
- target source of truth for migrated products

### Wave 3 — Critical

- corporate flows
- full DR validation
- operational handover

### Wave 4 — Exit

- residual data archive
- legacy shutdown
- CMDB/license cleanup

---

## 14. Questions de contrôle

1. Une vague de migration cohérente → souvent `Work Package`.
2. Le moment où 50 % du trafic bascule → `Implementation Event` possible.
3. État 50/50 stable pendant deux mois → `Plateau`.
4. Rollback runbook validé → `Deliverable`.
5. Capacité à revenir en arrière en 30 min → `Requirement`.
6. Arrêt final du legacy → `Implementation Event` + changement de Plateau.

---

## À retenir

> **Une roadmap ArchiMate doit montrer les états, les travaux et les changements architecturaux, pas reproduire un planning projet détaillé.**