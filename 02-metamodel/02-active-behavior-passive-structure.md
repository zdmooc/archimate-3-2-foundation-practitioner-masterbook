# 9 — Active Structure, Behavior et Passive Structure

## 9.1 Le triptyque central

La majorité des concepts structurants du cœur d’ArchiMate peuvent être compris avec trois familles :

```text
ACTIVE STRUCTURE
Qui / quoi exécute ?

BEHAVIOR
Qu’est-ce qui est fait ?

PASSIVE STRUCTURE
Sur quoi agit-on ?
```

Cette distinction n’est pas décorative. Elle détermine la manière dont les éléments peuvent être reliés et la façon dont on raconte l’architecture.

---

## 9.2 Active Structure : l’exécutant

Un élément d’Active Structure représente quelque chose capable de réaliser un comportement.

### Exemple métier

```text
Business Role: Payment Operations
```

Le rôle peut être assigné à :

```text
Business Process: Resolve Payment Exception
```

### Exemple applicatif

```text
Application Component: Payment Orchestrator
```

Le composant peut être assigné à :

```text
Application Function: Route Payment
```

### Exemple technologique

```text
System Software: Kafka Platform
```

peut fournir ou supporter des comportements technologiques.

---

## 9.3 Behavior : ce qui se passe

Behavior représente une activité, une fonction, un processus, une interaction, un événement ou un service.

On peut distinguer plusieurs intentions.

### Process

Séquence de comportements produisant un résultat.

### Function

Regroupement de comportements fondé sur une responsabilité, une compétence ou une ressource.

### Interaction

Comportement collectif.

### Event

Changement d’état.

### Service

Comportement exposé à l’environnement.

---

## 9.4 Passive Structure : l’objet du comportement

Un élément de Passive Structure ne “fait” pas lui-même le comportement.

Il est manipulé, consulté, produit ou transformé.

Exemple métier :

```text
Business Object: Payment Instruction
```

Exemple applicatif :

```text
Data Object: Payment Message
```

Exemple technologique :

```text
Artifact: payment-orchestrator.jar
```

---

## 9.5 Le pattern Assignment

Une relation Assignment permet notamment d’exprimer qu’un élément actif est responsable d’un comportement.

```text
Business Role
Payment Operations
   │ assignment
   ▼
Business Process
Resolve Exception
```

Phrase naturelle :

> Payment Operations exécute ou porte la responsabilité de Resolve Exception.

Même logique :

```text
Application Component
Payment Orchestrator
   │ assignment
   ▼
Application Function
Route Payment
```

---

## 9.6 Le pattern Access

Access exprime l’accès à un élément passif.

```text
Business Process
Validate Payment
   │ access
   ▼
Business Object
Payment Instruction
```

ou :

```text
Application Function
Persist Payment
   │ access write
   ▼
Data Object
Payment Record
```

La relation peut préciser lecture, écriture ou lecture/écriture selon le contexte et la notation utilisée.

---

## 9.7 Le pattern Realization

Realization exprime qu’un concept plus concret réalise un concept plus abstrait.

Exemple :

```text
Application Function
Validate Payment
   │ realization
   ▼
Application Service
Payment Validation
```

La fonction interne réalise le service exposé.

Autre exemple :

```text
Data Object
ISO20022 Payment Message
   │ realization
   ▼
Business Object
Payment Instruction
```

La donnée applicative réalise une représentation plus concrète du concept métier.

---

## 9.8 Le pattern Serving

Serving exprime qu’un élément fournit une fonctionnalité à un autre.

```text
Application Service
Payment Validation
   │ serving
   ▼
Business Process
Execute Payment
```

Lecture :

> Le service applicatif Payment Validation sert le processus métier Execute Payment.

Serving est central pour les modèles cross-layer.

---

## 9.9 Un même besoin, trois niveaux

Supposons le besoin “valider un paiement”.

### Métier

```text
Business Process: Validate Payment
```

### Application

```text
Application Function: Execute Validation Rules
Application Service: Payment Validation Service
```

### Technology

```text
Technology Service: Container Execution
```

Chaque élément représente une partie différente de la chaîne.

---

