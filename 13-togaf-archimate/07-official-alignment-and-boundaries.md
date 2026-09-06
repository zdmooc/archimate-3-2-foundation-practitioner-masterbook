# Frontière officielle : complémentarité TOGAF et ArchiMate

The Open Group décrit explicitement les deux standards comme complémentaires :

- **TOGAF** apporte une méthode de développement et de gouvernance de l'Enterprise Architecture, notamment l'ADM ;
- **ArchiMate** apporte un langage visuel cohérent pour représenter, communiquer et analyser l'architecture.

## 1. Ce qui est explicitement aligné

Le mapping officiel de haut niveau indique notamment :

```text
Phase A
→ capability, motivation, stakeholder views

Phases B–D
→ layered models couvrant structure, comportement et relations

Phases E–F
→ Plateau, Gap, Work Package

Phase G
→ traçabilité requirements → implementation

Phase H
→ impact analysis via les relations ArchiMate
```

## 2. Pourquoi ce livre ajoute Preliminary et Requirements Management

Le résumé officiel met surtout en avant A à H. Pour apprendre à pratiquer l'ADM de bout en bout, il est néanmoins utile de montrer :

- Preliminary avec Stakeholder, Role, Capability, Principle, Requirement ;
- Requirements Management comme fil transversal avec Requirement, Constraint, Goal, Outcome et traçabilité.

Ces mappings sont des usages cohérents du langage, pas l'affirmation qu'une correspondance normative un-à-un est imposée.

## 3. Ce que le mapping ne signifie pas

Il ne signifie pas :

- qu'une phase TOGAF = un viewpoint ArchiMate ;
- qu'un deliverable TOGAF = un élément `Deliverable` ArchiMate ;
- qu'ArchiMate est obligatoire pour appliquer TOGAF ;
- que TOGAF définit la notation graphique ArchiMate ;
- qu'ArchiMate remplace la gouvernance TOGAF.

## 4. Règle pour l'examen et la pratique

Si une question demande « que fait TOGAF ? » : penser **méthode, structure, gouvernance, ADM**.

Si elle demande « que fait ArchiMate ? » : penser **modélisation, représentation, communication, analyse, traçabilité**.

Si elle demande comment les deux fonctionnent ensemble :

```text
TOGAF structures le travail
+
ArchiMate représente et relie les résultats
```

## 5. Certification ArchiMate actuelle

La certification ArchiMate 3 reste alignée sur **ArchiMate Specification 3.2**.

Foundation vérifie la connaissance des concepts et du langage ; Practitioner vérifie la capacité à l'appliquer en pratique. L'examen Practitioner utilise la spécification ArchiMate 3.2 comme référence open-book.

## 6. Limite pédagogique

Les exemples MayaBank de ce livre sont originaux et pédagogiques. Ils illustrent une utilisation raisonnable des standards mais ne constituent ni des architectures prescrites par The Open Group, ni des questions officielles d'examen.

## À retenir

> **Ne pas transformer une complémentarité conceptuelle en fausse table de conversion normative.**