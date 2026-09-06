# Artifact & Deployment — du logiciel logique à ce qui est réellement déployé

L’`Artifact` est le principal concept de structure passive de la Technology Layer.

Il permet de répondre à une question très concrète :

> **Sous quelle forme déployable, stockée ou matérialisée un élément applicatif ou une donnée est-il réalisé ?**

---

## 1. Artifact

Un **Artifact** représente une donnée utilisée ou produite dans un processus de développement logiciel, ou par le déploiement et l’exploitation d’un système IT.

### Exemples

- fichier JAR ;
- EAR/WAR ;
- image de conteneur ;
- package RPM ;
- manifeste Kubernetes ;
- Helm chart ;
- fichier de configuration ;
- schéma SQL ;
- table physique ;
- schéma Avro ;
- binaire exécutable.

---

## 2. Application Component vs Artifact

### Application Component

Concept logique de structure applicative.

```text
Application Component: Payment Orchestrator
```

### Artifact

Forme déployable ou matérialisée.

```text
Artifact: payment-orchestrator:2.4.1
```

Le composant applicatif est réalisé par un ou plusieurs artifacts.

---

## 3. Data Object vs Artifact

### Data Object

Donnée logique destinée au traitement automatisé.

```text
Data Object: Payment Transaction
```

### Artifact

Réalisation physique ou déployée.

```text
Artifact: PAYMENT_TRANSACTION table
Artifact: payment-event.avsc
```

Cette séparation permet de représenter logique et physique sans les confondre.

---

## 4. Business Object → Data Object → Artifact

Pattern extrêmement utile :

```text
Business Object: Payment Order
        ↓ realized by
Data Object: Payment Transaction
        ↓ realized by
Artifact: PAYMENT_TRANSACTION table
```

Trois niveaux :

1. concept métier ;
2. représentation logique applicative ;
3. matérialisation technique.

---

## 5. Artifact → Node

Un artifact peut être déployé sur un Node.

```text
Artifact: payment-orchestrator:2.4.1
        ↓ deployed on
Node: OpenShift Production Runtime
```

Le runtime peut lui-même être supporté par du System Software.

```text
Node: OpenShift Worker
  └─ System Software: OpenShift / CRI-O
```

---

## 6. Container image

Une image de conteneur est un excellent exemple d’Artifact.

```text
Application Component: Payment Orchestrator
        ↓ realized by
Artifact: registry/mayabank/payment-orchestrator:2.4.1
        ↓ deployed on
Node: OpenShift Runtime
```

Il n’est pas nécessaire de représenter le digest SHA ou chaque layer Docker sauf concern spécifique.

---

## 7. Kubernetes manifest

Un manifeste peut également être Artifact :

```text
Artifact: payment-orchestrator-deployment.yaml
Artifact: payment-orchestrator-service.yaml
Artifact: payment-orchestrator-config.yaml
```

Mais une vue exécutive ne doit pas devenir un catalogue YAML.

Pour une vue GitOps, ces artifacts peuvent être pertinents.

---

## 8. Helm chart

```text
Artifact: payment-platform Helm Chart
```

Le chart peut participer au déploiement de plusieurs artifacts applicatifs.

Dans une vue de delivery :

```text
Git Repository
  → Helm Chart Artifact
  → Deployment Process
  → OpenShift Cluster
```

---

## 9. Java legacy

Baseline MayaBank :

```text
Application Component: Legacy Payment Engine
        ↓ realized by
Artifact: payment.ear
        ↓ deployed on
Node: Payment VM
        ↓
System Software: WebSphere Application Server
```

Cette chaîne rend la dépendance au middleware visible.

---

## 10. Target container

```text
Application Component: Payment Orchestrator
        ↓ realized by
Artifact: payment-orchestrator container image
        ↓ deployed on
Node: OpenShift Cluster
        ↓ supported by
System Software: OpenShift
```

Le modèle compare clairement les modèles d’hébergement.

---

## 11. Database artifacts

### Logique

```text
Data Object: Payment Transaction
```

### Physique

```text
Artifact: PAYMENT_TX table
Artifact: PAYMENT_INDEX index
Artifact: payment_schema.sql
```

Il ne faut pas nécessairement modéliser chaque table. On choisit les artifacts utiles au concern.

---

## 12. Kafka schema

