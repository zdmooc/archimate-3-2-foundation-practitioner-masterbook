# Cheat Sheet 06 — Relationships

## Les relations structurelles

### Composition
Relation forte tout-partie : la partie dépend fortement du tout.

Question mentale : **“cet élément fait-il partie intégrante de l’autre ?”**

### Aggregation
Relation tout-partie plus faible : les parties peuvent exister indépendamment.

### Assignment
Une structure active **porte/exécute** un comportement ou une responsabilité.

```text
Business Role → Business Process
Application Component → Application Function
Node → Technology Function
```

Mémo : **Assignment = exécute / porte.**

### Realization
Un élément plus concret **implémente, matérialise ou réalise** un élément plus abstrait.

```text
Application Function → Application Service
Application Component → Application Service selon le modèle autorisé
Deliverable → Requirement selon le modèle et la matrice
```

Mémo : **Realization = concrétise.**

## Relations de dépendance

### Serving
Un fournisseur met une fonctionnalité à disposition d’un consommateur.

Mémo : **Serving = fournit à.**

```text
Application Service → Business Process
Technology Service → Application Component
```

### Access
Un comportement ou une structure accède à un élément passif.

Types usuels : read / write / read-write.

```text
Application Function → Data Object
Business Process → Business Object
```

Mémo : **Access = lit/écrit.**

### Influence
Un élément exerce un effet positif, négatif ou non qualifié sur un élément de Motivation.

```text
Driver → Goal
Assessment → Goal
```

### Association
Lien générique à utiliser seulement lorsque la sémantique plus précise n’est pas appropriée.

**Anti-pattern : Association partout.**

## Relations dynamiques

### Triggering
Causalité ou séquence temporelle/comportementale.

```text
Payment Received → Validate Payment
Validate Payment → Fraud Check
```

Mémo : **Triggering = cause / déclenche / précède.**

### Flow
Transfert d’information, matière ou valeur.

```text
Payment API → Payment Orchestrator : Payment Instruction
```

Mémo : **Flow = quelque chose circule.**

## Autres

### Specialization
Un élément est une spécialisation d’un autre élément du même type/générique compatible.

### Junction
Point logique permettant de combiner des relations de même type dans certains modèles.

## Les 6 distinctions à connaître par cœur

### Assignment vs Realization
- Assignment = **qui exécute quoi ?**
- Realization = **qu’est-ce qui implémente quoi ?**

### Realization vs Serving
- Realization = implémentation fournisseur interne.
- Serving = consommation externe du service/fonctionnalité.

### Access vs Flow
- Access = lit/écrit un objet.
- Flow = transfère quelque chose entre source et cible.

### Triggering vs Flow
- Triggering = causalité/séquence.
- Flow = transfert.

### Composition vs Aggregation
- Composition = dépendance forte partie/tout.
- Aggregation = regroupement plus faible.

### Influence vs Serving
- Influence = effet motivationnel.
- Serving = fourniture de fonctionnalité.

## Algorithme de choix d’une relation

1. **Qui exécute ?** → Assignment.
2. **Qui implémente ?** → Realization.
3. **Qui fournit quelque chose à un consommateur ?** → Serving.
4. **Qui lit/écrit une information ?** → Access.
5. **Qu’est-ce qui déclenche quoi ?** → Triggering.
6. **Qu’est-ce qui circule ?** → Flow.
7. **Qu’est-ce qui influence un objectif/exigence ?** → Influence.
8. **Est-ce un tout-partie ?** → Composition/Aggregation.
9. Sinon seulement → Association si légale et justifiée.

## Direction : piège classique

Toujours lire la relation comme une phrase.

```text
Payment Orchestration Service SERVES Payment Process
```

et non l’inverse si l’intention est que le service fournisse une fonctionnalité au processus.

```text
Payment Orchestrator ASSIGNED TO Payment Validation Function
```

si le composant porte ce comportement.

## Pattern API complet

```text
Payment Orchestrator
  ─assignment→ Payment Function
  ─realization→ Payment Service
Payment Service
  ─serving→ Consumer
Payment Function
  ─access→ Payment Transaction
Payment REST API
  = interface exposant le service
```

## Pattern event-driven

```text
Payment Received Event
  ─triggering→ Validate Payment
Validate Payment
  ─triggering→ Fraud Check
Payment Orchestrator
  ─flow "Payment Event"→ Event Consumer
```

L’Event et le Flow ne sont pas interchangeables.

## Quality Gate relations

Avant de valider une vue :
- relation légale source/cible ;
- direction correcte ;
- sémantique explicable en une phrase ;
- pas d’Association utilisée par paresse ;
- pas de Flow utilisé pour signifier un simple appel ;
- pas de Triggering utilisé pour signifier un transfert ;
- pas de Serving utilisé pour signifier une implémentation.

## Mémo final

```text
Assignment = exécute
Realization = implémente
Serving = fournit
Access = lit/écrit
Triggering = déclenche
Flow = transfère
Influence = affecte
Composition = contient fortement
Aggregation = regroupe
Association = lien générique
```