# MayaBank — Motivation, Strategy et traçabilité

Cette fiche relie les raisons du changement aux capacités à développer. Elle évite un anti-pattern fréquent : commencer directement par OpenShift, Kafka ou des microservices sans démontrer pourquoi ces choix existent.

## 1. Motivation chain

```text
Driver: 24/7 Instant Payments
→ Assessment: legacy platform lacks elastic real-time processing
→ Goal: resilient real-time payment processing
→ Outcome: higher payment success rate and lower MTTR
→ Principle: Observable by Default
→ Requirement: end-to-end correlation ID
```

Autres chaînes :

```text
Driver: Cyber Risk
→ Assessment: static secret usage remains too high
→ Goal: reduce credential exposure
→ Requirement: externalize application secrets
→ Constraint: no production secret stored in source repositories
```

```text
Driver: Legacy Cost
→ Assessment: duplicated platforms remain active during migration
→ Goal: simplify estate
→ Outcome: legacy payment platform retired
→ Requirement: each migration wave defines a decommission exit criterion
```

## 2. Capability map

### Payments
- Payment Initiation
- Payment Validation
- Real-Time Payment Processing
- Fraud Detection
- Clearing Integration
- Settlement Reconciliation
- Exception Management
- Payment Tracking
- Partner Onboarding
- Transaction Observability

### Platform Engineering
- Cloud-Native Application Delivery
- GitOps Delivery
- Resilience Engineering
- Observability Engineering
- Disaster Recovery
- Secrets Management
- Event Streaming Platform Engineering

### Security
- Identity Federation
- Strong Authentication
- Service-to-Service Trust
- Key and Secret Lifecycle Management
- Security Monitoring

## 3. Baseline maturity

Exemple d’échelle pédagogique 1–5 :

| Capability | Baseline | Target |
|---|---:|---:|
| Real-Time Payment Processing | 2 | 5 |
| Fraud Detection | 3 | 5 |
| Transaction Observability | 1 | 4 |
| Partner Onboarding | 2 | 4 |
| Resilience Engineering | 2 | 5 |
| GitOps Delivery | 1 | 4 |
| Disaster Recovery | 3 | 5 |

La maturité est une propriété d’analyse, pas une notation ArchiMate supplémentaire.

## 4. Value Stream

```text
Initiate
→ Validate
→ Assess Risk
→ Execute
→ Confirm
→ Resolve
```

Mapping de capabilities :

| Value Stream Stage | Capabilities dominantes |
|---|---|
| Initiate | Payment Initiation, Partner Onboarding |
| Validate | Payment Validation |
| Assess Risk | Fraud Detection |
| Execute | Real-Time Payment Processing, Clearing Integration |
| Confirm | Payment Tracking, Transaction Observability |
| Resolve | Exception Management, Settlement Reconciliation |

## 5. Courses of Action

- Modernize Payments Incrementally
- Adopt API-First Integration
- Adopt Event-Driven Integration Where Appropriate
- Build a Reusable Platform Engineering Foundation
- Make Observability a Default Requirement
- Decommission Legacy by Migration Wave

## 6. Course of Action → Work Package

Le modèle distingue clairement stratégie et exécution :

```text
Course of Action: Adopt Event-Driven Integration
→ Work Package: Establish Kafka Platform
→ Work Package: Migrate Payment Status Events
→ Work Package: Migrate Fraud Events
```

```text
Course of Action: Modernize Payments Incrementally
→ Work Package: Build Payment Orchestrator
→ Work Package: Migrate Retail Payments Wave 1
→ Work Package: Migrate Corporate Payments Wave 2
```

## 7. Goal → Requirement → Architecture

Exemple :

```text
Goal: Improve Availability
→ Requirement: tolerate single worker failure
→ Application Component: Payment Orchestrator
→ Technology Service: Container Execution
→ System Software: OpenShift
```

Exemple observabilité :

```text
Goal: Reduce MTTR
→ Requirement: correlate payment across all hops
→ Data Object: Correlation Context
→ Application Components: Orchestrator, Fraud Engine, Clearing Adapter
→ Technology Service: Distributed Observability
```

## 8. Goal → Capability → Business → Application

```text
Goal: Real-Time Payment Processing
→ Capability: Real-Time Payment Processing
→ Business Process: Execute Instant Payment
→ Business Service: Instant Payment Service
→ Application Service: Payment Orchestration Service
→ Application Component: Payment Orchestrator
```

## 9. Capability → supporting resources

Exemples de Resources :

- Payment Engineering Skills
- Fraud Expertise
- Payment Data
- Partner Network
- Platform Engineering Team
- Operational Knowledge
- Compute Capacity

Une capability ne doit pas être réduite à un outil.

Mauvais :

```text
Capability: Kafka
```

Meilleur :

```text
Capability: Event Streaming Platform Engineering
Resource: Platform Engineering Skills
Technology: Kafka
```

## 10. Priorisation

Une capability peut être priorisée en combinant :

- valeur métier ;
- criticité ;
- gap de maturité ;
- risque ;
- dépendances ;
- coût de retard.

Exemple : Transaction Observability peut être prioritaire même si elle n’est pas directement visible par le client, car elle conditionne disponibilité et MTTR.

## 11. Traçabilité minimale attendue

Tout grand Work Package doit pouvoir répondre :

1. quel Driver ou Goal le justifie ?
2. quelle Capability il améliore ?
3. quelle architecture il change ?
4. quel Gap il réduit ?
5. quel Plateau il contribue à atteindre ?

## 12. Anti-patterns

### Technology-first justification

```text
"Nous voulons Kafka donc nous créons un programme Kafka."
```

Insuffisant.

### Capability = application

```text
Capability: Payment Orchestrator
```

Faux niveau d’abstraction.

### Requirement sans Goal

Une exigence peut exister seule, mais pour un programme stratégique il est préférable de conserver sa motivation lorsque celle-ci est connue.

## 13. Test de cohérence

Pour chaque élément Strategy, demander :

- est-ce une aptitude ou un composant ?
- est-ce une direction ou un chantier ?
- est-ce une ressource ou une capability ?
- peut-on remonter jusqu’à un Driver/Goal ?
- peut-on descendre jusqu’à un changement d’architecture concret ?

> **La Strategy Layer donne le pont entre la motivation et l’architecture opérationnelle.**