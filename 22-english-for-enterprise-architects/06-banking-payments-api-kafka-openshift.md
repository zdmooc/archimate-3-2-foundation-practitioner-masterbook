# 06 — Banking, Payments, API, Kafka & OpenShift English

## 1. Banking and payment vocabulary

| English | Français |
|---|---|
| payment initiation | initiation de paiement |
| payment instruction | instruction de paiement |
| payer | payeur / débiteur |
| payee | bénéficiaire / créditeur |
| debtor account | compte débiteur |
| creditor account | compte créditeur |
| clearing | compensation |
| settlement | règlement |
| clearing rail | réseau / rail de compensation |
| payment scheme | scheme / système de paiement |
| settlement account | compte de règlement |
| payment status | statut du paiement |
| rejection | rejet |
| recall | rappel de paiement |
| return | retour de fonds |
| reconciliation | réconciliation |
| duplicate payment | paiement en double |
| idempotency key | clé d’idempotence |
| fraud screening | contrôle fraude |
| sanctions screening | filtrage sanctions |
| beneficiary verification | vérification du bénéficiaire |
| transaction limit | limite de transaction |
| cut-off time | heure limite |
| liquidity | liquidité |
| posting | comptabilisation |
| ledger | grand livre / ledger |
| account balance | solde de compte |
| booking | écriture / comptabilisation |
| payment reference | référence de paiement |
| end-to-end identifier | identifiant bout en bout |

## 2. Describing an instant-payment flow

**The customer initiates a payment through a digital channel. The channel sends the request to the Payment API. The gateway authenticates the caller and forwards the request to the Payment Orchestrator. The orchestrator validates the instruction, checks fraud and limits, records the payment state and submits the transaction to the external clearing rail. Once a final status is received, the platform updates the internal state and publishes a payment-status event.**

## 3. Handling uncertain external status

Useful sentences:

- **The external rail did not return a definitive status.**
- **The payment therefore remains in an UNKNOWN state.**
- **We must reconcile before resubmitting.**
- **A blind retry could create a duplicate payment.**
- **The recovery action is explicit and idempotent.**
- **We distinguish technical timeout from business rejection.**
- **The authoritative status comes from the clearing rail.**

Complete explanation:

**If the clearing rail times out after receiving the instruction, the internal system cannot assume that the payment failed. We keep the payment in an UNKNOWN state and reconcile with the external rail. Only if the transaction is confirmed as not found can a controlled resubmission be considered. This protects against duplicate execution.**

## 4. API architecture vocabulary

| English phrase | Meaning |
|---|---|
| expose an endpoint | exposer un endpoint |
| consume an API | consommer une API |
| API contract | contrat API |
| backward compatibility | rétrocompatibilité |
| breaking change | changement cassant |
| rate limiting | limitation de débit |
| throttling | limitation / ralentissement contrôlé |
| request validation | validation de requête |
| schema validation | validation de schéma |
| token validation | validation de token |
| API versioning | versionnement API |
| consumer | consommateur |
| provider | fournisseur |
| northbound API | API exposée vers les consommateurs amont |
| southbound integration | intégration vers systèmes aval |

## 5. Explaining API Gateway responsibilities

**The API Gateway is the controlled entry point for external and channel APIs. It handles authentication integration, routing, throttling, policy enforcement and API lifecycle concerns. Business orchestration remains in application services rather than in gateway policies.**

Challenge question:

**Why is business logic implemented in the gateway? Could this create a deployment and ownership bottleneck?**

## 6. REST phrases

- **The endpoint is idempotent.**
- **The client sends a correlation identifier.**
- **The service returns an HTTP status and a business status.**
- **The API contract is versioned.**
- **The consumer must not depend on undocumented fields.**
- **Retries are allowed only for idempotent operations.**
- **The timeout is part of the integration contract.**

## 7. Kafka vocabulary

| English | Français |
|---|---|
| broker | broker |
| topic | topic |
| partition | partition |
| producer | producteur |
| consumer | consommateur |
| consumer group | groupe de consommateurs |
| offset | offset |
| consumer lag | retard consommateur |
| retention | rétention |
| replay | relecture |
| compaction | compaction |
| schema registry | registre de schémas |
| key | clé de partitionnement / message |
| ordering | ordre |
| at-least-once delivery | livraison au moins une fois |
| duplicate delivery | livraison en double |
| dead-letter topic | topic de rejet / DLQ selon design |

## 8. Explaining Kafka correctly

**Kafka is the event-streaming platform. It provides durable ordered logs divided into partitions. Producers publish records to topics and consumers read those records independently. The architecture must define event ownership, partitioning strategy, retention, schema evolution and consumer idempotency.**

Avoid saying:

*Kafka guarantees exactly once everywhere.*

Better:

**Exactly-once behavior depends on the end-to-end processing model. Even when Kafka provides transactional features, consumers and external side effects must still be designed carefully.**

