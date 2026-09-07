# 03 — Explaining ArchiMate Models in English

## 1. The minimum vocabulary

| ArchiMate term | Useful English explanation |
|---|---|
| Stakeholder | a person, group or organization with an interest in the architecture |
| Concern | an issue or question that matters to a stakeholder |
| Viewpoint | the conventions used to build a view for specific concerns |
| View | a representation of selected architecture elements and relationships |
| Driver | a condition or force that motivates change |
| Assessment | an analysis of a driver or current situation |
| Goal | a desired high-level state |
| Outcome | an observable result |
| Requirement | a condition the architecture must satisfy |
| Constraint | a restriction on the solution space |
| Capability | an ability the organization needs or possesses |
| Value Stream | a sequence of value-creating stages |
| Course of Action | a chosen strategic approach |
| Business Process | an ordered sequence of business behavior |
| Business Function | business behavior grouped by purpose rather than sequence |
| Business Service | business behavior exposed to a consumer |
| Application Component | a modular logical software element |
| Application Service | application behavior exposed to consumers |
| Application Interface | an access point to application behavior |
| Data Object | logical application-level information |
| Node | a computational or execution resource |
| Device | a physical IT resource |
| System Software | infrastructure/runtime software |
| Technology Service | technology behavior exposed to consumers |
| Artifact | a concrete deployable or stored representation |
| Facility | a physical structure or site |
| Equipment | physical non-IT machinery or equipment |
| Work Package | a set of transformation activities |
| Deliverable | a defined result produced by transformation work |
| Plateau | a relatively stable architecture state |
| Gap | a difference between architecture states |

## 2. Explaining the layers

### Motivation

**The Motivation aspect explains why the organization needs to change. It links stakeholders and drivers to assessments, goals, outcomes, requirements and constraints.**

### Strategy

**The Strategy elements explain what the organization needs to be able to do and which strategic approach it chooses. Capabilities are relatively stable abilities; a Course of Action represents a chosen direction.**

### Business

**The Business layer describes who performs business behavior, what that behavior is, what services are exposed, and which business information is involved.**

### Application

**The Application layer describes how software components support business behavior. It separates the logical component, its internal behavior, the service it exposes, the interface used to access it and the logical data it processes.**

### Technology

**The Technology layer describes the platform and infrastructure services required to run applications. It includes execution resources, devices, system software, networks, technology services and deployable artifacts.**

### Physical

**The Physical layer describes facilities, equipment, distribution networks and material resources when they are relevant to the architecture concern.**

### Implementation & Migration

**Implementation and Migration elements explain how the organization moves from a baseline state to a target state through gaps, work packages, deliverables, implementation events and plateaus.**

## 3. Explaining Active Structure, Behavior and Passive Structure

**Active structure elements are the things that can perform behavior. Behavior elements describe what is done. Passive structure elements are the things on which behavior operates.**

Example:

```text
Application Component: Payment Orchestrator
→ performs / is assigned to
Application Function: Validate Payment
→ accesses
Data Object: Payment Transaction
→ realizes
Application Service: Payment Validation Service
```

How to say it:

**The Payment Orchestrator is the active structure element. It performs payment-validation behavior, accesses the Payment Transaction data object, and realizes the Payment Validation Service exposed to other applications.**

## 4. Explaining Service vs Interface

This is a frequent interview and certification topic.

**A service describes what is provided to a consumer. An interface describes the point of access through which the service is made available.**

Example:

**The Payment Initiation Service represents the functionality offered by the application. The Payment REST API is the interface through which channels access that service.**

Avoid:

*The API is the service because it is REST.*

Better:

**REST describes the access style. In the model, I separate the exposed behavior from the access point because they answer different architecture questions.**

## 5. Explaining Component vs Service

**The Application Component represents the logical software structure. The Application Service represents behavior that the component exposes to consumers.**

Example:

**Payment Orchestrator is the logical application component. Payment Orchestration Service is the behavior exposed by that component.**

## 6. Explaining Business Object, Data Object and Artifact

**A Business Object represents information meaningful to the business. A Data Object represents its logical application-level representation. An Artifact is a concrete deployable or stored representation at technology level.**

Example:

```text
Business Object: Payment Order
→ represented logically by
Data Object: Payment Transaction
→ persisted / serialized through concrete artifacts or storage structures where relevant
```

Professional explanation:

**I keep the business concept separate from the application data representation. This lets us change storage technology without changing the business meaning of the information.**

## 7. Explaining Node, Device, System Software and Facility

**A Node is an execution resource. A Device is physical IT hardware. System Software is platform or runtime software. A Facility is a physical site or building.**

