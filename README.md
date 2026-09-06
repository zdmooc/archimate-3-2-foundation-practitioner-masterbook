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

1. [Vue d’ensemble — Business Layer](05-business-layer/00-overview.md)
2. [Active Structure — Actor, Role, Collaboration, Interface](05-business-layer/01-active-structure.md)
3. [Behavior — Process, Function, Interaction, Event, Service](05-business-layer/02-behavior.md)
4. [Passive Structure & Product — Object, Representation, Contract, Product](05-business-layer/03-passive-structure-product.md)
5. [Confusions critiques et méthode de choix](05-business-layer/04-business-confusions.md)
6. [Patterns de relations Business](05-business-layer/05-business-relationship-patterns.md)
7. [Construire une Business Architecture de qualité](05-business-layer/06-business-architecture-method.md)
8. [MayaBank — Business Architecture complète](05-business-layer/07-mayabank-business-architecture.md)
9. [Exercices et corrections](05-business-layer/08-exercises-and-corrections.md)

Concepts couverts : **Business Actor, Business Role, Business Collaboration, Business Interface, Business Process, Business Function, Business Interaction, Business Event, Business Service, Business Object, Contract, Representation, Product**.

### Partie VI — Application Layer

1. [Vue d’ensemble — Application Layer](06-application-layer/00-overview.md)
2. [Active Structure — Component, Collaboration, Interface](06-application-layer/01-active-structure.md)
3. [Behavior — Function, Process, Interaction, Event, Service](06-application-layer/02-behavior.md)
4. [Data Object — donnée logique et réalisations](06-application-layer/03-data-object.md)
5. [APIs et microservices](06-application-layer/04-api-and-microservices.md)
6. [Event-Driven Architecture et Kafka](06-application-layer/05-event-driven-kafka.md)
7. [Business ↔ Application Mapping](06-application-layer/06-business-application-mapping.md)
8. [Construire une Application Architecture de qualité](06-application-layer/07-application-architecture-method.md)
9. [MayaBank — Application Architecture complète](06-application-layer/08-mayabank-application-architecture.md)
10. [Exercices et corrections](06-application-layer/09-exercises-and-corrections.md)
11. [Quick Reference Application Layer](06-application-layer/10-quick-reference.md)
12. [Practitioner Checklist Application Layer](06-application-layer/11-practitioner-checklist.md)

Concepts couverts : **Application Component, Application Collaboration, Application Interface, Application Function, Application Process, Application Interaction, Application Event, Application Service, Data Object**, avec API, microservices, event-driven/Kafka, data mapping, Baseline/Target et transitions.

### Partie VII — Technology Layer

À venir : Nodes, Devices, System Software, Collaborations, Interfaces, Paths, Networks, Functions, Processes, Interactions, Events, Services et Artifacts.

### Partie VIII — Physical Layer

À venir : Equipment, Facility, Distribution Network et Material.

### Partie IX — Implementation & Migration

À venir : Work Package, Deliverable, Implementation Event, Plateau et Gap.

### Partie X — Relations ArchiMate

Composition, Aggregation, Assignment, Realization, Serving, Access, Influence, Triggering, Flow, Specialization, Association, Junctions et Derived Relationships.

### Partie XI — Views & Viewpoints

Stakeholders et concerns, View vs Viewpoint, Layered, Motivation, Strategy, Business, Application, Technology et Implementation & Migration viewpoints.

### Partie XII — Patterns de modélisation

Actor vs Role, Process vs Function, Service vs Function, Capability vs Application, Interface vs Service, Node vs Device vs System Software, Business Object vs Data Object vs Artifact, relations et cross-layer modeling.

### Partie XIII — TOGAF ↔ ArchiMate

Architecture Vision, Business, Data, Application, Technology, Opportunities & Solutions, Migration Planning, Implementation Governance et Change Management.

### Partie XIV — MayaBank : modèle d’entreprise complet

Drivers, Capabilities, Value Streams, Business, Data, Application, Event Streaming, API, Technology/OpenShift/Cloud, Security, Observability, Baseline, Target, Transition, Work Packages, Plateaus et Gaps.

### Partie XV — Use cases professionnels

Instant Payment, API Banking, Kafka/Event Streaming, Cloud Migration, OpenShift/Kubernetes, IAM, Fraud & Risk, Data Platform, Observability, Multi-site/DR, GenAI Platform et Green IT.

### Partie XVI — Archi et modélisation pratique

Construire des modèles et vues, organiser un modèle complexe, import/export, collaboration et analyse.

### Partie XVII — ArchiMate as Code

PlantUML, Git, documentation automatisée, validation et CI/CD documentaire.

### Partie XVIII — Foundation Question Bank

Questions de connaissance, discrimination, relations, éléments et mini-cas.

### Partie XIX — Practitioner Scenario Bank

Choix du bon élément, relation, viewpoint, correction de modèles, cross-layer et transformations.

### Partie XX — Mock Exams

Foundation, Practitioner et corrections détaillées.

### Partie XXI — Cheat Sheets

Éléments, relations, layers, viewpoints, confusions fréquentes et révision finale.

### Partie XXII — English for Enterprise Architects

Explain a model, describe relationships, present an architecture, defend modeling choices et interview questions.

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
