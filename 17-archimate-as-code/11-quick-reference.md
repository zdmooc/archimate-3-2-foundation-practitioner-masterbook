# 11 — Quick Reference

## Include

```plantuml
@startuml
!include <archimate/Archimate>
@enduml
```

## Layout

```plantuml
LAYOUT_LEFT_RIGHT()
LAYOUT_TOP_DOWN()
```

## Exemples d’éléments

```plantuml
Motivation_Driver(DRV_Regulation, "Regulatory Pressure")
Motivation_Goal(GOAL_Resilience, "Improve Resilience")
Motivation_Requirement(REQ_RTO, "RTO target")
Strategy_Capability(CAP_Payment, "Real-Time Payment Processing")
Business_Process(BP_Payment, "Execute Instant Payment")
Business_Service(BS_Payment, "Instant Payment Service")
Application_Component(AC_Orchestrator, "Payment Orchestrator")
Application_Service(AS_Orchestration, "Payment Orchestration Service")
Application_Interface(AI_PaymentAPI, "Payment REST API")
Application_DataObject(DO_Payment, "Payment Instruction")
Technology_Service(TS_EventStreaming, "Event Streaming Service")
Technology_SystemSoftware(SS_Kafka, "Kafka")
Technology_Node(N_OCP, "OpenShift Production Cluster")
Physical_Facility(FAC_SiteA, "MayaBank Site A")
Implementation_WorkPackage(WP_Migrate, "Migrate Payment Flows")
Implementation_Plateau(PL_Target, "Target Payment Platform")
```

## Relations

```plantuml
Rel_Realization(A, B)
Rel_Serving(A, B)
Rel_Access(A, B)
Rel_Triggering(A, B)
Rel_Flow(A, B)
Rel_Assignment(A, B)
Rel_Composition(A, B)
Rel_Aggregation(A, B)
Rel_Influence(A, B)
Rel_Association(A, B)
```

Les variantes `_Up`, `_Down`, `_Left`, `_Right` servent au layout ; elles ne doivent pas changer la sémantique voulue.

## Naming

```text
EXEC-01-...
BUS-01-...
APP-01-...
TEC-01-...
SEC-01-...
OPS-01-...
MIG-01-...
GREEN-01-...
```

## IDs

```text
DRV_  GOAL_  REQ_  CAP_
BP_   BS_    AC_    AS_    AI_    DO_
TS_   SS_    N_     FAC_
WP_   PL_    GAP_
```

## Local checks

```bash
bash 17-archimate-as-code/scripts/check.sh
```

## Local render

```bash
bash 17-archimate-as-code/scripts/render.sh
```

## Docker direct — permission-safe

```bash
docker run --rm -i plantuml/plantuml:1.2026.7 \
  -tsvg -pipe < model.puml > model.svg
```

## CI

```text
PR / push
→ naming checks
→ PlantUML syntax check
→ SVG render
→ artifact upload
→ human semantic review
```

## Three validation levels

```text
A Syntax
B Repository conventions
C ArchiMate semantics
```

## Archi vs code

```text
Archi
→ rich master model / interactive repository

PlantUML
→ governed views / Git diff / CI / docs-as-code
```

## Do not confuse

```text
compile success ≠ semantic correctness
layout direction ≠ relationship direction
Kafka ≠ Event
API Interface ≠ Application Service
OpenShift ≠ Capability
CO2e ≠ Material
Work Package ≠ Course of Action
```

## Definition of Done

```text
[ ] clear concern
[ ] correct types
[ ] correct relations
[ ] source/target verified
[ ] syntax check passes
[ ] naming conventions
[ ] SVG render passes
[ ] architecture state clear
[ ] reviewer approval
```
