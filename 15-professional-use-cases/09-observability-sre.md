# Use case 9 — Observability / SRE

## 1. Contexte

MayaBank veut passer d'une supervision technique fragmentée à une observabilité end-to-end capable de relier incidents techniques, services applicatifs, processus métier et objectifs de disponibilité.

## 2. Motivation

Drivers :

- production incidents ;
- long MTTR ;
- fragmented monitoring ;
- microservices complexity ;
- 24x7 payment obligations.

Goals :

- reduce detection time ;
- reduce MTTR ;
- measure service reliability ;
- make dependencies visible ;
- support SLO-based operations.

Requirements :

- metrics ;
- logs ;
- traces ;
- correlation IDs ;
- alerting ;
- retention ;
- dashboards ;
- synthetic monitoring ;
- business KPIs ;
- SLO/error-budget reporting.

## 3. Capabilities

- Service Monitoring
- Distributed Tracing
- Log Analytics
- Incident Detection
- Reliability Engineering
- Service Level Management
- Dependency Analysis

## 4. SRE concepts and ArchiMate

SLO, SLI and error budget are not ArchiMate element types.

They can be represented as :

- properties/metrics ;
- Requirements / Outcomes when architecturally significant ;
- constraints on services/processes.

Example :

```text
Goal: Improve Payment Reliability
Outcome: 99.99% successful payment processing
Requirement: Payment Status Service availability ≥ target SLO
```

## 5. Application / Technology

Technology Services :

- Metrics Service
- Log Aggregation Service
- Trace Service
- Alerting Service

System Software : monitoring platform, log engine, tracing backend, collectors/agents.

Application components expose telemetry but are not themselves observability services unless that is their application responsibility.

## 6. End-to-end traceability

```text
Business Service: Instant Payment Service
→ Business Process: Execute Instant Payment
→ Application Services
→ Application Components
→ Technology Services
→ Nodes / Platforms
```

Telemetry attaches to this chain through properties, services and views.

## 7. Incident impact pattern

```text
Technology Event: Kafka Cluster Degraded
→ impacts Technology Service: Event Streaming Service
→ impacts Application Components
→ impacts Application Services
→ impacts Business Processes
→ impacts Business Service / Capability
```

This is more useful to executives than a red broker icon alone.

## 8. Baseline / Target

Baseline : tool-by-tool monitoring, no distributed traces, alert floods, weak service ownership.

Target : centralized telemetry, SLOs, trace correlation, service ownership, dependency mapping, business impact dashboards.

## 9. Gaps / Work Packages

Gaps : missing telemetry standard, no SLO catalog, inconsistent labels, no service mapping, weak on-call ownership.

Work Packages :

1. Define observability standard
2. Establish telemetry platform
3. Instrument priority services
4. Establish SLO catalog
5. Build service dependency map
6. Implement business-impact dashboards
7. Improve alert policies
8. Industrialize incident reviews

## 10. Views

- Application Cooperation
- Technology Usage
- Layered
- Incident Impact
- Capability / Outcome view
- Operations custom view

## 11. Anti-patterns

- Observability = dashboard only.
- SLO = Technology Service.
- Monitoring tool shown without monitored consumers/services.
- Every metric represented as a separate ArchiMate element.

## 12. Interview questions

1. How do you model observability in ArchiMate?
2. Where do SLOs belong?
3. How do you show business impact from a technical incident?
4. How do you model logs/metrics/traces platforms?
5. How do you represent service ownership?

## 13. Practitioner case

Operations asks which customer-facing services can be affected by a PostgreSQL outage. Build a reverse dependency view from database technology service through application components and services to business processes and business services.
