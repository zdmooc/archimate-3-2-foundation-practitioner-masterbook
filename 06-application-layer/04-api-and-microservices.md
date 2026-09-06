# Modéliser APIs et microservices avec ArchiMate

Les architectures modernes utilisent massivement APIs, microservices et plateformes d’intégration. ArchiMate permet de les représenter, mais à condition de conserver une distinction claire entre **structure**, **service**, **interface**, **donnée** et **technologie**.

---

## 1. Une API n’est pas un seul concept ArchiMate

Le mot « API » peut désigner plusieurs choses.

### Fonctionnalité fournie

```text
Application Service: Payment Initiation Service
```

### Point d’accès

```text
Application Interface: Payment Public API
```

### Composant fournisseur

```text
Application Component: Payment Orchestrator
```

### Données échangées

```text
Data Object: Payment Request
Data Object: Payment Response
```

Le bon modèle sépare ces concepts.

---

## 2. Pattern API fournisseur

```text
Application Component
Payment Orchestrator
       ↓ realizes
Application Service
Payment Initiation Service
       ↓ exposed through
Application Interface
Payment REST API
```

Puis le consommateur utilise le service via le point d’accès.

---

## 3. Pattern API consommateur

```text
Application Component: Mobile Banking App
       ↓ uses
Application Service: Payment Initiation Service
       ↑ provided by
Application Component: Payment Orchestrator
```

Si l’interface est importante :

```text
Mobile Banking App
   → Payment REST API
   → Payment Initiation Service
```

---

## 4. Pourquoi ne pas modéliser uniquement des flèches entre applications ?

### Faible modèle

```text
Mobile App → API Gateway → Payment Engine → Fraud Engine
```

On ignore :

- quelle fonctionnalité est consommée ;
- quel contrat logique existe ;
- qui fournit réellement le service ;
- si la dépendance est synchrone ou événementielle ;
- quelles données sont échangées.

### Modèle sémantique

```text
Mobile App
   uses Payment Initiation Service

Payment Initiation Service
   realized by Payment Orchestrator

Payment REST API
   exposes Payment Initiation Service

Payment Request
   consumed by Payment Initiation Service
```

---

## 5. API Gateway

Un API Gateway peut être représenté différemment selon ce que l’on veut montrer.

### Si le gateway fait partie de la solution applicative

On peut le représenter comme `Application Component` lorsque sa responsabilité applicative est pertinente.

### Si l’on insiste sur la plateforme technique

On peut le modéliser dans Technology selon sa nature de plateforme/system software/service.

Le choix doit être cohérent avec le concern.

### MayaBank

```text
Application Component: Payment API Facade
Technology Service: API Management Service
System Software: API Management Platform
```

On sépare ainsi le rôle applicatif logique et la plateforme technique.

---

## 6. Microservice comme Application Component

Un microservice peut être modélisé comme `Application Component` lorsqu’il constitue une unité modulaire pertinente.

Exemple :

```text
Payment Validation MS
Payment Routing MS
Payment Status MS
```

Mais ArchiMate ne demande pas que chaque déploiement Kubernetes corresponde à un composant.

Le niveau dépend de l’architecture analysée.

---

## 7. Service métier vs microservice

Le terme « service » est ambigu dans le monde logiciel.

### Microservice

Structure logicielle.

```text
Application Component: Payment Status MS
```

### Application Service

Comportement exposé.

```text
Application Service: Get Payment Status
```

Un microservice peut réaliser plusieurs Application Services.

---

## 8. Bounded Context et ArchiMate

DDD `Bounded Context` n’est pas un élément natif ArchiMate.

On peut toutefois organiser le modèle autour de domaines ou groupings.

Exemple MayaBank :

```text
Payments Domain
- Payment Orchestrator
- Payment Status
- Payment Ledger

Risk Domain
- Fraud Engine
- AML Screening

Customer Domain
- Customer Profile
- Consent Management
```

Il faut documenter clairement la convention si un concept DDD est représenté par Grouping ou une autre structure.

---

## 9. API synchrone

### Exemple

```text
Payment Orchestrator
   uses Fraud Scoring Service
   exposed through Fraud REST API
   realized by Fraud Engine
```

Cette vue montre une dépendance de service.

Un diagramme de séquence pourra détailler l’ordre exact des appels.

