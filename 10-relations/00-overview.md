# Partie X — Relations ArchiMate : donner du sens aux liens

Les éléments ArchiMate n’ont de valeur que lorsqu’ils sont reliés correctement. Une relation ne sert pas à « faire une flèche » : elle affirme un **sens architectural précis** entre une source et une cible.

Cette partie couvre le jeu complet de relations ArchiMate 3.2 :

- relations **structurelles** : `Composition`, `Aggregation`, `Assignment`, `Realization` ;
- relations de **dépendance** : `Serving`, `Access`, `Influence`, `Association` ;
- relations **dynamiques** : `Triggering`, `Flow` ;
- autres mécanismes : `Specialization`, `Junction` ;
- relations dérivées et modélisation cross-layer.

## 1. La question à poser avant chaque flèche

Avant de tracer une relation, demander :

1. **Quel est le sens que je veux exprimer ?**
2. **Quelle est la source ?**
3. **Quelle est la cible ?**
4. **La relation est-elle permise entre ces types d’éléments ?**
5. **Une relation plus précise existe-t-elle ?**

Une `Association` ne doit pas devenir une échappatoire lorsque l’on hésite entre `Serving`, `Access`, `Realization` ou `Triggering`.

## 2. Carte mentale des relations

```text
STRUCTURE
Composition   = fait partie de, dépendance d’existence forte
Aggregation   = regroupe, partie relativement indépendante
Assignment    = qui exécute / porte quoi
Realization   = quel élément concret réalise une abstraction

DEPENDENCY
Serving       = fournit une fonctionnalité à
Access        = lit / écrit un élément passif
Influence     = influence positivement ou négativement
Association   = lien générique lorsque aucun sens plus précis n’est requis

DYNAMIC
Triggering    = relation temporelle/causale entre comportements ou événements
Flow          = transfert de quelque chose entre comportements ou structures

OTHER
Specialization = est une spécialisation de
Junction       = combine des relations de même type selon une logique AND/OR
```

## 3. Exemple MayaBank

```text
Payments Operations Team
  Assignment → Payment Operations Role

Payment Operations Role
  Assignment → Execute Instant Payment

Execute Instant Payment
  Realization → Instant Payment Service

Payment Orchestrator
  Realization → Payment Orchestration Service

Payment Orchestration Service
  Serving → Execute Instant Payment

Payment Orchestrator
  Access(write) → Payment Transaction

Payment Received
  Triggering → Validate Payment

Validate Payment
  Flow(Payment Instruction) → Fraud Check
```

Chaque relation apporte un sens différent. Les remplacer toutes par `Association` ferait perdre l’essentiel de l’architecture.

## 4. Direction ≠ sens visuel arbitraire

La direction d’une relation est sémantique.

Exemple :

```text
Application Service ── Serving ──> Business Process
```

Le service **sert** le processus.

Mais :

```text
Application Component ── Realization ──> Application Service
```

Le composant **réalise** le service.

Le bon choix ne dépend donc pas de la position gauche/droite dans le diagramme.

## 5. Relation explicite vs relation dérivée

Une relation peut être :

- **explicitement modélisée** ;
- ou **déduite** d’un chemin de relations compatible avec les règles ArchiMate.

Les relations dérivées permettent par exemple d’obtenir une vue plus abstraite sans relier manuellement chaque élément de bas niveau.

Elles seront étudiées dans un chapitre spécifique, car elles constituent un sujet Practitioner important.

## 6. Les pièges majeurs

| Confusion | Bonne question |
|---|---|
| Composition vs Aggregation | la partie dépend-elle fortement du tout ? |
| Assignment vs Serving | qui exécute le comportement, ou qui fournit un service à qui ? |
| Realization vs Serving | réalisation interne d’une abstraction, ou service fourni à un consommateur ? |
| Access vs Flow | accès persistant à une donnée, ou transfert entre comportements/structures ? |
| Triggering vs Flow | séquence/causalité, ou transfert de quelque chose ? |
| Influence vs Serving | effet motivationnel, ou fourniture fonctionnelle ? |
| Association vs relation précise | existe-t-il un sens plus spécifique ? |
| Specialization vs Composition | sous-type, ou relation tout/partie ? |

## 7. Méthode Practitioner

Face à un scénario :

```text
1. Identifier les deux éléments.
2. Identifier leur catégorie : structure, comportement, passif, motivation.
3. Décrire la phrase en français sans jargon.
4. Choisir la relation dont la sémantique correspond à cette phrase.
5. Vérifier la direction.
6. Vérifier si une relation plus précise existe.
7. Vérifier la validité source/cible dans la spécification si nécessaire.
```

## 8. Principe de qualité

> **Un bon modèle minimise les relations vagues et maximise les relations sémantiquement utiles.**

Le but n’est pas d’utiliser toutes les relations, mais de choisir celle qui explique réellement l’architecture.
