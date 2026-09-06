# ArchiMate 3.2 — Foundation & Practitioner Masterbook

> **Comprendre, lire, modéliser et expliquer une architecture d’entreprise avec ArchiMate 3.2.**

Ce livre est consacré au langage **ArchiMate 3.2** : structure du langage, éléments, relations, vues, viewpoints, transformations et utilisation sur des architectures réelles.

Le cas fil rouge **MayaBank** représente une banque fictive qui modernise sa plateforme de paiements, ses applications, ses données et son infrastructure.

---

## Table des matières

### Partie I — Fondations du langage

- [Pourquoi ArchiMate ?](01-foundations/01-why-archimate.md)
- [Architecture d’entreprise et modélisation](01-foundations/02-enterprise-architecture-and-modeling.md)
- [Structure du langage](01-foundations/03-language-structure.md)
- [Couches et aspects](01-foundations/04-layers-and-aspects.md)
- [Éléments, relations, vues et viewpoints](01-foundations/05-elements-relations-views-viewpoints.md)
- [Lire un modèle](01-foundations/06-reading-an-archimate-model.md)
- [ArchiMate et TOGAF](01-foundations/07-archimate-and-togaf.md)

### Partie II — Métamodèle et concepts génériques

- [Métamodèle générique](02-metamodel/01-generic-metamodel.md)
- [Active Structure, Behavior et Passive Structure](02-metamodel/02-active-behavior-passive-structure.md)
- [Internal, External et Interface](02-metamodel/03-internal-external-interface.md)

### Partie III — Motivation

- [Vue d’ensemble](03-motivation/00-overview.md)
- Stakeholder, Driver, Assessment, Goal, Outcome, Principle, Requirement, Constraint, Meaning, Value
- [Modèle Motivation MayaBank](03-motivation/05-motivation-complete-pattern.md)

### Partie IV — Strategy

- [Vue d’ensemble](04-strategy/00-overview.md)
- Resource, Capability, Value Stream, Course of Action
- [Modèle Strategy MayaBank](04-strategy/05-strategy-complete-pattern.md)

### Partie V — Business Layer

- [Ouvrir la Partie V](05-business-layer/README.md)
- Business Actor, Role, Collaboration, Interface, Process, Function, Interaction, Event, Service, Object, Representation, Contract, Product

### Partie VI — Application Layer

- [Ouvrir la Partie VI](06-application-layer/README.md)
- Application Component, Collaboration, Interface, Function, Process, Interaction, Event, Service, Data Object
- API, microservices, event-driven/Kafka, Business↔Application mapping

### Partie VII — Technology Layer

- [Ouvrir la Partie VII](07-technology-layer/README.md)
- Node, Device, System Software, Technology Service, Path, Network, Artifact
- OpenShift/Kubernetes, Kafka, Oracle/PostgreSQL, Cloud, IAM, Observability, HA/DR

### Partie VIII — Physical Layer

- [Ouvrir la Partie VIII](08-physical-layer/README.md)
- Equipment, Facility, Distribution Network, Material
- datacenter, énergie, refroidissement, résilience physique et Green IT

### Partie IX — Implementation & Migration

- [Ouvrir la Partie IX](09-implementation-migration/README.md)
- Work Package, Deliverable, Implementation Event, Plateau, Gap
- Baseline, Transition, Target, waves, cutover, rollback, decommissioning

### Partie X — Relations ArchiMate

- [Ouvrir la Partie X](10-relations/README.md)
- Composition, Aggregation, Assignment, Realization, Serving, Access, Influence, Triggering, Flow, Specialization, Association, Junctions, Derived Relationships
- 120 exercices de relations

### Partie XI — Views & Viewpoints

- [Ouvrir la Partie XI](11-views-viewpoints/README.md)
- Stakeholder → Concern → Viewpoint → View
- Layered, Strategy, Business, Application, Technology, Migration et vues cross-layer

### Partie XII — Patterns de modélisation & anti-patterns

- [Ouvrir la Partie XII](12-modeling-patterns/README.md)
- choix du bon élément, anti-patterns, réparation de modèles
- 30 patterns MayaBank + 100 exercices

### Partie XIII — TOGAF ↔ ArchiMate

- [Ouvrir la Partie XIII](13-togaf-archimate/README.md)
- Preliminary, A, B, C Data, C Application, D, E, F, G, H et Requirements Management
- mapping ADM → concepts/vues ArchiMate

### Partie XIV — MayaBank : modèle d’entreprise complet

- [Ouvrir la Partie XIV](14-mayabank-enterprise-model/README.md)
- Motivation → Strategy → Business → Information → Application/API/Event-Driven → Technology → Security → Observability → Physical → HA/DR → Green IT → Migration
- registre canonique, traçabilité bidirectionnelle, 20 vues et 60 cas cross-layer

### Partie XV — Use cases professionnels

- [Ouvrir la Partie XV](15-professional-use-cases/README.md)
- [Instant Payment](15-professional-use-cases/01-instant-payment.md)
- [API Banking](15-professional-use-cases/02-api-banking.md)
- [Kafka / Event Streaming](15-professional-use-cases/03-kafka-event-streaming.md)
- [OpenShift / Kubernetes](15-professional-use-cases/04-openshift-kubernetes.md)
- [Cloud Migration](15-professional-use-cases/05-cloud-migration.md)
- [IAM / Zero Trust](15-professional-use-cases/06-iam-zero-trust.md)
- [Fraud & Risk](15-professional-use-cases/07-fraud-risk.md)
- [Data Platform](15-professional-use-cases/08-data-platform.md)
- [Observability / SRE](15-professional-use-cases/09-observability-sre.md)
- [Multi-site / DR](15-professional-use-cases/10-multisite-dr.md)
- [GenAI Platform](15-professional-use-cases/11-genai-platform.md)
- [Green IT](15-professional-use-cases/12-green-it.md)
- [Matrice transversale](15-professional-use-cases/13-cross-usecase-pattern-matrix.md)
- [60 cas d’entretien et Practitioner](15-professional-use-cases/14-60-interview-practitioner-cases.md)
- [Quick Reference](15-professional-use-cases/15-quick-reference.md)
- [Practitioner Checklist](15-professional-use-cases/16-practitioner-checklist.md)

### Partie XVI — Archi et modélisation pratique

À venir : construction d’un vrai modèle dans Archi, organisation, views, import/export, collaboration, analyse et bonnes pratiques de repository de modèle.

### Partie XVII — ArchiMate as Code

À venir : PlantUML, Git, documentation automatisée, validation et CI/CD documentaire.

### Partie XVIII — Foundation Question Bank

À venir : banque complète de questions Foundation.

### Partie XIX — Practitioner Scenario Bank

À venir : scénarios Practitioner originaux.

### Partie XX — Mock Exams

À venir : examens blancs Foundation et Practitioner avec corrections détaillées.

### Partie XXI — Cheat Sheets

À venir : éléments, relations, layers, viewpoints et confusions critiques.

### Partie XXII — English for Enterprise Architects

À venir : expliquer, présenter et défendre un modèle en anglais.

### Partie XXIII — Glossaire

À venir : glossaire français/anglais complet.

### Partie XXIV — Références officielles

À venir : sources officielles, certification et mapping de couverture.

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

Puis, pour toute architecture réelle :

```text
Stakeholder / Concern
→ Viewpoint / View
→ Cross-layer traceability
→ Baseline / Target / Gaps
→ Work Packages / Plateaus
```

ArchiMate permet ainsi de construire **un modèle cohérent et interrogeable**, au lieu d’une collection de schémas indépendants.
