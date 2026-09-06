# Technology Active Structure — Node, Device et System Software

La structure active technologique répond à une question essentielle :

> **Quelles ressources techniques exécutent, hébergent ou fournissent l’environnement nécessaire aux applications ?**

Les trois concepts centraux sont :

- `Node`
- `Device`
- `System Software`

---

## 1. Node

Un **Node** représente une ressource computationnelle ou physique qui héberge, manipule ou interagit avec d’autres ressources computationnelles ou physiques.

Il est volontairement générique.

### Exemples

- OpenShift Production Cluster
- Worker Node
- Database Cluster
- Kafka Cluster
- Virtual Machine
- Mainframe LPAR
- Edge Gateway Node

Un Node peut représenter un environnement logique ou physique selon le niveau du modèle.

---

## 2. Device

Un **Device** représente une ressource IT physique sur laquelle du logiciel ou des artefacts peuvent être stockés ou déployés pour exécution.

### Exemples

- Physical Server
- Storage Appliance
- Hardware Security Module
- Network Appliance
- Mainframe

Le Device insiste donc sur la matérialité de la ressource.

---

## 3. Node vs Device

Cette distinction est particulièrement importante dans les architectures cloud et virtualisées.

### Device

```text
Physical Server HPE DL380
```

### Node

```text
VM Payment Runtime
OpenShift Worker
Database Cluster
```

Le Device décrit le support physique.
Le Node décrit l’environnement d’exécution ou de traitement.

### Pattern

```text
Device: Physical Server
   contains/hosts
Node: OpenShift Worker
```

Le sens exact de la relation dépendra du niveau de modélisation.

---

## 4. Node peut contenir Node

Une architecture hiérarchique peut être représentée avec plusieurs niveaux de Node.

```text
Node: OpenShift Production Cluster
  ├─ Node: Control Plane
  ├─ Node: Worker Pool A
  └─ Node: Worker Pool B
```

Puis, si nécessaire :

```text
Worker Pool A
  ├─ Node: Worker 01
  ├─ Node: Worker 02
  └─ Node: Worker 03
```

La granularité doit répondre au concern.

Une vue exécutive n’a probablement pas besoin de chaque worker.
Une vue HA peut en avoir besoin.

---

## 5. Virtual Machine : Node ou Device ?

Une VM est généralement mieux représentée comme `Node` parce qu’elle constitue un environnement computationnel logique.

```text
Node: Payment VM
System Software: Linux
Artifact: payment-engine.jar
```

Le serveur physique sous-jacent peut être représenté comme Device si le concern l’exige.

---

## 6. Conteneur : Node ou Artifact ?

Il faut distinguer l’image et l’instance d’exécution.

### Image de conteneur

```text
Artifact: payment-orchestrator:2.4.1
```

### Environnement d’exécution

Un Pod ou un environnement de conteneur peut être modélisé comme Node lorsque sa présence architecturale est pertinente.

Mais il ne faut pas mécaniquement transformer chaque Pod Kubernetes en Node.

Le bon niveau peut être :

```text
Node: OpenShift Runtime
Artifact: Payment Orchestrator Container Image
```

plutôt que 50 pods individuels.

---

## 7. System Software

Un **System Software** représente un logiciel qui fournit ou contribue à un environnement pour stocker, exécuter et utiliser des logiciels ou données déployés.

### Exemples

- Linux
- Windows Server
- Red Hat OpenShift
- Kubernetes
- CRI-O
- JVM
- IBM WebSphere Application Server
- PostgreSQL
- Oracle Database
- Kafka
- NGINX

---

## 8. Application Component vs System Software

### Application Component

Logiciel participant directement à la logique applicative du SI.

```text
Payment Orchestrator
Fraud Engine
Limit Management System
```

### System Software

Logiciel fournissant un environnement d’exécution ou une plateforme.

```text
OpenShift
Kafka
PostgreSQL
Linux
```

Cette distinction est fondamentale dans un modèle enterprise.

---

## 9. System Software vs Technology Service

