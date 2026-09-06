# Partie VII — Technology Layer : où et comment l’application s’exécute

La **Technology Layer** décrit l’environnement technologique qui héberge, exécute, connecte et expose les applications et leurs artefacts.

Elle répond à des questions comme :

- **Sur quoi cela s’exécute-t-il ?** → `Node`, `Device`, `System Software`
- **Quels éléments techniques coopèrent ?** → `Technology Collaboration`
- **Par quel point d’accès un service technologique est-il disponible ?** → `Technology Interface`
- **Comment les nœuds communiquent-ils ?** → `Path`, `Communication Network`
- **Quel comportement technique est exécuté ?** → `Technology Function`, `Technology Process`, `Technology Interaction`, `Technology Event`
- **Quel comportement technique est exposé ?** → `Technology Service`
- **Quel élément déployable ou physique de données est utilisé ?** → `Artifact`

---

## 1. La chaîne mentale Technology

```text
APPLICATION
Application Component / Service / Data Object
        ↓
DEPLOYABLE REALIZATION
Artifact
        ↓
RUNTIME / PLATFORM
System Software
        ↓
EXECUTION ENVIRONMENT
Node / Device
        ↓
CONNECTIVITY
Technology Interface / Path / Communication Network
        ↓
EXPOSED PLATFORM CAPABILITY
Technology Service
```

Cette chaîne est pédagogique : elle aide à comprendre les niveaux. Elle ne signifie pas qu’un modèle doit toujours contenir tous ces éléments.

---

## 2. Pourquoi la Technology Layer est importante

Une Application Architecture peut dire :

```text
Application Component: Payment Orchestrator
Application Service: Payment Orchestration Service
```

Mais elle ne répond pas encore à :

- où l’application s’exécute ;
- quel runtime la supporte ;
- quel stockage elle utilise ;
- comment elle communique ;
- comment la haute disponibilité est obtenue ;
- quelle plateforme fournit les services techniques ;
- quels artefacts sont déployés.

La Technology Layer complète cette vision.

---

## 3. Les familles de concepts

### Structure active

- Node
- Device
- System Software
- Technology Collaboration
- Technology Interface
- Path
- Communication Network

### Behavior

- Technology Function
- Technology Process
- Technology Interaction
- Technology Event
- Technology Service

### Passive Structure

- Artifact

---

## 4. Exemple MayaBank

La cible de paiement instantané de MayaBank utilise une plateforme conteneurisée.

### Nodes

- OpenShift Production Cluster
- OpenShift Worker Node
- Database Node
- Kafka Broker Node

### Devices

- Physical Server
- Network Appliance
- Storage Array

### System Software

- Red Hat OpenShift
- Kubernetes
- Kafka
- PostgreSQL
- Linux
- Envoy / Ingress Controller

### Technology Services

- Container Execution Service
- Event Streaming Service
- Relational Database Service
- Secrets Management Service
- Observability Service
- Load Balancing Service

### Artifacts

- `payment-orchestrator:2.4.1` container image
- `payment-events.avsc` schema
- Helm chart / deployment manifest
- SQL schema
- configuration bundle

### Connectivity

- Payment Network
- Cluster Network
- Inter-site WAN
- Database Network
- Event Streaming Network Path

---

## 5. Technology n’est pas Application

Une confusion fréquente consiste à représenter une technologie comme une application métier.

### Application Component

```text
Payment Orchestrator
Fraud Engine
Notification Service
```

### System Software

```text
OpenShift
Kafka
PostgreSQL
Linux
```

### Technology Service

```text
Container Execution Service
Event Streaming Service
Database Service
```

Le composant applicatif exploite le service technologique, lequel est réalisé par une plateforme technique.

---

## 6. Node n’est pas Device

### Node

Un `Node` est une ressource computationnelle ou physique qui héberge, manipule ou interagit avec d’autres ressources.

Il est volontairement général.

### Device

Un `Device` est une ressource IT physique sur laquelle du logiciel ou des artefacts peuvent être stockés ou exécutés.

Exemple :

```text
Node: OpenShift Worker
Device: Physical Server HPE DL380
```

Le Node peut représenter un environnement d’exécution logique ; le Device insiste sur le matériel physique.

---

## 7. System Software n’est pas Artifact

### System Software

Logiciel qui fournit ou contribue à un environnement d’exécution.

Exemples :

- Linux
- Kubernetes
- OpenShift
- PostgreSQL DBMS
- Kafka Broker

### Artifact

Élément de données utilisé ou produit dans un processus de développement, déploiement ou exploitation.

Exemples :

- image de conteneur ;
- fichier JAR ;
- manifeste YAML ;
- schéma SQL ;
- fichier de configuration ;
- binaire déployable.

```text
Artifact: payment-orchestrator.jar
System Software: Java Runtime
Node: Payment Runtime Node
```

---

## 8. Technology Service

Un `Technology Service` représente un comportement technologique explicitement exposé à son environnement.

Exemples :

- Container Execution Service
- Event Streaming Service
- Database Service
- DNS Service
- Secrets Management Service
- Monitoring Service
- Object Storage Service

Le service exprime **ce que la plateforme fournit**.

Le System Software exprime **la technologie qui réalise ce service**.

```text
System Software: Kafka
        ↓ realizes
Technology Service: Event Streaming Service
```

---

## 9. Technology Interface

Une `Technology Interface` est un point d’accès à un Technology Service.

Exemples possibles selon le niveau d’abstraction :

