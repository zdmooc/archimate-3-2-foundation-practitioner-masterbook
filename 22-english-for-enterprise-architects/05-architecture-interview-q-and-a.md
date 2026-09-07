# 05 — Architecture Interview Q&A

This chapter contains reusable answers for Solution / Enterprise Architecture interviews. The goal is not to memorize a script word for word, but to internalize a clear structure.

## 1. Tell me about yourself

**I’m a solution and transverse architect with a strong background in banking and payment systems. I work across business, application, platform and infrastructure concerns, with a particular focus on OpenShift/Kubernetes, event-driven architecture, APIs, resilience, cloud transformation and Green IT. My role is usually to connect business requirements with technical implementation, challenge design decisions, identify risks and produce architecture that can be implemented and operated.**

## 2. What is your role as a solution architect?

**My role is to turn business and non-functional requirements into an implementable architecture. I clarify scope and constraints, define the target architecture, identify dependencies and failure modes, compare options, document decisions and trade-offs, and support teams through implementation. I also make sure that security, resilience, observability, operations and migration are addressed from the beginning rather than added at the end.**

## 3. How do you start a new architecture assignment?

**I start by clarifying the business outcome, stakeholders, constraints and non-functional requirements. Then I understand the baseline architecture and identify the main gaps. I model the target at the right level of abstraction, identify key decisions and risks, and define a transition path. I avoid starting with products because product choices should come after the architecture concerns are understood.**

## 4. How do you choose between synchronous and asynchronous integration?

**I look at the business interaction first. If the consumer needs an immediate business response, synchronous interaction can be appropriate. If the main need is to propagate a fact to multiple independent consumers, absorb peaks or decouple runtime availability, asynchronous events are often better. I also consider ordering, idempotency, replay, latency, consistency and operational complexity.**

## 5. When would you use Kafka?

**I use Kafka when there is a real need for durable asynchronous event distribution, high-throughput streaming, replay or multiple decoupled consumers. I would not use Kafka simply because the organization has a Kafka platform. For request/response interactions requiring an immediate outcome, an API is often clearer.**

## 6. What are the main risks of event-driven architecture?

**The main risks are hidden event contracts, duplicate processing, ordering assumptions, eventual consistency, schema evolution, consumer lag, difficult end-to-end troubleshooting and uncontrolled topic proliferation. I mitigate those risks with explicit event ownership, versioned schemas, idempotent consumers, observability, retention policies and governance.**

## 7. How do you model an API in ArchiMate?

**I separate the functionality from the access point. The functionality is typically modeled as an Application Service, while the API endpoint or access mechanism can be modeled as an Application Interface. The component that implements the service is an Application Component. The exact level depends on the concern of the view.**

## 8. How do you model a microservice?

**A microservice is generally an Application Component when I model its logical software responsibility. The functionality it exposes is an Application Service, and its API can be represented by an Application Interface. At deployment level, the container image is an Artifact and the runtime platform belongs to the Technology layer.**

## 9. How do you separate logical and physical architecture?

**I keep logical application responsibilities independent from deployment technology. A Payment Orchestrator remains the same logical component whether it runs on a VM, a Kubernetes cluster or another platform. This separation improves portability, traceability and architecture readability. Deployment views then connect the logical components to artifacts, nodes and system software.**

## 10. What is the difference between high availability and disaster recovery?

**High availability is mainly about maintaining service during local failures with redundancy and automatic or controlled failover. Disaster recovery addresses larger failure scenarios, such as loss of a site, and is driven by RPO and RTO. A system can be highly available within one site and still have poor disaster-recovery capability.**

## 11. How do you identify a single point of failure?

**I follow the critical business flow through application, platform, data, network and physical dependencies. For each dependency, I ask whether there is an independent alternative and whether failover has actually been tested. Redundancy inside the same failure domain does not remove all single points of failure.**

## 12. How do you design for resilience?

