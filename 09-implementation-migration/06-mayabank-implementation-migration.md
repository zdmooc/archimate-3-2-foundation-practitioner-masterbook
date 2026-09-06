# MayaBank — Implementation & Migration complète

Ce chapitre assemble la transformation MayaBank de bout en bout, depuis la plateforme de paiement legacy jusqu’à la cible API/event-driven/OpenShift.

L’objectif n’est pas de produire un planning projet détaillé, mais de représenter **les états architecturaux, gaps, work packages, deliverables, événements d’implémentation et dépendances majeures**.

---

## 1. Baseline 2026

### Business

- traitement de certaines exceptions manuel ;
- faible visibilité temps réel ;
- délai de mise en production élevé.

### Application

- Legacy Payment Engine ;
- règles dupliquées ;
- intégrations point-à-point ;
- logique fortement couplée ;
- statut de paiement fragmenté.

### Technology

- middleware legacy ;
- déploiements manuels ;
- Oracle fortement couplé ;
- monitoring siloté ;
- faible automatisation.

### Plateau

```text
P0 — Legacy Payments Baseline
```

---

## 2. Target 2028

### Business

- traitement temps réel ;
- réduction des exceptions manuelles ;
- statut end-to-end ;
- operating model industrialisé.

### Application

- Payment API ;
- Payment Orchestrator ;
- Fraud Service ;
- Limit Service ;
- Ledger Adapter ;
- Notification Service ;
- event contracts.

### Technology

- OpenShift ;
- Kafka ;
- API Gateway ;
- GitOps ;
- IAM/OIDC ;
- secrets management ;
- observability ;
- HA/DR multi-site.

### Plateau

```text
P4 — Target Payments Architecture
```

---

## 3. Gap map

### G1 — API gap

Baseline : interfaces hétérogènes.
Target : standard API layer.

### G2 — orchestration gap

Baseline : orchestration répartie dans le monolithe.
Target : Payment Orchestrator explicite.

### G3 — event gap

Baseline : point-to-point/MQ.
Target : event streaming governed.

### G4 — platform gap

Baseline : runtime legacy.
Target : OpenShift platform.

### G5 — delivery gap

Baseline : release manuelle.
Target : GitOps.

### G6 — observability gap

Baseline : logs silotés.
Target : logs + metrics + traces corrélés.

### G7 — data gap

Baseline : shared schema / ownership ambigu.
Target : ownership explicite et target stores.

### G8 — resilience gap

Baseline : reprise partiellement manuelle.
Target : HA/DR industrialisé et testé.

---

## 4. Work Package map

### WP1 — Platform Foundation

Traite : G4, G5, G6, une partie de G8.

**Deliverables**
- OpenShift Production Foundation
- GitOps Foundation
- Observability Foundation
- IAM/Secrets Integration

**Implementation Event**
- Platform Ready for Onboarding

---

### WP2 — Integration Foundation

Traite : G1, G3.

**Deliverables**
- API Gateway Foundation
- Kafka Platform
- Schema Registry
- API/Event Governance Rules

**Event**
- Integration Foundation Available in Production

---

### WP3 — Payment Core Modernization

Traite : G2, G7.

**Deliverables**
- Payment API
- Payment Orchestrator
- Fraud Integration
- Limit Integration
- Ledger Adapter
- Target Data Model

**Event**
- Payment Core Ready for Pilot

---

### WP4 — Pilot Migration

Traite : migration initiale.

**Deliverables**
- Pilot Flow Migration
- Reconciliation Controls
- Rollback Runbook
- Operational Runbook

**Event**
- Pilot Cutover Completed

---

### WP5 — Retail Migration

**Deliverables**
- Retail Flows Migrated
- Target Store Activated for Retail
- Observability Dashboards

**Event**
- Retail Traffic Majority on Target

---

### WP6 — Corporate Migration

**Deliverables**
- Corporate Flows Migrated
- DR Validation Evidence
- Operational Handover

**Event**
- Strategic Payment Flows on Target

---

### WP7 — Legacy Exit

Traite les gaps de dette résiduelle.

**Deliverables**
- Archived Data
- Dependency Closure Report
- License Exit Plan
- CMDB Updates
- Decommission Runbook

**Events**
- Legacy Writes Disabled
- Legacy Read-only Period Ended
- Legacy Platform Powered Off

---

## 5. Plateaus

### P0 — Baseline

100 % legacy.

### P1 — Foundation Ready

- OpenShift ready ;
- Kafka ready ;
- API Gateway ready ;
- observability ready ;
- applications encore majoritairement legacy.

### P2 — Hybrid Pilot

- target core actif pour quelques flux ;
- legacy encore source principale ;
- dual reconciliation ;
- rollback possible.

### P3 — Target Majority

