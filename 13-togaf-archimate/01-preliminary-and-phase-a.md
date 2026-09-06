# Preliminary + Phase A — Architecture Capability et Architecture Vision

Les premiers travaux TOGAF préparent le terrain : qui gouverne l'architecture, pourquoi l'entreprise change, quelle vision doit aligner les acteurs et quelles capacités sont nécessaires.

## 1. Preliminary Phase

Questions :
- quelle capacité d'architecture faut-il ?
- quels rôles et responsabilités ?
- quels principes ?
- quelles contraintes de gouvernance ?
- quels standards et règles ?

Concepts ArchiMate utiles :

```text
Stakeholder
Business Actor / Business Role
Capability
Resource
Principle
Requirement
Constraint
```

Exemple MayaBank :

```text
Stakeholder: CIO
Stakeholder: Head of Payments
Business Role: Enterprise Architect
Capability: Architecture Governance
Principle: API Contract First
Principle: Observable by Default
Constraint: EU Data Residency
```

ArchiMate peut montrer qui porte quoi, quels principes influencent les choix et quelles capacités d'architecture doivent être présentes.

## 2. Architecture Vision — Phase A

Questions :
- pourquoi changer ?
- quels stakeholders ?
- quels drivers ?
- quels objectifs ?
- quelles capacités sont impactées ?
- quelle cible de haut niveau ?

Pattern :

```text
Stakeholder
→ Driver
→ Assessment
→ Goal
→ Outcome
→ Requirement
→ Capability
→ High-Level Target Architecture
```

Exemple :

```text
Driver: Instant Payment Regulation
Assessment: Legacy architecture cannot guarantee target latency
Goal: Compliant Real-Time Payments
Outcome: 99.99% payment availability
Requirement: Payment decision under target latency
Capability: Real-Time Payment Processing
```

## 3. Vues utiles

- Motivation View
- Stakeholder View
- Strategy View
- Capability View
- Value Stream View
- Layered Executive View

## 4. Ce qu'une bonne Vision doit éviter

- diagramme technique trop détaillé ;
- 50 applications dès la première vue ;
- objectifs non reliés aux drivers ;
- capabilities remplacées par des noms d'applications ;
- cible sans baseline ni problème explicite.

## 5. MayaBank — vue exécutive

```text
Instant Payment Regulation
        ↓
Legacy Cannot Meet Real-Time SLAs
        ↓
Compliant Real-Time Payments
        ↓
Real-Time Payment Processing Capability
        ↓
Target Payment Platform
        ↓
OpenShift + API + Event Streaming
```

La vue reste volontairement abstraite : l'objectif de Phase A est d'aligner la direction avant d'entrer dans les détails des phases B–D.

## Questions

### Q1
Quel concept ArchiMate représente une force qui motive le changement ?

**Driver.**

### Q2
Quel concept représente un résultat d'analyse de la situation ?

**Assessment.**

### Q3
Quel concept convient pour représenter « Real-Time Payment Processing » comme aptitude stratégique ?

**Capability.**

### Q4
Faut-il mettre les pods OpenShift dans la vue exécutive Phase A ?

En général **non**, sauf si un concern spécifique le justifie.

## À retenir

> **Preliminary organise la capacité d'architecture ; Phase A transforme drivers et assessments en vision, objectifs et capacités de haut niveau.**