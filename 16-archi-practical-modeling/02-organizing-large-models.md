# Organiser un grand modèle Archi

Un modèle d'entreprise devient vite difficile à maintenir si l'arbre n'a pas de convention stable.

## 1. Principe

Les dossiers servent à organiser le référentiel ; ils ne créent pas de nouvelle sémantique ArchiMate.

## 2. Structure MayaBank recommandée

```text
Strategy
├─ Capabilities
├─ Value Streams
├─ Resources
└─ Courses of Action

Business
├─ Actors & Roles
├─ Services
├─ Processes
├─ Events
├─ Objects
└─ Products & Contracts

Application
├─ Channels
├─ Payments
├─ Risk
├─ Integration
├─ Data
└─ Operations

Technology & Physical
├─ Platforms
├─ Runtime
├─ Messaging
├─ Database
├─ Network
├─ Security
├─ Observability
├─ Devices
└─ Facilities

Motivation
├─ Stakeholders
├─ Drivers
├─ Assessments
├─ Goals
├─ Requirements
└─ Constraints

Implementation & Migration
├─ Plateaus
├─ Gaps
├─ Work Packages
├─ Deliverables
└─ Events

Views
├─ 01 Executive
├─ 02 Business
├─ 03 Application
├─ 04 Technology
├─ 05 Security
├─ 06 Operations
├─ 07 Migration
└─ 08 Green IT
```

## 3. Un élément canonique par concept

Exemple :

`Payment Orchestrator` doit exister une seule fois comme `Application Component`.

Il peut apparaître dans :

- Application Cooperation View ;
- Deployment View ;
- Incident Impact View ;
- Migration View ;
- Security View.

## 4. Convention d'identifiants métier

Archi gère ses propres IDs. On peut ajouter une propriété métier stable :

```text
canonical-id = MB-APP-002
owner = Payments Architecture
lifecycle = target
criticality = high
```

Cette approche est utile pour faire le lien avec :

- CMDB ;
- catalogue applicatif ;
- ADR ;
- Confluence ;
- backlog ;
- référentiel TOGAF.

## 5. Ne pas organiser par projet uniquement

Mauvais :

```text
Project A
Project B
Project C
```

Cela produit trois versions du même système.

Préférer un référentiel canonique stable et utiliser :

- propriétés ;
- plateaus ;
- views ;
- work packages

pour représenter les projets et états.

## 6. Lifecycle

Propriété recommandée :

```text
lifecycle = baseline | transition | target | retired
```

Elle facilite :

- filtrage ;
- revue ;
- migration ;
- rationalisation.

## 7. Ownership

Chaque élément majeur devrait avoir un propriétaire explicite.

Exemples :

```text
owner = Payments Domain
owner = Platform Engineering
owner = Security Architecture
```

## 8. Granularité

Un modèle Archi n'est pas un inventaire exhaustif Kubernetes.

Éviter de créer automatiquement :

- chaque pod ;
- chaque secret ;
- chaque table ;
- chaque endpoint ;
- chaque VM.

Le niveau de détail doit être dicté par le concern.

## 9. Gestion des doublons

Avant de créer un élément :

1. rechercher par nom ;
2. rechercher par type ;
3. vérifier le canonical-id ;
4. vérifier les vues existantes ;
5. réutiliser si le concept est réellement identique.

## 10. Refactoring

Lorsqu'un modèle devient incohérent :

- fusionner les doublons conceptuels ;
- renommer les noms ambigus ;
- déplacer les éléments dans les bons dossiers ;
- supprimer les relations redondantes ;
- reconstruire les vues qui mélangent plusieurs concerns.

## 11. Definition of Done

Un grand modèle est maintenable si :

- chaque concept majeur a un owner ;
- chaque élément canonique est unique ;
- les dossiers sont stables ;
- les vues sont classées par concern/audience ;
- les états Baseline/Target sont explicites ;
- les noms restent lisibles hors contexte du diagramme.