## 9.10 Process vs Function

Cette confusion est fréquente.

### Process

Met l’accent sur l’enchaînement vers un résultat.

Exemple :

```text
Initiate → Validate → Screen → Route → Confirm
```

### Function

Met l’accent sur un regroupement fonctionnel ou une responsabilité.

Exemple :

```text
Fraud Management
Payment Operations
Reconciliation Management
```

Une entreprise peut modéliser le même domaine avec les deux selon la question posée.

---

## 9.11 Service vs Process

### Process

Décrit comment un comportement est exécuté en interne.

### Service

Décrit ce qui est exposé à l’environnement.

Exemple :

```text
Business Process
Execute Instant Payment
   │ realizes
   ▼
Business Service
Instant Payment Service
```

Un client consomme le service ; il ne connaît pas nécessairement le processus interne complet.

---

## 9.12 Actor vs Role

### Actor

Entité organisationnelle capable d’agir.

Exemples :

- MayaBank ;
- Payment Operations Team ;
- Customer.

### Role

Responsabilité ou comportement attendu qu’un acteur peut assumer.

Exemples :

- Payment Operator ;
- Fraud Analyst ;
- Settlement Manager.

Un même acteur peut assumer plusieurs rôles.

Un même rôle peut parfois être assumé par plusieurs acteurs.

---

## 9.13 Component vs Service

Un Application Component est une structure logicielle.

Un Application Service est une fonctionnalité exposée.

Exemple :

```text
Payment Orchestrator
(Application Component)

realizes

Payment Routing
(Application Service)
```

Dire “le microservice est le service” peut être pratique oralement, mais en ArchiMate il est utile de séparer **le fournisseur** et **ce qu’il fournit**.

---

## 9.14 Object vs Data Object vs Artifact

### Business Object

Concept informationnel métier.

`Payment Instruction`

### Data Object

Donnée structurée pour traitement applicatif.

`ISO20022 Payment Message`

### Artifact

Élément de donnée concret utilisé ou produit dans un contexte de développement, déploiement ou exploitation.

`payment-message-schema.json`, `payment-orchestrator.jar`, etc., selon ce que l’on modélise.

La relation de Realization peut relier ces niveaux lorsqu’elle est sémantiquement appropriée.

---

## 9.15 Exercice de classification

### “Fraud Analyst”

**Réponse :** Business Role si l’on modélise la responsabilité ; potentiellement Business Actor si l’on représente une personne ou entité concrète.

### “Fraud Screening”

**Réponse :** peut être Capability, Business Function, Business Process ou Application Service selon la signification voulue. Le nom seul ne suffit pas.

### “Fraud Engine”

**Réponse :** Application Component si l’on représente le système logiciel.

### “Fraud Decision”

**Réponse :** Business Object ou Data Object selon le niveau métier ou applicatif.

### “Fraud Screening API”

**Réponse :** Application Interface si l’on représente le point d’accès ; Application Service si l’on représente la fonctionnalité exposée.

---

## 9.16 Technique Practitioner : partir de la phrase métier

Avant de sélectionner un élément, reformuler :

> “Une équipe exécute un traitement qui lit une information et expose un résultat à une application.”

Puis mapper :

```text
Business Role
→ Business Process
→ Business Object
→ Application Service
```

Cette méthode évite de choisir un type uniquement à cause du vocabulaire employé dans le scénario.

---

## 9.17 Questions de compréhension

### Q1 — Quelle catégorie représente ce qui exécute ?

**Réponse :** Active Structure.

### Q2 — Quelle catégorie représente ce qui est fait ?

**Réponse :** Behavior.

### Q3 — Quelle catégorie représente ce qui est utilisé ou produit ?

**Réponse :** Passive Structure.

### Q4 — Quelle relation relie typiquement un élément actif à un comportement qu’il exécute ?

**Réponse :** Assignment.

### Q5 — Quelle relation exprime l’accès à une information ou un objet passif ?

**Réponse :** Access.

---

## À retenir

> **Ne mémorisez pas seulement les symboles. Demandez toujours : qui exécute, quel comportement, sur quel objet, et quel service est exposé ?**
