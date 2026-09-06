# Layered Viewpoint et vues cross-layer

Le **Layered Viewpoint** est l’un des plus puissants pour expliquer une architecture de bout en bout, car il permet de relier plusieurs couches dans une même lecture.

---

## 1. Pourquoi une Layered View ?

Elle répond à des questions comme :

- quel besoin métier dépend de quelle application ?
- quelle application dépend de quelle plateforme ?
- quel service technique soutient quelle fonction applicative ?
- quel risque technologique impacte quelle capacité métier ?

Exemple MayaBank :

```text
Goal: Faster Payments
↓
Capability: Real-Time Payment Processing
↓
Business Process: Execute Instant Payment
↓
Application Service: Payment Orchestration Service
↓
Application Component: Payment Orchestrator
↓
Technology Service: Container Execution Service
↓
System Software: OpenShift
↓
Node: Production Cluster
```

---

## 2. Le danger : tout mettre dans une seule vue

Une Layered View peut vite devenir illisible.

Mauvaise pratique :

- tous les drivers ;
- toutes les capabilities ;
- tous les processus ;
- toutes les applications ;
- tous les nodes ;
- tous les work packages ;
- tous les sites physiques ;
- toutes les relations.

Meilleure pratique : créer plusieurs vues cross-layer ciblées.

---

## 3. Executive Layered View

Audience : CIO / direction.

Contenu possible :

```text
Drivers
→ Goals
→ Capabilities
→ Major Business Services
→ Strategic Applications
→ Strategic Platforms
→ Target Plateau
```

Objectif : montrer la logique globale de transformation sans détail technique excessif.

---

## 4. Solution Layered View

Audience : architectes solution et équipes projet.

Contenu :

```text
Business Process
→ Application Services
→ Application Components
→ Technology Services
→ Technology Platforms
```

Exemple :

```text
Execute Instant Payment
← Payment Orchestration Service
← Payment Orchestrator
← Event Streaming Service
← Kafka Platform
```

---

## 5. Risk Impact View

Audience : CISO / risk / resilience.

Exemple :

```text
Technology Node: Kafka Cluster
↓ supports
Application Component: Payment Orchestrator
↓ supports
Business Process: Execute Instant Payment
↓ realizes
Business Service: Instant Payment Service
```

Si Kafka est indisponible, la vue aide à comprendre l’impact métier.

---

## 6. Data Lineage View

```text
Business Object: Payment Order
↓ realized by
Data Object: Payment Transaction
↓ realized by
Artifact: PAYMENT_TX
↓ managed by
System Software: PostgreSQL
```

Cette vue relie les niveaux sémantiques de la donnée.

---

## 7. Deployment View

```text
Application Component
↓ realized by
Artifact
↓ deployed on
System Software / Node
↓ located in
Facility
```

Elle est utile pour comprendre la réalisation physique d’une solution.

---

## 8. Green IT cross-layer

Exemple :

```text
Goal: Reduce IT Carbon Footprint
↓
Course of Action: Consolidate Platforms
↓
Work Package: Retire Legacy Payment Platform
↓
Application Component: Legacy Payment Engine
↓
Node: Legacy Physical Servers
↓
Facility: Datacenter A
```

Le raisonnement relie intention, transformation, application et infrastructure physique.

---

## 9. Comment limiter la complexité

Règles pratiques :

1. une question principale par vue ;
2. 2 à 4 couches maximum si possible ;
3. masquer les éléments sans rôle dans le concern ;
4. utiliser des relations dérivées avec prudence ;
5. grouper par domaine ou couche ;
6. créer plusieurs vues plutôt qu’un “poster total”.

---

## 10. Questions de contrôle

### Q1
Une Layered View doit-elle contenir toutes les couches ?

**Non.** Elle peut en combiner seulement celles nécessaires au concern.

### Q2
Pourquoi est-elle utile ?

Parce qu’elle expose les dépendances entre niveaux métier, application et technologie.

### Q3
Quel est son principal risque ?

La surcharge visuelle.

---

## À retenir

> **Cross-layer ne signifie pas tout montrer ; cela signifie montrer les dépendances entre niveaux qui expliquent réellement le concern.**