**I start from business continuity requirements and identify failure domains. Stateless services are replicated, stateful services use replication aligned with RPO/RTO, dependencies are isolated where possible, and failure handling is explicit. I also design observability and recovery procedures, because redundancy without detection and recovery validation is not enough.**

## 13. How do you handle an UNKNOWN payment status?

**I treat UNKNOWN as a controlled business and technical state rather than guessing the outcome. The system should reconcile with the external rail or authoritative source before any resubmission. Resubmission must be idempotent and explicitly controlled to avoid duplicate payment execution.**

## 14. How do you approach API security?

**I separate external authentication, service authorization, workload identity, secrets and audit. The gateway can enforce external policies, but service-level authorization should remain explicit. I also consider mTLS, token validation, rate limits, data classification, least privilege and key rotation.**

## 15. What is Zero Trust in practical architecture terms?

**For me, Zero Trust means that network location alone is not considered sufficient trust. Each human or workload identity must be authenticated, authorized and limited to the minimum required access. Trust boundaries, service identities, policy enforcement, secrets and auditability should be explicit in the architecture.**

## 16. How do you design observability?

**I define observability from the business transaction down to infrastructure. For payment flows, I want a correlation identifier propagated across services, distributed traces for latency and dependency analysis, metrics for SLOs and capacity, and logs for diagnostic detail. I also link technical alerts to business impact.**

## 17. What is the difference between monitoring and observability?

**Monitoring tells us whether known indicators are healthy. Observability gives enough internal signals to investigate unknown failure modes and understand system behavior. In a distributed platform, logs alone are not sufficient; metrics, traces and context propagation are essential.**

## 18. How do you use OpenShift in architecture?

**I treat OpenShift as a platform, not as the application architecture itself. It provides standardized container runtime, scheduling, isolation, configuration, operators and deployment integration. I still model application responsibilities independently, then connect them to the platform through technology services, nodes and artifacts.**

## 19. What do you check in an OpenShift design?

**I check cluster topology, failure domains, namespace strategy, quotas and limits, network policies, ingress, identity integration, secrets, storage classes, operators, observability, GitOps, backup/recovery, upgrade strategy and workload placement. I also verify whether platform redundancy matches application availability requirements.**

## 20. What is your approach to cloud migration?

**I avoid treating cloud migration as a simple hosting move. I classify applications and dependencies, decide which capabilities should be rehosted, replatformed, refactored, retained or retired, establish landing-zone controls, and model transition states. Decommissioning criteria are important because migration value is not realized if legacy capacity remains indefinitely.**

## 21. How do you compare cloud and on-premises options?

**I compare functional fit, security, data residency, resilience, latency, operational model, skills, portability, cost and exit strategy. I also distinguish unit price from total architecture cost, including networking, observability, support, platform operations and migration effort.**

## 22. How do you approach Green IT as an architect?

**I focus on architecture decisions that change real resource consumption: right-sizing, consolidation, utilization, lifecycle extension, data retention, workload scheduling and actual decommissioning. I avoid claiming a carbon benefit just because a workload moved to another platform. The physical capacity must be removed, avoided or measurably better utilized.**

## 23. How do you use TOGAF and ArchiMate together?

**I use TOGAF mainly as a method and governance framework and ArchiMate as a modeling language. During architecture phases, ArchiMate helps express motivation, business, application, technology and migration states. The language does not replace governance or the ADM; it supports communication, traceability and analysis.**

## 24. How do you choose the right ArchiMate viewpoint?

**I start from the stakeholder and concern. I then select or tailor a viewpoint that contains only the information required for that decision. I avoid one giant diagram because a useful view is intentionally selective.**

## 25. How do you deal with architecture debt?

**I make architecture debt explicit, identify its impact, link it to risks or constraints, and distinguish temporary exceptions from structural design. I then decide whether it is accepted, mitigated or scheduled for remediation through a Work Package.**

## 26. How do you make architecture decisions traceable?

