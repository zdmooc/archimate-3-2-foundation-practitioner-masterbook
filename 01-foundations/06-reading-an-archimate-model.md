# 6 — Lire un modèle ArchiMate

## 6.1 Lire avant de modéliser

Savoir lire un modèle est une compétence distincte de la capacité à en construire un.

Un bon lecteur ne commence pas par suivre toutes les flèches. Il cherche d’abord :

1. le but de la vue ;
2. les couches présentes ;
3. les types d’éléments ;
4. les relations dominantes ;
5. le sens général de la chaîne architecturale.

---

## 6.2 Méthode en six passes

### Passe 1 — Identifier le titre et l’objectif

Exemple :

`MayaBank — Instant Payment Target Architecture`

Le titre indique qu’il s’agit probablement d’une vue cible.

### Passe 2 — Identifier les couches

Chercher :

- Motivation ?
- Strategy ?
- Business ?
- Application ?
- Technology ?
- Implementation & Migration ?

### Passe 3 — Identifier les éléments structurants

Exemple :

- Capability ;
- Business Process ;
- Application Component ;
- Technology Service.

### Passe 4 — Lire les relations

Ne pas lire seulement “A est relié à B”.

Lire la phrase complète :

```text
Payment Orchestrator realizes Payment Routing Service
```

### Passe 5 — Reconstituer l’histoire

Quel est le récit architectural ?

### Passe 6 — Chercher les anomalies

- élément dans la mauvaise couche ;
- relation trop générique ;
- service confondu avec interface ;
- capability confondue avec application ;
- sens de relation inversé.

---

## 6.3 Lire de haut en bas

Une vue cross-layer peut souvent être lue ainsi :

```text
WHY
Goal / Requirement
↓
WHAT ABILITY
Capability
↓
BUSINESS
Process / Service
↓
APPLICATION
Service / Component
↓
TECHNOLOGY
Service / Node
```

Cette lecture permet de raconter l’architecture à un stakeholder.

---

## 6.4 Lire de bas en haut

On peut aussi partir d’une technologie et remonter vers son impact.

Exemple :

```text
OpenShift Worker
↓ supports
Container Execution Service
↓ serves
Payment Orchestrator
↓ realizes
Payment Routing Application Service
↓ serves
Execute Payment Business Process
↓ realizes
Instant Payment Business Service
```

Question répondue :

> Pourquoi ce cluster est-il critique pour le métier ?

---

## 6.5 Lire une relation comme une phrase

C’est l’un des meilleurs exercices.

### Assignment

```text
Payment Operations Role
assigned to
Handle Exceptions Process
```

Lire :

> Le rôle Payment Operations exécute ou porte la responsabilité du processus Handle Exceptions.

### Realization

```text
Payment Orchestrator
realizes
Payment Routing Service
```

Lire :

> Le composant Payment Orchestrator fournit la réalisation concrète du service Payment Routing.

### Serving

```text
Payment Routing Service
serves
Execute Payment Process
```

Lire :

> Le service applicatif Payment Routing fournit une fonctionnalité au processus métier Execute Payment.

### Access

```text
Validate Payment Process
accesses
Payment Instruction
```

Lire :

> Le processus Validate Payment lit ou écrit l’objet Payment Instruction selon le mode d’accès.

---

## 6.6 Lire une vue Motivation

Chercher généralement :

```text
Stakeholder
→ Driver
→ Assessment
→ Goal / Outcome
→ Principle / Requirement / Constraint
```

Question principale :

> Pourquoi l’architecture doit-elle changer et quelles exigences en découlent ?

---

## 6.7 Lire une vue Strategy

Chercher :

```text
Goal
→ Course of Action
→ Capability
→ Value Stream
```

Question principale :

> Quelles aptitudes et orientations permettent d’atteindre les objectifs ?

---

## 6.8 Lire une vue Business

Chercher :

```text
Actor / Role
→ Process / Function
→ Service
→ Business Object
```

Question principale :

> Qui fait quoi, quel service est fourni et quelles informations métier sont utilisées ?

---

## 6.9 Lire une vue Application

Chercher :

```text
Application Component
→ Function / Process
→ Application Service
→ Data Object
```

Question principale :

> Quelle structure logicielle fournit quelles fonctionnalités et manipule quelles données ?

---

## 6.10 Lire une vue Technology

Chercher :

```text
Node / System Software
→ Technology Function
→ Technology Service
→ Artifact
```

Question principale :

> Sur quelles ressources et plateformes la solution repose-t-elle ?

---

## 6.11 Lire une vue de migration

Chercher :

```text
Baseline Plateau
→ Gap
→ Work Package
→ Deliverable
→ Target Plateau
```

Question principale :

> Comment l’organisation passe-t-elle de l’existant à la cible ?

---

## 6.12 Exemple complet MayaBank

Supposons la chaîne suivante :

```text
Driver: Customer expectation for instant payments
↓ influences
Goal: Real-time payment experience
↓ realized by
Capability: Real-Time Payment Processing
↓ realized by
Business Process: Execute Instant Payment
↓ served by
Application Service: Payment Orchestration
↓ realized by
Application Component: Payment Orchestrator
↓ served by
Technology Service: Event Streaming
↓ realized by
System Software: Kafka Platform
```

Lecture naturelle :

> La demande client pour des paiements instantanés motive un objectif d’expérience temps réel. Cet objectif nécessite la capacité de traiter les paiements en temps réel. Le processus Execute Instant Payment contribue à cette capacité et s’appuie sur le service applicatif Payment Orchestration, réalisé par le composant Payment Orchestrator, lui-même dépendant d’un service technologique d’event streaming réalisé par la plateforme Kafka.

Une bonne vue doit pouvoir être racontée ainsi.

---

## 6.13 Détecter une mauvaise modélisation

### Exemple 1

```text
Kafka → realizes → Business Process
```

Suspect : on saute directement d’un produit technique à un comportement métier sans expliquer la chaîne de support.

### Exemple 2

```text
Payment App = Capability
```

Suspect : une application n’est pas une aptitude de l’organisation.

### Exemple 3

```text
REST API = Application Component
```

Pas forcément faux selon le contexte, mais souvent une API est mieux représentée comme Interface et/ou Service, tandis qu’un composant réalise ces comportements.

### Exemple 4

Association utilisée pour toutes les dépendances.

Suspect : on perd la sémantique disponible dans les relations plus précises.

---

## 6.14 Lire la direction des flèches avec prudence

Les relations ArchiMate possèdent une sémantique et une direction qui doivent être apprises.

Il ne faut pas déduire le sens uniquement à partir d’une intuition graphique.

Pendant l’apprentissage, verbaliser systématiquement :

> A [relation] B.

Puis vérifier si la phrase correspond au sens voulu.

---

## 6.15 Questions de compréhension

### Q1 — Quelle est la première chose à chercher dans une vue ?

**Réponse :** son objectif, son audience ou la question à laquelle elle tente de répondre.

### Q2 — Pourquoi lire une relation comme une phrase ?

**Réponse :** parce que cela force à vérifier sa sémantique au lieu de voir une simple ligne.

### Q3 — Quel est l’intérêt d’une lecture bottom-up ?

**Réponse :** comprendre l’impact métier d’un élément technique ou applicatif.

### Q4 — Que cherche-t-on principalement dans une vue de migration ?

**Réponse :** les états Baseline/Target ou plateaus, les gaps et les work packages qui réalisent la transition.

---

## À retenir

> **Une bonne lecture ArchiMate transforme un diagramme en une histoire causale : pourquoi, quoi, qui, comment, sur quoi, et comment cela change.**
