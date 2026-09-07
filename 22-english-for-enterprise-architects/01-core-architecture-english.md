# 01 — Core Architecture English

## 1. Verbs architects use every day

| English | Français | Example |
|---|---|---|
| support | supporter / prendre en charge | The platform supports instant payments. |
| expose | exposer | The API exposes the payment initiation service. |
| consume | consommer | The mobile channel consumes the payment service. |
| realize | réaliser / concrétiser | The application service is realized by the Payment Orchestrator. |
| depend on | dépendre de | The settlement flow depends on the clearing adapter. |
| trigger | déclencher | A payment request triggers the validation process. |
| route | router | The gateway routes requests to the appropriate backend. |
| orchestrate | orchestrer | The component orchestrates validation, fraud checks and clearing. |
| persist | persister | The service persists the payment state before publishing an event. |
| replicate | répliquer | The database replicates data to the secondary site. |
| fail over | basculer | The service can fail over to the secondary site. |
| recover | reprendre / restaurer | The platform must recover within fifteen minutes. |
| scale | monter en charge | The workload scales horizontally. |
| isolate | isoler | Namespaces isolate workloads and access rights. |
| enforce | imposer / faire respecter | The gateway enforces authentication and rate limits. |
| monitor | surveiller | The observability stack monitors latency and error rates. |
| trace | tracer | We trace a payment across all services. |
| mitigate | atténuer | We mitigate this risk through redundancy. |
| decommission | décommissionner | The legacy platform will be decommissioned after migration. |
| consolidate | consolider | We consolidate workloads on the target platform. |
| provision | provisionner | Infrastructure is provisioned through IaC. |
| deploy | déployer | Applications are deployed through GitOps. |
| validate | valider | The service validates the payment before execution. |
| reconcile | réconcilier | The process reconciles internal and external payment status. |
| retry | réessayer | The adapter retries transient failures. |
| throttle | limiter le débit | The API gateway throttles excessive requests. |

## 2. Nouns used in architecture discussions

| English | Français |
|---|---|
| requirement | exigence |
| constraint | contrainte |
| assumption | hypothèse |
| dependency | dépendance |
| bottleneck | goulot d’étranglement |
| single point of failure | point unique de défaillance |
| failure mode | mode de défaillance |
| fallback | solution de repli |
| workaround | contournement |
| throughput | débit |
| latency | latence |
| availability | disponibilité |
| durability | durabilité des données |
| scalability | scalabilité |
| maintainability | maintenabilité |
| operability | exploitabilité |
| observability | observabilité |
| traceability | traçabilité |
| ownership | responsabilité / ownership |
| boundary | frontière |
| trust boundary | frontière de confiance |
| blast radius | périmètre d’impact |
| target state | état cible |
| baseline | état initial |
| transition state | état de transition |
| roadmap | feuille de route |
| trade-off | compromis |
| rationale | justification |
| design decision | décision de conception |
| architectural debt | dette d’architecture |
| technical debt | dette technique |
| cutover | bascule |
| rollback | retour arrière |
| failover | bascule de secours |
| recovery | reprise |

## 3. Adjectives that make explanations precise

- **synchronous / asynchronous** — synchrone / asynchrone
- **stateful / stateless** — avec état / sans état
- **loosely coupled / tightly coupled** — faiblement / fortement couplé
- **resilient** — résilient
- **redundant** — redondant
- **idempotent** — idempotent
- **scalable** — scalable
- **observable** — observable
- **compliant** — conforme
- **portable** — portable
- **reusable** — réutilisable
- **maintainable** — maintenable
- **decoupled** — découplé
- **event-driven** — piloté par événements
- **cloud-native** — cloud-native
- **multi-site** — multi-site
- **highly available** — hautement disponible

## 4. The most useful sentence patterns

### Describing responsibility

- **This component is responsible for payment orchestration.**
- **The gateway is responsible for authentication, routing and throttling.**
- **Kafka provides the event-streaming capability at the technology level.**
- **The fraud engine evaluates the transaction before settlement.**

### Describing dependencies

- **The payment flow depends on the fraud service and the clearing adapter.**
- **The application depends on the database for durable state.**
- **The service relies on the identity provider for token validation.**
- **The secondary site is independent from the primary power domain.**