**I link the decision to its driver, requirement and affected architecture elements. I document alternatives, rationale, trade-offs and consequences. In ArchiMate, I also use cross-layer traceability so that we can explain both why a technical component exists and what business impact it has.**

## 27. How do you handle disagreement between teams?

**I bring the discussion back to shared requirements and decision criteria. I separate facts, assumptions and preferences, make trade-offs explicit, and compare options against the same criteria. If uncertainty remains, I recommend a controlled experiment or pilot rather than forcing a decision based on opinion.**

## 28. How do you work with developers and operations?

**I do not stop at the architecture document. I review implementation constraints with developers, validate operability with platform and operations teams, and update the architecture when real implementation feedback changes assumptions. Architecture should guide delivery and evolve with evidence.**

## 29. Give an example of a difficult architecture trade-off

**A typical example is synchronous versus asynchronous inter-site data replication. Synchronous replication improves RPO but can increase latency and couple availability to network quality. Asynchronous replication improves runtime independence but accepts a possible data-loss window. The correct decision depends on the business RPO, latency budget and recovery process.**

## 30. What makes a good architecture document?

**A good architecture document is decision-oriented. It explains context, requirements, baseline, target, main flows, dependencies, security, resilience, observability, risks, trade-offs and migration. It uses diagrams to support decisions rather than replacing explanations with boxes and arrows.**

## 31. What makes a good architecture model?

**A good model uses canonical elements, clear semantics, explicit relationships, consistent abstraction levels and stakeholder-specific views. It supports impact analysis and traceability in both directions.**

## 32. What would you do in your first weeks on a mission?

**I would identify the main stakeholders, architecture governance, current documentation, critical business flows and active risks. I would build a concise baseline, validate it with technical teams, identify unresolved decisions, and prioritize the areas where architecture can unblock delivery or reduce risk.**

## 33. How do you present a risk to management?

**I explain the business impact, likelihood or trigger, affected scope, existing controls and recommended mitigation. I avoid purely technical language. For example: `Loss of the shared database would stop payment initiation across all channels. The current design has no independent failover path. I recommend a replicated database service and a tested recovery procedure.`**

## 34. How do you decide whether to centralize a platform capability?

**I compare standardization benefits with blast radius and organizational coupling. Centralized identity, observability or API governance can be valuable, but the shared service must have an availability class consistent with the critical consumers and clear ownership.**

## 35. How do you explain a technical topic to executives?

**I translate the technical mechanism into business outcome, risk and decision. Instead of saying `Kafka has three brokers`, I say `the event platform is redundant across failure domains so one broker failure does not stop event distribution`. I keep product details only when they affect the decision.**

## 36. How do you explain a business topic to engineers?

**I turn the business objective into concrete requirements and scenarios. For example, `instant payment resilience` becomes availability target, maximum recovery time, idempotency, status reconciliation, auditability and failure handling.**

## 37. How do you evaluate a vendor solution?

**I start from architecture requirements rather than vendor features. I assess integration model, security, resilience, observability, deployment options, data ownership, scalability, operational model, lock-in, roadmap and exit strategy. Then I identify which requirements are native, configurable or require custom development.**

## 38. What is your approach to GenAI architecture?

**I separate business use case, data access, model access, orchestration, guardrails, evaluation, observability and platform runtime. I treat the model endpoint as one dependency within a wider enterprise architecture. Security, data leakage, prompt injection, model quality, cost and auditability are cross-cutting concerns.**

## 39. How do you govern architecture as code?

**I keep text-based architecture sources in Git, use stable identifiers and naming conventions, validate syntax automatically, render views in CI and review semantic changes through pull requests. Automation supports consistency, but a green pipeline does not replace architecture review.**

## 40. Why should we hire you as an architect?

**I can work across business, application, platform and infrastructure levels rather than optimizing one technology in isolation. I am comfortable with architecture governance, modern cloud-native patterns and operational concerns, and I focus on traceability from business requirement to implementation. My objective is to produce architecture that teams can actually build, operate and evolve.**