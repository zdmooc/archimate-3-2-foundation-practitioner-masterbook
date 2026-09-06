# ArchiMate 3.2 — Foundation & Practitioner Masterbook

> **Comprendre, lire, modéliser et expliquer une architecture d’entreprise avec ArchiMate 3.2.**

Ce livre est consacré au langage **ArchiMate 3.2** : sa structure, ses éléments, ses relations, ses vues, ses viewpoints et son utilisation dans des architectures réelles.

Il part des concepts fondamentaux et va jusqu’à la modélisation cross-layer, aux transformations d’entreprise, aux architectures cloud, aux systèmes de paiement et à la préparation Foundation / Practitioner.

Le cas fil rouge **MayaBank** représente une banque fictive qui modernise sa plateforme de paiements, ses applications, ses données et son infrastructure.

---

## Table des matières

### Partie I — Fondations du langage

1. [Pourquoi ArchiMate ?](01-foundations/01-why-archimate.md)
2. [Architecture d’entreprise et modélisation](01-foundations/02-enterprise-architecture-and-modeling.md)
3. [Structure du langage ArchiMate](01-foundations/03-language-structure.md)
4. [Couches et aspects](01-foundations/04-layers-and-aspects.md)
5. [Éléments, relations, vues et viewpoints](01-foundations/05-elements-relations-views-viewpoints.md)
6. [Lire un modèle ArchiMate](01-foundations/06-reading-an-archimate-model.md)
7. [ArchiMate et TOGAF](01-foundations/07-archimate-and-togaf.md)

### Partie II — Métamodèle et concepts génériques

1. [Le métamodèle générique](02-metamodel/01-generic-metamodel.md)
2. [Active Structure, Behavior et Passive Structure](02-metamodel/02-active-behavior-passive-structure.md)
3. [Internal, External et Interface](02-metamodel/03-internal-external-interface.md)

### Partie III — Motivation

1. [Vue d’ensemble — du pourquoi à l’exigence](03-motivation/00-overview.md)
2. [Stakeholder, Driver et Assessment](03-motivation/01-stakeholder-driver-assessment.md)
3. [Goal et Outcome](03-motivation/02-goal-outcome.md)
4. [Principle, Requirement et Constraint](03-motivation/03-principle-requirement-constraint.md)
5. [Meaning et Value](03-motivation/04-meaning-value.md)
6. [Modèle Motivation complet MayaBank](03-motivation/05-motivation-complete-pattern.md)

Concepts couverts : **Stakeholder, Driver, Assessment, Goal, Outcome, Principle, Requirement, Constraint, Meaning, Value**.

### Partie IV — Strategy

1. [Vue d’ensemble — Strategy](04-strategy/00-overview.md)
2. [Resource](04-strategy/01-resource.md)
3. [Capability](04-strategy/02-capability.md)
4. [Value Stream](04-strategy/03-value-stream.md)
5. [Course of Action](04-strategy/04-course-of-action.md)
6. [Modèle Strategy complet MayaBank](04-strategy/05-strategy-complete-pattern.md)

Concepts couverts : **Resource, Capability, Value Stream, Course of Action**.

### Partie V — Business Layer

- Actors, Roles, Collaborations, Interfaces
- Processes, Functions, Interactions, Events, Services
- Business Objects, Contracts, Representations, Products

### Partie VI — Application Layer

- Components, Collaborations, Interfaces
- Functions, Processes, Interactions, Events, Services
- Data Objects

### Partie VII — Technology Layer

- Nodes, Devices, System Software
- Technology Collaborations, Interfaces, Paths, Networks
- Functions, Processes, Interactions, Events, Services
- Artifacts

### Partie VIII — Physical Layer

- Equipment
- Facility
- Distribution Network
- Material

### Partie IX — Implementation & Migration

- Work Package
- Deliverable
- Implementation Event
- Plateau
- Gap

### Partie X — Relations ArchiMate

- Composition
- Aggregation
- Assignment
- Realization
- Serving
- Access
- Influence
- Triggering
- Flow
- Specialization
- Association
- Junctions
- Derived Relationships

### Partie XI — Views & Viewpoints

- Stakeholders et concerns
- View vs Viewpoint
- Layered Viewpoint
- Motivation Viewpoint
- Strategy Viewpoint
- Business Process Cooperation
- Application Cooperation
- Application Usage
- Technology
- Implementation & Migration
- Project / Migration / Capability / Outcome-oriented views

### Partie XII — Patterns de modélisation

- Actor vs Role
- Process vs Function
- Service vs Function
- Capability vs Application
- Interface vs Service
- Node vs Device vs System Software
- Business Object vs Data Object vs Artifact
- Composition vs Aggregation
- Serving vs Realization
- Triggering vs Flow
- Cross-layer modeling
- Derived relationships
- Patterns et anti-patterns

### Partie XIII — TOGAF ↔ ArchiMate

- Architecture Vision
- Business Architecture
- Data Architecture
- Application Architecture
- Technology Architecture
- Opportunities & Solutions
- Migration Planning
- Implementation Governance
- Architecture Change Management

### Partie XIV — MayaBank : modèle d’entreprise complet

- Drivers et objectifs
- Capabilities
- Value streams
- Business architecture
- Data & information
- Application architecture
- Event-driven payment platform
- API architecture
- Technology / OpenShift / Cloud
- Security
- Observability
- Baseline, Target et Transition
- Work Packages, Plateaus et Gaps
- Modèle ArchiMate complet

### Partie XV — Use cases professionnels

- Instant Payment
- API Banking
- Kafka / Event Streaming
- Cloud migration
- OpenShift / Kubernetes
- IAM
- Fraud & Risk
- Data Platform
- Observability
- Multi-site / Disaster Recovery
- GenAI Platform
- Green IT

### Partie XVI — Archi et modélisation pratique

- Construire un modèle
- Créer des vues
- Organiser un modèle complexe
- Import / export
- Collaboration
- Analyse du modèle

### Partie XVII — ArchiMate as Code

- PlantUML
- Git
- Documentation automatisée
- Validation
- CI/CD documentaire

### Partie XVIII — Foundation Question Bank

- Questions de connaissance
- Questions de discrimination
- Pièges de relations
- Pièges d’éléments
- Mini-cas

### Partie XIX — Practitioner Scenario Bank

- Choix du bon élément
- Choix de la bonne relation
- Choix du bon viewpoint
- Correction de modèles
- Cross-layer scenarios
- Transformation scenarios

### Partie XX — Mock Exams

- Foundation
- Practitioner
- Corrections détaillées

### Partie XXI — Cheat Sheets

- Éléments
- Relations
- Layers
- Viewpoints
- Confusions fréquentes
- Révision finale

### Partie XXII — English for Enterprise Architects

- Explain a model
- Describe relationships
- Present an architecture
- Defend modeling choices
- Interview questions

### Partie XXIII — Glossaire

Glossaire français / anglais de tous les concepts ArchiMate.

### Partie XXIV — Références officielles

Références et mapping avec **ArchiMate Specification 3.2**, Foundation et Practitioner.

---

## La chaîne mentale à retenir

```text
WHY
Motivation
   ↓
WHAT WE MUST BE ABLE TO DO
Strategy / Capabilities / Value Streams
   ↓
WHAT THE BUSINESS DOES
Business
   ↓
HOW APPLICATIONS SUPPORT IT
Application
   ↓
WHERE IT RUNS
Technology / Physical
   ↓
HOW WE MOVE FROM BASELINE TO TARGET
Implementation & Migration
```

ArchiMate permet de relier ces niveaux dans **un modèle cohérent**, au lieu de produire une collection de schémas indépendants.