```text
Application Event: Payment Authorized
Data Object: Payment Authorized Message
Artifact: payment-authorized.avsc
System Software: Kafka
Technology Service: Event Streaming Service
```

Le schéma Avro est un Artifact ; l’événement ne l’est pas.

---

## 13. Configuration

Les configurations significatives peuvent être Artifacts :

```text
Artifact: Payment Routing Configuration
Artifact: Fraud Rules Configuration
Artifact: OpenShift Deployment Configuration
```

Mais il faut éviter les détails éphémères qui n’apportent pas de valeur architecturale.

---

## 14. Secrets

Un secret matérialisé peut être un Artifact si la vue l’exige, mais il est souvent plus pertinent de modéliser :

```text
Technology Service: Secrets Management Service
System Software: Secrets Platform
```

Le modèle ne doit évidemment pas contenir la valeur réelle des secrets.

---

## 15. Infrastructure as Code

Des templates IaC peuvent être représentés comme Artifacts :

```text
Artifact: Terraform AKS Module
Artifact: OpenShift Cluster Definition
Artifact: Network Policy Bundle
```

Ils peuvent participer à un Technology Process de provisioning.

---

## 16. CI/CD et Artifact

Pattern :

```text
Source Code
  ↓ build
Artifact: Container Image
  ↓ stored in
Artifact Repository
  ↓ deployed by
Technology Process: Deployment
  ↓
Node: Runtime Cluster
```

ArchiMate peut donc représenter la chaîne de livraison au niveau architectural.

---

## 17. GitOps

MayaBank utilise GitOps.

```text
Artifact: Desired State Manifest
        ↓ processed by
System Software: Argo CD
        ↓ supports
Technology Process: Reconcile Cluster State
        ↓ deploys
Artifact: Application Container Image
        ↓ on
Node: OpenShift Cluster
```

Argo CD est ici System Software de plateforme.

---

## 18. Artifact Repository

Un registre de conteneurs peut être modélisé comme Node/System Software/Technology Service selon le concern.

Exemple :

```text
System Software: Container Registry
Technology Service: Artifact Storage Service
Artifact: Payment Orchestrator Image
```

---

## 19. Artifact vs Deliverable

Cette confusion avec Implementation & Migration est importante.

### Artifact

Élément technique de données/déploiement.

```text
Container Image
SQL Schema
Configuration File
```

### Deliverable

Résultat de travail défini dans une transformation.

```text
Validated Payment Platform Release
Migration Runbook
Production Readiness Package
```

Un Deliverable peut contenir ou regrouper des Artifacts, mais les concepts ne sont pas interchangeables.

---

## 20. Artifact ArchiMate vs Artifact TOGAF

Le même mot existe dans TOGAF avec un sens différent.

### ArchiMate Artifact

Concept technologique déployable/matérialisé.

### TOGAF Artifact

Représentation d’architecture de type Catalog, Matrix ou Diagram.

Ne jamais supposer qu’ils sont synonymes.

---

## 21. Pattern complet MayaBank

```text
Business Object: Payment Order
        ↓
Data Object: Payment Transaction
        ↓
Artifact: payment-schema.sql

Application Component: Payment Orchestrator
        ↓
Artifact: payment-orchestrator:2.4.1
        ↓
Node: OpenShift Production Cluster
        ↓
System Software: OpenShift
        ↓
Technology Service: Container Execution Service
```

Ce pattern relie métier, application et technologie.

---

## 22. Questions de contrôle

### Q1
`payment-service.jar` ?

**Réponse : Artifact.**

### Q2
`Payment Service` logique ?

**Réponse : Application Service.**

### Q3
`Payment Component` ?

**Réponse : Application Component.**

### Q4
`PAYMENT_TX` table ?

**Réponse : Artifact** si l’on modélise la matérialisation physique.

### Q5
`Payment Transaction` logique ?

**Réponse : Data Object.**

### Q6
Une image OCI ?

**Réponse : Artifact.**

### Q7
Un Helm chart ?

**Réponse : Artifact.**

### Q8
Un livrable de projet nommé « Production Readiness Package » ?

**Réponse : Deliverable**, pas Artifact, dans Implementation & Migration.

---

## À retenir

> **Application Component = structure logique ; Data Object = donnée logique ; Artifact = réalisation déployable ou physique.**

L’Artifact est le concept qui permet de passer proprement de la conception applicative à la réalité du déploiement.