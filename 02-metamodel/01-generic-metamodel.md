# 8 — Le métamodèle générique

## 8.1 Pourquoi apprendre le métamodèle avant les listes d’éléments

Il est possible d’apprendre ArchiMate en mémorisant des dizaines d’éléments un par un.

Ce n’est pas la meilleure méthode.

Le métamodèle générique montre que beaucoup d’éléments suivent les mêmes idées fondamentales.

Si vous comprenez :

- Active Structure ;
- Behavior ;
- Passive Structure ;
- Internal / External ;
- Interface ;

alors Business, Application et Technology deviennent beaucoup plus faciles à apprendre.

---

## 8.2 Le triangle conceptuel

Une simplification puissante est :

```text
WHO / WHAT PERFORMS?
Active Structure
        │
        │ performs
        ▼
WHAT HAPPENS?
Behavior
        │
        │ accesses / produces / uses
        ▼
WHAT IS ACTED UPON?
Passive Structure
```

Exemple métier :

```text
Business Role
Payment Operations
      │
      ▼
Business Process
Handle Payment Exception
      │
      ▼
Business Object
Payment Exception
```

Exemple applicatif :

```text
Application Component
Payment Orchestrator
      │
      ▼
Application Function
Route Payment
      │
      ▼
Data Object
Payment Message
```

Exemple technologique :

```text
System Software
Event Streaming Platform
      │
      ▼
Technology Function
Process Event Stream
      │
      ▼
Artifact
Event Log Segment
```

---

## 8.3 Active Structure

Un active structure element représente une entité capable de réaliser un comportement.

Il répond à :

> Qui ou quoi exécute ?

### Business

- Business Actor ;
- Business Role ;
- Business Collaboration ;
- Business Interface.

### Application

- Application Component ;
- Application Collaboration ;
- Application Interface.

### Technology

- Node ;
- Device ;
- System Software ;
- Technology Collaboration ;
- Technology Interface ;
- Path ;
- Communication Network.

Tous ne jouent pas exactement le même rôle, mais ils appartiennent à la logique de structure active.

---

## 8.4 Behavior

Un behavior element représente une unité de comportement.

Il répond à :

> Qu’est-ce qui se passe ?

On retrouve des catégories similaires dans plusieurs couches.

### Internal behavior

- Process ;
- Function ;
- Interaction.

### Event

Représente un changement d’état ayant une occurrence dans le temps.

### Service

Représente un comportement explicitement exposé à l’environnement.

---

## 8.5 Passive Structure

Un passive structure element représente un objet sur lequel un comportement agit.

Il répond à :

> Quelle information, donnée, représentation ou matière est utilisée ou produite ?

Exemples :

- Business Object ;
- Data Object ;
- Artifact ;
- Material.

---

## 8.6 Le pattern structure → behavior → service

Un pattern fondamental apparaît dans plusieurs couches.

### Business

```text
Business Role
assigned to
Business Process
realizes
Business Service
```

### Application

```text
Application Component
assigned to
Application Function
realizes
Application Service
```

### Technology

```text
System Software / Node
assigned to
Technology Function
realizes
Technology Service
```

Ce pattern permet de distinguer :

- qui fournit ;
- comment cela fonctionne en interne ;
- ce qui est exposé à l’extérieur.

---

## 8.7 Internal vs External Behavior

Prenons un restaurant.

### Internal behavior

```text
Prepare Meal
```

### External behavior

```text
Meal Service
```

Le client n’a pas besoin de connaître toutes les étapes de préparation.

Même logique en application :

```text
Application Function
Validate Payment Internally
```

peut réaliser :

```text
Application Service
Payment Validation Service
```

Le consommateur du service voit la fonctionnalité exposée, pas nécessairement son fonctionnement interne.

---

## 8.8 Interface comme point d’accès

L’interface permet d’exposer ou d’accéder à un service.

Exemple :

```text
Application Component
Payment Gateway
      │
      ├─ Application Interface: REST /payments
      │
      └─ Application Service: Payment Initiation
```

Le service et l’interface sont liés mais différents.

Une même fonctionnalité peut parfois être exposée via plusieurs interfaces.

---

## 8.9 Collaboration et Interaction

### Collaboration

Structure composée de plusieurs éléments actifs coopérant.

### Interaction

Comportement collectif réalisé par plusieurs participants.

Exemple métier :

```text
Business Collaboration
Fraud Investigation Team
```

peut effectuer :

```text
Business Interaction
Investigate Suspicious Payment
```

