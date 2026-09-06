# Quick Reference — Relations ArchiMate 3.2

## Les relations en une page

| Relation | Question | Mémo |
|---|---|---|
| Composition | partie constitutive forte ? | fait partie de fortement |
| Aggregation | regroupement plus faible ? | regroupe |
| Assignment | qui exécute/porte ? | exécute |
| Realization | qui concrétise quoi ? | réalise |
| Serving | qui fournit à qui ? | sert |
| Access | qui lit/écrit quoi ? | accède |
| Influence | qu’est-ce qui affecte quoi ? | influence |
| Association | simple lien utile ? | associé à |
| Triggering | qu’est-ce qui déclenche quoi ? | déclenche |
| Flow | qu’est-ce qui circule ? | transfère |
| Specialization | quel sous-type ? | est un type de |
| Junction | AND/OR entre relations ? | combine |

## Les quatre confusions à savoir par cœur

```text
Assignment ≠ Realization
Assignment = exécute
Realization = implémente/concrétise
```

```text
Realization ≠ Serving
Realization = met en œuvre
Serving = fournit à un consommateur
```

```text
Access ≠ Flow
Access = lit/écrit un passif
Flow = transfère entre source et cible
```

```text
Triggering ≠ Flow
Triggering = causalité/séquence
Flow = transfert
```

## Direction mentale

```text
Structure active ─Assignment→ Behavior
Behavior ─Realization→ Service
Service ─Serving→ Consumer
Behavior ─Access→ Passive Structure
Cause ─Triggering→ Effect
Sender ─Flow→ Receiver
Concrete ─Realization→ Abstract
Specific ─Specialization→ General
```

## Tout/partie

```text
Composition = forte dépendance d’identité
Aggregation = partie plus indépendante
```

## Junction

```text
AND = toutes les branches
OR  = une alternative
```

Une Junction combine des relations de même type.

## Derived relationships

```text
Chemin explicite valide
        ↓
règles de dérivation ArchiMate
        ↓
relation synthétique possible
```

Ne jamais inventer une relation dérivée par intuition.

## Règle Practitioner

Pour chaque flèche :

```text
source
+ cible
+ sémantique
+ direction
+ validité métamodèle
= relation correcte
```

## Anti-patterns

- Association partout ;
- flèches orientées selon la mise en page ;
- Realization pour dire « utilise » ;
- Serving pour dire « héberge » ;
- Flow pour dire « lit une donnée » ;
- Triggering pour dire « dépend techniquement » ;
- Composition pour tout nesting ;
- dérivation sans vérifier la spécification.

## Phrase ultime

> **Si tu ne peux pas lire la flèche comme une phrase vraie, revois la relation.**
