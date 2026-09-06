# Use case 10 — Multi-site / Disaster Recovery

## 1. Contexte

MayaBank doit maintenir ses services critiques malgré la perte d'un composant, d'un cluster, d'une zone ou d'un site complet.

## 2. Motivation

Drivers :

- business continuity ;
- regulatory resilience ;
- critical payment services ;
- infrastructure failure ;
- cyber recovery.

Goals :

- limit service interruption ;
- limit data loss ;
- recover critical services predictably ;
- validate recovery regularly.

Requirements :

- RTO/RPO targets ;
- backup integrity ;
- tested failover ;
- network independence ;
- recovery runbooks ;
- capacity on recovery site ;
- data replication ;
- operational authority during disaster.

## 3. Concepts importants

RTO/RPO are not ArchiMate element types. They are properties/requirements associated with services, processes, data and recovery designs.

```text
Requirement: RPO = 0 for critical ledger data
Requirement: RTO < 15 minutes for Instant Payment Service
```

## 4. Capabilities

- Service Continuity
- Disaster Recovery
- Backup & Restore
- Failover Management
- Recovery Testing
- Crisis Operations

## 5. Architecture layers

Business : critical services/processes.

Application : applications required to provide those services.

Technology : clusters, database services, messaging, network, storage, backup.

Physical : sites, facilities, devices, power/cooling dependencies.

Implementation : DR build, failover tests, migration/cutover events.

## 6. HA vs DR

```text
HA = tolerate local component failure
DR = recover from major failure / site loss
```

Multiple application replicas in one site do not prove site-level disaster recovery.

## 7. Data resilience

Possible patterns :

- synchronous replication ;
- asynchronous replication ;
- database standby ;
- backup + restore ;
- immutable backup ;
- event replay.

The architecture should state which data objects/business objects are protected by which technology services and what recovery requirement applies.

## 8. Multi-site model

```text
Facility: Site A
  Devices / Nodes / Platforms

Facility: Site B
  Devices / Nodes / Platforms

Communication Network
  connects sites

Technology Services
  replication / backup / routing / recovery
```

## 9. Dependency analysis

A real DR view must include dependencies often forgotten :

- DNS ;
- IAM ;
- certificate/PKI ;
- secrets ;
- network ;
- external clearing ;
- monitoring ;
- backup catalogs ;
- operational access.

## 10. Baseline / Target

Baseline : partial HA, manual recovery, untested dependencies, shared failure domains.

Target : explicit service tiers, tested failover, recovery capacity, independent critical services, documented RTO/RPO, periodic exercises.

## 11. Gaps / Work Packages

Gaps : incomplete service tiering, no end-to-end dependency map, insufficient recovery capacity, no regular testing.

Work Packages :

1. Classify critical services
2. Define RTO/RPO
3. Map dependencies
4. Build recovery platform
5. Implement replication/backup
6. Automate failover where appropriate
7. Execute DR tests
8. Remediate findings

## 12. Views

- Business Criticality View
- Layered Dependency View
- Technology View
- Physical View
- Deployment View
- Incident Impact View
- Implementation & Migration View

## 13. Anti-patterns

- “Two data centers” = DR proven.
- Backup = HA.
- Database replication alone = end-to-end recovery.
- RTO represented as a Technology Service.

## 14. Interview questions

1. How do you distinguish HA and DR?
2. How do you model RTO/RPO?
3. How do you expose hidden recovery dependencies?
4. How do you connect physical sites to business services?
5. How do you model a DR test?

## 15. Practitioner case

The Risk Committee asks whether the Instant Payment Service survives loss of Site A. Build a cross-layer view from Business Service down to all Application/Technology/Physical dependencies, then show recovery services and Site B. Missing dependencies become architectural gaps.