Cette distinction suit encore la logique :

```text
Structure collective → Behavior collectif
```

---

## 8.10 Process vs Function

Les deux sont des comportements internes, mais leur intention diffère.

### Process

Met l’accent sur une séquence ou un enchaînement produisant un résultat.

### Function

Regroupe un comportement selon des critères tels que compétences, ressources ou responsabilité, sans insister nécessairement sur la séquence.

Exemple :

```text
Business Function: Fraud Management
```

peut contenir/agréger plusieurs comportements, tandis que :

```text
Business Process: Screen Payment
```

exprime une séquence orientée résultat.

---

## 8.11 Event

Un Event représente un changement d’état.

Exemples :

```text
Business Event: Payment Requested
Application Event: Payment Validation Completed
Technology Event: Node Failure Detected
```

Un événement peut déclencher un comportement.

```text
Payment Requested
triggers
Validate Payment
```

---

## 8.12 Service

Un Service est un comportement explicitement exposé à son environnement.

Trois niveaux importants :

```text
Business Service
Application Service
Technology Service
```

Exemple :

```text
Business Service
Instant Payment

supported by

Application Service
Payment Orchestration

supported by

Technology Service
Event Streaming
```

Le mot service ne suffit donc jamais : il faut savoir **dans quelle couche**.

---

## 8.13 Objet passif et abstraction

La même information peut être représentée à plusieurs niveaux.

```text
Business Object
Payment Instruction
      │ realized by
      ▼
Data Object
Payment Message
      │ realized by
      ▼
Artifact
pain.001 XML File
```

Cette chaîne est très utile dans les architectures de paiement.

Elle permet de distinguer :

- concept métier ;
- représentation applicative ;
- artefact déployé ou manipulé concrètement.

---

## 8.14 MayaBank : modèle minimal générique

```text
Business Role
Payment Operations
      │ assignment
      ▼
Business Process
Handle Exception
      │ access
      ▼
Business Object
Payment Exception

Business Process
Handle Exception
      ▲ serving
      │
Application Service
Exception Management
      ▲ realization
      │
Application Component
Exception Manager
```

Ce petit modèle contient déjà :

- Active Structure ;
- Behavior ;
- Passive Structure ;
- Assignment ;
- Access ;
- Serving ;
- Realization ;
- cross-layer support.

---

## 8.15 Utiliser le métamodèle pour choisir un élément

Supposons que vous deviez modéliser `Fraud Engine`.

Posez :

### Est-ce une aptitude de l’entreprise ?

Alors peut-être **Capability** : `Fraud Detection`.

### Est-ce un logiciel ?

Alors probablement **Application Component**.

### Est-ce une fonctionnalité offerte par ce logiciel ?

Alors **Application Service**.

### Est-ce un traitement interne ?

Alors **Application Function/Process**.

### Est-ce une donnée manipulée ?

Alors **Data Object**.

Le métamodèle transforme un choix intuitif en raisonnement.

---

## 8.16 Pièges Foundation

### Structure ≠ Behavior

`Application Component` ≠ `Application Function`.

### Behavior interne ≠ Service

`Business Process` ≠ `Business Service`.

### Service ≠ Interface

`Application Service` ≠ `Application Interface`.

### Object métier ≠ Data Object

Le premier représente un concept métier ; le second une donnée structurée pour traitement automatisé.

### Event ≠ Process

Un Event représente une occurrence/changement d’état ; un Process représente un comportement.

---

## 8.17 Questions de compréhension

### Q1 — Quelle question pose Active Structure ?

**Réponse :** qui ou quoi est capable d’exécuter un comportement ?

### Q2 — Quelle question pose Behavior ?

**Réponse :** qu’est-ce qui est fait ou se produit ?

### Q3 — Quelle question pose Passive Structure ?

**Réponse :** sur quel objet le comportement agit-il ou quelle information/matière est-elle utilisée/produite ?

### Q4 — Pourquoi Service et Function sont-ils différents ?

**Réponse :** la Function décrit un comportement interne ; le Service décrit un comportement exposé à l’environnement.

### Q5 — Pourquoi Interface et Service sont-ils différents ?

**Réponse :** l’Interface est un point d’accès ; le Service est la fonctionnalité/comportement exposé.

---

## À retenir

> **Active Structure performs Behavior, Behavior acts on Passive Structure, and Services expose Behavior to an environment.**

Cette phrase explique une grande partie du métamodèle ArchiMate.
