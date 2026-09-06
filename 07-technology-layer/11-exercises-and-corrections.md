# Technology Layer — exercices et corrections

Cette série vérifie la compréhension des concepts Technology et leur application à des architectures réelles.

---

## Partie A — choisir le bon concept

### Q1
Un cluster OpenShift de production.

**Réponse : Node.**

### Q2
Red Hat OpenShift en tant que plateforme logicielle.

**Réponse : System Software.**

### Q3
Un serveur physique.

**Réponse : Device.**

### Q4
Une image de conteneur.

**Réponse : Artifact.**

### Q5
Un VNet Azure.

**Réponse : Communication Network.**

### Q6
Un chemin logique entre un workload et sa base.

**Réponse : Path.**

### Q7
Un endpoint PostgreSQL.

**Réponse : Technology Interface.**

### Q8
La capacité de base relationnelle offerte aux applications.

**Réponse : Technology Service.**

### Q9
Le moteur PostgreSQL.

**Réponse : System Software.**

### Q10
`Worker Node Failed`.

**Réponse : Technology Event.**

### Q11
`Workload Rescheduling` en tant que réaction ordonnée à une panne.

**Réponse : Technology Process.**

### Q12
`Metrics Collection`.

**Réponse : Technology Function.**

### Q13
Deux sites qui réalisent collectivement une plateforme HA.

**Réponse : Technology Collaboration.**

### Q14
`Cross-Site Failover` comme comportement collectif.

**Réponse : Technology Interaction.**

### Q15
`Object Storage Service`.

**Réponse : Technology Service.**

---

## Partie B — distinctions

### Q16 — Node vs Device

`Physical Server` et `OpenShift Worker VM`.

**Correction :**
- Physical Server → Device
- Worker VM → Node

### Q17 — System Software vs Application Component

`Kafka` et `Payment Orchestrator`.

**Correction :**
- Kafka → System Software
- Payment Orchestrator → Application Component

### Q18 — Technology Service vs System Software

`Event Streaming Service` et `Kafka`.

**Correction :**
- Event Streaming Service → Technology Service
- Kafka → System Software

### Q19 — Technology Interface vs Application Interface

`Payment REST API` et `Ingress VIP`.

**Correction :**
- Payment REST API → Application Interface
- Ingress VIP → Technology Interface

### Q20 — Data Object vs Artifact

`Payment Transaction` et `PAYMENT_TX table`.

**Correction :**
- Payment Transaction → Data Object
- PAYMENT_TX table → Artifact

---

## Partie C — OpenShift

### Q21
Faut-il représenter chaque Pod d’un cluster de 500 pods ?

**Réponse : non, pas par défaut.** Le niveau doit répondre au concern. Cluster, worker pool ou runtime logique sont souvent plus appropriés.

### Q22
Comment représenter Argo CD ?

**Réponse : System Software.** Il peut réaliser un GitOps Deployment Technology Service ou un Reconciliation Process.

### Q23
Comment représenter un manifeste Kubernetes ?

**Réponse : Artifact.**

### Q24
Comment représenter la capacité de stockage persistant ?

**Réponse : Technology Service**, par exemple Persistent Storage Service.

### Q25
Comment représenter un Ingress Controller ?

**Réponse : System Software**, réalisant un Ingress Technology Service.

---

## Partie D — Kafka

### Q26
`Payment Authorized` ?

**Réponse : Application Event.**

### Q27
`Payment Authorized Message` ?

**Réponse : Data Object.**

### Q28
`payment-authorized.avsc` ?

**Réponse : Artifact.**

### Q29
Kafka ?

**Réponse : System Software.**

### Q30
Event Streaming ?

**Réponse : Technology Service.**

---

## Partie E — Database

### Q31
Oracle RAC Cluster ?

**Réponse : Node**, avec Oracle Database comme System Software ; Technology Collaboration peut compléter si l’on insiste sur le comportement collectif des instances.

### Q32
Data Guard ?

**Réponse :** on peut modéliser les primary/standby comme Nodes, la réplication comme Technology Interaction/Function et le DR fourni comme Technology Service.

### Q33
Un backup set ?

**Réponse : Artifact.**

### Q34
Backup offert à plusieurs bases ?

**Réponse : Technology Service.**

### Q35
RPO 30 secondes ?

**Réponse : Requirement**, pas Technology Service.

---

## Partie F — sécurité

### Q36
Vault ?

**Réponse : System Software**, dans une vue de plateforme.

### Q37
Secrets Management ?

**Réponse : Technology Service.**

### Q38
HSM physique ?

**Réponse : Device.**