- Kubernetes API
- PostgreSQL Listener
- Kafka Bootstrap Endpoint
- Load Balancer VIP
- Object Storage Endpoint

Le service et son interface ne doivent pas être confondus.

```text
Technology Service: Relational Database Service
Technology Interface: PostgreSQL Endpoint
```

---

## 10. Path et Communication Network

### Communication Network

Représente un ensemble de structures connectant des nœuds pour transmettre, router et recevoir des données.

Exemples :

- Corporate WAN
- Datacenter Network
- OpenShift Cluster Network
- Azure Virtual Network

### Path

Représente un lien entre deux ou plusieurs Nodes permettant l’échange de données, d’énergie ou de matière.

Un Path peut exprimer une connectivité logique particulière à l’intérieur d’un réseau plus large.

```text
Node A
  ↓ Path: Payment Event Path
Communication Network: Datacenter Network
  ↓
Node B
```

---

## 11. Technology Behavior

La Technology Layer ne contient pas seulement des machines et plateformes.

Elle permet aussi de représenter du comportement.

### Technology Function

Comportement technique regroupé par responsabilité.

```text
Container Scheduling
Log Collection
Data Replication
```

### Technology Process

Séquence de comportements techniques produisant un résultat.

```text
Backup and Restore Process
Certificate Rotation Process
```

### Technology Interaction

Comportement collectif réalisé par plusieurs nœuds.

```text
Cluster Failover Interaction
```

### Technology Event

Changement d’état technologique.

```text
Worker Node Failed
Certificate Expired
Replica Promoted
```

---

## 12. Application → Technology

Pattern de base :

```text
Application Component: Payment Orchestrator
        ↓ realized/deployed as
Artifact: Payment Orchestrator Container Image
        ↓ deployed on
Node: OpenShift Worker
        ↓ runs with
System Software: OpenShift / Container Runtime
        ↓ provides
Technology Service: Container Execution Service
```

Le vocabulaire exact des relations sera étudié dans la Partie X ; ici, l’objectif est de comprendre les niveaux.

---

## 13. Cas OpenShift

Une modélisation raisonnable peut distinguer :

```text
Node: OpenShift Production Cluster
  ├─ Node: Worker Pool
  └─ Node: Control Plane

System Software:
- Red Hat OpenShift
- Kubernetes
- CRI-O

Technology Services:
- Container Execution Service
- Scheduling Service
- Service Discovery
- Ingress Service

Artifact:
- payment-orchestrator container image
```

Il ne faut pas forcément représenter chaque Pod comme Node. Le niveau dépend du concern.

---

## 14. Cas Kafka

```text
Application Event: Payment Authorized
Data Object: Payment Authorized Message
        ↓ transported through
Technology Service: Event Streaming Service
        ↓ realized by
System Software: Kafka
        ↓ running on
Node: Kafka Cluster
```

Cette séparation évite de confondre :

- le fait métier/applicatif ;
- le message ;
- le service de streaming ;
- la technologie Kafka ;
- les nœuds qui l’exécutent.

---

## 15. Cas base de données

```text
Data Object: Payment Transaction
        ↓ realized by
Artifact: PAYMENT_TRANSACTION table
        ↓ managed by
System Software: PostgreSQL
        ↓ running on
Node: Database Cluster
        ↓ exposes
Technology Service: Relational Database Service
```

Le modèle sépare logique applicative, réalisation physique des données, moteur de base et infrastructure.

---

## 16. Cas cloud

Les services cloud doivent être modélisés selon le concern, pas simplement avec le nom commercial du fournisseur.

Exemple :

```text
Technology Service: Managed Kubernetes Service
Technology Service: Managed Database Service
Technology Service: Object Storage Service
Technology Service: Key Management Service
```

Puis la vue peut indiquer la technologie ou le fournisseur réel si c’est pertinent.

---

## 17. Baseline vs Target Technology

### Baseline

- VM dédiées ;
- middleware installé manuellement ;
- clusters spécialisés ;
- supervision fragmentée ;
- réseau point-à-point ;
- faible automatisation.

### Target

- plateforme conteneurisée ;
- services techniques standardisés ;
- déploiement automatisé ;
- observabilité transverse ;
- secrets centralisés ;
- haute disponibilité intégrée ;
- connectivité gouvernée.

ArchiMate permet de représenter ces états et leurs dépendances.

---

## 18. Questions de contrôle

### Q1
`OpenShift` ?

**Réponse : généralement System Software** lorsqu’on représente la plateforme logicielle.

### Q2
`Container Execution Service` ?

**Réponse : Technology Service.**

### Q3
`OpenShift Worker` ?

**Réponse : Node**, si l’on représente l’environnement d’exécution.

### Q4
`Physical Server` ?

**Réponse : Device**, si l’on insiste sur la ressource matérielle IT.

### Q5
`payment-orchestrator:2.4.1` ?

**Réponse : Artifact**, si l’on représente l’image ou le paquet déployable.

### Q6
`Kafka` ?

**Réponse : généralement System Software.**

### Q7
`Event Streaming Service` ?

**Réponse : Technology Service.**

### Q8
`Corporate WAN` ?

**Réponse : Communication Network.**

---

## À retenir

> **Technology Layer = environnement d’exécution + plateforme logicielle + connectivité + comportements techniques + services de plateforme + artefacts déployables.**

Le but n’est pas de dessiner un datacenter complet, mais de rendre explicite **comment les applications dépendent d’une réalisation technologique et comment cette réalisation satisfait les besoins d’architecture**.