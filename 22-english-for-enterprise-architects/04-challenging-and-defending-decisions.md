# 04 — Challenging and Defending Architecture Decisions

## 1. Challenge the design, not the person

An architect often needs to disagree. The goal is to make the concern explicit without turning the discussion into a conflict.

Avoid:

- **This is wrong.**
- **That makes no sense.**
- **You should not do that.**
- **This architecture is bad.**

Prefer:

- **I see a risk with this approach.**
- **I’m concerned about the failure mode here.**
- **Can we validate this assumption?**
- **What happens if this dependency is unavailable?**
- **How does this design meet the RTO requirement?**
- **Could we compare this option with a more decoupled alternative?**
- **I would like to understand the rationale behind this choice.**

## 2. The architecture challenge framework

Use five questions:

```text
WHY?
WHAT ASSUMPTION?
WHAT FAILURE MODE?
WHAT TRADE-OFF?
WHAT ALTERNATIVE?
```

Example:

**Why do we need synchronous replication between the two sites? Which data-loss requirement drives this choice? What happens to application latency when inter-site latency increases? The trade-off seems to be lower RPO versus higher runtime coupling. Could asynchronous replication with a controlled RPO satisfy the business requirement?**

## 3. Asking for evidence

- **What evidence supports this sizing assumption?**
- **Do we have production measurements for this throughput?**
- **Was the failover tested under load?**
- **Can we demonstrate that the recovery procedure meets the RTO?**
- **Do we have an end-to-end trace for this transaction?**
- **Is this dependency documented in the architecture model?**
- **Which requirement is this design decision traced to?**

## 4. Challenging availability

Questions:

- **Is this component a single point of failure?**
- **Does the redundancy exist across failure domains or only within one node?**
- **What happens if the whole cluster is unavailable?**
- **What happens if the database is available but Kafka is not?**
- **How is partial failure detected?**
- **Is failover automatic, controlled or manual? Why?**
- **How do we prevent split-brain behavior?**
- **What is the blast radius of a platform failure?**

Useful assessment sentence:

**The service is redundant at pod level, but the architecture still has a site-level dependency, so the availability requirement is not fully addressed.**

## 5. Challenging performance and scalability

- **What is the expected peak throughput?**
- **Which component is likely to become the bottleneck?**
- **Can this workload scale horizontally?**
- **Is state stored locally or externally?**
- **What is the latency budget for each hop?**
- **How does back-pressure propagate through the system?**
- **What happens when consumers fall behind?**
- **How do we handle traffic spikes?**

Good sentence:

**Horizontal scaling helps only if the workload is not constrained by a shared stateful dependency. We therefore need to size the database and event platform as part of the same end-to-end capacity model.**

## 6. Challenging coupling

- **Why does this component call the database owned by another service?**
- **Can the dependency be expressed through a service contract instead?**
- **Is the integration contract versioned independently?**
- **What happens if one consumer requires a different release cadence?**
- **Are we coupling business availability to a non-critical downstream service?**

Good sentence:

**The current design creates runtime coupling between payment execution and notification. I would prefer to publish a payment-status event and keep notification asynchronous, because notification should not block settlement.**

## 7. Challenging security

- **Where is authentication performed?**
- **Where is authorization enforced?**
- **How are machine identities managed?**
- **Where are secrets stored and rotated?**
- **What is the trust boundary?**
- **Can one compromised workload access another namespace?**
- **Is sensitive data encrypted in transit and at rest?**
- **Which audit events are retained?**
- **How do privileged administrators access the platform?**

Diplomatic formulation:

**The design covers authentication, but authorization boundaries are still implicit. I recommend making service-level authorization and workload identity explicit in the target architecture.**

## 8. Challenging observability

- **How do we trace one payment end to end?**
- **Which business identifier is propagated across services?**
- **What metrics define service health?**
- **What is the SLO?**
- **How are technical alerts correlated with business impact?**
- **Can operations identify the affected payment flow without reading multiple logs manually?**

Good sentence:

**Logs alone are not sufficient for this distributed flow. We need a correlation identifier, distributed traces and business-level metrics to distinguish technical availability from successful payment completion.**

