# Partie IX — Implementation & Migration : représenter le passage du présent vers la cible

La couche **Implementation & Migration** sert à représenter la transformation : ce qui doit être réalisé, les résultats attendus, les jalons significatifs, les états relativement stables de l’architecture et les écarts entre ces états.

Elle répond à cinq questions essentielles :

- **Quel ensemble de travaux doit être exécuté ?** → `Work Package`
- **Quel résultat précisément défini doit être produit ?** → `Deliverable`
- **Quel événement marque un changement d’état d’implémentation ?** → `Implementation Event`
- **Quel état relativement stable de l’architecture existe à un moment donné ?** → `Plateau`
- **Quelle différence existe entre deux états ?** → `Gap`

---

## 1. Pourquoi cette couche est indispensable

Une architecture cible n’a de valeur que si l’organisation sait passer de la situation actuelle à cette cible.

Un schéma qui montre uniquement :

```text
Baseline → Target
```

est insuffisant pour une transformation complexe.

Il faut souvent montrer :

```text
Baseline Plateau
   ↓ Gap
Work Packages
   ↓ Deliverables / Implementation Events
Transition Plateau 1
   ↓ Gap
Work Packages
   ↓
Transition Plateau 2
   ↓
Target Plateau
```

Cette représentation permet de répondre aux questions de programme :

- que change-t-on en premier ?
- quelles dépendances existent ?
- quels systèmes coexistent temporairement ?
- quand le nouveau service devient-il actif ?
- quand le legacy peut-il être arrêté ?
- quel état reste stable entre deux vagues ?
- comment un rollback est-il possible ?

---

## 2. La chaîne mentale Implementation & Migration

```text
WHERE ARE WE?
Baseline Plateau
        ↓
WHAT IS DIFFERENT?
Gap
        ↓
WHAT DO WE DO?
Work Package
        ↓
WHAT DO WE PRODUCE?
Deliverable
        ↓
WHAT CHANGES STATE?
Implementation Event
        ↓
WHAT STABLE STATE DO WE REACH?
Transition / Target Plateau
```

Il s’agit d’un raisonnement pédagogique, pas d’une contrainte imposant un enchaînement unique de relations.

---

## 3. Exemple MayaBank

MayaBank possède une plateforme de paiement legacy :

- monolithe Java ;
- traitements batch ;
- base Oracle fortement couplée ;
- intégrations point-à-point ;
- faible observabilité ;
- déploiements manuels.

La cible prévoit :

- APIs contract-first ;
- Payment Orchestrator ;
- event streaming Kafka ;
- OpenShift ;
- observabilité distribuée ;
- GitOps ;
- migration progressive ;
- coexistence avec le legacy pendant plusieurs mois.

### Plateau 0 — Baseline

```text
Legacy Payment Platform
Point-to-point Integration
Manual Deployment
Legacy Oracle Schema
```

### Gap

```text
No real-time orchestration
No event backbone
No standardized API layer
No container platform
No end-to-end observability
```

### Work Packages

```text
WP1 Build OpenShift Platform
WP2 Establish API Foundation
WP3 Establish Event Streaming Platform
WP4 Build Payment Orchestrator
WP5 Migrate Payment Flows Wave 1
WP6 Migrate Remaining Flows
WP7 Decommission Legacy Platform
```

### Transition Plateau

```text
Legacy + Target coexist
New API layer active
Kafka available
Some payment flows on OpenShift
Legacy remains source for selected functions
```

### Target Plateau

```text
All strategic flows on target platform
Legacy payment engine retired
GitOps standard
Central observability
Event-driven integration
```

---

## 4. Pourquoi un Transition Plateau est important

Une transformation réelle n’est souvent ni instantanée ni binaire.

Pendant plusieurs mois, MayaBank peut avoir :

- deux moteurs de paiement ;
- deux modèles de données ;
- deux mécanismes d’intégration ;
- synchronisation temporaire ;
- routage différencié selon les flux ;
- mécanisme de rollback.

Cet état est architecturalement significatif.

Il mérite donc d’être représenté comme un **Plateau**, plutôt que d’être caché dans un planning projet.

---

## 5. Implementation & Migration n’est pas Project Management

ArchiMate permet de représenter la transformation à un niveau architectural.

Il ne remplace pas :

- Jira ;
- Microsoft Project ;
- backlog Scrum ;
- Gantt détaillé ;
- plan de charge ;
- gestion financière complète ;
- gestion des dépendances jour par jour.

Le modèle doit montrer ce qui est architecturalement significatif.

### Bon niveau

```text
Work Package: Migrate Instant Payment Flow
Deliverable: Production-ready Payment Orchestrator
Implementation Event: Wave 1 Cutover Completed
Plateau: Hybrid Payments Architecture
```

### Trop détaillé

```text
Task: update Helm value line 42
Task: create Jira subtask OPS-18329
Task: restart pod at 10:15
```

---

## 6. Liens avec les autres couches

La force de cette couche est la traçabilité.

```text
Driver
→ Goal
→ Capability
→ Business / Application / Technology Target
→ Gap
→ Work Package
→ Deliverable
→ Plateau
```

Ainsi, une migration n’est pas seulement une liste de projets : elle reste reliée à la raison métier du changement.

---

## 7. Les cinq confusions majeures

| Confusion | Distinction |
|---|---|
| Work Package vs Course of Action | Course of Action = direction stratégique ; Work Package = travail d’implémentation concret |
| Deliverable vs Artifact | Deliverable = résultat de travail ; Artifact = élément technologique déployable/physique |
| Implementation Event vs Application Event | événement de transformation vs changement d’état applicatif |
| Plateau vs Environment | état global relativement stable de l’architecture vs environnement technique |
| Gap vs Requirement | différence entre états vs propriété nécessaire à satisfaire |

---

## 8. Baseline, Transition et Target

`Baseline`, `Transition` et `Target` ne sont pas trois types d’éléments distincts du langage.

Ils peuvent être représentés au moyen de `Plateau` lorsqu’on veut montrer des états d’architecture relativement stables.

```text
Plateau: Baseline 2026
Plateau: Transition A — Hybrid Payments
Plateau: Transition B — Target Core Active
Plateau: Target 2028
```

---

## 9. Questions de contrôle

### Q1
+« Construire la plateforme OpenShift cible » ?

**Work Package**, si l’on parle d’un ensemble de travaux de transformation.

### Q2
+« Plateforme OpenShift validée pour la production » ?

**Deliverable**, si l’on représente un résultat précisément défini produit par les travaux.

### Q3
+« Cutover Wave 1 terminé » ?

**Implementation Event**, s’il marque un changement d’état significatif de l’implémentation.

### Q4
+« Legacy et cible coexistent avec routage 30/70 » ?

**Plateau**, si cet état est relativement stable et architecturalement significatif.

### Q5
+« La cible dispose d’un event backbone alors que la baseline n’en possède pas » ?

**Gap**, si l’on exprime la différence entre les deux états.

---

## À retenir

> **Implementation & Migration transforme l’architecture cible en chemin de transformation explicite.**

Le modèle doit permettre de comprendre **où l’on est, ce qui manque, ce que l’on construit, ce que l’on produit, quels jalons changent l’état et quels plateaus successifs conduisent à la cible**.