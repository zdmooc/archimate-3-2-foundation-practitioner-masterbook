# Use case 7 — Fraud & Risk

## 1. Contexte

MayaBank veut détecter la fraude en temps réel sans dégrader excessivement l'expérience client, tout en conservant explicabilité, traçabilité, gouvernance des règles et traitement manuel des cas complexes.

## 2. Motivation

Drivers :

- fraud losses ;
- instant payment irreversibility ;
- regulatory scrutiny ;
- customer friction ;
- model risk.

Goals :

- reduce fraud losses ;
- reduce false positives ;
- make a decision within payment latency budget ;
- retain auditable evidence ;
- support human investigation.

Requirements :

- real-time scoring ;
- rule/model version traceability ;
- explainable decision data ;
- case management ;
- access controls ;
- retention ;
- fallback behavior if fraud platform is degraded.

## 3. Capabilities

- Fraud Detection
- Risk Scoring
- Rules Management
- Model Management
- Case Investigation
- Alert Prioritization
- Fraud Analytics

## 4. Business

Roles : Fraud Analyst, Fraud Manager, Payment Operator.

Processes :

```text
Assess Payment Risk
→ Decide Fraud Action
→ Approve / Reject / Challenge
→ Investigate Suspicious Case
→ Close Fraud Case
```

Business objects : Fraud Case, Fraud Decision, Risk Policy, Investigation Evidence.

## 5. Application

Components :

- Fraud Decision Engine
- Rules Engine
- Feature Service
- Case Management Application
- Fraud Analytics Application
- Payment Orchestrator

Application services : Fraud Scoring Service, Fraud Decision Service, Case Management Service.

## 6. Event-driven

Events :

- Payment Risk Assessment Requested
- Fraud Decision Available
- Suspicious Payment Detected
- Fraud Case Opened
- Fraud Case Closed

Payloads remain Data Objects; Kafka/topic remains transport technology.

## 7. Data

Data Objects :

- Payment Features
- Customer Risk Profile
- Fraud Score
- Decision Explanation
- Fraud Case Data

Business Objects :

- Risk Policy
- Fraud Case
- Payment Order

## 8. Technology

Technology services :

- Real-Time Compute Service
- Feature Storage Service
- Event Streaming Service
- Model Serving Service
- Audit Logging Service

System Software may include streaming platform, feature store, model serving runtime, database and observability stack.

## 9. AI/ML distinction

A fraud model is not a Capability by default.

```text
Capability: Fraud Detection
Application Component: Fraud Decision Engine
Artifact: Fraud Model Version 42
Technology Service: Model Serving Service
```

## 10. Resilience and degraded mode

Architectural questions :

- block payments if fraud service is unavailable ?
- fallback to rules ?
- queue and replay ?
- use last-known risk profile ?
- route to manual review ?

These decisions should be represented through requirements, application behavior and transition/operational views.

## 11. Baseline vs Target

Baseline : batch fraud controls, isolated rules, manual case creation, fragmented data.

Target : real-time scoring, event integration, shared features, governed models/rules, case workflow, full traceability.

## 12. Gaps / Work Packages

Gaps : missing real-time data, fragmented decisioning, limited model governance, no standard fallback.

Work Packages :

1. Establish fraud data foundation
2. Build real-time decision service
3. Integrate event streaming
4. Implement feature service
5. Modernize case management
6. Establish model/rule governance
7. Implement fallback pattern
8. Migrate flows

## 13. Views

- Motivation
- Capability
- Business Process
- Application Cooperation
- Information Structure
- Layered
- Security
- Incident Impact

## 14. Anti-patterns

- Fraud model = Capability.
- Score = Business Event.
- Rules engine and Fraud Decision Service treated as synonyms.
- No representation of degraded-mode business impact.

## 15. Interview questions

1. How do you model an ML fraud model?
2. How do you trace a fraud decision back to a payment process?
3. How do you represent explainability/audit requirements?
4. How do you model degraded mode?
5. How do you separate capability, application and model artifact?

## 16. Practitioner case

The Risk Officer asks why an outage of the Feature Storage Service can stop instant payments. Build a Layered impact chain from Technology Service → Fraud Application → Fraud Service → Payment Process → Instant Payment Service.
