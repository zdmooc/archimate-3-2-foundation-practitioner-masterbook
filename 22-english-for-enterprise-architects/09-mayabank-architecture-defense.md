# 09 — MayaBank Architecture Defense in English

This chapter provides a complete oral defense of the MayaBank target architecture. It can be used for interviews, architecture boards and English-speaking presentations.

## 1. Executive opening

**MayaBank is modernizing its payment platform to support real-time payments, improve operational resilience and reduce delivery lead time. The current platform relies on point-to-point integration, manual deployment and several shared dependencies that make change and incident analysis difficult. The target architecture introduces a more modular application model, standardized APIs, event-driven integration, OpenShift-based runtime, stronger identity controls and explicit multi-site recovery.**

## 2. Business drivers

**The main business drivers are instant-payment regulation, customer expectations for immediate status, operational-resilience requirements, faster product delivery and the need to reduce avoidable infrastructure footprint.**

### Possible question
**Why are these architecture drivers rather than implementation details?**

### Answer
**Because they explain why the organization needs to change. The technology choices come later and are evaluated against these drivers and the resulting requirements.**

## 3. Current-state assessment

**The baseline has five major weaknesses. First, channels are tightly coupled to payment execution logic. Second, point-to-point integrations make change expensive. Third, deployment is partly manual. Fourth, observability is fragmented across systems. Fifth, disaster-recovery automation is insufficient for the target service level.**

### Strong phrase
**The problem is not that the legacy technology is old; the problem is that the current architecture no longer satisfies the required business and operational outcomes.**

## 4. Target capability model

**At strategy level, the target strengthens five key capabilities: Real-Time Payment Processing, Fraud Detection, Payment Observability, Platform Engineering and Operational Resilience. These capabilities are realized through business processes, applications and platform services rather than mapped directly to products.**

## 5. Business architecture

**The core business flow is `Receive → Validate → Authorize → Execute → Confirm`. Business roles include the Payment Operator, Fraud Analyst and Settlement Manager. The main exposed business services are Instant Payment Service and Payment Status Service. Business objects include Payment Order, Fraud Decision and Settlement Instruction.**

### Question
**Why use a Business Service as well as a Business Process?**

### Answer
**The process describes how the business performs the behavior. The service describes what is provided to a consumer. Keeping them separate helps us distinguish internal execution from externally visible value.**

## 6. Application architecture

**The target application architecture is centered around a Payment API Gateway, Payment Orchestrator, Fraud Engine, Limit Management Service, Ledger Adapter, Clearing Adapter and Notification Service. The orchestrator coordinates the critical synchronous payment flow, while independent state propagation uses events.**

### Question
**Why not put the orchestration into the API Gateway?**

### Answer
**Because the gateway should remain an access and policy boundary. Putting business orchestration into gateway policies would create ownership ambiguity, reduce testability and turn the gateway into a business-logic bottleneck.**

## 7. API architecture

**The Payment API provides a stable contract for channels. The Application Service represents the payment functionality, while the Application Interface represents the REST access point. Authentication and throttling are enforced at the gateway, but business authorization and domain validation remain explicit in the application architecture.**

## 8. Event-driven integration

**Kafka provides the Event Streaming Service used for business-relevant state propagation. Events such as `Payment Authorized`, `Payment Rejected` and `Payment Settled` represent facts that have occurred. The Kafka topic is the technical transport construct, and the event payload is the logical data representation.**

### Question
**Why use Kafka instead of synchronous APIs everywhere?**

### Answer
**Because not every downstream consumer should participate in the payment execution availability chain. Event-driven propagation decouples notification, reporting and some reconciliation activities from the critical synchronous path. The trade-off is eventual consistency and more complex event governance.**

## 9. Payment state and idempotency

**The payment database is the system of record for internal payment state. Each initiation request has an idempotency mechanism. If the clearing rail times out after receiving a payment, the platform does not assume success or failure. It records an UNKNOWN state and reconciles with the rail before any controlled resubmission.**

### Question
**Why is UNKNOWN important?**

### Answer
**Because a network timeout is not a business outcome. Treating a timeout as a rejection and blindly retrying can create duplicate execution. UNKNOWN preserves uncertainty explicitly until the authoritative external status is known.**

