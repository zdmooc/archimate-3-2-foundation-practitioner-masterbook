# Use case 4 — OpenShift / Kubernetes

## 1. Contexte

MayaBank veut standardiser l'exécution de ses applications conteneurisées sur une plateforme OpenShift multi-environnements, avec GitOps, sécurité, observabilité, autoscaling et résilience.

## 2. Motivation

Drivers :

- application modernization ;
- platform standardization ;
- faster deployment ;
- operational resilience ;
- automation ;
- infrastructure consolidation.

Goals :

- standardized deployment platform ;
- automated delivery ;
- stronger isolation and policy enforcement ;
- elastic application hosting ;
- reduced operational variance.

Requirements :

- namespace isolation ;
- RBAC ;
- quota / limits ;
- secrets management ;
- image security ;
- network policies ;
- GitOps ;
- monitoring/logging/tracing ;
- HA ;
- backup/restore ;
- DR.

## 3. Capability vs platform

```text
Capability: Container Platform Engineering
Technology Service: Container Execution Service
System Software: OpenShift / Kubernetes
Node: Worker Node
Artifact: Container Image
```

`OpenShift` n'est pas une Capability simplement parce qu'il rend l'entreprise plus capable.

## 4. Application-to-technology mapping

```text
Application Component: Payment Orchestrator
  realized by Artifact: payment-orchestrator image
  deployed on Technology Node: OpenShift Worker

Technology Service: Container Execution Service
  Serving → Payment Orchestrator
```

Depending on the level of abstraction, the cluster itself can be represented through a Node or Grouping of Nodes/System Software, while worker machines remain Nodes/Devices.

## 5. Kubernetes concepts

Useful mapping patterns :

- container image → Artifact ;
- OpenShift/Kubernetes runtime → System Software ;
- worker → Node ;
- physical server → Device ;
- ingress/router capability → Technology Service + System Software ;
- persistent storage → Technology Service / Node / Artifact depending concern ;
- namespace/project → often Grouping / modeling convention rather than inventing a new ArchiMate type ;
- Operator → System Software or Application Component depending the concern and responsibility.

## 6. GitOps

```text
Course of Action: Automate Platform Delivery
Work Package: Implement GitOps Foundation
Technology Service: Deployment Automation Service
System Software: Argo CD
Artifact: GitOps Manifest
```

Git repositories and manifests should not be confused with application services.

## 7. Security

Concerns :

- authentication ;
- RBAC ;
- namespace tenancy ;
- network policy ;
- secrets ;
- image provenance ;
- admission policy ;
- runtime security ;
- mTLS.

Cross-layer chain :

```text
Requirement: Workload Isolation
→ Technology Service: Policy Enforcement Service
→ System Software: Admission / Policy Engine
→ Nodes / workloads
```

## 8. Observability

Technology services :

- Metrics Service
- Log Aggregation Service
- Trace Service
- Alerting Service

Application requirements and SLOs can be traced to those services.

## 9. HA

The architecture must distinguish :

- application replicas ;
- platform control plane redundancy ;
- worker redundancy ;
- storage resilience ;
- external database resilience ;
- site resilience.

A cluster with several workers is not automatically a DR architecture.

## 10. Baseline

- VM-per-application ;
- manual deployments ;
- heterogeneous middleware ;
- weak standardization ;
- low utilization ;
- fragmented monitoring.

## 11. Target

- standardized OpenShift platform ;
- GitOps ;
- shared observability ;
- policy-as-code ;
- namespaces/tenancy standards ;
- scalable workloads ;
- integrated backup and DR.

## 12. Gaps

- no container landing zone ;
- no GitOps standard ;
- incomplete security policies ;
- missing workload sizing ;
- no platform SLO ;
- no DR design.

## 13. Work Packages

1. Build OpenShift foundation
2. Define tenancy model
3. Establish GitOps
4. Establish security policies
5. Establish observability
6. Establish storage/backup
7. Migrate pilot workload
8. Industrialize migration factory
9. Decommission legacy infrastructure

## 14. Views

- Technology View
- Deployment View
- Technology Usage View
- Layered View
- Security View
- Operations View
- Migration View
- Green IT View

## 15. Anti-patterns

### Pod = Application Component automatically

False. A pod is an implementation/runtime construct. The application component is the logical application structure.

### OpenShift = Application Component

Usually wrong when the concern is platform technology.

### Worker = Device only

A worker can be modeled as a Node; the underlying physical machine is a Device when relevant.

### Namespace = Capability

Wrong. Namespace is an organizational/runtime partitioning concept, not an enterprise ability.

## 16. Interview questions

1. How do you model OpenShift and Kubernetes in ArchiMate?
2. What is the difference between Node and Device for a worker?
3. Where do container images belong?
4. How do you show GitOps?
5. How do you represent platform services consumed by applications?
6. How do you distinguish HA from DR?

## 17. Practitioner case

A solution architect wants to prove that three business-critical applications rely on the same OpenShift cluster and storage service.

Use a **Technology Usage / Layered impact view** that traces applications to technology services and nodes, rather than drawing Kubernetes internals without consumers.
