# Relations structurelles — Composition, Aggregation, Assignment, Realization

Les relations structurelles décrivent comment les éléments sont **construits, regroupés, affectés et réalisés**.

Elles sont parmi les relations les plus importantes du langage.

---

## 1. Composition

`Composition` exprime une relation tout/partie forte.

La partie appartient au tout d’une manière telle que son existence dans ce contexte dépend fortement de ce tout.

### Exemple

```text
Application Component: Payment Platform
  Composition → Application Component: Payment Orchestrator
```

Le sens du modèle est : le Payment Orchestrator est modélisé comme une partie constitutive de la Payment Platform.

### Exemple métier

```text
Business Actor: Payments Department
  Composition → Business Actor: Payment Operations Team
```

à condition que l’intention soit de représenter l’équipe comme partie organisationnelle constitutive de ce département.

### Piège

Ne pas utiliser Composition simplement parce qu’un élément est dessiné « à l’intérieur » d’un autre.

Le nesting graphique peut représenter une relation, mais il faut que la sémantique soit réellement celle de la relation choisie.

---

## 2. Aggregation

`Aggregation` exprime également une relation tout/partie, mais plus faible : les parties restent conceptuellement plus indépendantes.

### Exemple

```text
Product: Premium Banking Offer
  Aggregation → Business Service: Instant Payment Service
  Aggregation → Business Service: Card Service
```

Le Product regroupe des services dans une offre cohérente, sans impliquer que ces services cessent d’exister conceptuellement hors du produit.

### Composition vs Aggregation

```text
Composition = partie constitutive forte
Aggregation = regroupement plus faible
```

Question de décision :

> Si le tout disparaît du modèle, la partie perd-elle essentiellement son identité dans ce contexte ?

Si oui, `Composition` est souvent plus naturelle. Sinon, `Aggregation` peut être préférable.

---

## 3. Assignment

`Assignment` relie un élément de structure active à un comportement qu’il exécute, ou à une responsabilité/structure qu’il porte.

### Pattern métier

```text
Business Actor: Payments Operations Team
  Assignment → Business Role: Payment Operator

Business Role: Payment Operator
  Assignment → Business Process: Resolve Payment Exception
```

### Pattern application

```text
Application Component: Fraud Engine
  Assignment → Application Function: Calculate Fraud Score
```

### Pattern technologie

```text
Node: OpenShift Worker
  Assignment → Technology Function: Container Execution
```

### Assignment vs Serving

`Assignment` répond à :

> Qui exécute ou porte ce comportement ?

`Serving` répond à :

> Qui fournit une fonctionnalité à qui ?

Exemple :

```text
Fraud Engine
  Assignment → Fraud Scoring Function

Fraud Scoring Service
  Serving → Payment Orchestration Process
```

Ce ne sont pas les mêmes questions.

---

## 4. Realization

`Realization` relie une entité plus concrète à une entité plus abstraite qu’elle met en œuvre ou réalise.

### Exemple Application

```text
Application Function: Calculate Fraud Score
  Realization → Application Service: Fraud Scoring Service
```

Le comportement interne réalise le comportement exposé.

### Exemple information

```text
Data Object: Payment Transaction Record
  Realization → Business Object: Payment Order
```

Le Data Object constitue une réalisation informatique du concept métier.

### Exemple technologie

```text
Artifact: payment-orchestrator.jar
  Realization → Application Component: Payment Orchestrator
```

L’artifact réalise physiquement/technologiquement l’élément applicatif dans le contexte de déploiement.

### Realization vs Assignment

```text
Assignment = exécute / porte
Realization = concrétise / implémente une abstraction
```

Un composant applicatif peut être assigné à une fonction, tandis que la fonction réalise un service.

```text
Payment Orchestrator
  Assignment → Orchestrate Payment Function

Orchestrate Payment Function
  Realization → Payment Orchestration Service
```

---

## 5. Chaîne structurelle MayaBank

```text
Payments Operations Team
  Assignment → Payment Operator Role

Payment Operator Role
  Assignment → Resolve Exception Process

Payment Platform
  Composition → Payment Orchestrator

Payment Orchestrator
  Assignment → Orchestrate Payment Function

Orchestrate Payment Function
  Realization → Payment Orchestration Service
```

Cette chaîne permet de répondre successivement :

- de quoi la plateforme est-elle composée ?
- qui porte la responsabilité ?
- qui exécute le comportement ?
- quel service ce comportement réalise-t-il ?

---

## 6. Cas de discrimination

### Cas A

Une plateforme contient trois sous-systèmes indissociables dans le modèle.

→ `Composition`.

### Cas B

Une offre commerciale regroupe plusieurs services réutilisables ailleurs.

→ `Aggregation`.

### Cas C

Une équipe exécute un processus.

→ `Assignment`.

### Cas D

Une fonction interne fournit le service visible par l’extérieur.

→ `Realization`.

### Cas E

Un service applicatif est utilisé par un processus métier.

→ pas `Realization` ; généralement `Serving` du service vers le consommateur.

---

## 7. Pièges d’examen

1. `Composition` et `Aggregation` ne signifient pas « dépendance technique ».
2. `Assignment` ne signifie pas « utilise ».
3. `Realization` ne signifie pas « appelle ».
4. Un service est généralement **réalisé** par un comportement interne, puis **sert** un consommateur.
5. Une relation plus forte/précise doit être préférée à `Association` lorsque sa sémantique correspond réellement au cas.

---

## À retenir

```text
Composition = partie forte
Aggregation = regroupement
Assignment = exécute / porte
Realization = concrétise / implémente
```
