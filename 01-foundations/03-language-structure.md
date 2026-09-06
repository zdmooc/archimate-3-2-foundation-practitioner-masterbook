# 3 — Structure du langage ArchiMate

## 3.1 Une grammaire d’architecture

ArchiMate peut être compris comme une grammaire.

Un modèle contient :

- des **éléments** qui représentent des concepts ;
- des **relations** qui expriment la manière dont ces concepts sont liés ;
- des **vues** qui présentent une sélection du modèle ;
- des **viewpoints** qui guident la construction de vues adaptées à une préoccupation.

La puissance du langage ne vient pas uniquement du nombre d’éléments disponibles, mais du fait qu’ils sont organisés selon une structure cohérente.

---

## 3.2 Deux dimensions fondamentales

Le cœur du langage peut être compris avec deux dimensions :

1. **les couches / domaines** ;
2. **les aspects conceptuels**.

Les couches répondent approximativement à :

```text
WHY?        Motivation
WHAT ABILITY? Strategy
WHAT BUSINESS? Business
WHAT SOFTWARE? Application
WHAT PLATFORM? Technology
WHAT PHYSICAL? Physical
HOW TO CHANGE? Implementation & Migration
```

Les aspects répondent principalement à :

```text
WHO / WHAT performs?       Active Structure
WHAT happens?              Behavior
WHAT is used / produced?   Passive Structure
```

Cette matrice mentale permet de classer une grande partie des éléments.

---

## 3.3 Les couches principales

### Motivation

Explique les raisons, intentions, contraintes et valeurs qui influencent l’architecture.

Exemples :

- Stakeholder ;
- Driver ;
- Goal ;
- Requirement ;
- Value.

### Strategy

Décrit les capacités, ressources et orientations nécessaires pour atteindre les objectifs.

Exemples :

- Capability ;
- Resource ;
- Value Stream ;
- Course of Action.

### Business

Décrit les acteurs métier, leurs comportements, services et informations métier.

Exemples :

- Business Actor ;
- Business Role ;
- Business Process ;
- Business Service ;
- Business Object.

### Application

Décrit la structure et le comportement du paysage applicatif.

Exemples :

- Application Component ;
- Application Service ;
- Application Process ;
- Data Object.

### Technology

Décrit l’infrastructure et les services technologiques qui supportent les applications.

Exemples :

- Node ;
- Device ;
- System Software ;
- Technology Service ;
- Artifact.

### Physical

Permet de représenter des environnements physiques, équipements et flux matériels.

### Implementation & Migration

Décrit les éléments nécessaires pour représenter une transformation.

Exemples :

- Work Package ;
- Deliverable ;
- Plateau ;
- Gap ;
- Implementation Event.

---

## 3.4 Les aspects : structure, comportement, information

### Active Structure

Représente ce qui est capable d’exécuter un comportement.

Exemples :

```text
Business Actor
Business Role
Application Component
Node
```

### Behavior

Représente ce qui est fait.

Exemples :

```text
Business Process
Business Function
Application Function
Application Service
Technology Service
```

### Passive Structure

Représente les objets sur lesquels un comportement agit ou qui transportent de l’information ou de la matière.

Exemples :

```text
Business Object
Data Object
Artifact
Material
```

---

## 3.5 Structure interne et comportement externe

Une autre distinction importante est celle entre :

- comportement interne ;
- service exposé à l’environnement.

Exemple applicatif :

```text
Application Component
Payment Orchestrator
       │ assigned to
       ▼
Application Function
Route Payment
       │ realizes
       ▼
Application Service
Payment Routing Service
```

L’Application Function décrit un comportement interne.

L’Application Service décrit un comportement explicitement exposé à l’environnement.

Cette différence reviendra constamment dans Business, Application et Technology.

---

## 3.6 Interface

Une interface représente un point d’accès permettant à un service d’être exposé.

Exemple :

```text
Application Component
Payment API Gateway
      │
Application Interface
REST Payment API
      │
Application Service
Payment Initiation Service
```

Il ne faut donc pas confondre :

- le composant qui fournit ;
- l’interface par laquelle on accède ;
- le service fourni.

---

## 3.7 Les concepts composites

Certains concepts combinent plusieurs aspects.

Exemple : un **Product** métier peut regrouper des services et des éléments passifs associés pour constituer une offre cohérente.

Le langage propose également Grouping et Location pour structurer ou contextualiser le modèle.

---

## 3.8 Exemple MayaBank : classification

Classons quelques termes courants.

