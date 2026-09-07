# Cheat Sheet 12 — Révision express 15 minutes

## Minute 0–2 — les couches

```text
Motivation = WHY
Strategy = WHAT WE MUST BE ABLE TO DO
Business = WHAT THE BUSINESS DOES
Application = HOW SOFTWARE SUPPORTS IT
Technology = WHERE SOFTWARE RUNS
Physical = PHYSICAL ENVIRONMENT
Implementation & Migration = HOW WE CHANGE
```

## Minute 2–4 — les concepts les plus discriminants

```text
Driver ≠ Assessment ≠ Goal ≠ Requirement
Capability ≠ Process ≠ Function
Actor ≠ Role
Service ≠ Interface
Business Object ≠ Data Object ≠ Artifact
Application Component ≠ System Software
Node ≠ Device ≠ Facility ≠ Equipment
Course of Action ≠ Work Package
Plateau ≠ Release/Environment
Gap ≠ Assessment
```

## Minute 4–6 — relations

```text
Assignment = exécute
Realization = implémente
Serving = fournit
Access = lit/écrit
Triggering = déclenche
Flow = transfère
Influence = affecte
Composition = contient fortement
Aggregation = regroupe
```

## Minute 6–8 — API / Kafka / OpenShift

```text
API functionality = Application Service
API endpoint = Application Interface
API software = Application Component/System Software selon concern

Kafka runtime = System Software
Event Streaming = Technology Service
Event = fact/state change
Payload = Data Object
Topic = technical messaging construct

OpenShift = System Software
Cluster = Node
Worker hardware = Device
Container image = Artifact
Business workload = Application Component
```

## Minute 8–10 — migration

```text
Assessment → Gap → Course of Action → Work Package
→ Deliverable → Implementation Event → Plateau
```

Toujours montrer : baseline, coexistence si nécessaire, cible, decommissioning.

## Minute 10–12 — views

```text
Stakeholder → Concern → Viewpoint → View
```

- CIO : capabilities / roadmap / target.
- CISO : requirements / identity / trust / dependencies.
- Ops : runtime / incident impact / recovery.
- Platform : application→technology usage.
- Program : gaps / work packages / plateaus.

## Minute 12–14 — Practitioner

Pour chaque scénario :

1. Qui décide ?
2. Quel concern ?
3. Quel niveau ?
4. Quel élément ?
5. Quelle relation ?
6. Quelle direction ?
7. Quelle traçabilité manque ?
8. Faut-il montrer migration/target ?

Choisir la réponse qui est correcte **et proportionnée au concern**.

## Minute 14–15 — MayaBank

```text
Regulation
→ Goal real-time/resilient payments
→ Capability
→ Business Payment Service
→ Payment Orchestration Service
→ Payment Orchestrator
→ OpenShift/Kafka/IAM/DB/Observability
→ multi-site facilities
→ Gaps/WPs/Plateaus
```

## Les 20 affirmations à pouvoir répondre Vrai/Faux instantanément

1. Une Capability est un workflow. **Faux.**
2. Un Process peut avoir une séquence. **Vrai.**
3. Un Service est un point d’accès. **Faux : Interface.**
4. Un Application Component est une structure logicielle. **Vrai.**
5. Kafka est normalement un Data Object. **Faux.**
6. Une image OCI est un Artifact. **Vrai.**
7. OpenShift est normalement System Software. **Vrai.**
8. Un datacenter est un Node. **Faux : Facility.**
9. Un serveur physique peut être Device. **Vrai.**
10. Un UPS est généralement Equipment. **Vrai.**
11. Assignment signifie implémente. **Faux : exécute/porte.**
12. Realization signifie concrétise/implémente. **Vrai.**
13. Flow signifie causalité. **Faux : transfert.**
14. Triggering signifie causalité/séquence. **Vrai.**
15. Access signifie lecture/écriture. **Vrai.**
16. Work Package est une stratégie. **Faux.**
17. Course of Action est une orientation stratégique. **Vrai.**
18. Plateau signifie automatiquement environnement PROD. **Faux.**
19. Viewpoint et View sont synonymes. **Faux.**
20. Le meilleur modèle est celui qui répond au concern avec la sémantique correcte. **Vrai.**