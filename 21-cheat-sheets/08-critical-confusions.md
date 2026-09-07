# Cheat Sheet 08 — Confusions critiques

Cette fiche regroupe les confusions qui provoquent le plus d’erreurs de modélisation.

## Motivation / Strategy

### Goal vs Outcome vs Requirement
- Goal = état souhaité.
- Outcome = résultat concret/mesurable.
- Requirement = obligation imposée à l’architecture/solution.

### Driver vs Assessment
- Driver = pression/condition.
- Assessment = constat issu de l’analyse.

### Capability vs Process vs Function
- Capability = aptitude.
- Process = comportement structuré/séquentiel.
- Function = comportement regroupé par finalité.

### Course of Action vs Work Package
- Course of Action = orientation stratégique.
- Work Package = travail concret.

## Business

### Actor vs Role
- Actor = entité/personne/organisation.
- Role = responsabilité.

### Process vs Service
- Process = comportement interne.
- Service = comportement exposé.

### Business Object vs Representation
- Business Object = concept métier.
- Representation = forme perceptible de l’objet.

### Product vs Service
- Product = offre cohérente de valeur, pouvant agréger services/contrats.
- Service = comportement exposé.

## Application

### Component vs Service
- Component = structure logicielle.
- Service = fonctionnalité exposée.

### Service vs Interface
- Service = ce qui est fourni.
- Interface = point d’accès.

### Application Event vs Data Object
- Event = fait/changement d’état.
- Data Object = information logique.

### API : trois lectures
- API comme fonctionnalité → Application Service.
- API comme point d’accès → Application Interface.
- API Gateway logiciel → Application Component ou System Software selon concern.

## Data / Artifact

### Business Object vs Data Object vs Artifact
```text
Business Object = concept métier
Data Object     = information logique applicative
Artifact        = représentation concrète déployable/stockée
```

Exemple :
- Payment Order = Business Object.
- Payment Transaction = Data Object.
- `payment-orchestrator.jar` = Artifact.

## Technology / Physical

### Application Component vs System Software
- application métier → Application Component.
- middleware/runtime/platforme → System Software.

### System Software vs Technology Service
- System Software = structure logicielle de plateforme.
- Technology Service = fonctionnalité technique exposée.

### Node vs Device
- Node = ressource d’exécution.
- Device = matériel IT.

### Device vs Equipment
- Device = matériel IT.
- Equipment = équipement physique non-IT.

### Facility vs Node
- Facility = site/bâtiment/espace.
- Node = exécution.

### Communication Network vs Distribution Network
- Communication Network = données/communications.
- Distribution Network = énergie/matière/eau.

## Events

### Business Event
Fait métier : Payment Request Received.

### Application Event
Fait applicatif : Payment Authorized.

### Technology Event
Fait technique : Node Failure Detected.

### Implementation Event
Jalon de transformation : Platform Ready.

## Migration

### Plateau vs Environment
Plateau = état architectural stable/significatif.
DEV/TEST/UAT/PROD = environnements, pas automatiquement Plateaus.

### Plateau vs Release
Release ≠ Plateau par défaut.

### Gap vs Assessment
Assessment = constat.
Gap = différence baseline/target.

### Deliverable vs Artifact
Deliverable = résultat de transformation.
Artifact = objet concret déployable/stocké.

## Relationships

### Assignment vs Realization
Assignment = exécute.
Realization = implémente.

### Realization vs Serving
Realization = implémente.
Serving = fournit à un consommateur.

### Access vs Flow
Access = lit/écrit.
Flow = transfère.

### Triggering vs Flow
Triggering = causalité.
Flow = transfert.

## Architecture moderne : pièges fréquents

### Kafka
- Kafka runtime = System Software.
- Event Streaming = Technology Service.
- Event = Business/Application/Technology Event selon niveau.
- Payload = Data Object/Artifact selon abstraction.
- Topic n’est pas automatiquement Data Object.

### OpenShift/Kubernetes
- OpenShift = System Software.
- Cluster = Node.
- Worker physique = Device.
- Container image = Artifact.
- Application dans le cluster = Application Component.

### Database
- Oracle/PostgreSQL DBMS = System Software.
- Database Service = Technology Service.
- données métier = Data Object.
- serveur DB physique = Device si représenté.

### IAM
- Identity capability = Capability si l’aptitude organisationnelle est le concern.
- IAM logiciel = Application Component/System Software selon rôle.
- Identity/Authentication Service = Application ou Technology Service selon niveau.
- OIDC endpoint = Interface possible.

### GenAI
- AI capability ≠ LLM.
- LLM/model runtime ≠ automatiquement Capability.
- GenAI application = Application Component.
- model serving = Application/Technology Service selon responsabilité.

### Green IT
- CO2e, PUE, kWh = mesures/propriétés.
- énergie peut être Material si modélisée comme ressource physique.
- “migration cloud = Green IT” est une conclusion non démontrée sans chaîne d’impact.

## Test ultime

Si vous ne pouvez pas compléter la phrase suivante, le type d’élément est probablement mal choisi :

> « Cet élément est un ___ parce qu’il représente ___ au niveau ___ et non ___ ». 

Même règle pour une relation :

> « Source ___ cible parce que la relation signifie ___. »