## 10. Technology architecture

**The workloads run on OpenShift. OpenShift is modeled as System Software providing Container Platform Services. Application components are packaged as container-image Artifacts and deployed on cluster Nodes. Kafka, API Management, IAM, secrets management, database services, object storage and observability form the main shared technology capabilities.**

## 11. Why OpenShift?

**The decision is driven by the need for a standardized container platform, automated deployment, workload isolation, horizontal scaling and consistent operations. The trade-off is platform complexity: cluster lifecycle, operators, quotas, network policies and upgrades require mature platform engineering.**

## 12. Security model

**External users authenticate through enterprise IAM. Workloads use machine identities. Authorization is enforced according to least privilege. Secrets are externalized and rotated. Trust boundaries are explicit between external clients, application workloads, platform administration and privileged operations.**

### Question
**Is mTLS enough for Zero Trust?**

### Answer
**No. mTLS can provide workload authentication and transport protection, but we still need authorization, identity lifecycle, least privilege, auditability and clear trust boundaries.**

## 13. Observability model

**The observability design combines logs, metrics and distributed traces with a payment correlation identifier. Technical indicators are linked to business metrics such as payment completion rate, UNKNOWN status volume and reconciliation backlog.**

### Question
**Why not rely on logs?**

### Answer
**Because a distributed transaction crosses several services. Logs provide detail, but traces expose dependency and latency paths, while metrics provide aggregate health and SLO indicators. We need all three.**

## 14. High availability

**Stateless application services are deployed with multiple replicas across independent worker nodes. Shared platform services are also redundant. However, redundancy is evaluated end to end: three application replicas do not make the service highly available if they all depend on one database or one site.**

## 15. Disaster recovery

**The target spans two sites. Recovery requirements are expressed through RPO and RTO. Stateful services use replication aligned with those objectives. Site failover is controlled rather than blindly automatic where payment state could be uncertain. The recovery procedure must be tested, not only documented.**

### Question
**Why not active-active for everything?**

### Answer
**Active-active can reduce interruption, but it increases complexity for state consistency, external side effects and failure coordination. The architecture should use it only where the business requirement justifies the additional complexity.**

## 16. Physical and Green IT architecture

**The physical model distinguishes datacenter Facilities, IT Devices and non-IT Equipment such as power and cooling infrastructure. The sustainability case is linked to real capacity changes. Moving workloads to OpenShift creates an environmental benefit only if legacy capacity is actually removed, avoided or better utilized.**

### Question
**Why include physical architecture in an application modernization program?**

### Answer
**Because some resilience and sustainability outcomes depend on physical failure domains and physical resource consumption. If those concerns matter, the model must extend beyond logical application components.**

## 17. Baseline and target gaps

**The main gaps are: no standard API layer, no shared event backbone, excessive point-to-point integration, manual deployment, weak end-to-end observability, legacy data coupling and insufficient disaster-recovery automation.**

## 18. Transformation roadmap

**The transformation uses four main architecture states. P0 is the legacy baseline. P1 establishes platform foundations such as OpenShift, API Management, IAM and event streaming. P2 introduces hybrid payments, with selected flows migrated while legacy flows remain active. P3 activates the target payment core for most flows. P4 is reached after legacy exit and stabilization.**

## 19. Work packages

- **WP1 — OpenShift Foundation**
- **WP2 — API Management**
- **WP3 — Event Streaming**
- **WP4 — Payment Orchestrator**
- **WP5 — Observability**
- **WP6 — Data Migration**
- **WP7 — Instant Payment Wave 1**
- **WP8 — Remaining Payment Flows**
- **WP9 — Legacy Decommissioning**

How to present them:

**The work packages are not technology features; they represent transformation work required to close specific architecture gaps and reach stable transition plateaus.**

## 20. Cutover and rollback

**Cutover occurs only when functional validation, performance, security, observability and recovery criteria are met. Rollback remains available during the controlled transition window. Once data ownership, operational ownership and external routing are fully transferred, the rollback option can be closed and legacy decommissioning can begin.**

## 21. Main trade-offs

