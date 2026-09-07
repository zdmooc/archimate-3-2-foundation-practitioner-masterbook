# Cheat Sheet 01 — Carte complète du langage

## Les grands domaines

| Domaine | Question principale | Exemples |
|---|---|---|
| Motivation | Pourquoi changer ? | Driver, Assessment, Goal, Requirement |
| Strategy | Que devons-nous savoir faire ? | Capability, Resource, Value Stream, Course of Action |
| Business | Que fait le métier ? | Actor, Role, Process, Service, Object, Product |
| Application | Comment les applications supportent-elles le métier ? | Component, Function, Service, Interface, Data Object |
| Technology | Quelle plateforme fournit l’exécution ? | Node, Device, System Software, Technology Service, Artifact |
| Physical | Quelle infrastructure physique non-IT intervient ? | Facility, Equipment, Distribution Network, Material |
| Implementation & Migration | Comment transformer l’existant ? | Work Package, Deliverable, Event, Plateau, Gap |

## Les trois grands aspects

### Active Structure
**Qui / quoi exécute ?**

Exemples : Business Actor, Business Role, Application Component, Node, Device, Equipment.

### Behavior
**Qu’est-ce qui est fait ?**

Exemples : Process, Function, Interaction, Event, Service.

### Passive Structure
**Sur quoi agit le comportement ?**

Exemples : Business Object, Data Object, Artifact, Material.

## Internal / External

- **Internal behavior** : comment le comportement est réalisé à l’intérieur.
- **Service** : comportement exposé à un consommateur.
- **Interface** : point d’accès à ce service.

Mémo :

```text
STRUCTURE
   ↓ assignment
BEHAVIOR INTERNE
   ↓ realization
SERVICE
   ↓ exposed through
INTERFACE
```

## Chaîne cross-layer type

```text
Driver
→ Assessment
→ Goal
→ Requirement
→ Capability
→ Business Process
→ Business Service
→ Application Service
→ Application Component
→ Technology Service
→ System Software / Node
→ Facility / Device
→ Work Package / Plateau
```

## Les erreurs à éliminer immédiatement

- Un produit technique n’est pas automatiquement une Capability.
- Une API n’est pas automatiquement un Application Component.
- Kafka n’est pas un Data Object.
- Une base de données n’est pas un Data Object.
- Un serveur n’est pas un Facility.
- Un datacenter n’est pas un Node.
- Une image OCI n’est pas un Material.
- Une release n’est pas automatiquement un Plateau.
- Un projet n’est pas un Course of Action.
- Un Goal n’est pas un Requirement.

## Questions de décision rapides

- **Pourquoi ?** → Motivation.
- **Aptitude ?** → Capability.
- **Séquence métier ?** → Business Process.
- **Fonctionnalité exposée métier ?** → Business Service.
- **Logiciel logique ?** → Application Component.
- **Fonctionnalité applicative exposée ?** → Application Service.
- **Point d’accès API/UI ?** → Application Interface.
- **Plateforme/runtime ?** → System Software.
- **Fonctionnalité de plateforme exposée ?** → Technology Service.
- **Ressource d’exécution ?** → Node.
- **Matériel IT ?** → Device.
- **Bâtiment/site ?** → Facility.
- **Travail de transformation ?** → Work Package.
- **État architectural stable ?** → Plateau.
- **Écart baseline/target ?** → Gap.