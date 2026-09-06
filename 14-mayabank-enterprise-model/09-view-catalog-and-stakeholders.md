# MayaBank — View Catalog & Stakeholders

Le modèle d’entreprise MayaBank est exploité à travers un catalogue de vues. Chaque vue possède une audience, un concern, une question de décision et un niveau d’abstraction.

## 1. Executive Transformation View

**Stakeholders** : CIO, CTO, Head of Payments.

**Concern** : pourquoi changer, quel impact global, où va l’investissement.

**Montre** :

```text
Drivers
→ Goals
→ Capabilities
→ Target Architecture blocks
→ Gaps
→ Work Packages
→ Target Plateau
```

Évite les détails de pods, topics, tables ou routes.

## 2. Capability Heatmap View

**Stakeholders** : CIO, Enterprise Architecture, Transformation.

**Concern** : où investir.

Montre :

- capabilities ;
- maturité baseline ;
- maturité cible ;
- criticité ;
- gap.

## 3. Business Process View

**Stakeholders** : Head of Payments, Operations.

Montre :

```text
Initiate
→ Validate
→ Assess Risk
→ Execute
→ Confirm
→ Reconcile
```

avec rôles, events, services et business objects utiles.

## 4. Business-to-Application Usage View

**Stakeholders** : Solution Architect, Business Architect.

Montre quelles Application Services supportent quels Business Processes.

Exemple :

```text
Payment Orchestration Service
  Serving → Execute Instant Payment
```

## 5. Application Cooperation View

**Stakeholders** : Solution Architect, Development Leads.

Montre :

- components ;
- services ;
- interfaces ;
- flows ;
- events ;
- data ownership.

## 6. API View

**Concern** : points d’accès synchrones, consumers, security boundary.

Montre :

- Application Interface ;
- Application Service ;
- provider component ;
- consumer ;
- IAM requirement.

## 7. Event-Driven View

**Concern** : découplage et flux asynchrones.

Montre :

- Application Events ;
- payload Data Objects ;
- producers ;
- consumers ;
- Event Streaming Technology Service ;
- éventuellement topics si le niveau de détail l’exige.

## 8. Information & Data Lineage View

**Stakeholders** : Data Architect, Risk, Audit.

Montre :

```text
Business Object
→ Data Objects
→ readers/writers
→ source of truth
→ replicas/projections
```

## 9. OpenShift Deployment View

**Stakeholders** : Platform Architect, Operations.

Montre :

- Application Components ;
- Artifacts ;
- Nodes ;
- OpenShift ;
- worker pools ;
- storage/network services.

## 10. Security View

**Stakeholders** : CISO, Security Architect.

Montre :

- Requirements ;
- identity services ;
- secrets services ;
- trust boundaries ;
- critical interfaces ;
- privileged roles ;
- data classification properties.

## 11. Observability View

**Stakeholders** : Operations, SRE, Architecture.

Montre :

- instrumented applications ;
- logs/metrics/traces services ;
- correlation ;
- alert consumers ;
- critical business journey.

## 12. Resilience & DR View

**Stakeholders** : Operations, Infrastructure, Risk.

Montre :

- critical Business Services ;
- RTO/RPO Requirements ;
- applications ;
- data ;
- platform ;
- sites ;
- replication paths.

## 13. Incident Impact View

Point de départ possible :

```text
Device / Node / Technology Service / Application
```

Puis remontée vers :

```text
Business Service
→ Stakeholder
```

Exemple : panne Kafka → quels services métier sont réellement affectés ?

## 14. Migration Roadmap View

**Stakeholders** : Program Director, Architects.

Montre :

```text
Gaps
→ Work Packages
→ Deliverables
→ Events
→ Plateaus
```

## 15. Coexistence View

Spécifique au Plateau hybride.

Montre :

- target ;
- legacy ;
- routing ;
- temporary adapters ;
- synchronization ;
- source of truth par domaine ;
- exit conditions.

## 16. Green IT View

**Stakeholders** : Sustainability/Green IT, Infrastructure, CIO.

Montre :

```text
Goal
→ consolidation / migration Work Packages
→ Plateau changes
→ Devices/Facilities affected
→ measured properties
```

## 17. Portfolio Rationalization View

Montre :

- applications ;
- services supportés ;
- duplication ;
- lifecycle ;
- target disposition : retain / modernize / replace / retire.

## 18. Partner Integration View

Montre :

- Partner Institution ;
- Contract ;
- Partner API ;
- Payment Services ;
- security requirements ;
- events/status.

## 19. Fraud View

Montre :

- Fraud capability ;
- Fraud Analyst ;
- Assess Fraud Risk process ;
- Fraud Engine ;
- Fraud Decision ;
- observability/audit ;
- exception workflow.

## 20. Settlement View

Montre :

- clearing/settlement processes ;
- ledger ;
- settlement records ;
- reconciliation ;
- exceptions ;
- external partner dependencies.

## 21. View metadata standard

Chaque vue MayaBank devrait documenter :

```text
Name
Purpose
Primary stakeholders
Concerns
Scope
Abstraction level
Elements included
Elements deliberately excluded
Key decisions supported
```

## 22. Naming convention

Exemples :

- `MB-VIEW-EXEC-001 Payment Transformation Executive`
- `MB-VIEW-APP-003 Payment Event-Driven Architecture`
- `MB-VIEW-TECH-005 OpenShift Deployment`
- `MB-VIEW-MIG-002 Hybrid Coexistence`

La convention est locale au référentiel, pas une exigence ArchiMate.

## 23. Règle de lisibilité

Une vue n’est pas meilleure parce qu’elle contient plus d’éléments.

Elle est meilleure si le stakeholder peut répondre rapidement à sa question.

> **Le modèle contient la richesse ; la vue contient seulement ce qui sert le concern.**