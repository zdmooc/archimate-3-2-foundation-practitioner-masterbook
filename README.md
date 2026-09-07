# ArchiMate 3.2 — Foundation & Practitioner Masterbook

> **Comprendre, lire, modéliser, expliquer et appliquer ArchiMate 3.2.**

**Statut : 24/24 parties terminées — audit final effectué le 7 septembre 2026.**

Le cas fil rouge **MayaBank** représente une banque fictive qui modernise sa plateforme de paiements, ses applications, ses données et son infrastructure.

- [Audit final](FINAL_AUDIT.md)
- [Références officielles & certification](24-official-references/README.md)

---

## Table des matières

### I — Fondations
[Ouvrir](01-foundations/01-why-archimate.md) — rôle d'ArchiMate, structure du langage, layers/aspects, lecture de modèles.

### II — Métamodèle
[Ouvrir](02-metamodel/01-generic-metamodel.md) — Active Structure, Behavior, Passive Structure, internal/external/interface.

### III — Motivation
[Ouvrir](03-motivation/00-overview.md) — Stakeholder, Driver, Assessment, Goal, Outcome, Principle, Requirement, Constraint, Meaning, Value.

### IV — Strategy
[Ouvrir](04-strategy/00-overview.md) — Resource, Capability, Value Stream, Course of Action.

### V — Business Layer
[Ouvrir](05-business-layer/README.md)

### VI — Application Layer
[Ouvrir](06-application-layer/README.md)

### VII — Technology Layer
[Ouvrir](07-technology-layer/README.md)

### VIII — Physical Layer
[Ouvrir](08-physical-layer/README.md)

### IX — Implementation & Migration
[Ouvrir](09-implementation-migration/README.md)

### X — Relations
[Ouvrir](10-relations/README.md) — **120 exercices**.

### XI — Views & Viewpoints
[Ouvrir](11-views-viewpoints/README.md) — catalogue de viewpoints + **80 exercices**.

### XII — Patterns & anti-patterns
[Ouvrir](12-modeling-patterns/README.md) — 30 patterns MayaBank + **100 exercices**.

### XIII — TOGAF ↔ ArchiMate
[Ouvrir](13-togaf-archimate/README.md)

### XIV — MayaBank Enterprise Model
[Ouvrir](14-mayabank-enterprise-model/README.md) — registre canonique, 20 views, 60 cas cross-layer.

### XV — Use cases professionnels
[Ouvrir](15-professional-use-cases/README.md) — Instant Payment, API, Kafka, OpenShift, Cloud, IAM, Fraud, Data, SRE, DR, GenAI, Green IT.

### XVI — Archi pratique
[Ouvrir](16-archi-practical-modeling/README.md) — Archi 5.8, coArchi/Git, labs et [modèle natif `.archimate`](16-archi-practical-modeling/models/mayabank-enterprise.archimate).

### XVII — ArchiMate as Code
[Ouvrir](17-archimate-as-code/README.md) — PlantUML, Git, CI/CD, 5 views MayaBank as-code.

### XVIII — Foundation Question Bank
[Ouvrir](18-foundation-question-bank/README.md) — **350 QCM originaux**, Q001–Q350, corrections et contrôle qualité.

### XIX — Practitioner Scenario Bank
[Ouvrir](19-practitioner-scenario-bank/README.md) — **100 scénarios S001–S100**, notation 5/3/1/0.

### XX — Mock Exams
[Ouvrir](20-mock-exams/README.md) — **4 Foundation × 40 + 4 Practitioner × 8**.

### XXI — Cheat Sheets
[Ouvrir](21-cheat-sheets/README.md) — **12 fiches** + révision express 15 minutes.

### XXII — English for Enterprise Architects
[Ouvrir](22-english-for-enterprise-architects/README.md) — 40 réponses d'entretien, 15 dialogues, soutenance MayaBank et 200 phrases.

### XXIII — Glossaire FR/EN
[Ouvrir](23-glossary/README.md) — **261 termes distincts** + index A–Z bilingues.

### XXIV — Références officielles & Certification Mapping
[Ouvrir](24-official-references/README.md) — état actuel Foundation/Practitioner, examens OGA-031/OGA-032, sources The Open Group, frontière normative, mapping de couverture et checklist finale.

---

## Certification — état vérifié au 7 septembre 2026

| Niveau | Examen | Format | Durée | Passage |
|---|---|---|---:|---:|
| Foundation | OGA-031 | 40 QCM, closed book | 60 min | 24/40 = 60% |
| Practitioner | OGA-032 | 8 scénarios, open book, 5/3/1/0 | 90 min | 26/40 = 65% |

Les deux niveaux sont alignés sur **ArchiMate Specification Version 3.2**. Il n'existe pas de Combined ArchiMate 3.

---

## Chaîne mentale

```text
WHY
Motivation
   ↓
WHAT WE MUST BE ABLE TO DO
Strategy
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
HOW WE CHANGE
Implementation & Migration
```

Puis :

```text
Stakeholder / Concern
→ Viewpoint / View
→ Cross-layer traceability
→ Baseline / Transition / Target
→ Gaps / Work Packages / Deliverables
```

## Principe du dépôt

ArchiMate sert ici à construire **un modèle cohérent, réutilisable, traçable et analysable**, et non une collection de schémas indépendants.

Pour les règles normatives et les modalités de certification, la source de vérité reste **The Open Group**.