### Describing sequence

- **First, the request is authenticated. Then it is validated. Finally, it is submitted to the clearing rail.**
- **Before publishing the event, the service persists the new payment state.**
- **Once the payment is settled, the notification service informs the customer.**
- **If the external status is unknown, the reconciliation process checks the rail before any resubmission.**

### Describing cause and impact

- **Because the database is shared by several services, its failure has a large blast radius.**
- **If Kafka is unavailable, asynchronous notifications are delayed but payment authorization can remain available depending on the design.**
- **This dependency increases operational risk.**
- **Removing this single point of failure improves resilience.**

## 5. False friends and common French mistakes

### “Actually”
**Actually** = en fait, réellement.  
“Actuellement” = **currently**.

Wrong: *Actually we use OpenShift 4.x.*  
Better: **Currently, we use OpenShift for container workloads.**

### “Eventually”
**Eventually** = finalement / à terme, pas “éventuellement”.  
“Éventuellement” = **possibly / if necessary**.

### “Demand”
Pour une exigence projet, préférer **requirement**, pas *demand*.

### “Information”
Uncountable: **information**, jamais *informations*.

### “Advice”
Uncountable: **advice**, pas *advices*.

### “Architecture”
On dit **the architecture**, pas *the architecture schema*. Pour “schéma”, utiliser **diagram** ou **view**.

### “Explain me”
Wrong: *Can you explain me this architecture?*  
Correct: **Can you explain this architecture to me?**

### “Depend of”
Wrong: *depends of*.  
Correct: **depends on**.

### “Responsible of”
Wrong: *responsible of*.  
Correct: **responsible for**.

### “According to me”
Grammatical mais maladroit pour donner son opinion.  
Prefer: **In my view**, **From an architecture perspective**, **My assessment is that...**

## 6. Professional connectors

Use simple connectors rather than long sentences:

- **First / then / finally** — premièrement / ensuite / enfin
- **However** — cependant
- **Therefore** — donc / par conséquent
- **In addition** — de plus
- **For example** — par exemple
- **In contrast** — en revanche
- **As a result** — en conséquence
- **From a security perspective** — du point de vue sécurité
- **From an operational perspective** — du point de vue exploitation
- **At application level** — au niveau applicatif
- **At technology level** — au niveau technologique
- **In the target state** — dans l’état cible
- **During the transition** — pendant la transition

## 7. Mini architecture description

### French idea
La plateforme expose une API de paiement. La gateway authentifie le client, l’orchestrateur valide le paiement, le moteur de fraude calcule le score, puis l’adapter envoie l’ordre au réseau de clearing. Les événements sont publiés dans Kafka. Le tout tourne sur OpenShift sur deux sites.

### Professional English
**The platform exposes a payment API. The API gateway authenticates the client and routes the request to the Payment Orchestrator. The orchestrator validates the payment and invokes the fraud engine. If the transaction is authorized, the clearing adapter submits the instruction to the external clearing rail. Business-relevant state changes are published as events through Kafka. The application runs on OpenShift across two sites to meet availability and recovery requirements.**

## 8. Architecture verbs by layer

### Business
- performs a process
- provides a business service
- owns a capability
- handles an exception
- approves a transaction

### Application
- realizes a service
- exposes an interface
- consumes an API
- publishes an event
- persists a state
- validates a request

### Technology
- hosts a workload
- provides runtime services
- replicates data
- routes traffic
- enforces network policy

### Migration
- closes a gap
- delivers a capability
- moves a workload
- enables a transition state
- decommissions a legacy component

## 9. The 20 phrases to know by heart

1. **The purpose of this component is to...**
2. **This service is exposed through...**
3. **This component consumes...**
4. **The main dependency is...**
5. **The main constraint is...**
6. **The design assumes that...**
7. **The current architecture does not meet...**
8. **The target architecture addresses this by...**
9. **The main trade-off is...**
10. **The main failure mode is...**
11. **The impact is limited to...**
12. **The blast radius includes...**
13. **The service can fail over to...**
14. **The data is replicated between...**
15. **The recovery objective is...**
16. **The migration is split into...**
17. **This work package removes...**
18. **The decision is driven by...**
19. **We considered two alternatives...**
20. **I would recommend this option because...**