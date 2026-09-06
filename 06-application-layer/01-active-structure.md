# Application Active Structure — Component, Collaboration et Interface

La structure active de la couche Application répond à une question fondamentale :

> **Quelles structures logicielles exécutent le comportement applicatif, travaillent ensemble et exposent leurs services ?**

Les trois concepts sont :

- `Application Component`
- `Application Collaboration`
- `Application Interface`

---

## 1. Application Component

Un **Application Component** représente une encapsulation de fonctionnalité applicative alignée sur une structure d’implémentation, modulaire et remplaçable.

### Exemples

- Payment Orchestrator
- Fraud Detection Engine
- Mobile Banking Application
- Customer Profile Service
- Limit Management System
- Notification Application

Le mot important est **structure**.

Un composant n’est pas la fonctionnalité qu’il expose. Cette fonctionnalité peut être représentée par un `Application Service`.

---

## 2. Comment choisir le bon niveau de composant

Le niveau dépend du concern.

### Vue portefeuille

```text
Payment Platform
Fraud Platform
Core Banking
CRM
```

### Vue solution

```text
Payment API Gateway
Payment Orchestrator
Validation Service
Settlement Adapter
```

### Vue très détaillée

```text
payment-validation-ms
payment-routing-ms
payment-status-ms
```

Les trois peuvent être légitimes dans des vues différentes.

Le problème n’est pas la granularité elle-même, mais l’incohérence entre éléments comparés.

---

## 3. Application Component vs Capability

### Capability

Aptitude que l’entreprise doit posséder.

```text
Real-Time Payment Processing
```

### Application Component

Structure logicielle contribuant à cette aptitude.

```text
Payment Orchestrator
```

Plusieurs applications peuvent contribuer à une capability.
Une application peut contribuer à plusieurs capabilities.

Ne pas écrire :

```text
Capability: Kafka
Capability: Payment Engine
```

si l’intention réelle est de modéliser des solutions techniques ou applicatives.

---

## 4. Application Component vs Business Actor

Un `Business Actor` représente une entité métier capable d’exécuter un comportement métier.

Un `Application Component` représente une structure logicielle.

```text
Business Actor: Payments Operations Team
Application Component: Payment Operations Portal
```

L’application peut servir ou supporter le travail de l’acteur, mais elle ne devient pas un acteur métier.

---

## 5. Application Component vs System Software

Cette distinction devient importante dans Cloud, OpenShift et Kafka.

### Application Component

Logiciel métier/applicatif :

- Payment Orchestrator
- Fraud Engine
- Customer API

### System Software

Logiciel fournissant l’environnement d’exécution ou de plateforme :

- Kubernetes
- OpenShift
- Kafka
- PostgreSQL DBMS
- Java Runtime

### Exemple MayaBank

```text
Application Component: Payment Orchestrator
Technology/System Software: OpenShift
Technology/System Software: Kafka
```

Le fait qu’un produit soit du logiciel ne suffit pas à le classer en Application Layer.

---

## 6. Application Collaboration

Une **Application Collaboration** représente un agrégat de plusieurs éléments de structure active applicative qui travaillent ensemble pour exécuter un comportement collectif.

Elle devient utile lorsque la coopération elle-même mérite d’être nommée.

### Exemple

```text
Application Collaboration: Instant Payment Processing Collaboration

Participants:
- Payment Orchestrator
- Fraud Detection Engine
- Limit Management System
- Ledger Adapter
```

Cette collaboration peut effectuer une `Application Interaction`.

---

## 7. Collaboration vs simple ensemble de composants

Ne crée pas une collaboration uniquement parce qu’un diagramme contient plusieurs applications.

Utilise `Application Collaboration` lorsque :

- plusieurs composants coopèrent réellement ;
- le comportement collectif est important ;
- la coopération est réutilisée dans plusieurs vues ;
- tu veux distinguer le collectif de ses membres.

### Mauvais réflexe

```text
Collaboration: All Applications
```

Cela n’apporte aucune sémantique.

---

## 8. Application Interface

Une **Application Interface** représente un point d’accès où des services applicatifs sont rendus disponibles.

Elle répond à :

> **Par où accède-t-on au service ?**

### Exemples

- Payment REST API
- Fraud Scoring API
- ISO 20022 Integration Interface
- Partner API
- Mobile User Interface
- Event Subscription Interface

---

## 9. Interface vs Service

C’est une confusion majeure.

### Application Service

```text
Payment Status Service
```

Répond à :

> Quelle fonctionnalité est fournie ?

### Application Interface

```text
Payment Status REST API
```

Répond à :

> Par quel point d’accès cette fonctionnalité est-elle disponible ?

Un service peut être exposé par plusieurs interfaces.

