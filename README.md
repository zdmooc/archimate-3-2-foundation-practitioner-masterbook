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

### Partie VI — Application Layer
- [Ouvrir la Partie VI](06-application-layer/README.md)

### Partie VII — Technology Layer
- [Ouvrir la Partie VII](07-technology-layer/README.md)

### Partie VIII — Physical Layer
- [Ouvrir la Partie VIII](08-physical-layer/README.md)

### Partie IX — Implementation & Migration
- [Ouvrir la Partie IX](09-implementation-migration/README.md)

### Partie X — Relations ArchiMate
- [Ouvrir la Partie X](10-relations/README.md)
- 120 exercices de relations

### Partie XI — Views & Viewpoints
- [Ouvrir la Partie XI](11-views-viewpoints/README.md)

### Partie XII — Patterns de modélisation & anti-patterns
- [Ouvrir la Partie XII](12-modeling-patterns/README.md)
- 30 patterns MayaBank + 100 exercices

### Partie XIII — TOGAF ↔ ArchiMate
- [Ouvrir la Partie XIII](13-togaf-archimate/README.md)

### Partie XIV — MayaBank : modèle d’entreprise complet
- [Ouvrir la Partie XIV](14-mayabank-enterprise-model/README.md)
- registre canonique, traçabilité bidirectionnelle, 20 vues et 60 cas cross-layer

### Partie XV — Use cases professionnels
- [Ouvrir la Partie XV](15-professional-use-cases/README.md)
- Instant Payment, API Banking, Kafka/Event Streaming, OpenShift/Kubernetes, Cloud Migration, IAM/Zero Trust, Fraud & Risk, Data Platform, Observability/SRE, Multi-site/DR, GenAI Platform, Green IT
- matrice transversale + 60 cas d’entretien/Practitioner

### Partie XVI — Archi et modélisation pratique
- [Ouvrir la Partie XVI](16-archi-practical-modeling/README.md)
- Archi 5.8, organisation du référentiel, Views, properties, documentation, analyse, import/export, coArchi/Git
- [LAB MayaBank](16-archi-practical-modeling/07-mayabank-hands-on-lab.md)
- [Modèle natif MayaBank `.archimate`](16-archi-practical-modeling/models/mayabank-enterprise.archimate)
- 50 exercices corrigés + Quick Reference + Practitioner Checklist

### Partie XVII — ArchiMate as Code
- [Ouvrir la Partie XVII](17-archimate-as-code/README.md)
- PlantUML + ArchiMate-PlantUML + Git + CI/CD documentaire
- 5 vues MayaBank as-code : EXEC / APP / TEC / SEC / MIG
- scripts de validation/rendu + workflow GitHub Actions
- 50 exercices + Quick Reference + Practitioner Checklist

### Partie XVIII — Foundation Question Bank
- [Ouvrir la Partie XVIII](18-foundation-question-bank/README.md)
- **350 QCM originaux** répartis en 7 blocs de 50
- corrections séparées Q001–Q175 et Q176–Q350
- contrôle de couverture : IDs continus, 4 choix A–D, 350 corrections, 350 énoncés distincts

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

Et pour l’industrialisation documentaire :

```text
Archi / PlantUML source
→ Git
→ validation
→ rendu
→ revue
→ documentation
```

ArchiMate permet ainsi de construire **un modèle cohérent et interrogeable**, au lieu d’une collection de schémas indépendants.
