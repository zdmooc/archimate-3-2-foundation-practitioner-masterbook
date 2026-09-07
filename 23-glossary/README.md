# Partie XXIII — Glossaire FR/EN d’architecture

Cette partie constitue le **référentiel terminologique bilingue** du masterbook. Elle contient **261 termes distincts** couvrant ArchiMate 3.2 et le vocabulaire professionnel utilisé en architecture d’entreprise, architecture solution et architecture plateforme.

Chaque entrée du glossaire thématique contient :

```text
English term
→ équivalent français
→ définition
→ exemple MayaBank
→ confusion fréquente
→ renvoi vers le chapitre du masterbook
```

## Glossaire thématique

1. [ArchiMate — Motivation & Strategy](01-archimate-motivation-strategy.md) — 14 termes
2. [ArchiMate — Business & Application](02-archimate-business-application.md) — 22 termes
3. [ArchiMate — Technology, Physical & Migration](03-archimate-technology-physical-migration.md) — 22 termes
4. [ArchiMate — Relations, Views & Métamodèle](04-archimate-relationships-views-metamodel.md) — 24 termes
5. [Enterprise Architecture & TOGAF](05-enterprise-architecture-togaf.md) — 32 termes
6. [API, Integration & Event-Driven](06-api-integration-event-driven.md) — 35 termes
7. [Cloud, Kubernetes & OpenShift](07-cloud-kubernetes-openshift.md) — 32 termes
8. [Security, Resilience & Observability](08-security-resilience-observability.md) — 38 termes
9. [Data, AI, Green IT & FinOps](09-data-ai-greenit-finops.md) — 42 termes

Total : **261 termes distincts**.

## Index bilingues

- [Index A–Z English → Français](10-english-a-z-index.md)
- [Index A–Z Français → English](11-french-a-z-index.md)

Les deux index contiennent les **261 entrées** et renvoient vers le fichier thématique qui porte la définition détaillée.

## Règle fondamentale

Le vocabulaire professionnel ne doit pas être transformé mécaniquement en types ArchiMate.

```text
MOT PROFESSIONNEL ≠ TYPE ARCHIMATE AUTOMATIQUE
```

Exemples :

```text
Kafka
→ technologie / System Software selon le concern

Kafka Topic
→ construct technique de messaging
→ pas automatiquement Data Object

Payment Authorized
→ fait/changement d’état
→ peut être Application Event

Event Payload
→ information logique transportée
→ peut être Data Object selon le niveau

OpenShift
→ plateforme / System Software

OpenShift Cluster
→ peut être Node si le concern porte sur la ressource d’exécution

RTO / RPO
→ objectifs/exigences de reprise
→ généralement Requirements ou propriétés selon le modèle

CO2e
→ mesure d’impact
→ pas un élément ArchiMate

LLM
→ modèle/technologie IA
→ pas automatiquement une Capability métier
```

## Les distinctions à connaître par cœur

```text
Actor ≠ Role
Capability ≠ Process
Process ≠ Function
Service ≠ Interface
Component ≠ Service
Business Object ≠ Data Object ≠ Artifact
Application Component ≠ System Software
Technology Service ≠ System Software
Node ≠ Device ≠ Equipment ≠ Facility
Application Event ≠ Kafka Topic ≠ Event Payload
Course of Action ≠ Work Package
Goal ≠ Outcome ≠ Requirement
Gap ≠ Assessment
Plateau ≠ Environment ≠ Release
Access ≠ Flow
Triggering ≠ Flow
Assignment ≠ Realization ≠ Serving
HA ≠ DR
RTO ≠ RPO
API Gateway ≠ API Management
Kubernetes Service ≠ ArchiMate Service
LLM ≠ AI Capability
CO2e ≠ Material
```

## Utilisation recommandée

### Certification Foundation

Commencer par les fichiers 01 à 04, puis utiliser l’index anglais pour apprendre le vocabulaire officiel.

### Certification Practitioner

Travailler en priorité les colonnes **À ne pas confondre**, puis relier les termes aux scénarios de la [Partie XIX](../19-practitioner-scenario-bank/README.md).

### Entretien Architecte Solution

Réviser les fichiers 05 à 09 puis la [Partie XXII — English for Enterprise Architects](../22-english-for-enterprise-architects/README.md).

### Architecture OpenShift / Cloud

Utiliser 07 + 08 : cluster, node, pod, namespace, IAM, Zero Trust, HA, DR, observability et SRE.

### Architecture Paiements / Kafka / API

Utiliser 06 + 08 : API contract, idempotency, event, message, topic, partition, replay, outbox, saga, RTO/RPO et resilience.

### Architecture Data / AI

Utiliser 09 : data governance, lineage, data products, MLOps, RAG, vector database, model gateway et guardrails.

### Green IT / FinOps

Utiliser 09 : carbon footprint, embodied/operational carbon, PUE, right-sizing, decommissioning, GreenOps et FinOps.

## Convention linguistique

Les termes de standard, produit ou pratique courante restent souvent en anglais dans les missions françaises. Le glossaire fournit donc un équivalent français pour comprendre et expliquer, mais ne force pas des traductions artificielles.

Exemples généralement conservés en anglais :

`stakeholder`, `driver`, `capability`, `work package`, `failover`, `GitOps`, `landing zone`, `pod`, `namespace`, `SLO`, `RAG`, `FinOps`.

Le but est double : **maîtriser la sémantique ArchiMate** et **être à l’aise avec le vocabulaire réellement utilisé en architecture d’entreprise et solution**.