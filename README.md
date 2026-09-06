# ArchiMate 3.2 — Foundation & Practitioner Masterbook

> **Comprendre, lire, modéliser et expliquer une architecture d’entreprise avec ArchiMate 3.2.**

Ce livre est consacré au langage **ArchiMate 3.2** : sa structure, ses éléments, ses relations, ses vues, ses viewpoints et son utilisation dans des architectures réelles.

Le cas fil rouge **MayaBank** représente une banque fictive qui modernise sa plateforme de paiements, ses applications, ses données et son infrastructure.

---

## Table des matières

### Partie I — Fondations du langage
1. [Pourquoi ArchiMate ?](01-foundations/01-why-archimate.md)
2. [Architecture d’entreprise et modélisation](01-foundations/02-enterprise-architecture-and-modeling.md)
3. [Structure du langage](01-foundations/03-language-structure.md)
4. [Couches et aspects](01-foundations/04-layers-and-aspects.md)
5. [Éléments, relations, vues et viewpoints](01-foundations/05-elements-relations-views-viewpoints.md)
6. [Lire un modèle](01-foundations/06-reading-an-archimate-model.md)
7. [ArchiMate et TOGAF](01-foundations/07-archimate-and-togaf.md)

### Partie II — Métamodèle et concepts génériques
1. [Métamodèle générique](02-metamodel/01-generic-metamodel.md)
2. [Active Structure, Behavior et Passive Structure](02-metamodel/02-active-behavior-passive-structure.md)
3. [Internal, External et Interface](02-metamodel/03-internal-external-interface.md)

### Partie III — Motivation
1. [Vue d’ensemble](03-motivation/00-overview.md)
2. [Stakeholder, Driver et Assessment](03-motivation/01-stakeholder-driver-assessment.md)
3. [Goal et Outcome](03-motivation/02-goal-outcome.md)
4. [Principle, Requirement et Constraint](03-motivation/03-principle-requirement-constraint.md)
5. [Meaning et Value](03-motivation/04-meaning-value.md)
6. [MayaBank — Motivation complète](03-motivation/05-motivation-complete-pattern.md)

### Partie IV — Strategy
1. [Vue d’ensemble](04-strategy/00-overview.md)
2. [Resource](04-strategy/01-resource.md)
3. [Capability](04-strategy/02-capability.md)
4. [Value Stream](04-strategy/03-value-stream.md)
5. [Course of Action](04-strategy/04-course-of-action.md)
6. [MayaBank — Strategy complète](04-strategy/05-strategy-complete-pattern.md)

### Partie V — Business Layer
1. [Vue d’ensemble](05-business-layer/00-overview.md)
2. [Active Structure](05-business-layer/01-active-structure.md)
3. [Behavior](05-business-layer/02-behavior.md)
4. [Passive Structure & Product](05-business-layer/03-passive-structure-product.md)
5. [Confusions critiques](05-business-layer/04-business-confusions.md)
6. [Patterns de relations](05-business-layer/05-business-relationship-patterns.md)
7. [Méthode Business Architecture](05-business-layer/06-business-architecture-method.md)
8. [MayaBank — Business Architecture](05-business-layer/07-mayabank-business-architecture.md)
9. [Exercices et corrections](05-business-layer/08-exercises-and-corrections.md)

### Partie VI — Application Layer
1. [Vue d’ensemble](06-application-layer/00-overview.md)
2. [Active Structure](06-application-layer/01-active-structure.md)
3. [Behavior](06-application-layer/02-behavior.md)
4. [Data Object](06-application-layer/03-data-object.md)
5. [APIs et microservices](06-application-layer/04-api-and-microservices.md)
6. [Event-Driven Architecture et Kafka](06-application-layer/05-event-driven-kafka.md)
7. [Business ↔ Application Mapping](06-application-layer/06-business-application-mapping.md)
8. [Méthode Application Architecture](06-application-layer/07-application-architecture-method.md)
9. [MayaBank — Application Architecture](06-application-layer/08-mayabank-application-architecture.md)
10. [Exercices et corrections](06-application-layer/09-exercises-and-corrections.md)
11. [Quick Reference](06-application-layer/10-quick-reference.md)
12. [Practitioner Checklist](06-application-layer/11-practitioner-checklist.md)

### Partie VII — Technology Layer
1. [Vue d’ensemble](07-technology-layer/00-overview.md)
2. [Active Structure](07-technology-layer/01-active-structure.md)
3. [Connectivity](07-technology-layer/02-connectivity.md)
4. [Behavior](07-technology-layer/03-behavior.md)
5. [Artifact & Deployment](07-technology-layer/04-artifact-and-deployment.md)
6. [OpenShift & Kubernetes](07-technology-layer/05-openshift-kubernetes.md)
7. [Data, Database, Messaging & Platform Services](07-technology-layer/06-data-messaging-platforms.md)
8. [Cloud, Security, Observability, HA & DR](07-technology-layer/07-cloud-security-observability-ha-dr.md)
9. [Application ↔ Technology Mapping](07-technology-layer/08-application-technology-mapping.md)
10. [Méthode Technology Architecture](07-technology-layer/09-technology-architecture-method.md)
11. [MayaBank — Technology Architecture](07-technology-layer/10-mayabank-technology-architecture.md)
12. [Exercices et corrections — 60 cas](07-technology-layer/11-exercises-and-corrections.md)
13. [Quick Reference](07-technology-layer/12-quick-reference.md)

