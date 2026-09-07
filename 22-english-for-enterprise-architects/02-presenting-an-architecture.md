# 02 — Presenting an Architecture

## 1. Opening a presentation

A strong opening gives the audience the decision context before the diagram.

### Short version

**Today I’ll walk you through the target architecture for MayaBank’s instant-payment platform. I’ll start with the business drivers and constraints, then explain the main application and technology decisions, and finish with the migration and resilience model.**

### More formal version

**The purpose of this presentation is to explain the proposed target architecture, the rationale behind the main design decisions, the associated trade-offs, and the transition path from the current state.**

## 2. Presenting the context

Useful patterns:

- **The business context is...**
- **The program was initiated because...**
- **The key driver is...**
- **The current platform has three main limitations...**
- **The architecture must satisfy the following requirements...**
- **We also have two important constraints...**

Example:

**The key driver is the need to support real-time payments with stronger resilience and end-to-end observability. The current platform is tightly coupled, depends on manual deployment, and does not provide sufficient failure isolation. The target solution must support high availability, controlled recovery and traceable payment status.**

## 3. Walking through a diagram

Do not describe every box. Explain the logic.

### Good structure

1. start with scope;
2. identify the main entry point;
3. follow the main flow;
4. explain key supporting services;
5. identify state and integration points;
6. identify resilience boundaries;
7. finish with operational concerns.

### Useful phrases

- **Starting from the left...**
- **At the top of the diagram...**
- **The main entry point is...**
- **From there, the request is routed to...**
- **This component calls...**
- **In parallel...**
- **The resulting event is published to...**
- **At the technology layer...**
- **The same logical service is deployed across...**
- **The dashed line represents...**
- **The important point here is not the product itself, but the service it provides.**

## 4. Presenting a component

Use this five-part pattern:

```text
NAME
→ RESPONSIBILITY
→ INPUTS
→ OUTPUTS
→ DEPENDENCIES
→ FAILURE IMPACT
```

Example:

**The Payment Orchestrator is responsible for coordinating payment validation, fraud checks, limit checks and clearing submission. It receives an authenticated payment request from the API layer and returns a controlled payment status. Its main dependencies are the fraud engine, the limit service, the payment database and the clearing adapter. If the orchestrator becomes unavailable, new payment initiation is affected, so it is deployed redundantly across multiple workers.**

## 5. Presenting an API

**The Payment API exposes the payment-initiation capability to digital channels. Authentication is performed at the gateway. The API contract is versioned independently from the implementation. The gateway applies authentication, routing, throttling and policy enforcement, while the business orchestration remains in the Payment Orchestrator.**

Useful distinctions:

- **The API is the access point, not the business capability itself.**
- **The interface exposes the service.**
- **The service defines what is provided.**
- **The component implements the behavior behind the service.**

## 6. Presenting event-driven architecture

**The payment platform uses synchronous calls for interactions that require an immediate response and asynchronous events for propagation of business-relevant state changes. Kafka provides the event-streaming platform. A payment event represents a fact such as `Payment Authorized` or `Payment Settled`; the Kafka topic is the technical transport construct, not the business event itself.**

Useful phrases:

- **The producer publishes...**
- **The consumer subscribes to...**
- **The event carries...**
- **The topic is partitioned by...**
- **Ordering is guaranteed within...**
- **The consumer must be idempotent because...**
- **A replay can be used to...**

## 7. Presenting OpenShift / Kubernetes

**The application runs on OpenShift. The cluster provides container scheduling, service discovery, configuration, secrets integration and workload isolation. Application components are packaged as container images and deployed as workloads. We separate the logical application architecture from the runtime topology so that the model remains understandable even if the deployment model changes.**

Useful phrases:

- **The workload runs in...**
- **The namespace provides an isolation boundary.**
- **The pod is a runtime construct.**
- **The image is the deployable artifact.**
- **The cluster spans...**
- **Traffic is distributed across...**
- **A node failure should not interrupt...**

## 8. Presenting data architecture

