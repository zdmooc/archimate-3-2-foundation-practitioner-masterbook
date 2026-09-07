# Cheat Sheet 04 — Technology & Physical

## Technology Layer

| Élément | Question | Exemple MayaBank |
|---|---|---|
| Node | Quelle ressource d’exécution logique/physique ? | OpenShift Production Cluster |
| Device | Quel matériel IT ? | Worker Server, HSM Appliance |
| System Software | Quel logiciel de plateforme/runtime ? | OpenShift, Kafka, PostgreSQL |
| Technology Collaboration | Quels éléments technologiques coopèrent ? | Active/Standby DB Pair |
| Technology Interface | Quel point d’accès technologique ? | Management Interface |
| Path | Quel chemin logique relie les nœuds ? | Inter-Site Replication Path |
| Communication Network | Quel réseau transporte les communications ? | WAN, Ethernet Network |
| Technology Function | Quel comportement interne de plateforme ? | Message Persistence |
| Technology Process | Quelle séquence technologique ? | Backup and Restore Process |
| Technology Interaction | Quel comportement collectif ? | Cluster Failover Coordination |
| Technology Event | Quel fait technique survient ? | Node Failure Detected |
| Technology Service | Quelle fonctionnalité de plateforme est exposée ? | Container Platform Service, Event Streaming Service |
| Artifact | Quelle représentation concrète déployable ? | OCI Image, JAR, Helm Package |

## Physical Layer

| Élément | Question | Exemple |
|---|---|---|
| Equipment | Quel équipement physique non-IT ? | UPS, Generator, Chiller |
| Facility | Quel site/bâtiment/espace ? | DC East, DC West |
| Distribution Network | Quel réseau distribue matière/énergie ? | Power Distribution, Cooling Loop |
| Material | Quelle matière/ressource physique circule ou est consommée ? | Electricity, Cooling Water |

## Distinctions critiques

### Node vs Device
- Node = ressource computationnelle/exécution ; peut être logique ou physique selon le concern.
- Device = matériel IT physique.

Un serveur physique peut être Device ; un cluster peut être Node.

### Device vs Equipment
- Device = équipement IT capable d’exécuter/traiter.
- Equipment = équipement physique non-IT participant au fonctionnement.

Serveur = Device.
UPS/chiller/générateur = Equipment.

### Node vs Facility
- Node = ressource d’exécution.
- Facility = lieu/site/bâtiment.

Datacenter = Facility, pas Node.

### System Software vs Application Component
- System Software = plateforme/runtime/infrastructure logicielle.
- Application Component = logiciel métier/applicatif.

OpenShift/Kafka/DBMS = System Software.
Payment Orchestrator/Fraud Engine = Application Component.

### System Software vs Technology Service
- System Software = structure logicielle de plateforme.
- Technology Service = fonctionnalité exposée par la technologie.

```text
Kafka (System Software)
→ realizes/provides
Event Streaming Service (Technology Service)
```

### Artifact vs Data Object
- Data Object = information logique manipulée par applications.
- Artifact = représentation concrète stockée/déployée.

Payment Transaction = Data Object.
`payment-orchestrator:1.4.2` image OCI = Artifact.

### Communication Network vs Distribution Network
- Communication Network = information/communication.
- Distribution Network = énergie, eau, matière.

WAN = Communication Network.
Power grid / cooling loop = Distribution Network.

## Pattern OpenShift

```text
Application Component: Payment Orchestrator
→ realized/deployed as Artifact: OCI Image
→ deployed on Node: OpenShift Production Cluster
← enabled by System Software: OpenShift
→ exposes Technology Service: Container Platform Service
```

Ne pas confondre :
- Pod = parfois Node si le concern justifie de représenter la ressource d’exécution ;
- image = Artifact ;
- OpenShift = System Software ;
- cluster = Node ;
- serveur worker physique = Device.

## Pattern Kafka

```text
Kafka Cluster / Kafka Runtime = System Software
Event Streaming Service       = Technology Service
Topic / partition             = construction technique, à modéliser seulement si le concern le justifie
Event                         = Application/Business/Technology Event selon le niveau
Payload                       = Data Object / Artifact selon l’abstraction
```

## Pattern Database

```text
PostgreSQL / Oracle = System Software
Database Service    = Technology Service
Database Node       = Node
DB Server           = Device si matériel physique explicitement représenté
Business data       = Data Object, pas “la base” elle-même
```

## Résilience physique

```text
Facility DC-East
→ contains Devices
→ host Nodes/System Software
→ enable Technology Services
→ support Application Services
→ support Business Services
```

Une panne Facility doit pouvoir remonter jusqu’au service métier critique via les dépendances cross-layer.

## Green IT

- kWh, W, kgCO2e, PUE = **mesures/propriétés**, pas automatiquement Material.
- Electricity peut être Material si l’architecture représente réellement la ressource physique consommée/distribuée.
- Un gain carbone crédible suppose une conséquence réelle : extinction, consolidation, évitement d’achat, diminution de capacité ou consommation mesurable.

## Réflexes d’examen

Si l’objet est :
- logiciel métier → Application Component ;
- runtime/plateforme → System Software ;
- capacité technique fournie → Technology Service ;
- matériel IT → Device ;
- site → Facility ;
- UPS/chiller → Equipment ;
- package/image → Artifact ;
- WAN → Communication Network ;
- alimentation électrique → Distribution Network.