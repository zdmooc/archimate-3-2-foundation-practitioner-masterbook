# Plateau, Gap, Baseline, Transition et Target

`Plateau` et `Gap` permettent de représenter les **états successifs** d’une architecture et les **différences** entre ces états.

---

## 1. Plateau

Un `Plateau` représente un état relativement stable de l’architecture qui existe pendant une période limitée.

Il ne s’agit pas d’un environnement technique au sens `dev/test/prod`.

Un Plateau peut contenir ou agréger des éléments de plusieurs couches :

- Business ;
- Application ;
- Technology ;
- Physical ;
- Motivation ;
- Strategy.

### Exemple

```text
Plateau: MayaBank Baseline 2026
```

peut être caractérisé par :

- monolithe Java ;
- Oracle legacy ;
- point-to-point ;
- batch ;
- déploiements manuels ;
- observabilité fragmentée.

---

## 2. Baseline Plateau

La Baseline représente l’état de départ pertinent pour la transformation.

Exemple :

```text
Plateau: Baseline Payments 2026
```

Ce plateau ne doit pas être un inventaire exhaustif du SI.

On y représente seulement les éléments nécessaires pour comprendre :

- pourquoi la transformation est nécessaire ;
- quels gaps existent ;
- quelles dépendances doivent être conservées pendant la transition.

---

## 3. Target Plateau

La Target représente l’état cible relativement stable.

```text
Plateau: Target Payments 2028
```

Exemple :

- API-first ;
- event-driven ;
- OpenShift ;
- GitOps ;
- observabilité end-to-end ;
- legacy retiré ;
- DR industrialisé.

La Target ne doit pas être confondue avec un Goal.

### Goal

```text
Increase resilience and reduce time-to-market
```

### Target Plateau

```text
Architecture state implementing the target operating model and technology stack
```

---

## 4. Transition Plateau

Un `Transition Plateau` représente un état intermédiaire suffisamment stable pour être architecturalement significatif.

Exemple :

```text
Transition Plateau A
Legacy 70%
Target 30%
New API layer active
Kafka active
Dual reconciliation active
```

Puis :

```text
Transition Plateau B
Legacy 20%
Target 80%
Target DB source of truth for new flows
Most batch removed
```

---

## 5. Pourquoi ne pas passer directement Baseline → Target ?

Parce que certaines transformations imposent :

- coexistence ;
- double écriture ;
- synchronisation ;
- adaptateurs temporaires ;
- compatibilité ascendante ;
- data migration ;
- cutover progressif ;
- rollback.

Ces architectures temporaires peuvent être plus complexes que la cible finale.

Les ignorer crée une architecture irréaliste.

---

## 6. Gap

Un `Gap` représente une déclaration de différence entre deux Plateaus.

Le Gap ne décrit pas directement la solution.

### Exemple

Baseline :

```text
No event streaming platform
```

Target :

```text
Enterprise Event Streaming Service
```

Gap :

```text
Missing Event Streaming Capability in current architecture
```

Le Work Package associé pourra ensuite être :

```text
Establish Event Streaming Platform
```

---

## 7. Gap vs Requirement

### Gap

Différence observée entre deux états.

```text
Current platform has no automated failover
```

### Requirement

Propriété que la cible doit satisfaire.

```text
Critical payment service must survive loss of one site within approved RTO/RPO
```

Le Gap aide à expliquer **ce qui manque**.
Le Requirement explique **ce qui doit être vrai**.

---

## 8. Gap vs Assessment

### Assessment

Résultat d’une analyse de la situation.

```text
Legacy platform cannot scale horizontally
```

### Gap

Différence entre Baseline et Target.

```text
Horizontal scalability absent from Baseline compared with Target
```

Un Assessment peut contribuer à identifier un Gap, mais les concepts ne sont pas identiques.

---

## 9. Gap categories

Pour structurer une grande transformation, les gaps peuvent être classés.

### Business gaps

- manual exception handling ;
- fragmented operating model.

### Application gaps

- no orchestration service ;
- duplicated payment rules ;
- no event contracts.

### Technology gaps

- no container platform ;
- no Kafka service ;
- insufficient observability ;
- incomplete HA/DR.

### Governance gaps

- no API standards ;
- no automated architecture compliance ;
- weak ownership model.

---

## 10. Plateau comme architecture state, pas comme release

Un Plateau peut correspondre à une release majeure si cette release définit un état architectural relativement stable.

Mais ce n’est pas obligatoire.

```text
Release 1.4.7
```

n’est pas forcément un Plateau.

```text
Hybrid Operating State — Legacy + Target
```

est beaucoup plus naturellement un Plateau.

---

## 11. Pattern complet

```text
Baseline Plateau
    ↓
Gap G1: no API foundation
Gap G2: no event backbone
Gap G3: no container platform
    ↓
WP1 API Foundation
WP2 Kafka Foundation
WP3 OpenShift Foundation
    ↓
Transition Plateau A
    ↓
Gap G4: legacy still source of truth
    ↓
WP4 Data Migration
WP5 Flow Migration
    ↓
Transition Plateau B
    ↓
WP6 Legacy Decommission
    ↓
Target Plateau
```

---

## 12. Baseline/Target et TOGAF

TOGAF utilise également les notions Baseline, Target et Transition Architectures.

ArchiMate fournit des éléments pour les **visualiser**.

Un `Plateau` est particulièrement adapté pour représenter un état Baseline, Transition ou Target.

Le langage ne remplace pas la méthode TOGAF ; il permet de la rendre visible.

---

## 13. Exemple MayaBank détaillé

### Baseline Plateau

- Legacy Payment Engine
- Batch Settlement Adapter
- Shared Oracle Schema
- Point-to-Point MQ
- Manual Release Process

### Target Plateau

- Payment API
- Payment Orchestrator
- Kafka Event Backbone
- OpenShift
- GitOps
- Observability Platform
- Target Payment Store

### Gaps

1. API exposure gap
2. orchestration gap
3. event integration gap
4. container platform gap
5. observability gap
6. data ownership gap
7. delivery automation gap

### Transition Plateau A

- API facade introduced ;
- legacy engine remains authoritative ;
- new observability active ;
- Kafka available for selected events.

### Transition Plateau B

- new flows use Payment Orchestrator ;
- target DB authoritative for migrated flows ;
- legacy retained for residual products ;
- reconciliation bridge active.

### Target

- legacy retired ;
- all strategic flows migrated ;
- single operating model ;
- full GitOps ;
- DR validated.

---

## 14. Questions de contrôle

1. État stable « legacy + cible » pendant six mois → **Plateau**.
2. Différence « pas de Kafka aujourd’hui, Kafka dans la cible » → **Gap**.
3. « Réduire le coût opérationnel » → **Goal**, pas Plateau.
4. « La cible doit être active-active » → **Requirement**, pas Gap.
5. « Le legacy ne supporte pas l’élasticité » → **Assessment** possible ; formulé comme différence Baseline/Target → **Gap**.
6. `preprod` → généralement environnement technique, pas automatiquement Plateau.

---

## À retenir

> **Plateau = état relativement stable ; Gap = différence entre états.**

La combinaison de plusieurs Plateaus transforme une cible abstraite en **chemin d’architecture réaliste**.