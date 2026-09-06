# Use case 12 — Green IT

## 1. Contexte

MayaBank veut réduire l'empreinte environnementale de son SI sans sacrifier performance, résilience, sécurité ou capacité métier.

## 2. Motivation

Drivers :

- carbon reduction targets ;
- energy cost ;
- hardware lifecycle ;
- regulatory / ESG pressure ;
- low infrastructure utilization ;
- data growth.

Goals :

- reduce infrastructure footprint ;
- improve utilization ;
- avoid unnecessary capacity ;
- extend hardware lifetime where appropriate ;
- reduce storage/data waste ;
- decommission obsolete platforms.

Principles :

- avoid before optimize ;
- right-size before scale-out ;
- measure real usage ;
- remove unused data ;
- prefer shared efficient platforms when they truly allow consolidation ;
- design for reversibility and observability.

## 3. ArchiMate does not calculate carbon

ArchiMate represents the **architecture dependencies and decisions** that make carbon analysis understandable.

Carbon values, energy, utilization and PUE are typically properties/measurements attached to elements, not new ArchiMate element types.

## 4. Capabilities

- Sustainable Architecture
- Infrastructure Efficiency Management
- Application Rationalization
- Carbon Measurement
- Capacity Management
- Data Lifecycle Management

## 5. Cross-layer chain

```text
Driver: Reduce IT Carbon Footprint
→ Goal: Reduce Infrastructure Impact
→ Principle: Avoid Unused Capacity
→ Requirement: Right-size Workloads
→ Application/Technology changes
→ Work Packages
→ Decommissioning Event
→ Target Plateau
```

## 6. Application rationalization

Use ArchiMate to identify :

- duplicate applications ;
- unused services ;
- obsolete interfaces ;
- redundant databases ;
- applications preventing hardware decommissioning.

A portfolio rationalization view can combine :

- Application Components ;
- Business Services supported ;
- Capabilities ;
- lifecycle properties ;
- cost/carbon properties.

## 7. Infrastructure consolidation

Important distinction :

```text
Migration to shared platform
≠ guaranteed environmental gain
```

A real gain requires one or more :

- physical server shutdown ;
- capacity avoided ;
- hardware purchase avoided ;
- improved utilization ;
- facility footprint reduction ;
- storage reduction.

## 8. OpenShift pattern

```text
Legacy Application Servers
→ migrate workloads
→ OpenShift Technology Service
→ consolidated worker pool
→ Implementation Event: Legacy Servers Decommissioned
```

The decommissioning event is crucial. Without it, the model only shows movement, not avoided physical footprint.

## 9. Data lifecycle

Requirements :

- TTL ;
- retention ;
- compression ;
- archive tiers ;
- deletion ;
- duplicate control.

Trace to :

- Data Objects ;
- Application Functions ;
- Storage Technology Services ;
- Physical infrastructure.

## 10. Build vs Use impacts

Architecture reviews can distinguish :

- embodied/fabrication impact of physical devices ;
- operational energy impact ;
- storage/backup replication ;
- network and cooling dependencies.

Physical elements such as Device, Facility, Equipment and Distribution Network help expose those dependencies.

## 11. Baseline / Target

Baseline : low utilization, dedicated servers, duplicate applications, excessive retention, obsolete platforms kept alive.

Target : consolidated hosting, right-sized workloads, lifecycle policies, rationalized portfolio, explicit decommissioning, measurable utilization.

## 12. Gaps / Work Packages

Gaps : incomplete inventory, weak usage measurement, missing ownership, no decommissioning process, no data lifecycle policies.

Work Packages :

1. Establish inventory and measurement
2. Identify low-value assets
3. Right-size workloads
4. Consolidate platforms
5. Rationalize applications
6. Reduce data/storage waste
7. Decommission physical assets
8. Measure realized benefit

## 13. Views

- Capability View
- Application Portfolio View
- Technology Usage View
- Physical View
- Layered View
- Migration View
- Carbon/Utilization custom view

## 14. Anti-patterns

- `CO2` modeled as Business Object.
- assuming cloud/container migration automatically reduces carbon.
- carbon model that ignores manufacturing and physical decommissioning.
- optimizing a system whose business service is no longer needed.

## 15. Interview questions

1. How can ArchiMate support Green IT?
2. How do you represent carbon values?
3. Why is decommissioning important in the model?
4. How do you trace an application rationalization decision to physical impact?
5. How do you avoid claiming benefits before physical resources are actually removed?

## 16. Practitioner case

The Green IT Lead asks whether migrating five applications to OpenShift will reduce environmental impact. Build a Baseline/Target/Migration view showing current Devices, target shared platform, utilization assumptions and the Implementation Events that actually remove legacy assets. The answer cannot be derived from the target topology alone.
