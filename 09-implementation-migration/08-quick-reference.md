# Quick Reference — Implementation & Migration

## Les 5 éléments

| Élément | Question | Exemple MayaBank |
|---|---|---|
| Work Package | Quel travail exécuter ? | Migrate Retail Payments |
| Deliverable | Quel résultat est produit ? | Retail Migration Release |
| Implementation Event | Quel changement d’état survient ? | Retail Cutover Completed |
| Plateau | Quel état stable existe ? | Hybrid Payments Plateau |
| Gap | Quelle différence existe entre deux états ? | No Event Backbone |

---

## Mnémotechnique

```text
GAP = what is missing
WORK PACKAGE = what we do
DELIVERABLE = what we produce
EVENT = what changes state
PLATEAU = where the architecture stabilizes
```

---

## Baseline / Transition / Target

```text
Baseline Plateau
   ↓ Gap
Work Package
   ↓
Transition Plateau
   ↓ Gap
Work Package
   ↓
Target Plateau
```

`Baseline`, `Transition` et `Target` sont des rôles joués par des états d’architecture ; `Plateau` est l’élément ArchiMate adapté pour les représenter.

---

## Confusions

### Work Package vs Course of Action

- Course of Action = direction stratégique.
- Work Package = travail d’implémentation.

### Deliverable vs Artifact

- Deliverable = résultat de transformation.
- Artifact = élément technologique concret/déployable.

### Implementation Event vs Application Event

- Implementation Event = changement d’état de transformation.
- Application Event = changement d’état applicatif.

### Plateau vs Environment

- Plateau = état global relativement stable.
- Environment = dev/test/prod ou contexte technique ; pas automatiquement Plateau.

### Gap vs Requirement

- Gap = différence entre états.
- Requirement = propriété à satisfaire.

### Gap vs Assessment

- Assessment = diagnostic.
- Gap = différence entre Baseline et Target.

---

## TOGAF

```text
Phase E
Identify implementation options
Identify Work Packages
Define Transition Architectures
Initial Roadmap

Phase F
Prioritize
Sequence
Dependencies
Migration Plan

Phase G
Govern implementation
Check architecture compliance
Trace requirements to deliverables
```

Mémo :

```text
E = WHAT TO IMPLEMENT
F = IN WHAT ORDER
G = GOVERN THE DELIVERY
```

---

## Migration patterns

### Big Bang

Un cutover majeur unique.

### Waves

Plusieurs Work Packages de migration.

### Strangler

Remplacement progressif du legacy.

### Parallel Run

Legacy et cible opèrent temporairement en parallèle.

### Blue/Green / Canary

Peuvent créer des états transitoires modélisables si architecturalement significatifs.

---

## Data migration

```text
Legacy authoritative
→ synchronized target
→ target authoritative
→ legacy read-only
→ legacy retired
```

Les bascules d’autorité peuvent être des `Implementation Events`.
Les états peuvent être des `Plateaus`.

---

## Rollback

Pas d’élément spécifique `Rollback`.

Utiliser selon le concern :

- Requirement ;
- Deliverable ;
- Work Package ;
- Implementation Event ;
- Plateau.

---

## Decommission

Toujours montrer :

- Work Package de sortie ;
- dépendances résiduelles ;
- data retention/archive ;
- arrêt des writes ;
- read-only éventuel ;
- shutdown final ;
- Target Plateau sans legacy.

---

## MayaBank en une ligne

```text
P0 Legacy
→ Platform Foundation
→ P1 Foundation
→ Payment Core + Pilot
→ P2 Hybrid
→ Migration Waves
→ P3 Target Majority
→ Legacy Exit
→ P4 Target
```

---

## 10 questions express

1. Travail ? → **Work Package**.
2. Résultat livré ? → **Deliverable**.
3. Jalon qui change l’état ? → **Implementation Event**.
4. État stable ? → **Plateau**.
5. Différence entre états ? → **Gap**.
6. Direction stratégique ? → **Course of Action**.
7. Propriété obligatoire ? → **Requirement**.
8. Objet déployable ? → **Artifact**.
9. Diagnostic ? → **Assessment**.
10. Transition Architecture ? → souvent **Plateau**.

---

## Test Practitioner

Avant de valider une vue, pouvoir expliquer :

```text
WHY this change?
WHAT gap?
WHICH work package?
WHAT deliverable?
WHICH event changes state?
WHICH plateau follows?
HOW do we rollback?
WHEN is legacy removed?
```

Si ces réponses ne sont pas visibles ou traçables, la vue de transformation est probablement incomplète.