Exemple :

```text
System Software: PostgreSQL
Technology Service: Relational Database Service
```

PostgreSQL représente la technologie.
Le service exprime ce que cette technologie expose à ses consommateurs.

Autre exemple :

```text
System Software: OpenShift
Technology Service: Container Execution Service
```

---

## 10. System Software sur un Node

Pattern classique :

```text
Node: OpenShift Worker
  ├─ System Software: Linux
  ├─ System Software: CRI-O
  └─ System Software: OpenShift Node Software
```

Autre pattern :

```text
Node: Database Cluster
  └─ System Software: PostgreSQL
```

---

## 11. MayaBank Baseline

Avant modernisation :

```text
Device: Physical Server
  ↓
Node: Payment VM
  ↓
System Software: Linux
  ↓
System Software: WebSphere
  ↓
Artifact: payment-ear.ear
```

La pile technologique est fortement couplée à une VM et à un middleware spécifique.

---

## 12. MayaBank Target

```text
Node: OpenShift Production Cluster
  ↓
Node: Worker Pool
  ↓
System Software: OpenShift
  ↓
Technology Service: Container Execution Service
  ↓
Artifact: payment-orchestrator container image
```

Le changement n’est pas seulement une substitution d’infrastructure.
Il modifie le modèle d’exécution, de déploiement et d’exploitation.

---

## 13. Cloud : Node, Device ou Service ?

Dans le cloud, il faut éviter de forcer la notion de Device si le matériel physique n’est pas pertinent.

### Exemple IaaS

```text
Node: Cloud VM
System Software: Linux
```

### Exemple PaaS

```text
Technology Service: Managed Database Service
```

Si le fournisseur masque totalement le runtime physique, le service peut suffire.

---

## 14. Kubernetes Control Plane

Selon le concern, le control plane peut être représenté par :

```text
Node: OpenShift Control Plane
System Software: Kubernetes Control Plane
```

Mais pour une vue métier ou application, ce niveau est probablement inutile.

La modélisation doit rester orientée concern.

---

## 15. Cluster vs nœuds individuels

### Vue capacité / HA

On peut montrer :

```text
OpenShift Cluster
  ├─ Worker 1
  ├─ Worker 2
  ├─ Worker 3
  └─ Worker 4
```

### Vue solution

On peut se limiter à :

```text
OpenShift Production Cluster
```

Les deux sont corrects si le concern diffère.

---

## 16. Anti-pattern : confondre produit commercial et concept

`Azure`, `AWS`, `OpenShift`, `VMware` sont des noms commerciaux ou technologiques.

ArchiMate demande d’abord :

> Quel concept représente ce nom dans cette vue ?

Exemples :

```text
OpenShift → System Software
Azure VNet → Communication Network
Azure VM → Node
Azure SQL Database → Technology Service, éventuellement System Software/Node selon le niveau
```

Le choix dépend du sens, pas du logo.

---

## 17. Questions de contrôle

### Q1
Un serveur physique ?

**Réponse : Device.**

### Q2
Une VM ?

**Réponse : généralement Node.**

### Q3
Un cluster Kubernetes ?

**Réponse : Node**, lorsqu’on représente l’environnement computationnel.

### Q4
Linux ?

**Réponse : System Software.**

### Q5
OpenShift ?

**Réponse : System Software** lorsqu’on représente la plateforme logicielle.

### Q6
Un container image ?

**Réponse : Artifact.**

### Q7
Un Pod ?

**Réponse : peut être représenté comme Node si le concern justifie ce niveau, mais il n’est pas nécessaire de modéliser chaque pod individuellement.**

### Q8
Une base PostgreSQL managée ?

**Réponse : souvent Technology Service dans une vue consommateur ; le moteur peut être System Software dans une vue plus détaillée.**

---

## À retenir

> **Device = matériel physique ; Node = environnement computationnel ; System Software = logiciel de plateforme/runtime.**

Ces trois concepts permettent de décrire une pile technique sans mélanger matériel, environnement logique et logiciel de plateforme.