# 03 — Mapping Foundation / Practitioner → Masterbook

## Foundation

Foundation vise la **connaissance et la compréhension** du langage.

| Domaine | Parties principales | Validation |
|---|---|---|
| rôle d'ArchiMate en EA | I, XIII, XXIII | QCM + glossaire |
| structure du langage | I, II | QCM |
| Active / Behavior / Passive | II, XXI | QCM + cheat sheets |
| Motivation | III | QCM |
| Strategy | IV | QCM |
| Business | V | QCM |
| Application | VI | QCM |
| Technology | VII | QCM |
| Physical | VIII | QCM |
| Implementation & Migration | IX | QCM |
| relations | X | 120 exercices + QCM |
| views & viewpoints | XI | exercices + QCM |
| patterns / anti-patterns | XII | exercices |
| lecture cross-layer | XIV, XV | cas |
| vocabulaire | XXIII | index FR/EN |
| révision synthétique | XXI | cheat sheets |
| entraînement Foundation | XVIII, XX | 350 QCM + 4 mocks |

### Couverture des familles de concepts

Motivation : Stakeholder, Driver, Assessment, Goal, Outcome, Principle, Requirement, Constraint, Meaning, Value.

Strategy : Resource, Capability, Value Stream, Course of Action.

Business : Actor, Role, Collaboration, Interface, Process, Function, Interaction, Event, Service, Business Object, Representation, Contract, Product.

Application : Component, Collaboration, Interface, Function, Process, Interaction, Event, Service, Data Object.

Technology : Node, Device, System Software, Collaboration, Interface, Path, Communication Network, Function, Process, Interaction, Event, Service, Artifact.

Physical : Equipment, Facility, Distribution Network, Material.

Implementation & Migration : Work Package, Deliverable, Implementation Event, Plateau, Gap.

Relations : Composition, Aggregation, Assignment, Realization, Serving, Access, Influence, Association, Triggering, Flow, Specialization, Junctions et relations dérivées.

### Test de sortie Foundation

Le lecteur doit distinguer spontanément :

```text
Actor vs Role
Process vs Function
Service vs Interface
Business Object vs Data Object vs Artifact
Component vs System Software
Node vs Device vs Equipment vs Facility
Goal vs Outcome vs Requirement
Course of Action vs Work Package
Gap vs Assessment
Plateau vs Environment
Assignment vs Realization vs Serving
Access vs Flow
Triggering vs Flow
Viewpoint vs View
```

## Practitioner

Practitioner valide la capacité à **appliquer** ArchiMate.

| Compétence Practitioner | Parties principales | Preuve pratique |
|---|---|---|
| appliquer le métamodèle | II, XII | exercices de classification |
| choisir le bon élément | III–IX, XII | patterns / anti-patterns |
| choisir la bonne relation | X | 120 exercices |
| construire des views utiles | XI | catalogue de viewpoints |
| raisonner cross-layer | XIV | modèle MayaBank |
| modéliser des cas réels | XV | 12 use cases |
| utiliser Archi | XVI | modèle `.archimate` + labs |
| versionner as-code | XVII | PlantUML + CI |
| résoudre des scénarios | XIX | 100 scénarios |
| passer un mock réaliste | XX | 4 mocks Practitioner |
| réviser les pièges | XXI | cheat sheets |
| expliquer oralement | XXII | architecture defense |
| maîtriser le vocabulaire | XXIII | glossaire |
| rattacher au normatif | XXIV | sources/mapping |

### Raisonnement Practitioner attendu

```text
1. identifier le stakeholder
2. identifier le concern
3. choisir le niveau d'abstraction
4. choisir les éléments
5. choisir les relations précises
6. vérifier la direction
7. construire la view adaptée
8. vérifier le cross-layer
9. analyser impact / transformation
10. justifier les trade-offs
```

## Matrice des 24 parties

| Partie | Contenu | Foundation | Practitioner | Professionnel |
|---:|---|:---:|:---:|:---:|
| I | Fondations | ✓ | ✓ | ✓ |
| II | Métamodèle | ✓ | ✓ | ✓ |
| III | Motivation | ✓ | ✓ | ✓ |
| IV | Strategy | ✓ | ✓ | ✓ |
| V | Business | ✓ | ✓ | ✓ |
| VI | Application | ✓ | ✓ | ✓ |
| VII | Technology | ✓ | ✓ | ✓ |
| VIII | Physical | ✓ | ✓ | ✓ |
| IX | Implementation & Migration | ✓ | ✓ | ✓ |
| X | Relations | ✓ | ✓ | ✓ |
| XI | Views & Viewpoints | ✓ | ✓ | ✓ |
| XII | Patterns / anti-patterns | ✓ | ✓ | ✓ |
| XIII | TOGAF ↔ ArchiMate | complément | ✓ | ✓ |
| XIV | MayaBank model | lecture | ✓ | ✓ |
| XV | Use cases professionnels | complément | ✓ | ✓ |
| XVI | Archi pratique | complément | ✓ | ✓ |
| XVII | ArchiMate as Code | complément | ✓ | ✓ |
| XVIII | 350 QCM | ✓ | renforcement |  |
| XIX | 100 scénarios |  | ✓ | ✓ |
| XX | 8 mocks | ✓ | ✓ |  |
| XXI | Cheat Sheets | ✓ | ✓ | ✓ |
| XXII | English for Architects |  | complément | ✓ |
| XXIII | Glossaire FR/EN | ✓ | ✓ | ✓ |
| XXIV | Sources & mapping | ✓ | ✓ | ✓ |

## Couverture quantitative principale

Le dépôt contient notamment :
- 350 QCM Foundation ;
- 100 scénarios Practitioner ;
- 8 examens blancs ;
- 120 exercices de relations ;
- 100 exercices de patterns ;
- 80 exercices Views/Viewpoints ;
- 60 cas cross-layer MayaBank ;
- 60 cas d'entretien/Practitioner professionnels ;
- 50 exercices Archi ;
- 50 exercices ArchiMate-as-Code ;
- 12 use cases professionnels détaillés ;
- un modèle MayaBank natif `.archimate` ;
- 5 vues MayaBank PlantUML avec CI ;
- 12 cheat sheets ;
- 261 termes de glossaire ;
- 200 phrases d'anglais d'architecture.

La source de vérité reste The Open Group pour le standard et la certification.