# Matrice ADM → concepts ArchiMate → viewpoints → décisions

Cette matrice sert de référence rapide. Elle indique les concepts fréquemment utiles ; elle ne signifie pas qu'une phase TOGAF impose un viewpoint unique.

| Moment TOGAF | Décision principale | Concepts ArchiMate utiles | Vues / viewpoints utiles |
|---|---|---|---|
| Preliminary | organiser la capacité d'architecture | Stakeholder, Role, Capability, Principle, Requirement | Organization, Motivation, Capability |
| Phase A | aligner vision, valeur et périmètre | Driver, Assessment, Goal, Outcome, Capability, Value Stream | Motivation, Strategy, Capability, Layered Executive |
| Phase B | décrire métier baseline/cible | Actor, Role, Process, Function, Service, Object, Product | Organization, Business Process, Product |
| Phase C Data | structurer information et flux | Business Object, Data Object, Representation, Access, Flow | Information Structure, layered data views |
| Phase C Application | structurer support applicatif | Component, Service, Interface, Function, Event, Data Object | Application Cooperation, Application Usage |
| Phase D | structurer plateforme et infrastructure | Technology Service, System Software, Node, Device, Network, Artifact | Technology, Technology Usage, Deployment |
| Phase E | choisir options et lots | Gap, Course of Action, Work Package, Plateau | Implementation & Migration, Strategy |
| Phase F | séquencer la migration | Work Package, Deliverable, Event, Plateau, Gap | Migration, Implementation & Migration |
| Phase G | gouverner conformité | Requirement, Work Package, Deliverable, realized target elements | Requirements traceability, deployment/compliance views |
| Phase H | analyser le changement | Driver, Assessment, Requirement, Gap, Plateau | Motivation + impact / layered views |
| Requirements Mgmt | maintenir la traçabilité | Requirement, Constraint, Goal, Outcome | Motivation + cross-layer traceability |

## 1. La logique de sélection

Ne demande pas :

> « Quel diagramme ArchiMate correspond à la Phase C ? »

Demande plutôt :

```text
1. Quelle décision doit être prise ?
2. Qui doit la prendre ?
3. Quel concern faut-il adresser ?
4. Quelles informations du modèle sont nécessaires ?
5. Quelle View les montre le plus clairement ?
```

## 2. Exemple Phase B → C → D

```text
Business Process: Execute Instant Payment
   ↑ served by
Application Service: Payment Orchestration Service
   ↑ realized by
Application Function: Orchestrate Payment
   ↑ assigned to
Application Component: Payment Orchestrator
   ↓ uses
Technology Service: Container Platform Service
   ↓ provided by
System Software: OpenShift
```

Cette seule chaîne peut être filtrée en plusieurs vues selon le stakeholder.

## 3. Exemple A → E → F

```text
Driver: Regulation
→ Goal: Real-Time Compliance
→ Capability: Real-Time Payments
→ Target Architecture
→ Gap: Legacy Cannot Meet Target
→ Work Package: Build New Platform
→ Plateau: Hybrid Architecture
→ Work Package: Migrate Remaining Flows
→ Plateau: Target Architecture
```

## 4. Exemple G → H

```text
Requirement: RTO ≤ 15 min
→ Target Architecture Elements
→ Work Package / Deliverable
→ Implemented Solution
→ Assessment: DR test exceeds RTO
→ Gap / Change Need
→ New Work Package
```

## 5. Les erreurs de mapping les plus fréquentes

1. Utiliser `Capability` pour nommer une application.
2. Utiliser `Work Package` pour représenter une direction stratégique.
3. Utiliser `Data Object` pour toute notion métier.
4. Utiliser `Plateau` pour un environnement Dev/UAT/Prod.
5. Utiliser `Requirement` pour un simple concern.
6. Utiliser `Gap` pour une exigence future.
7. Forcer une relation directe au lieu de montrer la chaîne intermédiaire.
8. Créer une vue ADM gigantesque couvrant toutes les phases.

## 6. Principe de gouvernance

Un bon modèle TOGAF + ArchiMate doit permettre de remonter :

```text
Implemented Technology
→ Application
→ Business Service / Process
→ Capability
→ Goal
→ Driver
```

et de redescendre :

```text
Driver
→ Goal
→ Requirement
→ Architecture Target
→ Gap
→ Work Package
→ Deliverable
→ Implementation
```

## À retenir

> **L'ADM organise le raisonnement dans le temps ; ArchiMate organise la représentation des résultats et leurs dépendances.**