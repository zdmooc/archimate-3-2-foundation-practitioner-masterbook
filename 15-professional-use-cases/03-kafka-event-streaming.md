# Use case 3 — Kafka / Event Streaming

## 1. Contexte

MayaBank veut remplacer une partie des intégrations point-à-point par une architecture événementielle pour les paiements, la fraude, la notification, la conformité et la synchronisation de statuts.

## 2. Le piège principal

Kafka n'est pas l'événement métier.

```text
Business Event: Payment Rejected
Application Event: Payment Rejection Registered
Data Object: Payment Rejection Event Payload
Technology Service: Event Streaming Service
System Software: Kafka
Artifact: Avro/JSON schema
```

Un topic comme `payments.rejected.v1` est un mécanisme technique de transport/organisation, pas automatiquement un `Application Event`.

## 3. Motivation

Drivers :

- decoupling ;
- real-time propagation ;
- scalability ;
- resilience ;
- auditability ;
- integration simplification.

Goals :

- reduce synchronous coupling ;
- propagate business facts quickly ;
- improve recoverability ;
- standardize event contracts.

Requirements :

- schema governance ;
- replayability where appropriate ;
- idempotent consumers ;
- ordering guarantees defined per domain ;
- encryption ;
- ACLs ;
- observability ;
- retention policy.

## 4. Capabilities

- Event Publishing
- Event Consumption
- Event Contract Management
- Stream Processing
- Event Replay
- Event Observability

## 5. Application model

```text
Payment Orchestrator
  emits → Application Event: Payment Execution Completed

Fraud Application
  consumes event through an event-driven interaction

Notification Application
  consumes payment status events
```

The application components should not be connected merely because they share a topic. The model should express the architectural concern : event production/consumption, service dependency, or flow.

## 6. Data and schema

```text
Business Object: Payment Order
Data Object: Payment Event Payload
Artifact: payment-event.avsc
```

Schema Registry can be modeled as a technology platform/system software or through the service it provides, depending on the concern.

## 7. Technology model

```text
Technology Service: Event Streaming Service
  served by / realized through
System Software: Kafka

Technology Service: Schema Management Service
System Software: Schema Registry

Node: Kafka Broker Node
Artifact: topic/configuration/schema artifacts
```

## 8. Producer / consumer

Do not confuse :

- producer application component ;
- application event ;
- event payload ;
- topic ;
- broker ;
- consumer component.

A useful pedagogical chain is :

```text
Application Component
→ emits Application Event
→ payload represented by Data Object
→ transported through Event Streaming Service
→ consumed by Application Component
```

## 9. Stream processing

If MayaBank uses stream processing for fraud or telemetry :

- streaming engine product → System Software ;
- stream processing capability exposed → Technology Service ;
- business/app logic → Application Function/Process ;
- generated result → Application Event / Data Object.

## 10. Resilience

Concerns :

- replication factor ;
- quorum ;
- partition leader loss ;
- broker failure ;
- cross-site replication ;
- consumer lag ;
- poison messages ;
- retry / DLQ ;
- schema incompatibility.

ArchiMate is useful to show **what depends on the Event Streaming Service** and therefore what can be impacted by its failure.

## 11. Baseline

- point-to-point synchronous interfaces ;
- duplicate integration logic ;
- fragile batch synchronization ;
- hidden coupling.

## 12. Target

- event backbone ;
- governed event catalog ;
- explicit event owners ;
- contract evolution ;
- observable producer/consumer chains ;
- multi-site resilience.

## 13. Gaps

- no event taxonomy ;
- no schema governance ;
- no standardized security model ;
- no replay policy ;
- no consumer ownership model ;
- weak monitoring.

## 14. Work Packages

1. Define event governance
2. Build Kafka platform
3. Establish schema management
4. Establish security/ACLs
5. Migrate payment status events
6. Migrate fraud events
7. Add observability
8. Validate DR/replay

## 15. Views

- Application Cooperation
- Information Structure
- Technology
- Technology Usage
- Layered
- Incident Impact
- Migration

## 16. Anti-patterns

### Kafka topic = Application Event

Incorrect in most architecture concerns. Topic and event are different concepts.

### Event payload = Business Event

Incorrect. Payload is information describing the event.

### Kafka = Application Component by default

Incorrect. Kafka is commonly platform technology. Use System Software / Technology Service according to the concern.

## 17. Interview questions

1. How do you model Kafka in ArchiMate?
2. What is the difference between event, topic and payload?
3. How do you show producer/consumer dependencies?
4. How do you model replay and DR concerns?
5. How do you prevent a Kafka architecture diagram from becoming only a technical topology?

## 18. Practitioner case

The CIO asks which business capabilities would be affected if the Event Streaming Service is unavailable.

The correct response is a **cross-layer impact view** :

```text
Technology Service
→ Application Components
→ Application Services
→ Business Processes
→ Capabilities
```

not a broker topology alone.