### Partie VIII — Physical Layer
1. [Vue d’ensemble](08-physical-layer/00-overview.md)
2. [Equipment, Facility, Distribution Network, Material](08-physical-layer/01-elements.md)
3. [Modéliser un datacenter](08-physical-layer/02-datacenter-modeling.md)
4. [Physical Layer, énergie et Green IT](08-physical-layer/03-green-it.md)
5. [Méthode Physical Architecture](08-physical-layer/04-physical-architecture-method.md)
6. [MayaBank — Physical Architecture](08-physical-layer/05-mayabank-physical-architecture.md)
7. [Exercices et corrections — 60 cas](08-physical-layer/06-exercises-and-corrections.md)
8. [Quick Reference](08-physical-layer/07-quick-reference.md)
9. [Practitioner Checklist](08-physical-layer/08-practitioner-checklist.md)

### Partie IX — Implementation & Migration
1. [Vue d’ensemble](09-implementation-migration/00-overview.md)
2. [Work Package, Deliverable et Implementation Event](09-implementation-migration/01-work-package-deliverable-event.md)
3. [Plateau, Gap, Baseline, Transition et Target](09-implementation-migration/02-plateau-gap-baseline-target.md)
4. [Roadmap, cutover, rollback et décommissionnement](09-implementation-migration/03-roadmap-cutover-rollback.md)
5. [TOGAF E/F/G](09-implementation-migration/04-togaf-e-f-g.md)
6. [Méthode Implementation & Migration](09-implementation-migration/05-implementation-migration-method.md)
7. [MayaBank — Implementation & Migration](09-implementation-migration/06-mayabank-implementation-migration.md)
8. [Exercices et corrections — 60 cas](09-implementation-migration/07-exercises-and-corrections.md)
9. [Quick Reference](09-implementation-migration/08-quick-reference.md)
10. [Practitioner Checklist](09-implementation-migration/09-practitioner-checklist.md)

### Partie X — Relations ArchiMate
1. [Vue d’ensemble](10-relations/00-overview.md)
2. [Relations structurelles](10-relations/01-structural-relationships.md)
3. [Relations de dépendance](10-relations/02-dependency-relationships.md)
4. [Relations dynamiques et autres](10-relations/03-dynamic-and-other-relationships.md)
5. [Junctions, direction et validation](10-relations/04-junctions-and-relationship-direction.md)
6. [Relations dérivées](10-relations/05-derived-relationships.md)
7. [Cross-layer relationships et confusions](10-relations/06-cross-layer-and-confusions.md)
8. [MayaBank — relations end-to-end](10-relations/07-mayabank-relationship-model.md)
9. [120 exercices et corrections](10-relations/08-120-exercises-and-corrections.md)
10. [Quick Reference](10-relations/09-quick-reference.md)
11. [Practitioner Checklist](10-relations/10-practitioner-checklist.md)

### Partie XI — Views & Viewpoints
1. [Vue d’ensemble](11-views-viewpoints/00-overview.md)
2. [Stakeholder, Concern, Viewpoint et View](11-views-viewpoints/01-stakeholder-concern-viewpoint-view.md)
3. [Viewpoints majeurs](11-views-viewpoints/02-core-viewpoints.md)
4. [Layered et cross-layer](11-views-viewpoints/03-layered-and-cross-layer.md)
5. [Transformation viewpoints](11-views-viewpoints/04-transformation-viewpoints.md)
6. [Méthode de construction d’une View](11-views-viewpoints/05-view-design-method.md)
7. [MayaBank — catalogue de Views](11-views-viewpoints/06-mayabank-view-catalog.md)
8. [Exercices et corrections — 80 cas](11-views-viewpoints/07-exercises-and-corrections.md)
9. [Quick Reference](11-views-viewpoints/08-quick-reference.md)
10. [Practitioner Checklist](11-views-viewpoints/09-practitioner-checklist.md)

### Partie XII — Patterns de modélisation & anti-patterns
1. [Vue d’ensemble](12-modeling-patterns/00-overview.md)
2. [Choisir le bon élément](12-modeling-patterns/01-element-choice-patterns.md)
3. [Behavior / Service / Interface](12-modeling-patterns/02-behavior-service-interface-patterns.md)
4. [Information / Data / Artifact](12-modeling-patterns/03-information-data-artifact-patterns.md)
5. [Application → Technology → Physical](12-modeling-patterns/04-application-technology-physical-patterns.md)
6. [Event, State & Transformation](12-modeling-patterns/05-event-and-transformation-patterns.md)
7. [Patterns de solutions professionnelles](12-modeling-patterns/06-professional-solution-patterns.md)
8. [Anti-patterns et réparation](12-modeling-patterns/07-antipatterns-and-model-repair.md)
9. [MayaBank — 30 patterns](12-modeling-patterns/08-mayabank-pattern-catalog.md)
10. [100 exercices et corrections](12-modeling-patterns/09-100-exercises-and-corrections.md)
11. [Quick Reference](12-modeling-patterns/10-quick-reference.md)
12. [Practitioner Checklist](12-modeling-patterns/11-practitioner-checklist.md)

