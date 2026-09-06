# Anti-patterns ArchiMate — reconnaître et réparer un modèle trompeur

Un modèle peut être joli, compréhensible à première vue et pourtant sémantiquement pauvre ou incorrect. Cette fiche présente les anti-patterns les plus fréquents et une méthode de réparation.

---

## 1. Association Everywhere

### Symptôme

Presque toutes les relations sont `Association`.

### Pourquoi c’est mauvais

Le modèle ne dit plus :

- qui exécute ;
- qui réalise ;
- qui sert ;
- qui lit ;
- qui déclenche ;
- ce qui circule.

### Réparation

Pour chaque Association, poser :

```text
Assignment ?
Realization ?
Serving ?
Access ?
Triggering ?
Flow ?
Influence ?
```

Garder Association uniquement si aucun sens plus précis n’est nécessaire.

---

## 2. Technology Soup

### Symptôme

```text
[API] [Kafka] [Oracle] [OpenShift] [Firewall] [S3]
```

Tous représentés comme le même type.

### Réparation

```text
Application Interface: API
Technology Service: Event Streaming Service
System Software: Kafka
System Software: Oracle Database
System Software: OpenShift
Device/System Software: Firewall according to concern
Technology Service: Object Storage Service
```

---

## 3. Application = Service

### Symptôme

Une application et ce qu’elle fournit sont confondus.

### Réparation

```text
Application Component
→ internal behavior
→ Application Service
→ consumer
```

---

## 4. Interface = Service

### Symptôme

`POST /payments` est présenté comme la fonctionnalité métier.

### Réparation

```text
Application Service: Payment Initiation Service
Application Interface: POST /payments
```

---

## 5. Capability = Application

### Symptôme

```text
Capability: Kafka
Capability: CRM
```

### Réparation

Une Capability exprime une aptitude :

```text
Capability: Real-Time Event Processing
Capability: Customer Relationship Management
```

Les applications/technologies les soutiennent.

---

## 6. Process = Capability

### Symptôme

Une chaîne d’étapes est utilisée comme carte de capabilities.

### Réparation

```text
Capability = aptitude stable
Process = comportement orienté résultat
```

Construire deux vues si nécessaire.

---

## 7. Role = Person

### Symptôme

Une personne nommée est modélisée comme responsabilité durable.

### Réparation

```text
Actor: Payments Team
Role: Payment Operator
```

La personne peut être documentée dans les propriétés ou hors du modèle si elle n’est pas architecturale.

---

## 8. Event = Message

### Symptôme

```text
Application Event: payment-authorized.json
```

### Réparation

```text
Application Event: Payment Authorized
Data Object: PaymentAuthorized Message
Artifact: schema/file if needed
```

---

## 9. Kafka Topic = Business Event

### Réparation

```text
Business/Application Event = fait
Data Object = information
Kafka topic = mécanisme technique / propriété / artifact selon le concern
Kafka = System Software
```

---

## 10. Database = Data Object

### Symptôme

```text
Data Object: Oracle
```

### Réparation

```text
Data Object: Payment Transaction
System Software: Oracle Database
Artifact: PAYMENT_TX table if useful
```

---

## 11. Server = Equipment

### Symptôme

Tout objet matériel est mis dans Physical Layer.

### Réparation

```text
Device: Physical Server
Equipment: UPS / Generator / Chiller
Facility: Data Center
```

---

## 12. Network = Distribution Network

### Symptôme

Un WAN/IP network est classé en Distribution Network.

### Réparation

```text
Communication Network = information
Distribution Network = energy/material
```

---

## 13. Goal = Requirement

### Symptôme

```text
Requirement: Improve Customer Satisfaction
```

### Réparation

```text
Goal: Improve Customer Satisfaction
Requirement: Payment confirmation shall be returned within 2 seconds
```

---

## 14. Outcome = Goal recopié

### Symptôme

```text
Goal: Improve Reliability
Outcome: Improve Reliability
```

### Réparation

