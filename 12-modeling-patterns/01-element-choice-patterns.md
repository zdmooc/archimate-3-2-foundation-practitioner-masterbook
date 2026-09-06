# Patterns de choix des éléments — décider sans deviner

Cette fiche rassemble les confusions les plus fréquentes entre éléments proches. Le but n’est pas de mémoriser des définitions isolées, mais de poser **la bonne question de discrimination**.

---

## 1. Business Actor vs Business Role

### Business Actor

Qui ou quelle entité organisationnelle agit ?

```text
Payments Department
Fraud Operations Team
MayaBank
```

### Business Role

Quelle responsabilité est tenue ?

```text
Payment Operator
Fraud Analyst
Settlement Manager
```

### Pattern

```text
Business Actor
  Assignment → Business Role
```

### Test

Si la personne change mais la responsabilité reste, le concept est probablement un **Role**.

---

## 2. Business Collaboration vs Business Actor

`Business Collaboration` représente plusieurs structures métier coopérant comme un ensemble.

Exemple :

```text
Instant Payment Operations Collaboration
```

peut regrouper :

- Payment Operations ;
- Fraud Operations ;
- Treasury.

Ne pas créer un Actor artificiel uniquement pour représenter une coopération temporaire.

---

## 3. Capability vs Business Process

### Capability

Aptitude de l’entreprise.

```text
Real-Time Payment Processing
Fraud Detection
Customer Authentication
```

### Business Process

Séquence de comportements produisant un résultat.

```text
Execute Instant Payment
Handle Payment Exception
```

### Test

Question :

> « De quoi devons-nous être capables ? »

→ Capability.

Question :

> « Quelles étapes sont exécutées ? »

→ Business Process.

---

## 4. Capability vs Business Function

### Capability

Possibilité stratégique.

### Business Function

Regroupement de comportements internes selon une responsabilité ou compétence métier.

```text
Capability: Fraud Management
Business Function: Fraud Analysis
```

Une capability peut être réalisée/soutenue par plusieurs fonctions, processus, ressources et applications.

---

## 5. Business Process vs Business Function

### Process

Orientation vers une séquence et un résultat.

### Function

Orientation vers une responsabilité stable.

Exemple :

```text
Process: Execute Payment
Function: Payment Validation
```

Le même comportement réel peut être observé sous l’un ou l’autre angle selon le concern.

---

## 6. Process vs Interaction

`Interaction` est un comportement collectif réalisé par plusieurs structures actives qui collaborent.

```text
Payment-Fraud Decision Interaction
```

Si plusieurs parties participent conjointement au comportement et que cette coopération est le point de la vue, `Interaction` peut être plus pertinent qu’un simple Process.

---

## 7. Service vs Function / Process

### Function / Process

Comportement interne.

### Service

Comportement explicitement exposé à l’environnement.

Pattern :

```text
Internal Behavior
  Realization → Service

Service
  Serving → Consumer
```

### Exemple Application

```text
Payment Validation Function
  Realization → Payment Validation Service
```

Ne pas modéliser automatiquement chaque fonction comme service : une fonction peut rester purement interne.

---

## 8. Interface vs Service

### Service

Ce qui est fourni.

### Interface

Le point d’accès par lequel le service est rendu disponible.

```text
Application Service: Payment Status Service
Application Interface: Payment Status REST API
```

Même distinction au niveau Business et Technology.

### Test

Question : « Qu’est-ce que j’obtiens ? » → Service.

Question : « Par où j’y accède ? » → Interface.

---

## 9. Business Product vs Application Component

Un `Product` est une collection cohérente de services/contrats proposée à des clients ou marchés.

```text
Product: MayaBank Instant Payment Offer
```

Une application est un élément logiciel.

```text
Application Component: Mobile Banking App
```

Une application peut supporter un Product, mais n’est pas elle-même automatiquement le Product.

---

## 10. Resource vs Capability

### Resource

Actif dont l’entreprise dispose ou peut disposer.

### Capability

Aptitude rendue possible par des ressources, comportements et structures.

```text
Resource: Payment Engineering Team
Capability: Real-Time Payment Engineering
```

---

## 11. Goal vs Outcome

### Goal

État souhaité ou intention.

```text
Goal: Improve Payment Reliability
```

### Outcome

Résultat mesurable ou effet obtenu/attendu.

```text
Outcome: Payment Success Rate > 99.99%
```

Le Goal donne la direction ; l’Outcome donne une formulation plus observable du résultat.

---

## 12. Requirement vs Constraint

### Requirement

Propriété nécessaire à satisfaire.

```text
Requirement: All payment APIs shall use strong authentication
```

### Constraint

Restriction qui limite la manière dont le système peut être conçu ou réalisé.

```text
Constraint: Customer payment data must remain in EU-hosted environments
```

---

## 13. Driver vs Assessment

### Driver

Force qui motive le changement.

```text
Driver: Instant Payment Regulation
```

### Assessment

Résultat d’analyse concernant un driver ou une situation.

```text
Assessment: Current payment architecture cannot meet target latency
```

Le driver existe ; l’assessment exprime ce qu’on en conclut.

---

## 14. Course of Action vs Work Package

### Course of Action

Direction stratégique.

```text
Adopt Event-Driven Integration
```

### Work Package

Travail concret de transformation.

```text
Deploy Kafka Platform
Migrate Payment Events Wave 1
```

---

## 15. Gap vs Assessment

`Assessment` analyse une situation.

`Gap` exprime une différence entre deux états d’architecture.

```text
Assessment: Current platform is difficult to scale
Gap: No elastic container platform between Baseline and Target
```

---

## 16. Plateau vs Environment

Un Plateau représente un état relativement stable de l’architecture dans une transformation.

```text
Plateau: Hybrid Payments Transition
```

Un environnement technique est représenté par des éléments Technology/Application appropriés.

```text
Node: Production OpenShift Cluster
```

`Production` n’est pas automatiquement un Plateau.

---

## Méthode rapide

```text
1. Quelle question architecturale je pose ?
2. Quel aspect : structure, behavior, passive, motivation ?
3. Quelle couche ?
4. Interne ou exposé ?
5. État actuel ou transformation ?
```

> **Le bon élément exprime une intention sémantique, pas simplement un nom technique.**