| Terme MayaBank | Concept ArchiMate possible | Pourquoi |
|---|---|---|
| Customer | Business Actor | entité métier capable d’interagir |
| Payment Operations | Business Role | responsabilité métier |
| Execute Instant Payment | Business Process | séquence de comportements métier |
| Instant Payment Service | Business Service | comportement métier exposé |
| Payment Instruction | Business Object | information métier |
| Payment Orchestrator | Application Component | composant applicatif |
| Payment Routing API | Application Service | comportement applicatif exposé |
| Payment Data | Data Object | donnée structurée pour traitement automatisé |
| Kafka Platform | System Software | logiciel d’infrastructure |
| Event Streaming | Technology Service | comportement technologique exposé |
| OpenShift Worker | Node | ressource computationnelle |
| Payment Modernization | Work Package | ensemble de travaux de transformation |

La classification exacte dépend du contexte. Un même mot naturel peut représenter différents concepts selon ce que l’architecte souhaite exprimer.

---

## 3.9 Le piège des noms

Le nom d’un élément ne détermine pas son type.

Exemple :

`Payment Service` pourrait signifier :

- Business Service ;
- Application Service ;
- Technology Service ;
- nom commercial d’un Product.

Le modélisateur doit partir de la **sémantique**, pas du mot utilisé par l’organisation.

---

## 3.10 Relations : donner un sens aux dépendances

Une relation ne signifie pas simplement « A est connecté à B ».

Quelques intentions :

- **Assignment** : un élément actif exécute un comportement ou assume une responsabilité ;
- **Realization** : un élément plus concret réalise un élément plus abstrait ;
- **Serving** : un élément fournit une fonctionnalité à un autre ;
- **Access** : un comportement ou un élément actif accède à un objet passif ;
- **Triggering** : un comportement déclenche un autre comportement ;
- **Flow** : transfert d’information, de valeur ou de matière ;
- **Composition** : relation partie-tout forte ;
- **Aggregation** : relation partie-tout plus faible.

Les relations seront étudiées individuellement plus loin.

---

## 3.11 La même logique à plusieurs couches

Le langage est volontairement régulier.

Compare :

| Business | Application | Technology |
|---|---|---|
| Business Actor/Role | Application Component | Node/System Software |
| Business Process/Function | Application Process/Function | Technology Process/Function |
| Business Service | Application Service | Technology Service |
| Business Object | Data Object | Artifact |

Cette régularité facilite l’apprentissage.

---

## 3.12 Cross-layer modeling

La vraie valeur apparaît lorsque les couches sont reliées.

Exemple :

```text
Business Role
Payment Operations
      │ assigned to
      ▼
Business Process
Handle Payment Exception
      │ uses
      ▼
Application Service
Exception Management Service
      │ realized by
      ▼
Application Component
Exception Manager
      │ served by
      ▼
Technology Service
Container Execution
```

La vue montre une chaîne métier → application → technologie.

---

## 3.13 Niveau Foundation vs Practitioner

### Foundation

Il faut savoir :

- reconnaître les concepts ;
- comprendre leur définition ;
- interpréter la notation ;
- distinguer les catégories ;
- identifier la relation adaptée dans des cas simples.

### Practitioner

Il faut aller plus loin :

- choisir les bons concepts dans un scénario ;
- construire ou corriger un modèle ;
- raisonner cross-layer ;
- utiliser les mécanismes avancés ;
- sélectionner les vues pertinentes.

---

## 3.14 Questions de compréhension

### Q1 — Quelles sont les trois grandes catégories conceptuelles du cœur du métamodèle ?

**Réponse :** Active Structure, Behavior et Passive Structure.

### Q2 — Quelle différence entre Application Function et Application Service ?

**Réponse :** la Function décrit un comportement interne ; le Service décrit un comportement exposé à l’environnement.

### Q3 — Une interface est-elle un service ?

**Réponse :** non. L’interface représente un point d’accès par lequel un service peut être exposé.

### Q4 — Pourquoi le mot “service” est-il ambigu dans le langage naturel ?

**Réponse :** parce qu’ArchiMate distingue Business Service, Application Service et Technology Service selon la couche.

### Q5 — Qu’est-ce que le cross-layer modeling ?

**Réponse :** la modélisation des relations entre concepts appartenant à plusieurs couches afin de rendre visibles leurs dépendances.

---

## À retenir

> **Pour comprendre ArchiMate, pensez toujours en deux dimensions : dans quelle couche suis-je, et quel type de concept suis-je en train de représenter ?**
