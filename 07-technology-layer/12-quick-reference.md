# Technology Layer — Quick Reference

## Concepts

| Question | Concept |
|---|---|
| environnement de calcul | `Node` |
| matériel physique IT | `Device` |
| logiciel de plateforme/runtime | `System Software` |
| coopération de structures techniques | `Technology Collaboration` |
| point d’accès technique | `Technology Interface` |
| chemin entre Nodes | `Path` |
| réseau partagé | `Communication Network` |
| responsabilité technique interne | `Technology Function` |
| séquence technique | `Technology Process` |
| comportement collectif | `Technology Interaction` |
| changement d’état technique | `Technology Event` |
| comportement technique exposé | `Technology Service` |
| élément déployable/physique de données | `Artifact` |

## Confusions critiques

```text
Device ≠ Node
Application Component ≠ System Software
Application Service ≠ Technology Service
Application Interface ≠ Technology Interface
Data Object ≠ Artifact
Application Event ≠ Technology Event
Artifact ≠ Deliverable
Artifact ArchiMate ≠ Artifact TOGAF
Path ≠ Communication Network
```

## OpenShift

```text
OpenShift Cluster     → Node
OpenShift             → System Software
Worker                → Node
Container Image       → Artifact
Ingress Service       → Technology Service
Ingress Endpoint      → Technology Interface
Argo CD               → System Software
GitOps Manifests      → Artifact
Persistent Storage    → Technology Service
```

## Kafka

```text
Payment Authorized    → Application Event
Event Message         → Data Object
Avro Schema           → Artifact
Kafka                 → System Software
Kafka Cluster         → Node
Event Streaming       → Technology Service
Bootstrap Endpoint    → Technology Interface
```

## Database

```text
Payment Transaction   → Data Object
PAYMENT_TX table      → Artifact
PostgreSQL/Oracle     → System Software
DB Cluster            → Node
Database Service      → Technology Service
DB Endpoint           → Technology Interface
```

## HA / DR

```text
Failure               → Technology Event
Failover sequence     → Technology Process
Cross-node behavior   → Technology Interaction
HA pair/platform      → Technology Collaboration
DR capability         → Technology Service
RPO/RTO               → Requirement
```

## Cross-layer chain

```text
Goal
 → Requirement
 → Business Service
 → Application Service
 → Application Component
 → Artifact
 → Technology Service
 → System Software
 → Node
```

## Five-second test

- **What runs it?** → Node/System Software
- **What platform capability is consumed?** → Technology Service
- **Where do I connect?** → Technology Interface
- **How do Nodes communicate?** → Path/Communication Network
- **What is deployed?** → Artifact
- **What happens on failure?** → Event/Process/Interaction