### Q39
OIDC Endpoint ?

**Réponse : Technology Interface**, lorsque l’on modélise l’interface du service d’identité.

### Q40
`Strong Authentication Required` ?

**Réponse : Requirement.**

---

## Partie G — observability et résilience

### Q41
Prometheus ?

**Réponse : System Software.**

### Q42
Metrics Collection ?

**Réponse : Technology Function.**

### Q43
Observability Service ?

**Réponse : Technology Service.**

### Q44
Site A Unavailable ?

**Réponse : Technology Event.**

### Q45
Activate Site B ?

**Réponse : Technology Process.**

### Q46
Deux sites fonctionnant ensemble pour le DR ?

**Réponse : Technology Collaboration.**

---

## Partie H — mini-cas

### Q47 — API Platform

MayaBank expose `POST /payments` via une plateforme API Gateway.

Proposer quatre concepts.

**Correction :**

```text
Application Interface: Payment REST API
Technology Interface: Public API Endpoint
Technology Service: API Routing Service
System Software: API Gateway Platform
```

---

### Q48 — Container deployment

Un composant `Fraud Engine` est livré en image OCI sur OpenShift.

**Correction :**

```text
Application Component: Fraud Engine
Artifact: fraud-engine:3.2.0
Node: OpenShift Production Cluster
System Software: OpenShift
Technology Service: Container Execution Service
```

---

### Q49 — Event-driven

Le Payment Orchestrator publie `Payment Settled` sur Kafka.

**Correction :**

```text
Application Event: Payment Settled
Data Object: Payment Settled Message
Artifact: payment-settled schema
Technology Service: Event Streaming Service
System Software: Kafka
Node: Kafka Cluster
```

---

### Q50 — Database HA

MayaBank veut une base active/standby avec bascule automatique.

**Correction :**

```text
Node: Primary DB
Node: Standby DB
Technology Collaboration: Database HA Pair
Technology Interaction: Replication
Technology Process: Automatic Failover
Technology Service: Resilient Database Service
```

---

### Q51 — Observability

Chaque paiement doit être traçable de bout en bout.

**Correction :**

```text
Requirement: End-to-End Payment Traceability
Technology Service: Distributed Tracing Service
Technology Function: Trace Collection
System Software: Observability Platform
```

---

### Q52 — Secrets

Les mots de passe ne doivent plus être intégrés aux fichiers de configuration.

**Correction :**

```text
Requirement: Centralized Secret Management
Technology Service: Secrets Management Service
System Software: Secrets Platform
Technology Process: Secret Rotation
```

---

### Q53 — DR

Le site primaire est perdu.

**Correction :**

```text
Technology Event: Primary Site Unavailable
Technology Process: Activate Secondary Site
Technology Interaction: Cross-Site Failover
Technology Service: Disaster Recovery Service
```

---

### Q54 — Cloud database

Une application consomme Azure PostgreSQL sans gérer les VMs.

**Correction :** dans une vue consommateur, `Technology Service: Managed Relational Database Service` peut suffire ; l’endpoint peut être Technology Interface. Les Nodes internes du fournisseur peuvent rester hors scope.

---

### Q55 — Green IT

MayaBank veut réduire le surdimensionnement.

**Correction :**

```text
Goal: Reduce Infrastructure Footprint
Requirement: Runtime must scale with demand
Technology Function: Autoscaling
Technology Service: Elastic Runtime Service
```

---

## Partie I — erreurs à corriger

### Q56
`Kafka = Application Component`

**Correction :** généralement System Software dans ce contexte.

### Q57
`OpenShift Cluster = Device`

**Correction :** Node pour l’environnement computationnel ; le matériel sous-jacent peut être Device.

### Q58
`Payment REST API = Technology Service`

**Correction :** l’API métier est Application Interface / Application Service selon ce qui est représenté.

### Q59
`RTO = Technology Service`

**Correction :** RTO est une exigence/mesure de récupération.

### Q60
`Container Image = Application Component`

**Correction :** l’image est Artifact ; elle réalise le composant applicatif.

---

## Test final de compréhension

Pour chaque technologie, être capable de répondre :

1. Quel **Node** héberge ou exécute ?
2. Quel **System Software** fournit le runtime ?
3. Quel **Technology Service** est consommé ?
4. Par quelle **Technology Interface** ?
5. Sur quel **Communication Network/Path** ?
6. Quel **Artifact** est déployé ?
7. Quels **Technology Events/Processes** assurent la résilience ?
8. Quels Application Components et Business Services dépendent de cette technologie ?

Si ces huit questions sont claires, le modèle technologique commence à devenir exploitable.