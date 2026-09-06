# Patterns Application → Technology → Physical

Cette fiche répond à une question simple : **qu’est-ce qui relève de l’application, de la plateforme, du calcul physique ou de l’infrastructure non-IT ?**

---

## 1. Application Component vs System Software

### Application Component

Logiciel orienté support métier ou fonctionnalité applicative.

```text
Payment Orchestrator
Fraud Engine
Customer Profile Service
```

### System Software

Logiciel de plateforme ou d’infrastructure fournissant un environnement d’exécution ou un service technique.

```text
Kafka
PostgreSQL
Oracle Database
OpenShift
Linux
```

### Test

Si l’objet répond directement à une capacité ou fonction applicative métier → probablement Application Component.

S’il fournit un runtime, une plateforme, un middleware, un DBMS ou un mécanisme d’infrastructure → probablement System Software.

---

## 2. Technology Service vs System Software

### Technology Service

Ce qui est fourni à l’application.

```text
Event Streaming Service
Container Runtime Service
Relational Database Service
Identity Service
Observability Service
```

### System Software

Ce qui réalise ce service.

```text
Kafka
OpenShift
PostgreSQL
Keycloak
Prometheus / OpenTelemetry stack
```

Pattern :

```text
Technology Behavior
  Realization → Technology Service

System Software
  Assignment → Technology Behavior
```

---

## 3. Node vs Device

### Node

Ressource computationnelle ou infrastructurelle capable d’héberger, stocker ou exécuter des artifacts.

### Device

Ressource matérielle physique ou virtuelle de type équipement informatique.

Exemples :

```text
Device: Physical Server
Device: Firewall Appliance
Device: Storage Array
```

Un Node peut représenter une unité logique d’exécution plus abstraite :

```text
Node: OpenShift Worker Node
Node: Database Cluster Node
```

Le niveau dépend du concern.

---

## 4. Device vs Equipment

`Equipment` appartient au Physical Layer et représente une machine, outil ou instrument physique utilisé pour créer, transformer ou transporter des matériaux/énergie, notamment dans l’infrastructure physique.

Exemples :

```text
Device: Rack Server
Equipment: UPS
Equipment: Chiller
Equipment: Generator
```

Ne pas classer un serveur comme Equipment simplement parce qu’il est physique.

---

## 5. Communication Network vs Distribution Network

### Communication Network

Transport d’information.

```text
IP Network
WAN
Data Center Network
```

### Distribution Network

Transport de matière ou d’énergie.

```text
Electrical Distribution Network
Cooling Water Distribution
Fuel Distribution
```

---

## 6. Pattern de déploiement complet

```text
Application Component: Payment Orchestrator
  realized by
Artifact: payment-orchestrator image
  deployed on
System Software: OpenShift
  running on
Node: Worker Pool
  hosted by
Device: Physical Servers
  located in
Facility: Data Center A
```

La notation exacte des relations doit être validée dans la spécification ; le pattern sert surtout à distinguer les niveaux.

---

## 7. Pattern OpenShift/Kubernetes

### Vue fonctionnelle

```text
Application Component: Payment Orchestrator
Technology Service: Container Platform Service
System Software: OpenShift
```

### Vue déploiement

```text
Artifact: payment-orchestrator image
System Software: OpenShift
Node: Worker Node
Device: Physical Server / VM Host selon le concern
```

### Vue plateforme

```text
System Software: OpenShift
System Software: Service Mesh
System Software: Argo CD
Technology Service: Container Orchestration Service
Technology Service: GitOps Deployment Service
Technology Service: Service-to-Service Security Service
```

---

## 8. Pattern Kafka

```text
Application Event: Payment Authorized
Data Object: PaymentAuthorized Payload
Technology Service: Event Streaming Service
System Software: Kafka
Node: Kafka Broker Node
Device: Server / VM infrastructure
```

Ne pas représenter Kafka comme événement, ni le topic comme service métier.

---

## 9. Pattern base de données

```text
Data Object: Payment Transaction
Application Component: Payment Ledger
Technology Service: Relational Database Service
System Software: PostgreSQL / Oracle
Artifact: PAYMENT_TX table/schema if useful
Node: Database Node / RAC Node
```

---

## 10. Pattern Cloud

ArchiMate ne nécessite pas un type d’élément « Cloud » spécifique.

Selon le concern :

```text
Technology Service: Managed Kubernetes Service
Technology Service: Object Storage Service
System Software: Kubernetes runtime
Node: Cloud Compute Environment
Facility: Cloud Region, uniquement si ce niveau physique/géographique est utile
```

Les propriétés peuvent porter :

- provider ;
- region ;
- availability zone ;
- service tier ;
- cost center ;
- carbon intensity.

---

## 11. Pattern IAM

```text
Requirement: Strong Authentication
Application Service: Customer Authentication Service
Technology Service: Identity Federation Service
System Software: IAM Platform
Technology Interface: OIDC Endpoint
Data Object: Identity Token / Claims model
```

Le standard permet de tracer du besoin jusqu’au mécanisme technique sans inventer un élément « Security Control » générique.

---

## 12. Pattern Observability

```text
Requirement: End-to-End Observability
Technology Service: Metrics Service
Technology Service: Logging Service
Technology Service: Distributed Tracing Service
System Software: Observability Platform
Application Components → telemetry flows → platform
```

Une propriété peut préciser :

```text
SLO = 99.95%
retention = 30d
```

---

## 13. Pattern HA / DR

```text
Requirement: RTO < 15 min
Requirement: RPO < 1 min

Application Component
→ Technology Services
→ Nodes on Site A / Site B
→ Communication Network
→ Facilities
```

Puis la migration/validation :

```text
Work Package: Implement DR
Deliverable: Validated DR Architecture
Implementation Event: DR Test Passed
```

---

## 14. Anti-pattern : toute plateforme = Node

`OpenShift`, `Kafka` ou `Oracle` sont généralement des System Software lorsqu’on parle du produit logiciel.

Le Node représente plutôt l’environnement computationnel qui les héberge.

---

## 15. Anti-pattern : tout ce qui est physique = Physical Layer

Un serveur est bien physique dans la réalité, mais ArchiMate possède `Device` précisément pour représenter les équipements IT.

Le Physical Layer complète le Technology Layer pour des infrastructures comme :

- bâtiments ;
- alimentation ;
- refroidissement ;
- équipements industriels ;
- matériaux.

## À retenir

```text
Application Component = logiciel métier/applicatif
Technology Service     = fonctionnalité technique fournie
System Software        = plateforme logicielle
Node                   = ressource d’exécution/hébergement
Device                 = équipement IT
Equipment              = équipement physique non-IT/industriel selon le concern
Communication Network  = transporte information
Distribution Network   = transporte énergie/matière
```