### Synchronous vs asynchronous
**Immediate consistency and simplicity versus runtime decoupling and replay.**

### Central platform vs distributed ownership
**Standardization and reuse versus blast radius and shared-service dependency.**

### Synchronous inter-site replication vs asynchronous
**Lower RPO versus latency and runtime coupling.**

### Refactor vs replatform
**Long-term architecture quality versus delivery time and migration risk.**

### Managed service vs portable stack
**Lower operational burden versus provider dependency.**

## 22. Main architecture risks

1. Shared database becomes an end-to-end SPOF.
2. Event contracts evolve without governance.
3. Fraud availability blocks payment unnecessarily.
4. UNKNOWN states are retried unsafely.
5. Secondary site depends on primary-site shared services.
6. Platform centralization increases blast radius.
7. Legacy decommissioning is postponed indefinitely.
8. Carbon savings are claimed without physical capacity reduction.

## 23. Five-minute oral defense

**MayaBank’s target architecture is designed around one principle: payment execution must be resilient, traceable and decoupled from non-critical downstream functions. Channels access the platform through a controlled Payment API. The Payment Orchestrator owns the main payment workflow and calls specialized services for fraud, limits, ledger and clearing. This keeps domain responsibilities explicit.**

**For interactions requiring an immediate outcome, we use synchronous APIs. For propagation of completed state changes to independent consumers, we use Kafka. That choice reduces runtime coupling but introduces eventual consistency, so event ownership, schema versioning, ordering and idempotency are governed explicitly.**

**The application runs on OpenShift, with shared services for identity, secrets, API Management, event streaming and observability. Logical application responsibilities remain independent from deployment constructs. The resilience model covers pod, node, cluster and site failure. Stateful services are designed according to business RPO and RTO rather than assuming that active-active is always the best answer.**

**The transformation is incremental. We first establish platform foundations, then migrate selected flows in hybrid mode, then activate the target payment core and finally decommission the legacy platform. The architecture model traces each work package to the gap it closes and the target outcome it enables.**

**The main open decisions are the final database replication mode, the degraded-mode policy for fraud-service failure and the exact cutover criteria. These decisions will be closed using measured latency, recovery tests and business-risk criteria rather than technology preference.**

## 24. Ten tough questions and model answers

### Q1 — What is the biggest risk?
**The biggest risk is a shared stateful dependency that can stop the whole payment flow. I therefore prioritize database resilience and tested recovery over adding more stateless replicas.**

### Q2 — Why not microservices everywhere?
**Because service boundaries should follow ownership and change needs. Excessive decomposition increases network dependency and operational complexity without automatically improving architecture quality.**

### Q3 — Why not use Kafka for commands?
**Kafka can transport command-like messages, but I select interaction style from business semantics. For payment initiation, the caller often needs an immediate controlled response, so a synchronous service contract is clearer.**

### Q4 — What is the source of truth?
**The internal payment database is the source of truth for MayaBank’s payment state, while the external clearing rail remains authoritative for the final external execution status when uncertainty exists.**

### Q5 — What happens if Kafka fails?
**Critical synchronous payment execution should not depend unnecessarily on event consumers. Event publication must be recoverable from durable internal state so the system can restore propagation after Kafka recovery.**

### Q6 — What happens if the fraud engine fails?
**That depends on the approved business-risk policy. The architecture must define whether payments stop, use a controlled fallback or enter manual review. We should not invent the policy at runtime.**

### Q7 — How do you prove DR works?
**Through repeatable recovery tests that measure actual recovery time, data loss and operational steps. A diagram alone does not prove resilience.**

### Q8 — How do you control platform blast radius?
**Through failure-domain separation, namespace and network isolation, quotas, independent scaling, high availability of shared services and clear service-level objectives for the platform itself.**

### Q9 — When is migration finished?
**When target flows are stable, operational ownership is transferred, recovery is validated, hidden legacy dependencies are removed and legacy capacity can be retired or formally retained.**

### Q10 — How does ArchiMate help?
**It gives us a consistent way to trace business drivers and requirements to capabilities, processes, applications, technology, physical infrastructure and migration work, while producing stakeholder-specific views from the same canonical model.**