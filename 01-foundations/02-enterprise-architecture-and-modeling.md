# 2 — Architecture d’entreprise et modélisation

## 2.1 Architecture d’entreprise : une vue systémique

L’architecture d’entreprise cherche à comprendre comment une organisation transforme une intention stratégique en capacités, comportements, systèmes et infrastructures cohérents.

Elle ne s’intéresse donc pas uniquement à l’informatique.

Elle relie notamment :

- stratégie ;
- organisation ;
- capacités ;
- processus ;
- information ;
- applications ;
- technologie ;
- transformation.

Un modèle d’architecture devient utile lorsque ces domaines ne sont plus décrits séparément.

---

## 2.2 Pourquoi modéliser ?

Une architecture complexe ne peut pas être raisonnablement comprise sous forme de texte uniquement.

La modélisation permet de :

- réduire la complexité ;
- expliciter les dépendances ;
- identifier les redondances ;
- visualiser les responsabilités ;
- comparer Baseline et Target ;
- analyser les impacts ;
- communiquer selon l’audience.

Le modèle n’est pas une décoration de présentation. Il devient un instrument d’analyse.

---

## 2.3 Abstraction

L’architecture travaille avec plusieurs niveaux d’abstraction.

Prenons la capacité de paiement temps réel.

À un niveau stratégique :

```text
Capability: Real-Time Payment Processing
```

À un niveau métier :

```text
Business Process: Execute Instant Payment
```

À un niveau applicatif :

```text
Application Service: Payment Orchestration
Application Component: Payment Orchestrator
```

À un niveau technologique :

```text
Technology Service: Container Execution
Node: OpenShift Worker
```

Tous ces éléments parlent du même système d’entreprise, mais à des niveaux différents.

---

## 2.4 Architecture vs design

La frontière n’est pas absolue, mais on peut utiliser un principe simple.

### Architecture

S’intéresse principalement aux décisions structurelles importantes, aux dépendances, aux responsabilités, aux interfaces, aux qualités et aux transformations.

### Design détaillé

S’intéresse davantage à la réalisation précise d’un composant ou d’une solution.

ArchiMate est principalement un langage d’architecture.

Par exemple :

```text
ArchiMate
Payment Orchestrator Application Component
   ↓
UML / code / design détaillé
Java modules, classes, sequence diagrams, deployment manifests
```

---

## 2.5 Le modèle comme graphe

Une façon puissante de comprendre ArchiMate est de considérer un modèle comme un graphe.

### Nœuds

Les éléments :

- Capability ;
- Business Process ;
- Application Component ;
- Node ;
- Goal ;
- Work Package ;
- etc.

### Arêtes

Les relations :

- Assignment ;
- Realization ;
- Serving ;
- Access ;
- Triggering ;
- Flow ;
- etc.

Une vue est alors une projection d’un sous-ensemble de ce graphe.

Cela explique pourquoi ArchiMate est adapté à l’analyse de dépendances.

---

## 2.6 Questions d’architecture typiques

Un bon modèle doit permettre de répondre à des questions.

### Stratégie

- Quels goals répondent à quels drivers ?
- Quelles capabilities sont nécessaires ?
- Quels outcomes sont attendus ?

### Métier

- Quels processus réalisent les services métier ?
- Quels rôles exécutent quels comportements ?
- Quels objets métier sont manipulés ?

### Application

- Quelles applications supportent quel processus ?
- Quels services applicatifs sont exposés ?
- Où existe une duplication fonctionnelle ?

### Technologie

- Quelles applications reposent sur quels nœuds ou plateformes ?
- Quels services technologiques sont critiques ?

### Transformation

- Quels gaps séparent Baseline et Target ?
- Quels work packages ferment quels gaps ?
- Quels plateaus représentent les états intermédiaires ?

---

## 2.7 Exemple MayaBank : question d’impact

Question :

> Que se passe-t-il si MayaBank retire sa plateforme de messagerie legacy ?

Un modèle peut permettre de remonter :

```text
Legacy Messaging Platform
   ↑ realizes
Messaging Technology Service
   ↑ serves
Payment Integration Application Component
   ↑ realizes
Payment Integration Application Service
   ↑ serves
Execute Payment Business Process
   ↑ realizes
Instant Payment Business Service
```

Cette chaîne permet de comprendre que le retrait d’un composant technique peut affecter un service métier.

