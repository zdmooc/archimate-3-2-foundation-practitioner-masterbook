# Partie XIV — MayaBank : modèle d’entreprise complet

Cette partie rassemble toutes les couches ArchiMate étudiées jusqu’ici dans un seul cas cohérent. Le but n’est plus d’expliquer chaque concept isolément, mais de montrer comment un architecte construit un **modèle d’entreprise traçable, lisible et exploitable**.

MayaBank est une banque fictive. Son domaine fil rouge est la modernisation des paiements temps réel.

## 1. Question centrale

Le modèle doit permettre de répondre sans changer de référentiel à des questions très différentes :

- pourquoi MayaBank transforme-t-elle ses paiements ?
- quelles capabilities doivent progresser ?
- quels processus métier sont concernés ?
- quelles informations sont critiques ?
- quelles applications portent la cible ?
- où s’exécutent-elles ?
- comment sont gérés sécurité, observabilité, résilience et DR ?
- quel est le Baseline ?
- quel est le Target ?
- quels Gaps séparent les deux ?
- quels Work Packages permettent la migration ?
- quels Plateaus intermédiaires sont nécessaires ?
- quels stakeholders ont besoin de quelles Views ?

## 2. Chaîne de traçabilité principale

```text
Driver
→ Assessment
→ Goal
→ Requirement
→ Capability
→ Value Stream
→ Business Process
→ Business Service
→ Application Service
→ Application Component
→ Data Object
→ Artifact
→ Technology Service
→ System Software / Node
→ Facility
→ Gap
→ Work Package
→ Deliverable
→ Implementation Event
→ Plateau
```

Cette chaîne est un guide de lecture. Elle ne signifie pas que chaque élément doit être relié directement au suivant ni qu’une seule relation suffit partout.

## 3. Scope MayaBank

Le modèle couvre principalement :

### Métier
- initiation d’un paiement ;
- validation ;
- fraude ;
- exécution ;
- confirmation ;
- gestion des exceptions ;
- réconciliation.

### Application
- Payment API Gateway ;
- Payment Orchestrator ;
- Fraud Engine ;
- Limit Service ;
- Payment Ledger Adapter ;
- Clearing Adapter ;
- Notification Service ;
- Operations Portal.

### Data
- Payment Order ;
- Payment Transaction ;
- Fraud Case ;
- Customer Limit ;
- Settlement Record ;
- Payment Status ;
- Audit Trail.

### Technology
- OpenShift ;
- Kafka ;
- PostgreSQL ;
- Oracle ;
- API Gateway technology ;
- IAM/OIDC ;
- secrets management ;
- service mesh ;
- observability stack ;
- object storage ;
- backup/DR.

### Physical
- Site A ;
- Site B ;
- compute devices ;
- network devices ;
- storage devices ;
- energy distribution ;
- cooling ;
- physical facilities.

### Transformation
- Baseline legacy ;
- foundation target ;
- hybrid coexistence ;
- migration waves ;
- data cutover ;
- decommissioning ;
- target stable.

## 4. Baseline en une vue

```text
Business
  ↓
Legacy Payment Process
  ↓
Legacy Payment Application
  ↓
Point-to-point Integration
  ↓
Oracle-centric Data
  ↓
Virtual Machines / Legacy Middleware
  ↓
Two datacenter sites
```

Problèmes principaux :

- faible découplage ;
- forte dépendance au legacy ;
- déploiements lents ;
- observabilité partielle ;
- intégrations difficiles à faire évoluer ;
- résilience complexe ;
- coût de maintien élevé ;
- capacité temps réel insuffisante.

## 5. Target en une vue

```text
Real-Time Payments Capability
  ↓
Instant Payment Business Processes
  ↓
API + Event-Driven Application Architecture
  ↓
Payment Orchestrator + Services
  ↓
Kafka + PostgreSQL/Oracle Integration
  ↓
OpenShift Platform
  ↓
Multi-site Resilience + Observability + Security
```

## 6. Le modèle n’est pas un seul diagramme

Le modèle d’entreprise contient une connaissance cohérente. Les vues sont des projections adaptées :

- Executive Transformation View ;
- Capability View ;
- Business Process View ;
- Application Cooperation View ;
- Event-Driven View ;
- Data Lineage View ;
- OpenShift Deployment View ;
- Security View ;
- Observability View ;
- Resilience/DR View ;
- Migration Roadmap View ;
- Green IT View.

## 7. Principe de non-duplication

Un élément important doit idéalement exister une seule fois dans le référentiel puis être réutilisé dans plusieurs vues.

Exemple :

```text
Application Component: Payment Orchestrator
```

peut apparaître dans :

- Application Cooperation ;
- Event-Driven ;
- Deployment ;
- Security ;
- Observability ;
- Migration ;
- Incident Impact.

Il ne faut pas recréer six objets différents portant le même nom sans raison.

## 8. Principe de traçabilité

Chaque choix technique majeur doit pouvoir remonter vers un besoin.

Exemple :

```text
Driver: 24/7 Instant Payments
→ Goal: Resilient Real-Time Payments
→ Requirement: tolerate single-node failure
→ Capability: Resilience Engineering
→ Application: Payment Orchestrator
→ Technology Service: Container Execution
→ System Software: OpenShift
→ Plateau: Target Resilient Payments
```

## 9. Principe de séparation des concerns

Le modèle complet peut être riche ; une vue ne doit pas tout montrer.

Le CIO doit voir la transformation.
Le Head of Payments doit voir le service et les processus.
Le Solution Architect doit voir les dépendances applicatives.
Le Platform Architect doit voir le runtime.
Le CISO doit voir les contrôles et zones de confiance.
Operations doit voir dépendances, observabilité et points de panne.

## 10. Résultat attendu

À la fin de cette partie, on doit être capable de reconstruire MayaBank en partant soit :

- d’un problème stratégique ;
- d’un incident ;
- d’une application ;
- d’une donnée ;
- d’un composant technique ;
- d’un Work Package ;

et retrouver les dépendances et motivations associées.

> **Un modèle d’entreprise mature n’est pas une collection de dessins : c’est un graphe cohérent de décisions, dépendances et transformations.**