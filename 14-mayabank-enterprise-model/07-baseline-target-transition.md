# MayaBank — Baseline, Target & Transition Architectures

Cette fiche décrit les états successifs de l’architecture MayaBank et les Gaps qui justifient les Work Packages de transformation.

## 1. Plateau 0 — Baseline

### Business
- processus fortement dépendants du legacy ;
- gestion d’exception peu automatisée ;
- faible visibilité temps réel.

### Application
- monolithe / gros composants fortement couplés ;
- point-to-point integration ;
- traitements batch ;
- APIs non uniformes ;
- ownership de données peu clair.

### Technology
- middleware historique ;
- VMs dédiées ;
- déploiement manuel ;
- observabilité fragmentée ;
- secrets parfois statiques.

### Physical
- serveurs dédiés ;
- capacité peu mutualisée ;
- coexistence de matériels anciens.

## 2. Gaps Baseline → Target

### G1 — Real-Time Orchestration Gap
La baseline ne fournit pas l’orchestration temps réel cible.

### G2 — API Governance Gap
Absence de couche API homogène et gouvernée.

### G3 — Event Backbone Gap
Absence d’un event backbone standard.

### G4 — Cloud-Native Runtime Gap
Absence de plateforme cible conteneurisée standardisée.

### G5 — Observability Gap
Corrélation et tracing insuffisants.

### G6 — Secrets & Identity Gap
Gestion des secrets et identités workloads à renforcer.

### G7 — Data Ownership Gap
Responsabilités et source of truth insuffisamment explicites.

### G8 — Deployment Automation Gap
Déploiements trop manuels.

### G9 — DR Consistency Gap
Résilience inter-site non homogène entre composants.

### G10 — Estate Simplification Gap
Legacy et infrastructures dédiées restent trop nombreux.

## 3. Work Packages

- WP1 Build OpenShift Foundation
- WP2 Establish API Management Foundation
- WP3 Establish Event Streaming Platform
- WP4 Establish IAM and Secrets Foundation
- WP5 Establish Distributed Observability
- WP6 Build Payment Orchestrator
- WP7 Build Fraud Integration
- WP8 Build Ledger/Clearing Integration
- WP9 Migrate Retail Payment Flow
- WP10 Migrate Corporate Payment Flow
- WP11 Execute Data Cutover
- WP12 Validate Multi-Site DR
- WP13 Decommission Legacy Payment Platform

## 4. Deliverables

Exemples :

- Production-ready OpenShift platform ;
- Governed Payment API ;
- Production Kafka service ;
- Payment Orchestrator Release 1 ;
- Validated end-to-end observability ;
- Migration reconciliation report ;
- DR validation evidence ;
- Legacy decommission evidence pack.

## 5. Implementation Events

- OpenShift Production Ready
- Kafka Production Ready
- Payment API Go-Live
- First Target Payment Processed
- Wave 1 Cutover Completed
- Target Ledger Becomes Source of Truth
- Wave 2 Cutover Completed
- DR Test Passed
- Legacy Read-Only Enabled
- Legacy Payment Platform Decommissioned

## 6. Plateau 1 — Foundation Ready

```text
OpenShift available
API management available
Kafka available
IAM/secrets available
Observability foundation available
Legacy still handles production payments
```

Ce Plateau est stable même si aucune migration métier majeure n’a encore eu lieu.

## 7. Plateau 2 — Hybrid Payments

```text
Target API active
Payment Orchestrator active for selected flows
Kafka active
Retail flow partially migrated
Legacy handles remaining flows
Temporary synchronization exists
```

C’est un vrai état d’architecture, pas seulement une phase de projet.

## 8. Plateau 3 — Target Core Active

```text
Most payment flows on target
Target data ownership active
Legacy retained for limited residual functions
DR validated
GitOps standard
Observability end-to-end
```

## 9. Plateau 4 — Target Stable

```text
Strategic flows fully migrated
Legacy payment engine retired
Temporary bridges removed
Target source-of-truth model stable
Multi-site operations validated
Physical capacity rationalized
```

## 10. Routing during coexistence

Pendant Plateau 2 :

```text
Inbound Payment
→ Routing Rule
   ├─ migrated segment → Target Orchestrator
   └─ non-migrated segment → Legacy
```

Le critère de routage doit être explicite et testable.

## 11. Data coexistence

Risques :

- double write ;
- divergence ;
- duplicate events ;
- ordering issues ;
- reconciliation gaps ;
- ambiguous source of truth.

Le modèle doit indiquer, pour chaque Plateau, quelle application est autoritative pour chaque donnée critique.

## 12. Cutover pattern

Avant cutover :

- réplication/synchronisation ;
- validation de qualité ;
- observabilité renforcée ;
- rollback prêt.

Événement :

```text
Implementation Event: Target Ledger Becomes Source of Truth
```

Après :

- writes target-only ;
- legacy éventuellement read-only ;
- reconciliation contrôlée ;
- rollback limité dans le temps.

## 13. Rollback

Le rollback doit être traité comme un scénario d’architecture, pas un simple bouton projet.

Questions :

- quelle donnée a changé ?
- peut-on rejouer les événements ?
- comment éviter les doublons ?
- quel composant redevient source of truth ?
- pendant combien de temps ?

## 14. Strangler pattern

Le Strangler permet de détourner progressivement des capacités du legacy vers la cible.

```text
Facade / API Layer
→ Target Service when migrated
→ Legacy Adapter otherwise
```

L’objectif est que le périmètre legacy diminue réellement à chaque vague.

## 15. Dependency sequencing

Exemple :

```text
OpenShift Foundation
→ Observability Foundation
→ Kafka Foundation
→ Payment Orchestrator
→ Pilot Flow
→ Data Cutover
→ Scale Migration
→ Decommission
```

Certaines dépendances peuvent être parallélisées ; le modèle doit représenter les vraies dépendances architecturales.

## 16. Exit criteria

### Hybrid Plateau exit
- target volume stable ;
- error rate acceptable ;
- reconciliation passed ;
- rollback criteria expire ;
- target support model ready.

### Target Plateau exit
- all strategic flows migrated ;
- legacy traffic = 0 ;
- archival complete ;
- physical resources released ;
- support contracts adjusted.

## 17. Green IT temporal effect

Pendant la coexistence, l’empreinte peut **augmenter temporairement** car legacy et cible tournent ensemble.

Le bénéfice apparaît après :

```text
Migration
→ Legacy traffic zero
→ Decommission
→ Capacity released
→ Devices consolidated/retired/avoided
```

## 18. Program governance view

```text
Gap
→ Work Package
→ Deliverable
→ Implementation Event
→ Plateau
```

Chaque Work Package doit contribuer explicitement à un Gap et à un Plateau.

## 19. Anti-patterns

- Baseline et Target sans Transition ;
- Transition exprimée seulement en dates ;
- Plateau utilisé pour un environnement Dev/Test/Prod ;
- Work Package sans Gap ;
- Deliverable confondu avec Artifact ;
- cutover sans source-of-truth decision ;
- migration terminée alors que le legacy reste actif.

## 20. Résumé

```text
Baseline
→ Gaps
→ Foundations
→ Hybrid Plateau
→ Data/Flow Cutovers
→ Target Core
→ Decommission
→ Target Stable
```

> **Une transformation bien modélisée rend les états intermédiaires, les décisions de bascule et les conditions d’extinction visibles.**