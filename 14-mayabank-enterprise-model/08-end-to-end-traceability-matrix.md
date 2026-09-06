# MayaBank — End-to-End Traceability Matrix

Cette fiche fournit une matrice de traçabilité qui relie les préoccupations stratégiques aux éléments métier, applicatifs, technologiques et de transformation.

## 1. Pourquoi une matrice

Une architecture peut sembler cohérente dans chaque couche tout en restant incohérente globalement.

Exemple :

- un Requirement existe mais aucun composant ne le satisfait ;
- un Application Component existe mais aucun Business Process ne le consomme ;
- un Technology Service existe mais aucune application n’en dépend ;
- un Work Package existe mais ne réduit aucun Gap ;
- un Plateau cible existe mais aucun Deliverable ne permet de l’atteindre.

La matrice sert à détecter ces ruptures.

## 2. Trace 1 — Résilience

| Niveau | Élément |
|---|---|
| Driver | 24/7 Instant Payments |
| Goal | Resilient Real-Time Payments |
| Requirement | tolerate single-worker failure |
| Capability | Resilience Engineering |
| Business Service | Instant Payment Service |
| Application Component | Payment Orchestrator |
| Technology Service | Container Execution Service |
| System Software | OpenShift |
| Physical | multi-device / multi-site infrastructure |
| Gap | insufficient resilience |
| Work Package | Build Resilient OpenShift Foundation |
| Plateau | Target Stable Payments |

## 3. Trace 2 — Observability

| Niveau | Élément |
|---|---|
| Driver | Operational Risk |
| Goal | Reduce MTTR |
| Requirement | end-to-end correlation ID |
| Capability | Transaction Observability |
| Business Process | Execute Instant Payment |
| Application | Gateway, Orchestrator, Fraud, Clearing |
| Technology Service | Distributed Observability Service |
| Deliverable | validated tracing and dashboards |
| Outcome | reduced incident diagnosis time |

## 4. Trace 3 — Cyber / secrets

| Niveau | Élément |
|---|---|
| Driver | Cyber Risk |
| Assessment | static secret exposure |
| Goal | Reduce Credential Exposure |
| Requirement | externalize workload secrets |
| Capability | Key and Secret Lifecycle Management |
| Application Consumers | Payment Orchestrator, Fraud Engine, Clearing Adapter |
| Technology Service | Secrets Management Service |
| Work Package | Establish IAM and Secrets Foundation |
| Outcome | lower static-secret footprint |

## 5. Trace 4 — Event-driven decoupling

| Niveau | Élément |
|---|---|
| Driver | Time-to-Market |
| Goal | Reduce Integration Coupling |
| Course of Action | Event-Driven Where Appropriate |
| Capability | Event Streaming Platform Engineering |
| Application Event | Payment Authorized |
| Data Object | PaymentAuthorizedEvent payload |
| Technology Service | Event Streaming Service |
| System Software | Kafka |
| Work Package | Establish Event Streaming Platform |
| Gap | No standard event backbone |

## 6. Trace 5 — Green IT

| Niveau | Élément |
|---|---|
| Driver | Estate Cost / Sustainability |
| Assessment | low utilization and duplicated platforms |
| Goal | Simplify and reduce footprint |
| Course of Action | Consolidate Platforms |
| Work Package | Migrate Legacy Payments |
| Implementation Event | Legacy Traffic Reaches Zero |
| Work Package | Decommission Legacy Payment Platform |
| Physical Effect | devices released/retired/avoided |
| Outcome | lower infrastructure footprint |

## 7. Trace 6 — Fraud

```text
Driver: Fraud Risk
→ Goal: Improve Fraud Prevention
→ Capability: Fraud Detection
→ Business Process: Assess Fraud Risk
→ Application Service: Fraud Scoring Service
→ Application Component: Fraud Engine
→ Data Object: Fraud Decision
→ Technology Services: compute + database + observability
```

## 8. Trace 7 — Payment tracking

```text
Goal: Improve Customer Transparency
→ Capability: Payment Tracking
→ Business Service: Payment Tracking Service
→ Application Service: Payment Status Service
→ Application Component: Payment Status Service
→ Data Object: Payment Status Record
→ Event: Payment Settled / Payment Failed
```

## 9. Trace 8 — Partner APIs

```text
Driver: Partner Growth
→ Goal: Faster Partner Onboarding
→ Capability: Partner Onboarding
→ Business Service: Partner Payment Service
→ Application Interface: Partner Payment API
→ Application Component: Payment API Gateway
→ Technology Service: API Management Service
```

## 10. Trace 9 — DR

```text
Business Service: Instant Payment Service
→ Requirement: RTO/RPO targets
→ Application Components: critical payment components
→ Technology Service: Disaster Recovery Service
→ System Software: replicated platform/data technologies
→ Sites A/B
→ Work Package: Validate Multi-Site DR
→ Deliverable: DR test evidence
```

## 11. Orphan detection

### Orphan Requirement
Un Requirement sans relation vers une architecture ou un Work Package doit être revu.

### Orphan Application
Une application sans Business Service/Process consommateur peut être :

- technique/shared ;
- legacy ;
- mal documentée ;
- candidate à rationalisation.

### Orphan Technology
Un produit technique sans consumer peut être inutile ou mal relié.

### Orphan Work Package
Un chantier sans Gap, Goal ou Plateau cible est suspect.

## 12. Reverse traceability

La traçabilité doit fonctionner dans les deux sens.

Exemple depuis Kafka :

```text
Kafka
→ Event Streaming Service
→ Application Components
→ Application Events
→ Business Processes
→ Capabilities
→ Goals
```

Cela permet d’expliquer **pourquoi Kafka existe**.

Exemple depuis un serveur :

```text
Device
→ Node/Technology Service
→ Applications
→ Business Services
→ Stakeholders
```

Cela permet d’analyser l’impact métier d’une panne.

## 13. Change impact

Si `Payment Orchestrator` change :

- quelles APIs ?
- quels events ?
- quelles données ?
- quels consumers ?
- quels Technology Services ?
- quels Requirements ?
- quels Work Packages ?
- quels Business Services ?

Le modèle d’entreprise devient alors un outil d’analyse d’impact.

## 14. Coverage metrics possibles

Des métriques de gouvernance peuvent mesurer :

- % Requirements tracés à une solution ;
- % Applications reliées à un Business Service ;
- % Technology Services avec consumers ;
- % Work Packages reliés à un Gap ;
- % critical services avec RTO/RPO ;
- % applications critiques avec observability requirement.

Ces métriques ne font pas partie de la notation ArchiMate, mais exploitent le graphe.

## 15. Quality rule

> **Chaque élément majeur doit avoir une raison d’exister et un effet observable dans le modèle.**

La matrice de traçabilité est le contrôle le plus simple pour vérifier cette règle.