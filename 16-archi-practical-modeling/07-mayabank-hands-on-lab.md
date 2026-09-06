# LAB — Construire MayaBank dans Archi

## Objectif

Construire une première version du référentiel MayaBank à partir du fichier fourni ou depuis un modèle vide.

## Étape 1 — Ouvrir le modèle fourni

Ouvrir :

`models/mayabank-enterprise.archimate`

Vérifier la présence des familles :

- Motivation ;
- Strategy ;
- Business ;
- Application ;
- Technology & Physical ;
- Implementation & Migration ;
- Relations ;
- Views.

## Étape 2 — Vérifier les éléments canoniques

Chercher :

```text
Real-Time Payment Processing
Execute Instant Payment
Payment Orchestrator
Payment Initiation Service
Event Streaming Service
Kafka
OpenShift Production Cluster
Target Payment Platform
```

## Étape 3 — Créer une propriété canonique

Sur `Payment Orchestrator` :

```text
canonical-id = MB-APP-002
owner = Payments Domain
lifecycle = target
criticality = critical
```

## Étape 4 — Construire la vue Business-to-Application

Créer :

`APP-01 Instant Payment Support`

Ajouter les éléments existants :

```text
Execute Instant Payment
Payment Initiation Service
Payment Orchestrator
Payment Transaction
```

Ne pas recréer les éléments.

## Étape 5 — Construire la vue Technology

Créer :

`TEC-01 Payment Runtime`

Ajouter :

```text
Payment Orchestrator
Event Streaming Service
Kafka
OpenShift Production Cluster
```

## Étape 6 — Ajouter une vue cross-layer

Créer :

`EXEC-01 Payment Target Traceability`

Chaîne :

```text
Goal: Reliable Real-Time Payments
→ Capability: Real-Time Payment Processing
→ Business Process: Execute Instant Payment
→ Application Component: Payment Orchestrator
→ Technology Service: Event Streaming Service
→ System Software: Kafka
→ Node: OpenShift Production Cluster
```

## Étape 7 — Ajouter Baseline/Target

Créer :

```text
Plateau: Legacy Payment Platform
Plateau: Hybrid Payment Platform
Plateau: Target Payment Platform
```

Puis créer :

```text
Gap: No Event Backbone
Work Package: Establish Event Streaming Platform
Implementation Event: Event Platform Ready
```

## Étape 8 — Créer la vue migration

`MIG-01 Payment Transformation Roadmap`

Lecture recommandée : gauche → droite.

```text
Legacy Plateau
→ Gap
→ Work Package
→ Implementation Event
→ Hybrid Plateau
→ Target Plateau
```

## Étape 9 — Ajouter une vue incident impact

Question : que se passe-t-il si Kafka est indisponible ?

Construire une vue :

```text
Kafka
→ Event Streaming Service
→ Payment Orchestrator
→ Payment Initiation Service
→ Execute Instant Payment
```

## Étape 10 — Ajouter Security

Créer ou réutiliser :

```text
Requirement: Strong Authentication
Technology Service: Identity Service
Application Interface: Payment API
```

## Étape 11 — Ajouter Green IT

Créer une vue où l'on montre :

```text
Goal: Reduce Infrastructure Footprint
→ Course of Action: Consolidate Runtime Platforms
→ OpenShift Production Cluster
→ Work Package: Decommission Legacy Payment Servers
→ Target Plateau
```

## Étape 12 — Quality gate

Vérifier :

- pas de doublon Payment Orchestrator ;
- service ≠ interface ;
- Kafka ≠ Application Event ;
- OpenShift cluster ≠ Application Component ;
- relations orientées correctement ;
- Baseline/Target explicites ;
- vues séparées par concern.

## Étape 13 — Commit

Exemple :

```text
feat: build MayaBank payment target and migration views
```

## Résultat attendu

Vous disposez d'un modèle où un élément peut être analysé dans plusieurs dimensions :

```text
strategy
business
application
technology
migration
impact
```

sans être recréé à chaque diagramme.