### Partie XIII — TOGAF ↔ ArchiMate
1. [Vue d’ensemble — méthode et langage](13-togaf-archimate/00-overview.md)
2. [Preliminary + Phase A](13-togaf-archimate/01-preliminary-and-phase-a.md)
3. [Phases B, C et D](13-togaf-archimate/02-phases-b-c-d.md)
4. [Phases E, F et G](13-togaf-archimate/03-phases-e-f-g.md)
5. [Phase H + Requirements Management](13-togaf-archimate/04-phase-h-and-requirements.md)
6. [Matrice ADM → ArchiMate](13-togaf-archimate/05-adm-archimate-matrix.md)
7. [MayaBank — TOGAF + ArchiMate end-to-end](13-togaf-archimate/06-mayabank-end-to-end.md)
8. [Frontière officielle et limites](13-togaf-archimate/07-official-alignment-and-boundaries.md)
9. [80 exercices et corrections](13-togaf-archimate/08-80-exercises-and-corrections.md)
10. [Quick Reference](13-togaf-archimate/09-quick-reference.md)
11. [Practitioner Checklist](13-togaf-archimate/10-practitioner-checklist.md)

### Partie XIV — MayaBank : modèle d’entreprise complet
1. [Vue d’ensemble](14-mayabank-enterprise-model/00-overview.md)
2. [Histoire d’entreprise, scope et architecture questions](14-mayabank-enterprise-model/01-enterprise-story-and-scope.md)
3. [Motivation, Strategy et traçabilité](14-mayabank-enterprise-model/02-motivation-strategy-traceability.md)
4. [Business & Information Architecture](14-mayabank-enterprise-model/03-business-information-architecture.md)
5. [Application, API & Event-Driven Architecture](14-mayabank-enterprise-model/04-application-api-event-driven.md)
6. [Technology, Security & Observability Architecture](14-mayabank-enterprise-model/05-technology-security-observability.md)
7. [Physical, Green IT, HA & DR Architecture](14-mayabank-enterprise-model/06-physical-greenit-ha-dr.md)
8. [Baseline, Target & Transition Architectures](14-mayabank-enterprise-model/07-baseline-target-transition.md)
9. [End-to-End Traceability Matrix](14-mayabank-enterprise-model/08-end-to-end-traceability-matrix.md)
10. [View Catalog & Stakeholders](14-mayabank-enterprise-model/09-view-catalog-and-stakeholders.md)
11. [Canonical Element Register](14-mayabank-enterprise-model/10-canonical-element-register.md)
12. [Consistency Rules & Quality Gates](14-mayabank-enterprise-model/11-consistency-rules-and-quality-gates.md)
13. [60 Cross-Layer Review Cases](14-mayabank-enterprise-model/12-cross-layer-review-cases.md)
14. [Quick Reference](14-mayabank-enterprise-model/13-quick-reference.md)
15. [Practitioner Checklist](14-mayabank-enterprise-model/14-practitioner-checklist.md)

Couverture : **Motivation → Strategy → Business → Information → Application/API/Event-Driven → Technology/OpenShift/Kafka/Data → Security → Observability → Physical → HA/DR → Green IT → Baseline/Target/Transition → Gaps/Work Packages/Plateaus**, avec registre canonique, traçabilité bidirectionnelle, 20 vues et 60 cas cross-layer.

### Partie XV — Use cases professionnels
À venir : Instant Payment, API Banking, Kafka/Event Streaming, Cloud Migration, OpenShift/Kubernetes, IAM, Fraud & Risk, Data Platform, Observability, Multi-site/DR, GenAI Platform et Green IT.

### Partie XVI — Archi et modélisation pratique
À venir : modèles et vues dans Archi, organisation, import/export, collaboration et analyse.

### Partie XVII — ArchiMate as Code
À venir : PlantUML, Git, documentation automatisée, validation et CI/CD documentaire.

### Partie XVIII — Foundation Question Bank
À venir : banque complète de questions Foundation.

### Partie XIX — Practitioner Scenario Bank
À venir : scénarios Practitioner originaux.

### Partie XX — Mock Exams
À venir : examens blancs Foundation et Practitioner avec corrections séparées.

### Partie XXI — Cheat Sheets
À venir : éléments, relations, layers, viewpoints et confusions critiques.

### Partie XXII — English for Enterprise Architects
À venir : expliquer et défendre un modèle en anglais.

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

ArchiMate permet de relier ces niveaux dans **un modèle cohérent**, au lieu de produire une collection de schémas indépendants.