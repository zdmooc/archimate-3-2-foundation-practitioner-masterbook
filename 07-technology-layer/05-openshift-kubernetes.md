# OpenShift & Kubernetes — modéliser une plateforme conteneurisée avec ArchiMate

Ce chapitre montre comment représenter une plateforme **OpenShift/Kubernetes** sans confondre produit, cluster, runtime, service technique, workload et artifact.

L’objectif n’est pas de reproduire tous les objets Kubernetes, mais de construire une **vue d’architecture** cohérente.

---

## 1. Les concepts utiles

Pour une plateforme OpenShift, on utilise principalement :

- `Node`
- `System Software`
- `Technology Service`
- `Technology Interface`
- `Communication Network`
- `Artifact`
- `Technology Function`
- `Technology Process`
- `Technology Event`

et, côté Application :

- `Application Component`
- `Application Service`
- `Application Interface`
- `Data Object`

---

## 2. OpenShift comme System Software

Quand on représente la plateforme logicielle :

```text
System Software: Red Hat OpenShift
```

Kubernetes peut également être représenté comme System Software si l’on veut distinguer les couches du runtime.

```text
System Software: Kubernetes
System Software: CRI-O
System Software: Linux
```

---

## 3. Cluster comme Node

```text
Node: OpenShift Production Cluster
```

Le cluster est un environnement computationnel pertinent pour l’architecture.

Une vue plus détaillée peut montrer :

```text
OpenShift Production Cluster
  ├─ Node: Control Plane
  ├─ Node: Worker Pool - Payments
  └─ Node: Worker Pool - Shared Services
```

---

## 4. Worker comme Node

Si le concern porte sur la capacité ou la résilience :

```text
Node: Worker 01
Node: Worker 02
Node: Worker 03
Node: Worker 04
```

Mais pour une vue solution, `Worker Pool` ou `Cluster` suffit souvent.

---

## 5. Master / Control Plane

```text
Node: OpenShift Control Plane
System Software: Kubernetes Control Plane
```

On peut y associer :

```text
Technology Function: Cluster State Management
Technology Function: Scheduling Coordination
Technology Service: Cluster Management Service
```

---

## 6. Namespace / Project

ArchiMate ne possède pas de concept « namespace » spécifique.

Plusieurs choix sont possibles selon l’intention :

- Grouping pour organiser visuellement ;
- Node si le namespace est traité comme environnement logique d’exécution important ;
- simple propriété/attribut dans le modèle ;
- ne pas le représenter si le concern ne l’exige pas.

Il faut éviter de transformer chaque objet Kubernetes en concept ArchiMate artificiel.

---

## 7. Pod

Un Pod peut être représenté comme Node si sa présence est importante pour le concern d’exécution.

Mais dans une architecture enterprise, on préfère souvent :

```text
Application Component: Payment Orchestrator
Artifact: payment-orchestrator image
Node: OpenShift Payment Runtime
```

plutôt que de représenter les pods éphémères individuels.

---

## 8. Deployment

Le `Deployment` Kubernetes est d’abord un objet de configuration.

Il peut être représenté comme Artifact :

```text
Artifact: payment-orchestrator Deployment Manifest
```

Le comportement de déploiement peut être :

```text
Technology Process: Deploy Payment Workload
```

---

## 9. Service Kubernetes

Attention au mot `Service`.

Un Kubernetes Service est un mécanisme technique de réseau/discovery.

Selon le concern :

```text
Technology Service: Internal Service Discovery
Technology Interface: Cluster Service Endpoint
```

Il ne faut pas automatiquement le confondre avec `Application Service`.

---

## 10. Route / Ingress

```text
System Software: Ingress Controller
Technology Service: Ingress Service
Technology Interface: Payment Platform Ingress Endpoint
```

Côté applicatif :

```text
Application Interface: Payment REST API
```

Les deux couches sont distinctes.

---

## 11. Operator

Un Operator est un logiciel de plateforme automatisant la gestion d’un composant.

On peut le modéliser comme :

```text
System Software: PostgreSQL Operator
Technology Function: Database Lifecycle Automation
Technology Service: Managed Database Lifecycle Service
```

Le niveau dépend du concern.

---

## 12. Persistent Volume

Le stockage peut être modélisé par :

```text
Technology Service: Persistent Storage Service
System Software: CSI Driver
Node/Device: Storage Platform
```

L’objet PVC lui-même peut être omis d’une vue architecture générale.

---

## 13. Object Storage

```text
Technology Service: Object Storage Service
Technology Interface: S3 Endpoint
System Software/Node: Object Storage Platform
```

Une application peut consommer le service sans connaître la topologie physique du stockage.

---

## 14. Secrets

```text
Technology Service: Secrets Management Service
Technology Interface: Secrets API
System Software: Vault / External Secrets Platform
```

Le Kubernetes Secret individuel n’a pas forcément besoin d’être modélisé.

---

## 15. ConfigMap

Une configuration peut être Artifact :

```text
Artifact: Payment Routing Configuration
```