---

## 2.8 Modéliser pour décider

Un modèle n’a pas besoin d’être complet pour être utile.

Supposons deux options :

- conserver le moteur de paiement historique ;
- construire un orchestrateur moderne.

Une vue décisionnelle peut montrer seulement :

- goals ;
- requirements ;
- capabilities ;
- applications candidates ;
- risques ;
- impacts.

Le bon niveau de détail est celui qui permet de prendre la décision.

---

## 2.9 Cohérence sémantique

La cohérence signifie qu’un concept conserve sa signification dans le modèle.

Si `Payment Orchestrator` est un Application Component dans une vue, il doit rester le même élément partout où il apparaît.

Il ne doit pas devenir arbitrairement :

- un Business Process dans une autre vue ;
- une Capability ailleurs ;
- un Node parce que le diagramme technique l’exige.

Sinon le modèle perd sa valeur analytique.

---

## 2.10 Granularité

Un élément peut être modélisé à plusieurs niveaux de détail.

Exemple :

```text
Payment Processing
```

peut être décomposé en :

```text
Validate Payment
Fraud Screening
Route Payment
Clear Payment
Reconcile Payment
Notify Customer
```

La granularité doit rester cohérente avec la question traitée.

Comparer une capability très haut niveau à un composant technique très fin dans la même liste sans logique de relation rend la vue difficile à interpréter.

---

## 2.11 Baseline, Target et transition

Une transformation doit distinguer :

### Baseline

État actuel.

### Target

État souhaité.

### Plateau intermédiaire

État stable temporaire pendant la migration.

Exemple :

```text
Baseline
Legacy Payment Engine

Plateau 1
Legacy + New API Gateway

Plateau 2
Legacy + Payment Orchestrator + Kafka

Target
Modern Payment Platform
```

ArchiMate peut représenter ces états et les work packages nécessaires pour passer de l’un à l’autre.

---

## 2.12 Plusieurs modèles ou un modèle partagé ?

Dans un environnement mature, il est préférable de construire un modèle cohérent réutilisable plutôt que des schémas indépendants.

Un même `Application Component` peut être réutilisé dans :

- Application Cooperation View ;
- Application Usage View ;
- Layered View ;
- Migration View ;
- Technology View.

Cela réduit les divergences.

---

## 2.13 Modèle conceptuel et implémentation réelle

ArchiMate ne doit pas être confondu avec un inventaire technique exact à la seconde.

Un modèle peut représenter :

```text
Technology Service: Event Streaming
```

alors que la réalisation réelle peut être :

```text
Kafka Cluster A
Kafka Cluster B
Schema Registry
Connect
MirrorMaker
```

Le niveau d’abstraction dépend du besoin.

---

## 2.14 Anti-pattern : diagramme spaghetti

Symptômes :

- trop d’éléments ;
- relations qui se croisent partout ;
- aucune audience définie ;
- aucune question claire ;
- tous les layers en même temps ;
- légende nécessaire pour comprendre des conventions non standard.

Solution :

1. déterminer le concern ;
2. choisir un viewpoint adapté ;
3. sélectionner seulement les éléments pertinents ;
4. créer plusieurs vues cohérentes si nécessaire.

---

## 2.15 Questions de compréhension

### Q1 — Pourquoi modéliser au lieu de simplement dessiner ?

**Réponse :** parce qu’un modèle possède une sémantique réutilisable et cohérente qui permet l’analyse des dépendances.

### Q2 — Qu’est-ce que la granularité ?

**Réponse :** le niveau de détail auquel un concept est représenté.

### Q3 — Pourquoi réutiliser le même élément dans plusieurs vues ?

**Réponse :** pour garantir que plusieurs représentations parlent du même objet architectural et maintenir la cohérence.

### Q4 — Quel est le risque d’un diagramme trop complet ?

**Réponse :** la vue devient illisible et ne répond plus clairement à un concern précis.

### Q5 — Une architecture est-elle équivalente au design détaillé ?

**Réponse :** non. L’architecture s’intéresse principalement aux structures, responsabilités, dépendances et décisions majeures ; le design détaille la réalisation.

---

## À retenir

> **Un bon modèle n’essaie pas de représenter toute l’entreprise. Il représente suffisamment de l’entreprise pour répondre correctement à une question d’architecture.**