```text
Goal: Improve Reliability
Outcome: Payment success rate ≥ 99.99%
```

---

## 15. Driver = Problem Statement

### Symptôme

Le driver et le diagnostic sont mélangés.

### Réparation

```text
Driver: Regulatory Change
Assessment: Current platform cannot meet new SLA
```

---

## 16. Course of Action = Project

### Réparation

```text
Course of Action: Adopt Event-Driven Architecture
Work Package: Deploy Kafka Platform
```

---

## 17. Gap = Risk

Un Gap décrit une différence entre états. Un risque peut être exprimé via Assessment/Concern et autres mécanismes de gouvernance.

```text
Gap: No Secondary Site
Assessment: Single-site architecture creates unacceptable continuity risk
```

---

## 18. Plateau = Environment

### Symptôme

```text
Plateau: DEV
Plateau: TEST
Plateau: PROD
```

Sans contexte de transformation, ces noms décrivent probablement des environnements, pas des états architecturaux successifs.

---

## 19. Giant Layered Diagram

### Symptôme

Une seule vue contient tout : drivers, capabilities, processus, 80 applications, 200 interfaces, infrastructure, migration.

### Réparation

Créer plusieurs Views depuis le même modèle :

- Executive ;
- Capability ;
- Business ;
- Application Cooperation ;
- Data ;
- Technology ;
- Deployment ;
- Migration ;
- Security ;
- Operations.

---

## 20. Mixed Granularity

### Symptôme

```text
Application Component: Core Banking
Application Component: PaymentValidatorImpl.java
```

Dans la même vue, les niveaux sont incompatibles.

### Réparation

Définir le niveau de zoom avant de modéliser.

---

## 21. Diagram without Concern

### Symptôme

Le diagramme contient des éléments mais personne ne sait quelle décision il doit supporter.

### Réparation

Documenter :

```text
Stakeholder
Concern
Question answered
Viewpoint
Scope
```

---

## 22. Decorative Arrows

### Symptôme

Les flèches montrent seulement un sens gauche→droite sans sémantique.

### Réparation

Lire chaque relation comme une phrase et vérifier :

- type ;
- source ;
- cible ;
- direction.

---

## 23. Nesting without Semantics

Dessiner un élément dans un autre peut être pratique, mais le nesting ne doit pas cacher une relation ambiguë.

Si le sens est important, expliciter la relation ou vérifier que le nesting correspond bien à la relation attendue.

---

## 24. Premature Derived Relationship

### Symptôme

Une relation directe est dessinée parce qu’elle « semble logique » à partir de plusieurs intermédiaires.

### Réparation

1. conserver le chemin explicite ;
2. vérifier les règles de dérivation ;
3. seulement ensuite utiliser la relation dérivée dans une vue abstraite.

---

## 25. Customization Abuse

### Symptôme

Des couleurs, icônes ou stéréotypes locaux changent la signification du langage sans documentation.

### Réparation

- conserver la sémantique standard ;
- documenter les spécialisations ;
- préférer properties, specialization et viewpoints adaptés ;
- éviter d’inventer un nouveau langage lorsque ArchiMate suffit.

---

# Méthode de réparation en 10 étapes

```text
1. Identifier le stakeholder.
2. Identifier le concern.
3. Définir le scope.
4. Fixer le niveau d’abstraction.
5. Reclasser chaque élément par couche/aspect.
6. Remplacer les relations vagues par des relations précises.
7. Vérifier directions et source/cible.
8. Séparer les vues trop denses.
9. Vérifier cross-layer et dérivations.
10. Faire relire le modèle sous forme de phrases.
```

# Definition of Done

Un modèle réparé doit permettre à un lecteur de répondre :

- pourquoi ces éléments sont présents ;
- quel rôle chacun joue ;
- ce que signifie chaque relation importante ;
- quelle décision la vue supporte ;
- où commence et finit le scope.

> **Un anti-pattern n’est pas simplement un diagramme laid. C’est un modèle dont la sémantique empêche ou fausse le raisonnement architectural.**