**The payment database is the system of record for the payment state. Application services access logical payment data through controlled interfaces. We distinguish the business concept, the logical data object and the physical storage technology. This is important for traceability and migration.**

Useful phrases:

- **The system of record is...**
- **The source of truth is...**
- **The data owner is...**
- **The retention requirement is...**
- **The data must remain within...**
- **The schema evolves through...**
- **The data is replicated to...**

## 9. Presenting security

**Security is embedded in the architecture rather than represented as a separate technical island. Identity, authentication, authorization, secrets, encryption, trust boundaries and auditability are traced to the relevant services and components.**

Useful phrases:

- **Authentication is delegated to...**
- **Authorization is enforced by...**
- **Service-to-service communication uses...**
- **Secrets are stored in...**
- **The trust boundary is...**
- **This reduces lateral movement because...**
- **The audit trail includes...**

## 10. Presenting resilience

**The resilience model addresses failure at application, platform and site level. Stateless services are replicated, stateful components use controlled replication, and the recovery process is explicit. High availability reduces interruption during local failures; disaster recovery addresses site-level loss and recovery objectives.**

Useful phrases:

- **This is a single point of failure because...**
- **We remove the single point of failure by...**
- **The service is deployed in active-active mode.**
- **The database uses synchronous/asynchronous replication.**
- **RPO is...**
- **RTO is...**
- **Failover is automatic/manual because...**
- **The recovery procedure is tested through...**

## 11. Presenting migration

Do not say only “we migrate to the cloud/OpenShift”. Explain states.

**The migration is split into four plateaus. The baseline represents the legacy payment platform. The first transition introduces the target platform foundations. The second plateau operates in hybrid mode, with selected payment flows migrated while legacy flows remain active. The final plateau represents the target state after legacy decommissioning.**

Useful phrases:

- **The first work package establishes...**
- **The next wave migrates...**
- **During coexistence...**
- **The cutover criterion is...**
- **Rollback remains possible until...**
- **The legacy component can be decommissioned once...**

## 12. Presenting trade-offs

Architects must show that choices have consequences.

Pattern:

```text
OPTION
→ BENEFIT
→ COST / RISK
→ DECISION CRITERION
```

Examples:

**Active-active deployment improves availability and reduces failover time, but it increases operational complexity and may require conflict-management mechanisms for stateful services.**

**Synchronous replication can reduce data loss, but it increases latency and couples application availability to inter-site connectivity.**

**A shared platform improves standardization and operational efficiency, but it can increase the blast radius if tenant isolation is weak.**

## 13. Ending a presentation

Good closing:

**To summarize, the target architecture decouples channels from payment execution, introduces event-driven integration, standardizes runtime on OpenShift, strengthens identity and observability, and provides an explicit multi-site recovery model. The remaining decisions concern data replication mode, cutover sequencing and final decommissioning criteria.**

Then invite questions:

- **I’m happy to go deeper into any of these areas.**
- **We can now review the main open decisions.**
- **I’d like to get your feedback on the two remaining trade-offs.**

## 14. A complete three-minute architecture pitch

**MayaBank is modernizing its payment platform to support real-time payment processing, stronger operational resilience and faster delivery. The current architecture is tightly coupled and relies on several point-to-point integrations, which makes change and incident analysis difficult.**

**The target architecture introduces a Payment API, a Payment Orchestrator and a set of specialized services for fraud, limits, ledger integration, clearing and notification. Synchronous APIs are used where an immediate response is required, while business-relevant state changes are distributed asynchronously through Kafka.**

**The workloads run on OpenShift. Identity and access are handled through centralized IAM, secrets are externalized, and the observability stack provides logs, metrics and distributed traces. The platform is deployed across two sites. Stateless services are redundant, while stateful services use controlled replication aligned with RPO and RTO requirements.**

**The transformation is incremental. We first establish platform foundations, then migrate selected payment flows in hybrid mode, and finally decommission the legacy platform once functional, operational and recovery criteria are met. The main design trade-offs are between consistency and latency, centralization and blast radius, and automation and operational complexity.**