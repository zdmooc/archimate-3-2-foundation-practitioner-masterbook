# Partie XII — Patterns de modélisation : transformer le langage en réflexes d’architecte

Connaître les éléments ArchiMate ne suffit pas. Un architecte doit savoir **choisir le bon concept, construire une chaîne sémantique cohérente, sélectionner la bonne relation et éviter les raccourcis qui produisent des modèles visuellement convaincants mais faux**.

Cette partie transforme les Parties I à XI en **patterns de raisonnement réutilisables**.

> Les patterns présentés ici sont des recettes pédagogiques et professionnelles construites à partir de la sémantique ArchiMate 3.2. Ils ne constituent pas une bibliothèque normative imposée par The Open Group. Pour un modèle formel, la validité des relations doit toujours être vérifiée avec la spécification et la matrice des relations.

---

## 1. Le réflexe général

Avant de choisir un élément, répondre à la question :

```text
Pourquoi ?        → Motivation
De quoi être capable ? → Strategy / Capability
Qui ?             → Active Structure
Que fait-on ?     → Behavior
Quel service est exposé ? → Service
Par où ?          → Interface
Quelle information ? → Passive Structure
Avec quelle application ? → Application
Sur quelle plateforme ? → Technology
Dans quelle infrastructure physique ? → Physical
Comment transformer ? → Implementation & Migration
```

La majorité des erreurs viennent du fait qu’on commence par le nom réel de l’objet — « API », « Kafka », « équipe », « plateforme » — au lieu de commencer par **le rôle architectural joué dans la vue**.

---

## 2. Même objet réel, concepts différents selon le concern

Un même objet réel peut apparaître sous différents concepts si le concern change.

Exemple : **Payment API**.

Si l’on parle de la fonctionnalité exposée :

```text
Application Service: Payment Initiation Service
```

Si l’on parle du point d’accès :

```text
Application Interface: Payment REST API
```

Si l’on parle du composant qui fournit cette API :

```text
Application Component: Payment API Gateway
```

Si l’on parle du produit déployable :

```text
Artifact: payment-api-gateway container image
```

Le mot « API » ne détermine donc pas automatiquement le type ArchiMate.

---

## 3. Pattern de lecture en cinq questions

Pour chaque élément :

1. **De quelle couche parle-t-on ?**
2. **Est-ce une structure, un comportement, un service, une interface, une information ou une motivation ?**
3. **Quel niveau d’abstraction est utile ?**
4. **Quel autre concept pourrait être confondu avec celui-ci ?**
5. **Quelle relation exprime réellement le lien ?**

---

## 4. Pattern de construction cross-layer

Une architecture de solution peut souvent être lue ainsi :

```text
Driver
→ Goal
→ Requirement
→ Capability
→ Business Process
→ Application Service
→ Application Component
→ Data Object
→ Artifact
→ Technology Service
→ System Software
→ Node
→ Facility
→ Gap
→ Work Package
→ Plateau
```

Cette chaîne n’est pas une séquence obligatoire. Elle sert à vérifier que la solution reste **traçable de la raison métier jusqu’à l’implémentation et la transformation**.

---

## 5. Pattern de choix : abstraction avant technologie

Mauvais réflexe :

```text
"J’ai Kafka, donc je mets Application Component: Kafka."
```

Meilleur raisonnement :

```text
Que veux-je montrer ?

Fonctionnalité de streaming fournie ?
→ Technology Service: Event Streaming Service

Produit logiciel de plateforme ?
→ System Software: Kafka

Événement métier/applicatif transporté ?
→ Application Event

Payload structuré ?
→ Data Object
```

---

## 6. Pattern de séparation interne / externe

Pour Business, Application et Technology :

```text
Internal Structure
      ↓ Assignment
Internal Behavior
      ↓ Realization
External Service
      ↓ exposed through
Interface
      ↓ Serving
Consumer
```

Exemple Application :

```text
Payment Orchestrator
  Assignment → Orchestrate Payment Function

Orchestrate Payment Function
  Realization → Payment Orchestration Service

Payment REST API
  exposes → Payment Orchestration Service

Payment Orchestration Service
  Serving → Execute Instant Payment Process
```

Ce pattern empêche de mélanger :

- le fournisseur ;
- ce qu’il fait en interne ;
- ce qu’il expose ;
- par où il l’expose ;
- qui le consomme.

---

## 7. Pattern de qualité : le test de la phrase

Une relation est correcte si l’on peut lire une phrase naturelle.

```text
Fraud Engine ASSIGNED TO Fraud Scoring Function
Fraud Scoring Function REALIZES Fraud Scoring Service
Fraud Scoring Service SERVES Payment Orchestration Process
Payment Orchestration Process ACCESSES Payment Transaction
Payment Received TRIGGERS Validate Payment
Validate Payment FLOWS Payment Instruction TO Fraud Check
```

Si la phrase n’a pas de sens, la relation est probablement incorrecte.

---

## 8. Les grands groupes de patterns de cette partie

### Choisir les éléments

- Actor vs Role
- Capability vs Process vs Function
- Function vs Process vs Interaction
- Service vs Behavior
- Interface vs Service
- Product vs Application

### Information

- Business Object vs Data Object vs Artifact
- Event vs payload
- Access vs Flow

### Application / Technology / Physical

- Application Component vs System Software
- Node vs Device vs Equipment
- Communication Network vs Distribution Network
- Technology Service vs System Software

### Transformation

- Course of Action vs Work Package
- Goal vs Outcome vs Requirement
- Gap vs Assessment
- Plateau vs Environment
- Implementation Event vs Application Event

### Solutions professionnelles

- API
- microservices
- Kafka/event-driven
- OpenShift/Kubernetes
- database/data platform
- IAM/security
- observability
- HA/DR
- migration
- Green IT

---

## 9. Anti-pattern général : « un rectangle = un système »

Beaucoup de diagrammes d’architecture utilisent des rectangles génériques :

```text
[Client]
   ↓
[API]
   ↓
[Kafka]
   ↓
[Oracle]
```

Le dessin peut être utile pour une discussion rapide, mais il ne précise pas :

- service ou composant ?
- interface ou plateforme ?
- donnée ou moteur de données ?
- flux ou dépendance ?
- application ou technologie ?

ArchiMate apporte précisément cette sémantique.

---

## 10. Règle d’or Practitioner

> **Le bon concept n’est pas celui qui ressemble le plus au nom réel de l’objet ; c’est celui qui exprime le mieux son rôle dans le concern du modèle.**

Le niveau Practitioner évalue précisément la capacité à appliquer le langage dans des situations réelles, à utiliser les relations, le cross-layer modeling, les viewpoints et les mécanismes avancés de manière cohérente.