## 9. Defending a decision

Use this format:

```text
DECISION
→ DRIVER
→ OPTIONS CONSIDERED
→ TRADE-OFF
→ RISK
→ MITIGATION
```

Example:

**We chose asynchronous event propagation for payment-status notifications. The decision is driven by the requirement to keep payment execution independent from downstream notification availability. We considered synchronous REST callbacks and event streaming. The event-driven option introduces eventual consistency and operational complexity, but it reduces runtime coupling. We mitigate duplicate delivery through idempotent consumers and event identifiers.**

## 10. Defending OpenShift

Weak answer:

*We chose OpenShift because Kubernetes is modern.*

Strong answer:

**We chose OpenShift as the standardized container platform because the target architecture requires automated deployment, workload isolation, controlled configuration, horizontal scaling and a common operational model. The decision also reduces platform fragmentation. The trade-off is increased platform complexity and the need for strong governance around namespaces, quotas, operators and cluster lifecycle.**

## 11. Defending Kafka

Weak answer:

*Kafka is fast and scalable.*

Strong answer:

**Kafka is used where the architecture needs durable asynchronous event distribution, replay and decoupled consumers. It is not used for every interaction. Operations that require an immediate business response remain synchronous. The main trade-offs are eventual consistency, consumer idempotency and additional operational complexity.**

## 12. Defending API Management

**API Management centralizes external API exposure, authentication integration, policy enforcement, throttling and lifecycle governance. However, we deliberately keep business orchestration out of the gateway to avoid turning it into a central business-logic bottleneck.**

## 13. Defending a multi-site design

**The multi-site design is driven by the service continuity requirement, not by technology preference. Stateless application services are deployed redundantly across failure domains. Stateful services use replication mechanisms aligned with their RPO and RTO. Site failover is controlled to avoid inconsistent payment execution during uncertain external states.**

## 14. Saying “I don’t know” professionally

Architects do not need to improvise false certainty.

- **I don’t have enough data to confirm that yet.**
- **I would need to verify the actual production volume before answering.**
- **That depends on the failure mode; I would like to separate node failure from site failure.**
- **I don’t want to guess. The architecture decision should be based on the measured latency and the required RPO.**
- **I’m not certain about the product-specific limitation, but the architecture principle would be...**

## 15. Disagreeing with a senior stakeholder

- **I understand the objective. My concern is the operational impact of this option.**
- **We can implement it, but I want to make the associated risk explicit.**
- **If the priority is time-to-market, this option is reasonable. If resilience is the priority, I would choose the second option.**
- **I’m comfortable with the decision provided that we record the assumption and validate it during the pilot.**
- **I recommend documenting this as an accepted architecture risk rather than treating it as resolved.**

## 16. Architecture Review Board language

Opening:

**I’ll focus on the decisions that require architecture approval rather than walking through every component.**

Decision:

**The first decision is whether payment execution can depend synchronously on the fraud platform.**

Assessment:

**My assessment is that the dependency is acceptable only if the fraud service meets the same availability class or if a controlled fallback exists.**

Recommendation:

**I recommend option B because it preserves business continuity while keeping the fraud decision auditable.**

Condition:

**Approval should be conditional on load testing, failover testing and confirmation of the data-retention requirement.**

## 17. Useful trade-off sentences

- **This improves availability at the cost of consistency.**
- **This reduces coupling but introduces eventual consistency.**
- **This simplifies development but increases operational dependency.**
- **This centralizes governance but may increase the blast radius.**
- **This improves portability but limits access to provider-specific services.**
- **This reduces recovery time but increases infrastructure cost.**
- **This improves security isolation but adds operational overhead.**
- **This accelerates migration but postpones legacy decommissioning.**
- **This reduces infrastructure footprint only if the legacy capacity is actually removed or repurposed.**

## 18. Closing a disagreement

- **I think we agree on the requirement; the remaining question is the implementation trade-off.**
- **Let’s record both options and the decision criteria.**
- **I’m fine with this approach if we make the risk and mitigation explicit.**
- **We can proceed with the pilot and use measured results to close the decision.**
- **The architecture model should reflect the agreed decision and the remaining constraint.**