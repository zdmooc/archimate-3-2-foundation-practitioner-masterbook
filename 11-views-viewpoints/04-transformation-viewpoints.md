# Transformation, Implementation & Migration Viewpoints

Les vues de transformation expliquent **comment l’architecture évolue dans le temps**. Elles sont indispensables lorsqu’une cible ne peut pas être atteinte en une seule étape.

---

## 1. Implementation & Migration Viewpoint

Questions :

- quels work packages produisent quels deliverables ?
- quels événements marquent les changements d’état ?
- quels plateaus successifs existent ?
- quels gaps sont traités ?

Exemple MayaBank :

```text
Gap: No Event Backbone
↓ addressed by
Work Package: Build Kafka Platform
↓ produces
Deliverable: Production Event Streaming Platform
↓ enables
Plateau: Hybrid Payment Architecture
```

---

## 2. Project Viewpoint

Ce viewpoint permet de montrer les projets/work packages et leurs relations avec des objectifs ou éléments d’architecture.

Exemple :

```text
Goal: Reduce Payment Latency
↓
Work Package: Implement Payment Orchestrator
↓
Deliverable: Payment Orchestrator R1
```

Il reste architectural : il ne remplace pas un planning projet détaillé.

---

## 3. Migration Viewpoint

Question :

> Quels plateaus et gaps structurent le passage du présent vers la cible ?

Exemple :

```text
Baseline Plateau
   ↓ Gap A
Transition Plateau 1
   ↓ Gap B
Transition Plateau 2
   ↓ Gap C
Target Plateau
```

Cette vue est excellente pour expliquer la coexistence legacy/cible.

---

## 4. Roadmap View

Une roadmap peut être construite en combinant :

- Work Packages ;
- Implementation Events ;
- Plateaus ;
- Gaps ;
- éventuellement Goals/Outcomes.

Exemple :

```text
2026 H2
Build OpenShift Foundation
Build Kafka Foundation

2027 H1
Payment Orchestrator Pilot
Wave 1 Migration

2027 H2
Corporate Flow Migration
Legacy Read-Only

2028
Legacy Decommissioned
Target Plateau
```

---

## 5. Baseline / Target comparison

Une bonne vue de comparaison ne consiste pas à juxtaposer deux gros diagrammes sans explication.

Elle doit rendre visibles :

- ce qui est conservé ;
- ce qui est supprimé ;
- ce qui est ajouté ;
- ce qui change de responsabilité ;
- ce qui change de technologie ;
- les gaps associés.

Exemple :

```text
BASELINE
Monolith
Point-to-point
Manual deployment

TARGET
Payment Orchestrator
Kafka
GitOps
OpenShift
```

---

## 6. Vue cutover

Audience : architecture + programme + exploitation.

Elle peut montrer :

```text
Before Event
Legacy = 100%

Implementation Event
Wave 1 Cutover

After Event / Plateau
Legacy = 70%
Target = 30%
```

Puis le mécanisme de rollback et les dépendances temporaires.

---

## 7. Vue décommissionnement

Elle répond à une question souvent oubliée :

> Quand peut-on réellement supprimer le legacy ?

Éléments utiles :

- Work Package: Decommission Legacy Platform ;
- Deliverable: Legacy Retirement Evidence ;
- Implementation Event: Legacy Shutdown Completed ;
- Plateau: Target Only ;
- Goals Green IT / simplification ;
- Nodes/Facilities éventuellement concernés.

---

## 8. Lien TOGAF

### Phase E

Vues utiles :

- options de réalisation ;
- work packages ;
- transition architectures ;
- gaps.

### Phase F

Vues utiles :

- séquencement ;
- dépendances ;
- roadmap ;
- plateaus.

### Phase G

Vues utiles :

- conformité ;
- requirements-to-deliverables ;
- architecture implemented vs target.

---

## 9. Pièges

- confondre Plateau avec environnement Dev/Test/Prod ;
- confondre Work Package avec tâche Jira ;
- confondre Deliverable avec Artifact ;
- montrer une roadmap sans architecture cible ;
- montrer la cible sans transition ;
- oublier les éléments temporaires de coexistence.

---

## À retenir

> **Une vue de transformation doit montrer les états, les écarts, les travaux et les jalons qui rendent la cible réalisable.**