---

## 10. API asynchrone

Une API asynchrone ou une interface événementielle peut être modélisée avec :

- Application Events ;
- Data Objects ;
- Application Services/Interfaces si la fonctionnalité exposée est pertinente ;
- Technology Services pour la plateforme de messaging.

Exemple :

```text
Payment Orchestrator
   produces Payment Authorized Event

Settlement Adapter
   reacts to Payment Authorized Event
```

La Technology Layer montrera Kafka.

---

## 11. API contract

Le contrat de l’API peut être représenté à plusieurs niveaux.

### Logique

```text
Data Object: Payment Request
Data Object: Payment Response
```

### Physique

```text
Artifact: openapi-payment-v1.yaml
```

### Business/legal

Un `Contract` Business est réservé au sens métier/accord, pas au simple schéma technique OpenAPI.

---

## 12. Versioning

ArchiMate peut représenter plusieurs états ou interfaces :

```text
Payment API v1
Payment API v2
```

Mais il faut éviter de surcharger le modèle central avec toutes les versions mineures.

Utilise la version lorsqu’elle a un impact architectural :

- coexistence ;
- migration ;
- dépendances clients ;
- décommissionnement.

---

## 13. API ownership

Une vue utile peut montrer :

```text
Payments Domain
  owns Payment Initiation Service

Payment Orchestrator
  realizes Payment Initiation Service

Partner Channel
  consumes Payment Initiation Service
```

Le langage ne fournit pas un concept générique « owner » pour tous les cas ; utilise des conventions documentées ou les relations appropriées sans surinterpréter.

---

## 14. Service granularity

Trop large :

```text
Banking Service
```

Trop fin :

```text
GetPaymentAmountField Service
```

Niveau architectural pertinent :

```text
Payment Initiation Service
Payment Status Service
Fraud Scoring Service
Limit Verification Service
```

---

## 15. API composition

MayaBank expose un service composite :

```text
Instant Payment Service
```

Il dépend de :

```text
Fraud Scoring Service
Limit Verification Service
Account Availability Service
Clearing Connectivity Service
```

Un modèle de service composition permet de comprendre les dépendances critiques.

---

## 16. Microservices et bases partagées

### Anti-pattern

```text
Payment MS ─┐
Fraud MS   ─┼→ Shared DB
Status MS  ─┘
```

### Cible

```text
Payment Ledger Component
  manages Payment Transaction

Fraud Engine
  manages Fraud Assessment

Status Service
  consumes Payment Events
```

ArchiMate aide à visualiser le couplage data.

---

## 17. Microservice et runtime

Ne mélange pas :

```text
Application Component: Payment Validation MS
Artifact: payment-validation.jar/container image
System Software: Kubernetes/OpenShift
Node: Worker Node
```

Ce sont plusieurs niveaux d’architecture.

---

## 18. API security

On peut relier Motivation et Application :

```text
Requirement: Strong Customer Authentication
Requirement: API Authorization
Requirement: End-to-End Traceability
```

puis montrer les services/interfaces concernés.

La Technology/Security architecture détaillera :

- OAuth2/OIDC ;
- mTLS ;
- WAF ;
- secrets ;
- certificates.

---

## 19. MayaBank — API Banking View

```text
Partner Application
      ↓
Partner Payment API
      ↓
Payment Initiation Service
      ↓
Payment Orchestrator
      ↓
Fraud Scoring Service ← Fraud Engine
      ↓
Limit Verification Service ← Limit Management
      ↓
Payment Ledger Service ← Payment Ledger
```

Data Objects :

```text
Payment Request
Fraud Assessment
Limit Decision
Payment Status
```

---

## 20. Questions

### Q1
Microservice Payment Status ?

**Application Component.**

### Q2
Get Payment Status ?

**Application Service.**

### Q3
`GET /payments/{id}` ?

**Application Interface** si le point d’accès est l’objet du modèle.

### Q4
OpenAPI YAML ?

**Artifact** au niveau technologique/physique.

### Q5
Payment Response logique ?

**Data Object.**

---

## À retenir

> **Une API n’est pas “une boîte API”. Modélise le fournisseur, le service, l’interface et les données séparément.**

Cette discipline rend les architectures API beaucoup plus lisibles et réutilisables.
