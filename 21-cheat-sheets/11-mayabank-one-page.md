# Cheat Sheet 11 — MayaBank en une page

## Motivation

```text
Drivers
- Instant Payment Regulation
- Customer real-time expectations
- Operational resilience
- Legacy obsolescence
- Sustainability pressure

Assessments
- legacy latency too high
- point-to-point integrations
- weak end-to-end observability
- manual deployment
- insufficient DR automation

Goals
- compliant real-time payments
- resilient platform
- faster delivery
- end-to-end traceability
- lower avoidable footprint

Requirements
- strong authentication
- RTO/RPO targets
- observability
- data residency
- event schema governance
```

## Strategy

```text
Capabilities
- Real-Time Payment Processing
- Fraud Detection
- Payment Observability
- Platform Engineering
- Resilience Management

Value Stream
Receive → Validate → Authorize → Execute → Confirm

Courses of Action
- API-first
- Event-driven integration
- Platform engineering
- Automated observability
- Progressive legacy exit
```

## Business

```text
Actors / Roles
MayaBank
Payments Department
Payment Operator
Fraud Analyst
Settlement Manager

Processes
Initiate Payment
Validate Payment
Fraud Control
Execute Payment
Handle Exception
Notify Customer

Services
Instant Payment Service
Payment Status Service

Objects
Payment Order
Fraud Decision
Settlement Instruction
```

## Application

```text
Payment API Gateway
→ Payment Orchestrator
→ Fraud Engine
→ Limit Management
→ Ledger Adapter
→ Clearing Adapter
→ Notification Service

Application Services
Payment Initiation
Payment Orchestration
Fraud Scoring
Payment Status
Notification

Events
Payment Received
Payment Validated
Payment Authorized
Payment Rejected
Payment Settled

Data Objects
Payment Transaction
Payment Status
Fraud Score
Event Envelope
```

## Technology

```text
OpenShift          = System Software
Production Cluster = Node
Kafka              = System Software
Event Streaming    = Technology Service
API Management     = platform/service selon concern
OIDC / IAM         = identity platform/services
PostgreSQL/Oracle  = System Software
DB Service         = Technology Service
Observability      = Technology Service + supporting software
GitOps             = delivery/platform pattern
OCI Images         = Artifacts
```

## Physical

```text
Facilities
- DC East
- DC West

Devices
- worker servers
- database servers
- HSM / network appliances where relevant

Equipment
- UPS
- generator
- cooling equipment

Distribution Networks
- power distribution
- cooling distribution
```

## Migration

```text
G1 No Standard API
G2 No Event Backbone
G3 Point-to-Point
G4 Manual Deployment
G5 Weak E2E Observability
G6 Legacy DB Coupling
G7 Insufficient DR Automation

WP1 OpenShift Foundation
WP2 API Management
WP3 Event Streaming
WP4 Payment Orchestrator
WP5 Observability
WP6 Data Migration
WP7 Instant Payment Wave 1
WP8 Remaining Flows
WP9 Decommission Legacy

P0 Legacy
→ P1 Foundations Ready
→ P2 Hybrid Payments
→ P3 Target Core Active
→ P4 Target
```

## Deux chaînes à savoir expliquer

### Strategy → runtime

```text
Driver: Instant Payment Regulation
→ Goal: Compliant Real-Time Payments
→ Requirement: strong auth / latency / availability
→ Capability: Real-Time Payment Processing
→ Business Process: Execute Instant Payment
→ Application Service: Payment Orchestration
→ Application Component: Payment Orchestrator
→ Technology Service: Container Platform
→ System Software: OpenShift
→ Node: Production Cluster
→ Facilities: DC East / DC West
```

### Gap → transformation

```text
Assessment: legacy cannot meet target
→ Gap: No Event Backbone
→ Course of Action: Adopt Event-Driven Integration
→ Work Package: Build Event Streaming
→ Deliverable: Production Event Platform
→ Implementation Event: Event Platform Ready
→ Plateau: Foundations Ready
```

## Incident impact

```text
DC East outage
→ Devices/Nodes unavailable
→ OpenShift/Kafka/DB services impacted
→ Payment Orchestrator/Fraud/Status dependencies impacted
→ Instant Payment Business Service degraded
→ resilience requirement / recovery work activated
```

## Green IT impact

```text
Right-size / consolidate
→ migrate workloads
→ validate target capacity
→ stop legacy workload
→ decommission or release physical capacity
→ measure kWh / CO2e / utilization outcome
```

## Présentation entretien en 60 secondes

> MayaBank modernise une plateforme de paiements legacy vers une architecture API-first et event-driven. Je pars des drivers réglementaires, de résilience et de time-to-market, je les traduis en goals/requirements et capabilities, puis je trace les services métier jusqu’aux composants applicatifs — orchestrateur, fraude, ledger, clearing — et jusqu’aux services de plateforme OpenShift, Kafka, IAM, base de données et observabilité. La migration est structurée par gaps, work packages et plateaus, avec coexistence hybride et sortie explicite du legacy. Les vues CISO, Ops et Green IT dérivent du même référentiel canonique pour analyser sécurité, incidents, DR et impact environnemental.