## 9. Event vs message vs topic

**The event is the business- or application-relevant fact. The message or record is the representation transported by the messaging platform. The topic is the technical stream or channel through which records are distributed.**

Example:

```text
Event: Payment Settled
Payload / record: JSON/Avro representation of the event
Topic: payments.status.v1
Kafka: event-streaming system software
```

## 10. Event schema language

- **The event schema is versioned.**
- **Consumers should tolerate additive changes.**
- **Breaking schema changes require a compatibility strategy.**
- **The event owner is responsible for semantic stability.**
- **A schema registry validates compatibility rules.**
- **The event name should describe a fact that has already happened.**

## 11. Consumer design language

- **The consumer must be idempotent.**
- **The offset is committed after successful processing.**
- **Poison messages are isolated for investigation.**
- **Consumer lag is monitored as an operational indicator.**
- **Replay must not duplicate external side effects.**
- **The partition key determines ordering scope.**

## 12. OpenShift / Kubernetes vocabulary

| English | Français |
|---|---|
| cluster | cluster |
| control plane | plan de contrôle |
| worker node | nœud worker |
| namespace | namespace / espace logique |
| pod | pod |
| deployment | Deployment Kubernetes |
| stateful set | StatefulSet |
| service | Service Kubernetes |
| route / ingress | route / ingress |
| config map | ConfigMap |
| secret | Secret |
| persistent volume | volume persistant |
| storage class | classe de stockage |
| operator | opérateur |
| quota | quota |
| limit range | LimitRange |
| network policy | politique réseau |
| readiness probe | sonde de disponibilité |
| liveness probe | sonde de vie |
| horizontal pod autoscaler | autoscaling horizontal |
| node selector | sélecteur de nœud |
| affinity / anti-affinity | affinité / anti-affinité |
| taint / toleration | taint / tolération |

## 13. Explaining OpenShift architecture

**OpenShift provides the standardized container runtime for the application platform. Application teams deploy workloads into controlled namespaces. Resource quotas prevent one workload from consuming uncontrolled cluster capacity. Network policies restrict lateral communication. Operators manage platform components, while GitOps keeps deployment state versioned and reproducible.**

## 14. Explaining workload resilience

**A Deployment with multiple replicas improves resilience to pod failure, but only if replicas are spread across independent nodes or failure domains. Pod-level redundancy alone does not protect against cluster or site loss.**

## 15. Explaining stateful workloads

**Stateful workloads require additional architecture decisions around persistent storage, replication, backup, recovery and failover. Simply running a database in Kubernetes does not make it highly available.**

## 16. GitOps vocabulary

- **desired state** — état désiré
- **reconciliation loop** — boucle de réconciliation
- **source of truth** — source de vérité
- **drift** — dérive
- **pull-based deployment** — déploiement pull
- **promotion** — promotion entre environnements
- **rollback** — retour arrière
- **configuration repository** — dépôt de configuration

Explanation:

**With GitOps, Git stores the desired deployment state. The controller continuously compares the cluster with that desired state and reconciles drift. This improves traceability, repeatability and recovery, but repository permissions and promotion workflows become part of the control model.**

## 17. Payment observability language

- **end-to-end payment trace**
- **correlation ID**
- **business transaction ID**
- **payment completion rate**
- **authorization latency**
- **clearing response time**
- **UNKNOWN status rate**
- **reconciliation backlog**
- **consumer lag**
- **error budget**

Example:

**A technically healthy platform can still have a payment problem. We therefore monitor both infrastructure metrics and business-level indicators such as completion rate, UNKNOWN status volume and reconciliation backlog.**

## 18. Payment architecture review questions

1. **What is the system of record for payment state?**
2. **How is duplicate payment execution prevented?**
3. **What happens after a timeout from the clearing rail?**
4. **Which interactions are synchronous and why?**
5. **Which state changes are published as events?**
6. **How is event ordering scoped?**
7. **How are schema changes governed?**
8. **How is one payment traced end to end?**
9. **What is the RTO for payment initiation?**
10. **What is the RPO for payment state?**
11. **Can notification failure block payment settlement?**
12. **What is the fallback if fraud scoring is unavailable?**
13. **How are privileged operations audited?**
14. **What is the cutover strategy from the legacy payment engine?**
15. **When can the legacy platform be decommissioned?**

## 19. Complete interview answer — payment platform

**A modern payment architecture should separate channel exposure, payment orchestration, domain controls and external rail integration. I would expose a stable API contract through API Management, keep orchestration in a dedicated application component, isolate fraud and limits behind services, persist payment state in an authoritative store, and publish business-relevant state changes through an event platform. The design must explicitly handle idempotency and UNKNOWN external status. On OpenShift, I would distribute stateless workloads across failure domains, externalize configuration and secrets, use GitOps for deployment, and connect technical observability to business payment indicators.**