# Use case 5 — Cloud Migration

## 1. Contexte

MayaBank veut migrer une partie de son SI vers un cloud public/hybride tout en conservant des exigences fortes de sécurité, résilience, souveraineté, coûts et réversibilité.

## 2. Motivation

Drivers :

- data center modernization ;
- elasticity ;
- faster provisioning ;
- managed services ;
- resilience ;
- cost optimization.

Constraints :

- data residency ;
- regulatory obligations ;
- approved regions ;
- network connectivity ;
- legacy dependencies ;
- exit strategy.

Goals :

- reduce infrastructure lead time ;
- modernize application hosting ;
- improve resilience ;
- improve cost transparency.

## 3. Capabilities

- Cloud Platform Engineering
- Landing Zone Management
- Cloud Security
- Cloud Cost Management
- Cloud Connectivity
- Cloud Migration Factory
- Cloud Operations

## 4. Do not model “Cloud” as one box

A useful decomposition separates :

```text
Technology Services
  Compute Service
  Managed Database Service
  Object Storage Service
  Identity Service
  Network Service
  Monitoring Service

System Software / Nodes
  Runtime platforms
  Managed DB engines
  Kubernetes platform
  gateways
  VMs
```

The provider itself can be represented as an external business actor/provider where procurement/service concerns matter.

## 5. Migration strategies

ArchiMate can represent work packages corresponding to :

- rehost ;
- replatform ;
- refactor ;
- replace ;
- retire ;
- retain.

Do not turn those labels into ArchiMate element types. They are migration strategies or courses of action / work-package classifications.

## 6. Baseline

```text
On-prem applications
→ enterprise middleware
→ VM/physical infrastructure
→ two data centers
```

## 7. Target example

```text
Business Services
→ Cloud-ready Applications
→ Container / Managed Services
→ Cloud Technology Services
→ Cloud Regions / Zones
```

Hybrid dependencies remain explicit :

- on-prem mainframe ;
- core banking ;
- identity ;
- network ;
- backup ;
- settlement gateways.

## 8. Landing zone

A landing zone is not simply one Node.

It can be decomposed through :

- identity and access services ;
- network services ;
- logging ;
- security policies ;
- key management ;
- accounts/subscriptions ;
- governance ;
- deployment automation.

## 9. Security and compliance

Model :

```text
Principle: Least Privilege
Requirement: Encryption at Rest
Requirement: Approved EU Region
Requirement: Central Audit Logging

→ Technology Services
→ cloud platform components
→ workloads
```

## 10. FinOps

FinOps is better represented through :

- Capability: Cloud Cost Management ;
- Business/Technology processes for allocation and optimization ;
- Requirements/Goals for budget and efficiency ;
- properties such as cost, utilization or tags.

The monthly invoice is not the architecture itself.

## 11. Resilience

Distinguish :

- availability zone resilience ;
- regional resilience ;
- backup ;
- cross-region DR ;
- hybrid failover ;
- application-level recovery.

## 12. Gaps

- no landing zone ;
- missing connectivity ;
- weak identity federation ;
- no tagging/cost model ;
- unclassified workloads ;
- no cloud security baseline ;
- no exit strategy.

## 13. Work Packages

1. Establish cloud governance
2. Build landing zone
3. Establish connectivity
4. Establish identity federation
5. Establish security/monitoring
6. Classify workloads
7. Migrate pilot
8. Migrate waves
9. Optimize and decommission

## 14. Views

- Strategy View
- Capability View
- Technology View
- Layered View
- Migration View
- Security View
- Cost/Green IT custom view

## 15. Anti-patterns

### Cloud = Node

Too vague. Model the specific technology services and runtime structures relevant to the concern.

### Migration = only target diagram

Wrong. The transition state and remaining hybrid dependencies matter.

### Managed service = no architecture

Wrong. Managed services still have dependencies, consumers, contracts, security requirements and resilience characteristics.

## 16. Interview questions

1. How would you represent a cloud landing zone?
2. How do you model managed services versus self-managed software?
3. How do you show hybrid dependencies?
4. How do you represent rehost/refactor decisions?
5. How do you show decommissioning benefits?

## 17. Practitioner case

The CIO asks which applications can migrate first without creating new dependencies on the legacy data center.

Useful view : **Application + Technology + Migration cross-layer view**, highlighting legacy technology services still consumed by each candidate application.