Exemple :

```text
Payment Status Service
 ├─ REST API
 ├─ Mobile UI
 └─ Partner Interface
```

Inversement, une interface peut donner accès à plusieurs services selon le niveau de modélisation.

---

## 10. Interface vs API

Une API réelle peut être représentée par une `Application Interface`, mais il faut préciser ce que le modèle veut dire.

Exemple :

```text
Application Interface: Payment Public API
```

Cette interface peut exposer :

- Initiate Payment Service
- Get Payment Status Service
- Cancel Payment Service

ArchiMate modélise ici l’architecture de l’API.

OpenAPI décrira ensuite :

- endpoints ;
- paramètres ;
- schémas JSON ;
- codes HTTP ;
- authentication details.

---

## 11. Interface vs canal métier

Un canal peut exister à plusieurs niveaux.

### Business Interface

Point d’accès métier au service.

```text
Mobile Banking Channel
```

### Application Interface

Point d’accès applicatif.

```text
Mobile Payment API
```

La distinction permet de montrer que le même service métier peut être accessible par plusieurs canaux, eux-mêmes supportés par plusieurs interfaces applicatives.

---

## 12. Pattern fournisseur de service

```text
Application Component
      ↓ realizes behavior/service
Application Service
      ↓ exposed through
Application Interface
```

Exemple :

```text
Payment Orchestrator
      ↓
Payment Initiation Service
      ↓
Payment REST API
```

La partie Relations expliquera précisément quelles relations normatives employer selon la construction choisie.

---

## 13. Pattern consommateur/fournisseur

```text
Mobile Banking Application
        uses
Payment Initiation Service
        provided by
Payment Orchestrator
```

La vue peut ajouter l’interface si le point d’accès est pertinent :

```text
Mobile Banking App
      → Payment REST API
      → Payment Initiation Service
      → Payment Orchestrator
```

Le but est de rendre lisible :

1. consommateur ;
2. point d’accès ;
3. service ;
4. fournisseur.

---

## 14. Pattern microservices

MayaBank possède :

- Payment Validation Service
- Payment Routing Service
- Payment Status Service

On peut modéliser :

```text
Application Components
- Payment Validation MS
- Payment Routing MS
- Payment Status MS
```

et leurs services :

```text
Application Services
- Validate Payment
- Route Payment
- Get Payment Status
```

Le modèle peut ensuite montrer les dépendances sans transformer ArchiMate en diagramme de classes ou de code.

---

## 15. Application Landscape

Une vue Landscape répond à :

- quelles applications existent ?
- quelles zones métier supportent-elles ?
- quelles sont les principales dépendances ?
- quelles applications sont legacy/target ?

### MayaBank

```text
Channels
- Mobile Banking
- Web Banking

Payments
- Legacy Payment Engine
- Payment Orchestrator
- Payment Status Service

Risk
- Fraud Engine
- AML Screening

Core
- Core Banking
- Ledger
```

Le modèle détaillé peut contenir plus d’éléments, mais la vue Landscape doit rester lisible.

---

## 16. Baseline vs Target

### Baseline

```text
Legacy Payment Engine
- règles intégrées
- interfaces point-to-point
- dépendance forte au batch
```

### Target

```text
Payment Orchestrator
Fraud Engine
Limit Service
Event-driven integrations
API services
```

ArchiMate permet de garder les deux états dans le même modèle ou dans des vues clairement séparées.

---

## 17. Anti-patterns

### Une application = une boîte sans sémantique

```text
App A → App B → App C
```

On sait qu’elles sont reliées, mais pas pourquoi.

Meilleur :

```text
App A uses Customer Verification Service realized by App B
```

### Toute API = Application Service

Une API est souvent mieux comprise comme **interface** ; la fonctionnalité fournie reste un service.

### Tout microservice = niveau obligatoire

Le niveau dépend de l’audience.

### Kafka comme Application Component métier

Cela brouille Application et Technology.

---

## 18. Exercices rapides

### Q1
`Fraud Detection Engine` ?

**Application Component.**

### Q2
`Instant Payment Processing Collaboration`, ensemble nommé de plusieurs composants coopérants ?

**Application Collaboration.**

### Q3
`POST /instant-payments` comme point d’accès architectural ?

**Application Interface.**

### Q4
`Instant Payment Initiation` comme fonctionnalité offerte ?

**Application Service.**

### Q5
OpenShift ?

**Pas Application Component dans ce contexte ; plutôt Technology/System Software.**

---

## À retenir

> **Component = structure logicielle. Collaboration = coopération de structures. Interface = point d’accès. Service = comportement exposé.**

Cette distinction suffit à corriger une grande partie des diagrammes applicatifs ambigus.
