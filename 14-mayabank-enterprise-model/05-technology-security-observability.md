# MayaBank — Technology, Security & Observability Architecture

Cette fiche relie les composants applicatifs aux services de plateforme, runtimes, réseaux logiques, mécanismes de sécurité et services d’observabilité.

## 1. Technology Services

- Container Execution Service
- Event Streaming Service
- Relational Database Service
- API Management Service
- Identity Federation Service
- Secrets Management Service
- Service-to-Service Trust Service
- Distributed Observability Service
- Object Storage Service
- Backup Service
- Disaster Recovery Service

## 2. System Software

- OpenShift
- Kubernetes control-plane components
- Kafka
- API Gateway runtime
- PostgreSQL
- Oracle Database
- Service Mesh
- Secrets Manager / Vault-like platform
- Metrics backend
- Log backend
- Trace backend
- GitOps controller

Le produit logiciel de plateforme est généralement `System Software`, tandis que la fonctionnalité fournie aux applications peut être représentée comme `Technology Service`.

## 3. Application → Technology mapping

```text
Payment Orchestrator
  served by → Container Execution Service

Payment Orchestrator
  served by → Event Streaming Service

Payment Orchestrator
  served by → Secrets Management Service

Payment Orchestrator
  served by → Distributed Observability Service
```

## 4. OpenShift model

### Logical Nodes

- OpenShift Production Cluster
- OpenShift Non-Production Cluster
- Worker Pool Payments
- Worker Pool Platform

### System Software

```text
Node: OpenShift Production Cluster
  Assignment / hosting context → System Software: OpenShift
```

### Technology Services exposed

- Container Scheduling
- Service Discovery
- Routing
- Configuration
- Secret injection
- Autoscaling
- Persistent storage integration

## 5. Deployment chain

```text
Application Component: Payment Orchestrator
← Realization — Artifact: payment-orchestrator image
→ deployed on Node: Payments Worker Pool
→ enabled by System Software: OpenShift
```

La vue de déploiement doit distinguer le composant logique de son artifact déployable.

## 6. Kafka model

```text
System Software: Kafka
  Realization / provides → Technology Service: Event Streaming Service

Event Streaming Service
  Serving → Payment Orchestrator
  Serving → Clearing Adapter
  Serving → Status Service
```

Les topics peuvent être représentés comme artifacts ou éléments de détail complémentaires selon le concern, mais ils ne remplacent pas les Application Events.

## 7. Database model

### PostgreSQL
Utilisé pour certains services cibles à ownership local.

### Oracle
Reste nécessaire pour des fonctions legacy ou des domaines de données partagés pendant la transition.

### Pattern

```text
Technology Service: Relational Database Service
  Serving → Application Component

System Software: PostgreSQL / Oracle
  realizes or implements the database technology capability in the deployment view
```

## 8. Network model

### Communication Networks

- Front Door Network
- Application Network
- Platform Network
- Data Network
- Inter-Site Network

### Paths

- Client-to-API path
- API-to-application path
- application-to-Kafka path
- application-to-database path
- inter-site replication path

Le modèle doit permettre de voir les points de concentration et les dépendances critiques.

## 9. IAM

### Requirement

```text
Requirement: all privileged operations require strong authentication
```

### Application concern

- OAuth2/OIDC for user-facing APIs
- service identities for workloads

### Technology concern

```text
Technology Service: Identity Federation Service
System Software: Identity Provider
```

## 10. Authorization

Le modèle peut montrer :

- Business Role ;
- Application Service ;
- Requirement ;
- access-control technology.

Exemple :

```text
Business Role: Fraud Analyst
  uses → Fraud Review Service

Requirement: Fraud Review restricted to authorized analysts
```

## 11. Secrets

Mauvais pattern : secret statique dans Git ou image.

Cible :

```text
Technology Service: Secrets Management Service
  Serving → Payment Orchestrator
  Serving → Fraud Engine
  Serving → Clearing Adapter
```

avec rotation et contrôle d’accès.

## 12. Service-to-service trust

Le service mesh ou mécanisme équivalent peut fournir :

- mTLS ;
- identity between workloads ;
- traffic policy ;
- telemetry.

Ne pas modéliser `mTLS` comme une capability métier.

## 13. Observability architecture

### Application requirements

- correlation ID ;
- structured logging ;
- key business metrics ;
- distributed tracing ;
- health checks.

### Technology services

- Metrics Collection Service
- Log Aggregation Service
- Trace Collection Service
- Alerting Service

### Trace chain

```text
Payment API Gateway
→ Payment Orchestrator
→ Fraud Engine
→ Clearing Adapter
```

Chaque hop doit conserver la corrélation.

## 14. SLO view

Exemples de propriétés :

- availability target ;
- latency target ;
- error-rate target ;
- recovery target.

Les SLOs peuvent être portés comme propriétés ou Requirements selon le niveau de formalisation choisi.

## 15. HA

### Application
- multiple replicas ;
- stateless where possible ;
- retry/idempotency ;
- partition-tolerant interaction patterns.

### Platform
- multiple workers ;
- redundant control plane ;
- replicated Kafka ;
- database HA.

### Site
- services répartis ou réplicables sur deux sites selon le RTO/RPO.

## 16. DR

Exemples :

```text
Requirement: RPO = target value
Requirement: RTO = target value
Technology Service: Disaster Recovery Service
```

La DR doit être reliée aux données et applications critiques, pas seulement à un schéma de datacenter.

## 17. GitOps

```text
System Software: GitOps Controller
Technology Service: Declarative Deployment Service
  Serving → OpenShift-hosted workloads
```

Le repository Git contient des Artifacts/configurations ; il n’est pas lui-même une Capability.

## 18. Security traceability

```text
Driver: Cyber Risk
→ Goal: Reduce Credential Exposure
→ Requirement: Externalize Secrets
→ Technology Service: Secrets Management
→ System Software: Secrets Platform
→ Application Components served
```

## 19. Observability traceability

```text
Goal: Reduce MTTR
→ Requirement: End-to-End Correlation
→ Application behavior instrumentation
→ Technology Service: Distributed Observability
→ Operations Role consumes alerts/traces
```

## 20. Technology anti-patterns

- représenter OpenShift comme Application Component dans une vue de plateforme ;
- représenter Kafka comme Capability ;
- confondre Node logique et Device physique ;
- oublier les Technology Services et relier directement chaque application au nom du produit ;
- modéliser la sécurité uniquement avec des notes sans Requirements ni services concernés ;
- montrer HA sans dépendances de données ;
- montrer observability sans consumers opérationnels.

## 21. Vue cible synthétique

```text
Applications
  ↓ served by
OpenShift / Kafka / DB / IAM / Secrets / Observability Technology Services
  ↓ realized by
System Software
  ↓ hosted on
Nodes
  ↓ connected through
Communication Networks
```

> **La Technology Architecture explique les services techniques consommés par les applications et les mécanismes qui les rendent possibles.**