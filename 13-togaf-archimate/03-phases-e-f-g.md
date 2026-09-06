# Phases E, F et G — Opportunities & Solutions, Migration Planning et Implementation Governance

Les phases E, F et G transforment l'architecture cible en trajectoire de réalisation gouvernée.

## 1. Phase E — Opportunities & Solutions

Questions :
- quelles options permettent de réaliser la cible ?
- quels gaps faut-il traiter ?
- quels work packages ?
- quelles Transition Architectures ?
- quelles dépendances entre initiatives ?

Concepts ArchiMate :

```text
Gap
Course of Action
Work Package
Plateau
Deliverable
```

Pattern MayaBank :

```text
Gap: No Event Backbone
Course of Action: Adopt Event-Driven Integration
Work Package: Build Kafka Platform
Deliverable: Production Event Streaming Platform
Plateau: Hybrid Payments Architecture
```

### E ≠ F

Phase E identifie principalement **comment la cible peut être réalisée** et structure les solutions/initiatives.

Phase F décide **dans quel ordre, avec quelles priorités et dépendances** la migration sera exécutée.

## 2. Phase F — Migration Planning

Questions :
- quel work package en premier ?
- quelles dépendances ?
- quelles vagues ?
- quels plateaus intermédiaires ?
- quels risques de coexistence ?

Concepts :

```text
Work Package
Deliverable
Implementation Event
Plateau
Gap
```

Exemple :

```text
WP1 Build OpenShift Foundation
   ↓
Event: Platform Production Ready
   ↓
WP2 Build Event Streaming
   ↓
Plateau: Target Foundations Available
   ↓
WP3 Migrate Instant Payments
   ↓
Plateau: Hybrid Payments
   ↓
WP4 Decommission Legacy
   ↓
Plateau: Target Payments Architecture
```

## 3. Phase G — Implementation Governance

Phase G ne signifie pas que l'architecte « exécute le projet ». Elle vise à maintenir la conformité entre l'architecture approuvée et l'implémentation.

ArchiMate peut aider à tracer :

```text
Requirement
→ Architecture Element
→ Work Package
→ Deliverable
→ Implemented Element
```

Exemple :

```text
Requirement: All Payment APIs Observable
→ Application Service: Payment API Service
→ Work Package: Implement Distributed Observability
→ Deliverable: Production Observability Controls
```

Une vue de conformité peut mettre en évidence :
- exigence couverte ;
- exigence non couverte ;
- déviation ;
- élément impacté ;
- lot correctif.

## 4. Architecture Contract et conformité

ArchiMate ne remplace pas l'Architecture Contract TOGAF.

Il peut cependant fournir des vues utiles à la gouvernance :
- Requirements Traceability View ;
- Implementation View ;
- Deployment View ;
- Layered compliance view ;
- gap/deviation view.

## 5. Exemple MayaBank — déviation

Architecture approuvée :

```text
Requirement: Event Contracts Must Be Versioned
Target: Schema Registry + governed event schemas
```

Implémentation observée :

```text
Producer publishes ungoverned JSON payload
```

La vue peut montrer :

```text
Requirement
→ Target Event Service
→ Work Package
→ Deliverable

Observed Implementation
→ Gap / deviation identified through governance process
```

Le statut de déviation/waiver appartient au processus de gouvernance ; ne pas inventer un type d'élément ArchiMate « Waiver ».

## 6. Questions de discrimination

### Q1
Choix des grands work packages et options ?

**Phase E.**

### Q2
Priorisation et séquencement détaillé de la migration ?

**Phase F.**

### Q3
Contrôle de conformité pendant l'implémentation ?

**Phase G.**

### Q4
Un Work Package est-il un Course of Action ?

Non. **Course of Action = direction stratégique ; Work Package = ensemble de travaux de réalisation.**

## À retenir

> **E structure les options et lots, F construit la trajectoire, G maintient la conformité entre décision d'architecture et réalisation.**