Example:

**The production OpenShift cluster is modeled as a Node because it represents an execution environment. OpenShift itself is System Software. The physical worker server can be represented as a Device when hardware-level concerns matter. The datacenter hosting those devices is a Facility.**

## 8. Explaining the key relationships

### Assignment

**Assignment answers the question: who or what performs this behavior or carries this responsibility?**

Example: **The Fraud Analyst is assigned to the Fraud Review Process.**

### Realization

**Realization means that a more concrete element implements or gives effect to a more abstract one.**

Example: **The Payment Orchestration Function realizes the Payment Orchestration Service.**

### Serving

**Serving describes a provider-to-consumer relationship.**

Example: **The Payment Status Service serves the Mobile Banking Application.**

### Access

**Access shows that behavior reads, writes or otherwise uses passive structure.**

Example: **The Payment Validation Function reads the Payment Transaction data object.**

### Triggering

**Triggering expresses causal or temporal dependency between behaviors or events.**

Example: **Payment Authorized triggers Clearing Submission.**

### Flow

**Flow expresses the transfer of information, material or value.**

Example: **Payment details flow from the API layer to the orchestrator.**

### Influence

**Influence is mainly used to express an effect on Motivation elements.**

Example: **Operational Resilience Regulation influences the Resilient Payment Platform goal.**

## 9. Explaining Viewpoint vs View

**A Viewpoint is the template or set of conventions used to build a representation. A View is the actual representation produced for a given concern.**

Good interview sentence:

**I do not select a viewpoint because it is popular; I start from the stakeholder and concern, then choose or tailor the viewpoint that best supports the decision.**

## 10. Explaining cross-layer traceability

**Cross-layer traceability connects motivation and strategy to business behavior, applications, technology, physical infrastructure and transformation. The goal is to explain both how a requirement is implemented and what business impact a technical component has.**

Example downward:

```text
Driver: Instant Payment Regulation
→ Goal: Compliant Real-Time Payments
→ Requirement: Strong Authentication
→ Capability: Real-Time Payment Processing
→ Business Process: Execute Instant Payment
→ Application Service: Payment Orchestration
→ Application Component: Payment Orchestrator
→ Technology Service: Container Platform
→ System Software: OpenShift
```

How to explain it:

**This chain shows why the Payment Orchestrator exists and which strategic requirement it supports.**

Example upward:

```text
Kafka Cluster
→ Event Streaming Service
→ Payment Events
→ Notification / Reconciliation Components
→ Payment Processes
→ Customer and Operations Services
```

How to explain it:

**This reverse trace lets us assess the business impact of a Kafka outage.**

## 11. Explaining Baseline, Gap, Work Package and Plateau

**The baseline is the current architecture state. A gap identifies what is missing or inadequate relative to the target. A Work Package represents the transformation work required to address one or more gaps. A Plateau represents a relatively stable architecture state reached during the transformation.**

Example:

**The baseline relies on point-to-point integration. The target requires event-driven integration. The gap is the absence of a shared event backbone. The `Build Event Streaming Platform` work package closes that gap and enables the `Foundation Ready` plateau.**

## 12. Explaining an ArchiMate view in 90 seconds

**This view is designed for the Head of Payments. The main concern is how the target architecture supports resilient real-time payment processing. At the top, the business process `Execute Instant Payment` realizes the `Instant Payment Service`. At application level, the process is supported by the Payment Orchestrator, Fraud Engine, Limit Service and Clearing Adapter. The main asynchronous integration path uses the Event Streaming Service provided by Kafka. At technology level, the workloads run on OpenShift across two sites. The view deliberately excludes low-level network and storage details because they are not required for this stakeholder’s decision.**

## 13. Phrases for correcting a model politely

- **I think we are mixing two abstraction levels here.**
- **I would separate the service from the interface.**
- **This looks more like a capability than a process.**
- **I’m not sure Serving expresses the intended semantics here. Could this be Realization instead?**
- **The direction of the relationship seems reversed.**
- **This element is useful, but it may belong in a different view.**
- **We should avoid duplicating the same logical element in multiple views.**
- **I would keep the canonical element and reuse it across views.**
- **The diagram is technically correct, but it may not answer the stakeholder’s concern.**

## 14. Practitioner-style answer pattern

When explaining why one model is better than another:

**Option A is stronger because it preserves the distinction between structure, behavior and exposed service, while also keeping the relationship semantics explicit. Option B contains some valid elements, but it loses traceability between the application component and the service it provides. Option C mixes abstraction levels, and Option D uses an element type that does not match the concern.**