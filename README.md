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

1. [Vue d’ensemble — Technology Layer](07-technology-layer/00-overview.md)
2. [Active Structure — Node, Device, System Software](07-technology-layer/01-active-structure.md)
3. [Connectivity — Collaboration, Interface, Path, Communication Network](07-technology-layer/02-connectivity.md)
4. [Behavior — Function, Process, Interaction, Event, Service](07-technology-layer/03-behavior.md)
5. [Artifact & Deployment](07-technology-layer/04-artifact-and-deployment.md)
6. [OpenShift & Kubernetes](07-technology-layer/05-openshift-kubernetes.md)
7. [Data, Database, Messaging & Platform Services](07-technology-layer/06-data-messaging-platforms.md)
8. [Cloud, Security, Observability, HA & DR](07-technology-layer/07-cloud-security-observability-ha-dr.md)
9. [Application ↔ Technology Mapping](07-technology-layer/08-application-technology-mapping.md)
10. [Construire une Technology Architecture de qualité](07-technology-layer/09-technology-architecture-method.md)
11. [MayaBank — Technology Architecture complète](07-technology-layer/10-mayabank-technology-architecture.md)
12. [Exercices et corrections — 60 cas](07-technology-layer/11-exercises-and-corrections.md)
13. [Quick Reference Technology Layer](07-technology-layer/12-quick-reference.md)

Concepts couverts : **Node, Device, System Software, Technology Collaboration, Technology Interface, Path, Communication Network, Technology Function, Technology Process, Technology Interaction, Technology Event, Technology Service, Artifact**, avec OpenShift/Kubernetes, Kafka, PostgreSQL/Oracle/Exadata, cloud, IAM, secrets, observability, HA/DR, GitOps et deployment mapping.

### Partie VIII — Physical Layer

1. [Vue d’ensemble — Physical Layer](08-physical-layer/00-overview.md)
2. [Equipment, Facility, Distribution Network, Material](08-physical-layer/01-elements.md)
3. [Modéliser un datacenter](08-physical-layer/02-datacenter-modeling.md)
4. [Physical Layer, énergie et Green IT](08-physical-layer/03-green-it.md)
5. [Construire une Physical Architecture de qualité](08-physical-layer/04-physical-architecture-method.md)
6. [MayaBank — Physical Architecture complète](08-physical-layer/05-mayabank-physical-architecture.md)
7. [Exercices et corrections — 60 cas](08-physical-layer/06-exercises-and-corrections.md)
8. [Quick Reference Physical Layer](08-physical-layer/07-quick-reference.md)
9. [Practitioner Checklist Physical Layer](08-physical-layer/08-practitioner-checklist.md)

Concepts couverts : **Equipment, Facility, Distribution Network, Material**, avec Device↔Equipment, Communication Network↔Distribution Network, datacenter, énergie, refroidissement, résilience multi-site et Green IT.

### Partie IX — Implementation & Migration

1. [Vue d’ensemble — du présent vers la cible](09-implementation-migration/00-overview.md)
2. [Work Package, Deliverable et Implementation Event](09-implementation-migration/01-work-package-deliverable-event.md)
3. [Plateau, Gap, Baseline, Transition et Target](09-implementation-migration/02-plateau-gap-baseline-target.md)
4. [Roadmap, vagues, cutover, rollback et décommissionnement](09-implementation-migration/03-roadmap-cutover-rollback.md)
5. [TOGAF Phases E/F/G ↔ Implementation & Migration](09-implementation-migration/04-togaf-e-f-g.md)
6. [Construire une Implementation & Migration Architecture de qualité](09-implementation-migration/05-implementation-migration-method.md)
7. [MayaBank — Implementation & Migration complète](09-implementation-migration/06-mayabank-implementation-migration.md)
8. [Exercices et corrections — 60 cas](09-implementation-migration/07-exercises-and-corrections.md)
9. [Quick Reference](09-implementation-migration/08-quick-reference.md)
10. [Practitioner Checklist](09-implementation-migration/09-practitioner-checklist.md)

Concepts couverts : **Work Package, Deliverable, Implementation Event, Plateau, Gap**, avec Baseline/Target/Transition, migration waves, cutover, rollback, data migration, decommissioning, coexistence legacy et mapping TOGAF E/F/G.

### Partie X — Relations ArchiMate

1. [Vue d’ensemble](10-relations/00-overview.md)
2. [Relations structurelles — Composition, Aggregation, Assignment, Realization](10-relations/01-structural-relationships.md)
3. [Relations de dépendance — Serving, Access, Influence, Association](10-relations/02-dependency-relationships.md)
4. [Relations dynamiques et autres — Triggering, Flow, Specialization](10-relations/03-dynamic-and-other-relationships.md)
5. [Junctions, direction et validation](10-relations/04-junctions-and-relationship-direction.md)
6. [Relations dérivées](10-relations/05-derived-relationships.md)
7. [Cross-layer relationships et confusions](10-relations/06-cross-layer-and-confusions.md)
8. [MayaBank — modèle de relations de bout en bout](10-relations/07-mayabank-relationship-model.md)
9. [120 exercices et corrections](10-relations/08-120-exercises-and-corrections.md)
10. [Quick Reference Relations](10-relations/09-quick-reference.md)
11. [Practitioner Checklist Relations](10-relations/10-practitioner-checklist.md)

Relations couvertes : **Composition, Aggregation, Assignment, Realization, Serving, Access, Influence, Association, Triggering, Flow, Specialization, Junctions et Derived Relationships**, avec direction, source/cible, cross-layer modeling et 120 cas.

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