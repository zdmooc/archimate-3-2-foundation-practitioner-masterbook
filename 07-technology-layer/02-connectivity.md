# Technology Connectivity — Collaboration, Interface, Path et Communication Network

La connectivité technologique décrit **comment les ressources techniques coopèrent et échangent**.

Les concepts principaux sont :

- `Technology Collaboration`
- `Technology Interface`
- `Path`
- `Communication Network`

---

## 1. Technology Collaboration

Une **Technology Collaboration** représente un agrégat de plusieurs éléments de structure active technologique qui travaillent ensemble pour réaliser un comportement collectif.

### Exemples

- Active/Standby Database Pair
- Multi-site Kafka Collaboration
- HA Load Balancing Collaboration
- OpenShift Ingress Collaboration

Le concept est utile lorsque la coopération elle-même a une signification architecturale.

---

## 2. Quand utiliser Collaboration

Supposons deux sites :

```text
Node: Site A Database Cluster
Node: Site B Database Cluster
```

Si l’on veut simplement montrer deux clusters, Collaboration n’est pas nécessaire.

Si l’on veut représenter l’ensemble comme une capacité technique collective :

```text
Technology Collaboration: Cross-Site Database HA
```

qui regroupe les deux clusters.

---

## 3. Technology Interface

Une **Technology Interface** représente un point d’accès où un Technology Service est disponible.

### Exemples

- Kubernetes API Endpoint
- Kafka Bootstrap Endpoint
- PostgreSQL Listener
- DNS Endpoint
- Object Storage Endpoint
- Load Balancer VIP
- Secrets API Endpoint

---

## 4. Service vs Interface

### Service

```text
Technology Service: Event Streaming Service
```

### Interface

```text
Technology Interface: kafka-prod:9093
```

Le service indique **ce qui est fourni**.
L’interface indique **où/comment ce service est accessible** au niveau architectural.

---

## 5. Application Interface vs Technology Interface

Cette distinction est importante.

```text
Application Interface: Payment REST API
Technology Interface: Ingress Endpoint
```

L’Application Interface expose un service applicatif.
La Technology Interface expose un service de plateforme/infrastructure.

---

## 6. Communication Network

Un **Communication Network** représente un ensemble de structures connectant des Nodes pour transmettre, router et recevoir des données.

### Exemples

- Corporate WAN
- Datacenter LAN
- OpenShift Cluster Network
- Azure Virtual Network
- AWS VPC Network
- Payment Processing Network
- Storage Network

---

## 7. Path

Un **Path** représente un lien entre deux ou plusieurs Nodes par lequel ils peuvent échanger des données, de l’énergie ou de la matière.

Dans un contexte IT, il est surtout utilisé pour exprimer un chemin de communication.

### Exemple

```text
Node: Payment Runtime
   ↔ Path: Payment-to-Database Path
Node: Database Cluster
```

Le Path peut utiliser ou traverser un Communication Network.

---

## 8. Path vs Communication Network

### Communication Network

Le réseau global ou partagé.

```text
Datacenter Network
```

### Path

Une relation de communication particulière entre des Nodes.

```text
Payment Runtime → Database Cluster
```

Le premier représente l’infrastructure de communication.
Le second représente une connectivité utile à une relation spécifique.

---

## 9. Exemple OpenShift

```text
Communication Network: OpenShift Cluster Network

Node: Payment Pod Runtime
Node: Fraud Service Runtime

Path: Payment-Fraud Service Path
```

Une vue technique peut aussi montrer :

```text
Technology Interface: OpenShift Ingress Endpoint
Technology Service: Ingress Service
```

---

## 10. Exemple Kafka

```text
Communication Network: Event Platform Network
Node: Payment Runtime
Node: Kafka Cluster
Path: Payment Producer Path
Technology Interface: Kafka Bootstrap Endpoint
Technology Service: Event Streaming Service
```