- majorité des flux sur cible ;
- target DB authoritative pour domaines migrés ;
- legacy uniquement résiduel ;
- adapters temporaires encore présents.

### P4 — Target

- legacy retiré ;
- event/API model standard ;
- GitOps ;
- HA/DR validé ;
- single operating model.

---

## 6. Timeline logique

```text
P0 Baseline
  ↓ WP1 + WP2
Event: Foundation Ready
  ↓
P1 Foundation Ready
  ↓ WP3 + WP4
Event: Pilot Cutover
  ↓
P2 Hybrid Pilot
  ↓ WP5
Event: Retail Majority on Target
  ↓
P3 Target Majority
  ↓ WP6 + WP7
Event: Legacy Powered Off
  ↓
P4 Target
```

---

## 7. Dépendances structurantes

```text
WP1 OpenShift Foundation ─┐
WP2 Integration Foundation ─┼→ WP3 Payment Core
                            │
IAM / Observability ────────┘
```

```text
WP3 Payment Core
      ↓
WP4 Pilot
      ↓
WP5 Retail
      ↓
WP6 Corporate
      ↓
WP7 Legacy Exit
```

### Dépendance data

```text
Target Data Model
→ Migration Tooling
→ Reconciliation
→ Source-of-Truth Cutover
→ Legacy DB Decommission
```

---

## 8. Rollback architecture

### Requirement

```text
Each migration wave must support controlled rollback before irreversible data cutover.
```

### Deliverables

- validated rollback runbook ;
- reconciliation control ;
- traffic routing rule ;
- data restore procedure.

### Implementation Event

```text
Rollback Decision Triggered
```

### Resulting Plateau

Retour au plateau précédent si les conditions le permettent.

---

## 9. Data migration architecture

La donnée impose souvent son propre plateau intermédiaire.

### Transition

```text
Legacy DB authoritative
Target DB synchronized
```

Puis :

```text
Target DB authoritative
Legacy DB read-only
```

Puis :

```text
Legacy DB archived and retired
```

Ces états doivent être explicites dans une transformation bancaire critique.

---

## 10. Security & compliance gates

Avant chaque cutover critique :

- security architecture reviewed ;
- IAM validated ;
- secrets rotation validated ;
- audit logging validated ;
- resilience test completed ;
- backup/restore tested ;
- DR evidence accepted.

Ces contrôles peuvent être reliés à des Deliverables et Implementation Events sans transformer le modèle en checklist opérationnelle exhaustive.

---

## 11. Observability as migration enabler

L’observabilité ne doit pas être déployée à la fin.

Elle est nécessaire avant les premières vagues pour comparer :

- legacy vs target latency ;
- error rates ;
- throughput ;
- duplicate processing ;
- reconciliation mismatches ;
- technical saturation.

Donc :

```text
WP Observability Foundation
    before
WP Pilot Migration
```

---

## 12. Green IT / decommissioning

Le gain environnemental n’est réellement obtenu que si les ressources legacy sont retirées.

Une migration qui déploie la cible tout en conservant indéfiniment la baseline peut augmenter :

- consommation ;
- infrastructure ;
- licences ;
- stockage ;
- empreinte de fabrication.

Le Work Package `Legacy Exit` devient donc aussi un élément de la trajectoire Green IT.

---

## 13. Architecture governance

Pendant Phase G, l’architecte vérifie notamment :

- que les Deliverables respectent les Requirements ;
- que les work packages ne créent pas de nouvelles dépendances contraires aux principes ;
- que les exceptions sont explicites ;
- que les plateaus restent cohérents ;
- que les temporary components ont une date de sortie ;
- que les gaps sont réellement fermés.

---

## 14. Anti-patterns MayaBank

### Big bang inutile

Migrer tous les flux en une nuit sans nécessité métier.

### Eternal transition

Créer un Plateau hybride sans Work Package de sortie.

### Temporary forever

Ajouter des bridges et adapters temporaires sans ownership de décommissionnement.

### Build without gap

Lancer Kafka/OpenShift parce que la technologie est intéressante, sans relier le travail à un Gap/Requirement.

### Target without rollback

Ignorer le retour arrière dans une migration critique.

---

## 15. Vue exécutive synthétique

```text
WHY
Resilience + Time-to-Market + Real-Time Payments

GAPS
Legacy coupling + no event backbone + manual delivery + weak observability

WORK PACKAGES
Platform → Integration → Payment Core → Migration Waves → Legacy Exit

PLATEAUS
P0 Legacy → P1 Foundation → P2 Hybrid → P3 Target Majority → P4 Target

OUTCOME
Modern, resilient, observable, governable payment platform
```

---

## À retenir

> **La transformation MayaBank n’est pas un saut de la baseline vers la cible : c’est une succession d’états gouvernés, chacun rendu possible par des work packages et des deliverables explicites.**