Le mécanisme Kubernetes ConfigMap est un détail de réalisation, à montrer seulement si le concern le justifie.

---

## 16. RBAC

Le RBAC peut être représenté comme service/fonction :

```text
Technology Function: Authorization Enforcement
Technology Service: Platform Authorization Service
```

Les rôles Kubernetes détaillés peuvent rester dans la documentation de sécurité opérationnelle.

---

## 17. Network Policy

Pattern :

```text
Artifact: Payment Namespace Network Policy
Technology Function: Network Segmentation Enforcement
Technology Service: Network Isolation Service
```

---

## 18. Service Mesh

```text
System Software: Service Mesh
Technology Function: mTLS Enforcement
Technology Function: Traffic Management
Technology Service: Secure Service Connectivity
```

Il peut soutenir les Application Interactions entre microservices.

---

## 19. GitOps

```text
System Software: Argo CD
Artifact: Desired State Manifests
Technology Process: Reconcile Desired State
Technology Service: GitOps Deployment Service
Node: OpenShift Cluster
```

GitOps devient alors une capacité de plateforme clairement distincte de l’application.

---

## 20. Registry

```text
System Software: Container Registry
Technology Service: Container Artifact Storage Service
Technology Interface: Registry Endpoint
Artifact: Payment Orchestrator Image
```

---

## 21. Observability

```text
System Software: Metrics Platform
System Software: Log Platform
System Software: Trace Platform
Technology Service: Observability Service
Technology Function: Metrics Collection
Technology Function: Log Aggregation
Technology Function: Trace Correlation
```

---

## 22. Autoscaling

```text
Technology Function: Workload Autoscaling
Technology Event: Capacity Threshold Reached
Technology Process: Scale Workload
```

L’objectif est de montrer la capacité d’élasticité, pas chaque HPA YAML.

---

## 23. Self-healing

```text
Technology Event: Pod Runtime Failed
        ↓ triggers
Technology Process: Reschedule Workload
        ↓ supports
Technology Service: Resilient Container Execution
```

---

## 24. High Availability

MayaBank exige qu’une panne worker n’interrompe pas le service.

```text
Requirement: survive one worker failure
        ↓
Technology Service: Resilient Container Execution
        ↓ realized by
System Software: OpenShift
        ↓
Technology Function: Scheduling / Rescheduling
```

---

## 25. Multi-site OpenShift

Deux clusters :

```text
Node: Site A OpenShift Cluster
Node: Site B OpenShift Cluster
Technology Collaboration: Dual-Site Container Platform
Communication Network: Inter-site Network
Technology Service: Disaster Recovery Container Service
```

Puis :

```text
Technology Process: Failover Applications
Technology Event: Site A Unavailable
```

---

## 26. Application deployment chain

```text
Application Component: Payment Orchestrator
        ↓ realized by
Artifact: payment-orchestrator image
        ↓ deployed on
Node: OpenShift Production Cluster
        ↓ supported by
System Software: OpenShift
        ↓ exposes
Technology Service: Container Execution Service
```

---

## 27. API chain

```text
Application Interface: Payment REST API
        ↓ exposed through
Technology Interface: Ingress Endpoint
        ↓ provided by
Technology Service: Ingress / Load Balancing Service
        ↓ realized by
System Software: Ingress Controller
```

---

## 28. Event-driven chain

```text
Application Event: Payment Authorized
Data Object: Payment Authorized Message
        ↓
Technology Service: Event Streaming Service
        ↓ realized by
System Software: Kafka
        ↓ running on
Node: Event Platform Cluster
```

---

## 29. Storage chain

```text
Data Object: Payment Document
        ↓ realized/stored as
Artifact: Payment Document Object
        ↓ uses
Technology Service: Object Storage Service
        ↓ through
Technology Interface: S3 Endpoint
```

---

## 30. Anti-pattern : transformer ArchiMate en `oc get all`

Une vue qui montre :

- 60 Pods ;
- 25 Services ;
- 20 ConfigMaps ;
- 50 Secrets ;
- 30 Routes ;
- 100 ReplicaSets

n’est généralement pas une vue d’architecture d’entreprise.

ArchiMate doit sélectionner les structures et dépendances **stables et significatives**.

---

## 31. Questions de contrôle

### Q1
OpenShift ?

**Réponse : System Software.**

### Q2
OpenShift cluster ?

**Réponse : Node.**

### Q3
Container image ?

**Réponse : Artifact.**

### Q4
Ingress endpoint ?

**Réponse : Technology Interface.**

### Q5
Application REST API ?

**Réponse : Application Interface.**

### Q6
Persistent storage offert aux workloads ?

**Réponse : Technology Service.**

### Q7
Argo CD ?

**Réponse : System Software.**

### Q8
Desired-state YAML ?

**Réponse : Artifact.**

---

## À retenir

> **Modéliser OpenShift en ArchiMate ne signifie pas redessiner Kubernetes.**

Il faut représenter les **environnements, services de plateforme, interfaces, logiciels système, artifacts et mécanismes structurants** qui expliquent comment l’application est hébergée, connectée, sécurisée et exploitée.