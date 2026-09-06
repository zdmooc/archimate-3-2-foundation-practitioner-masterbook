# Partie XIII — TOGAF ↔ ArchiMate : méthode et langage dans un même raisonnement

TOGAF et ArchiMate répondent à deux questions complémentaires.

```text
TOGAF  = comment conduire, structurer et gouverner le travail d'architecture ?
ArchiMate = comment représenter, relier, analyser et communiquer l'architecture ?
```

Le but n'est pas de traduire mécaniquement chaque mot TOGAF en un élément ArchiMate. Il faut utiliser ArchiMate pour représenter ce qui est utile dans chaque moment de l'ADM.

## 1. Carte générale ADM → ArchiMate

| TOGAF | Question dominante | ArchiMate utile |
|---|---|---|
| Preliminary | comment organiser la capacité d'architecture ? | Stakeholder, Role, Capability, Principle, Requirement |
| Phase A | pourquoi changer et vers quelle vision ? | Driver, Assessment, Goal, Outcome, Capability, Value Stream, Stakeholder |
| Phase B | comment fonctionne le métier ? | Business Actor/Role, Process, Function, Service, Object, Product |
| Phase C Data | quelles informations sont nécessaires ? | Business Object, Data Object, Representation, Access, Flow |
| Phase C Application | quelles applications supportent le métier ? | Application Component, Service, Interface, Function, Event, Data Object |
| Phase D | sur quelles technologies ? | Technology Service, System Software, Node, Device, Network, Artifact |
| Phase E | quelles options de réalisation ? | Gap, Work Package, Plateau, Course of Action |
| Phase F | dans quel ordre migrer ? | Work Package, Deliverable, Implementation Event, Plateau, Gap |
| Phase G | l'implémentation reste-t-elle conforme ? | Requirement, Deliverable, Work Package, realization/traceability |
| Phase H | que faut-il changer après mise en service ? | Driver, Assessment, Gap, Plateau, impact relationships |
| Requirements Management | quelles exigences doivent rester traçables ? | Requirement, Constraint, Goal, Outcome + relations vers les architectures |

Cette table donne une orientation. Ce n'est pas une table de correspondance normative un-à-un.

## 2. Chaîne MayaBank

```text
Driver: Instant Payment Regulation
→ Goal: Real-Time Compliant Payments
→ Capability: Real-Time Payment Processing
→ Business Process: Execute Instant Payment
→ Application Service: Payment Orchestration Service
→ Application Component: Payment Orchestrator
→ Technology Service: Container Platform Service
→ System Software: OpenShift
→ Node: Production Cluster
→ Gap: Legacy Cannot Meet Target Architecture
→ Work Package: Migrate Instant Payments
→ Plateau: Target Payments Architecture
```

TOGAF structure le travail qui mène à cette chaîne. ArchiMate permet de la représenter et de la réutiliser dans plusieurs vues.

## 3. Ce qu'il ne faut pas faire

### Anti-pattern : une phase TOGAF = un diagramme unique

Une phase peut produire plusieurs vues et plusieurs modèles.

### Anti-pattern : chaque livrable TOGAF = un élément Deliverable ArchiMate

Le mot Deliverable existe dans les deux univers mais ne doit pas être appliqué mécaniquement.

### Anti-pattern : ArchiMate remplace l'ADM

Un modèle ne définit pas à lui seul :
- la gouvernance ;
- le cycle de décision ;
- les responsabilités de l'Architecture Board ;
- la conduite de l'engagement ;
- la méthode de gestion du changement.

### Anti-pattern : TOGAF impose une notation de diagramme

TOGAF n'oblige pas à représenter les architectures uniquement en ArchiMate. ArchiMate est particulièrement cohérent avec TOGAF, mais reste un langage distinct.

## 4. Pattern de travail

Pour chaque phase :

```text
1. Identifier l'objectif TOGAF.
2. Identifier les décisions à prendre.
3. Identifier les stakeholders et concerns.
4. Choisir les concepts ArchiMate utiles.
5. Construire une ou plusieurs views.
6. Maintenir la traçabilité avec les exigences.
7. Réutiliser le même modèle dans les phases suivantes.
```

## 5. Foundation vs Practitioner

Pour Foundation : savoir reconnaître les concepts et comprendre comment les standards se complètent.

Pour Practitioner : savoir choisir les concepts, relations et viewpoints adaptés à un contexte réel, et expliquer pourquoi le modèle supporte une décision ADM.

## À retenir

> **TOGAF donne le chemin de travail ; ArchiMate donne un langage cohérent pour représenter ce que ce travail découvre, décide et transforme.**