La relation entre ces éléments permet de distinguer réseau, chemin, point d’accès et service.

---

## 11. Exemple base de données

```text
Node: Payment Runtime
Node: PostgreSQL Cluster
Path: JDBC Database Path
Communication Network: Database Network
Technology Interface: PostgreSQL Listener
Technology Service: Relational Database Service
```

Cela répond à plusieurs concerns :

- qui communique avec quoi ?
- via quel réseau ?
- par quel endpoint ?
- pour consommer quel service ?

---

## 12. Multi-site

MayaBank possède deux sites.

```text
Node: Site A Payment Cluster
Node: Site B Payment Cluster
Communication Network: Inter-site WAN
Path: Replication Path
Technology Collaboration: Dual-Site Payment Platform
```

Ce modèle peut être complété par :

```text
Technology Service: Disaster Recovery Service
Technology Interaction: Site Failover
```

---

## 13. Cloud hybride

Exemple : datacenter ↔ Azure.

```text
Node: On-Prem Payment Gateway
Node: Azure Integration Runtime
Communication Network: Hybrid Connectivity Network
Path: Private Interconnect Path
Technology Interface: Private Endpoint
```

ArchiMate ne remplace pas un schéma réseau détaillé, mais permet de montrer les dépendances structurantes.

---

## 14. Firewall et load balancer

Un firewall physique peut être modélisé comme Device.
Un firewall virtuel/logiciel peut être System Software ou Node selon le concern.

Le service fourni peut être :

```text
Technology Service: Network Filtering Service
```

Un load balancer peut également être modélisé selon le niveau :

```text
System Software: Load Balancer
Technology Service: Load Balancing Service
Technology Interface: Payment VIP
```

---

## 15. DNS

Pattern :

```text
System Software: DNS Platform
Technology Service: Name Resolution Service
Technology Interface: DNS Endpoint
```

Le modèle s’intéresse à la fonction architecturale, pas à chaque record DNS.

---

## 16. Service mesh

Dans une vue de plateforme :

```text
System Software: Service Mesh
Technology Service: Service-to-Service Connectivity
Technology Service: mTLS Service
Technology Service: Traffic Management Service
```

Les applications consomment ces capacités sans nécessairement connaître toute l’implémentation.

---

## 17. API Gateway

Il faut distinguer les niveaux.

### Métier/applicatif

```text
Application Interface: Payment REST API
```

### Plateforme

```text
System Software: API Gateway Platform
Technology Service: API Routing Service
Technology Interface: Public API Endpoint
```

Le même produit technique peut apparaître dans plusieurs vues avec des concepts distincts si la sémantique le justifie.

---

## 18. Anti-pattern : ligne sans sémantique

Un dessin peut simplement relier :

```text
App A ----- App B
```

Mais un modèle d’architecture doit pouvoir expliquer :

- quelle relation existe ;
- quel service est consommé ;
- par quel chemin ;
- sur quel réseau ;
- éventuellement via quelle interface.

Il ne faut pas forcément tout montrer dans une seule vue, mais le modèle doit permettre cette précision.

---

## 19. Questions de contrôle

### Q1
Un VNet Azure ?

**Réponse : Communication Network.**

### Q2
Un endpoint PostgreSQL ?

**Réponse : Technology Interface.**

### Q3
Un lien logique entre une application et son cluster Kafka ?

**Réponse : Path**, si le concern porte sur cette connectivité.

### Q4
Deux clusters qui forment une solution HA commune ?

**Réponse : Technology Collaboration** peut être pertinent.

### Q5
Un endpoint REST métier ?

**Réponse : Application Interface**, pas Technology Interface, si l’on représente l’accès au service applicatif.

---

## À retenir

> **Communication Network = infrastructure de communication ; Path = chemin entre Nodes ; Interface = point d’accès ; Collaboration = coopération technique.**

Cette distinction rend les vues d’infrastructure plus précises sans les transformer en schémas réseau de niveau exploitation.