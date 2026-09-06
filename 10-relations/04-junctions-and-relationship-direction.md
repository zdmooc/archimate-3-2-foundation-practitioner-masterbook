# Junctions, direction et validation des relations

Deux difficultés séparent souvent un modèle débutant d’un modèle professionnel :

1. savoir **dans quel sens** tracer une relation ;
2. savoir représenter une logique **AND / OR** sans multiplier artificiellement les éléments.

---

## 1. La direction d’une relation est sémantique

Une flèche n’est pas orientée selon le sens de lecture du diagramme.

Elle est orientée selon la définition de la relation.

### Serving

```text
Application Service
  Serving → Business Process
```

Le fournisseur pointe vers le consommateur.

### Realization

```text
Application Function
  Realization → Application Service
```

Le concret pointe vers l’abstrait qu’il réalise.

### Assignment

```text
Application Component
  Assignment → Application Function
```

La structure active pointe vers le comportement qu’elle exécute.

### Access

```text
Application Function
  Access(read) → Data Object
```

L’élément qui accède pointe vers l’élément passif.

### Triggering

```text
Event A
  Triggering → Process B
```

La cause/précédence pointe vers le comportement déclenché.

### Flow

```text
Process A
  Flow(Message) → Process B
```

La source du transfert pointe vers le destinataire.

---

## 2. Technique de vérification en phrase

Avant de dessiner, transformer la relation en phrase.

```text
Payment Orchestrator REALIZES Payment Orchestration Service.
Payment Orchestration Service SERVES Execute Payment Process.
Payment Orchestrator ACCESSES Payment Transaction.
Payment Received TRIGGERS Validate Payment.
```

Si la phrase semble inversée ou absurde, la flèche est probablement mal orientée.

---

## 3. Les Junctions

Une `Junction` permet de connecter plusieurs relations du même type dans une logique combinée.

Deux formes conceptuelles sont utilisées :

- **AND Junction** ;
- **OR Junction**.

Une Junction n’est pas un composant, une fonction ni une décision métier.

C’est un mécanisme de connexion du langage.

---

## 4. AND Junction

Une AND Junction exprime que plusieurs branches participent conjointement à la relation.

### Exemple conceptuel

Pour qu’un traitement démarre, deux préconditions doivent être satisfaites :

```text
Customer Authenticated ─┐
                        ├─ AND Junction → Execute Payment
Funds Available ────────┘
```

L’intérêt est de ne pas créer un faux « Process: AND ».

---

## 5. OR Junction

Une OR Junction exprime une alternative.

```text
Retail Payment ───┐
                  ├─ OR Junction → Payment Processing
Corporate Payment ┘
```

La Junction représente la logique de combinaison des relations, pas un comportement autonome.

---

## 6. Règle essentielle sur les Junctions

Une Junction combine des relations **du même type**.

On n’utilise pas une même Junction pour mélanger arbitrairement :

- Triggering ;
- Flow ;
- Serving ;
- Realization.

Si plusieurs sémantiques sont nécessaires, elles doivent être représentées séparément.

---

## 7. Junction vs gateway BPMN

Une Junction ArchiMate peut ressembler visuellement à une logique de gateway, mais les objectifs diffèrent.

### ArchiMate

Met l’accent sur les relations architecturales entre concepts.

### BPMN

Décrit en détail le contrôle de flux d’un processus.

Si le besoin est de décrire précisément conditions, timers, exceptions et branches de workflow, BPMN sera généralement plus adapté.

---

## 8. Source/cible et métamodèle

Même lorsque la sémantique semble correcte, toutes les relations ne sont pas autorisées entre tous les types d’éléments.

Le bon réflexe Practitioner est donc :

```text
Sémantique correcte
      +
Direction correcte
      +
Source/cible autorisées
      =
Relation valide
```

Lorsque le scénario est subtil, la matrice des relations de la spécification ArchiMate 3.2 reste la référence.

---

## 9. Erreur fréquente : raisonner uniquement par couche

Le fait que deux éléments appartiennent à la même couche ne suffit pas à autoriser n’importe quelle relation.

Exemple :

```text
Application Component
Application Service
```

La relation pertinente peut être indirecte :

```text
Application Component
  Assignment → Application Function
Application Function
  Realization → Application Service
```

Selon le niveau d’abstraction, une relation directe autorisée peut exister, mais il faut préserver le sens que l’on veut exprimer.

---

## 10. Nesting graphique

ArchiMate permet souvent de représenter une relation structurelle par nesting.

Exemple : un élément dessiné à l’intérieur d’un autre peut rendre visuellement une relation de type tout/partie ou assignment selon le contexte et la notation supportée.

Mais :

> **Le nesting ne dispense jamais de comprendre la relation sémantique représentée.**

Un modèle peut paraître joli et être sémantiquement faux.

---

## 11. Checklist de validation d’une flèche

Pour chaque relation importante :

- [ ] ai-je nommé mentalement la source ?
- [ ] ai-je nommé mentalement la cible ?
- [ ] puis-je lire la relation comme une phrase ?
- [ ] ai-je choisi la relation la plus précise ?
- [ ] la direction correspond-elle à la sémantique ?
- [ ] les types source/cible sont-ils valides ?
- [ ] ai-je utilisé `Association` uniquement en dernier recours ?
- [ ] ai-je évité un niveau de détail inutile ?

---

## 12. Mini-cas MayaBank

### Cas 1

Le Payment Orchestrator implémente le Payment Orchestration Service.

```text
Payment Orchestrator
  Realization → Payment Orchestration Service
```

### Cas 2

Le Payment Orchestration Service est utilisé par Execute Instant Payment.

```text
Payment Orchestration Service
  Serving → Execute Instant Payment
```

### Cas 3

Le processus ne peut démarrer qu’après authentification ET validation des limites.

```text
Authentication Completed ─┐
                          ├─ AND Junction → Execute Payment
Limit Check Completed ────┘
```

---

## À retenir

> **Une relation ArchiMate correcte = bon sens + bonne direction + source/cible valides.**

Les Junctions permettent d’exprimer des combinaisons logiques sans inventer de faux éléments architecturaux.
