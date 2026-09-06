# Business ↔ Application Mapping — relier métier et logiciel

Le véritable intérêt d’ArchiMate apparaît lorsque la Business Layer et l’Application Layer sont reliées de manière explicite.

Une architecture applicative n’est pas un inventaire de logiciels. Elle doit montrer :

- quels comportements métier sont supportés ;
- quels services applicatifs sont utilisés ;
- quelles applications les réalisent ;
- quelles données sont manipulées ;
- où se trouvent les dépendances critiques.

---

## 1. Chaîne mentale

```text
Business Capability
      ↓
Business Process / Function
      ↓ uses
Application Service
      ↓ realized by
Application Component
      ↓ accesses
Data Object
```

Cette chaîne permet d’expliquer pourquoi une application existe.

---

## 2. Exemple MayaBank

```text
Capability: Real-Time Payment Processing
      ↓
Business Process: Execute Instant Payment
      ↓
Application Service: Payment Orchestration Service
      ↓
Application Component: Payment Orchestrator
      ↓
Data Object: Payment Transaction
```

Si le Payment Orchestrator disparaît, l’impact métier devient visible immédiatement.

---

## 3. Business Service vs Application Service

### Business Service

```text
Instant Payment Service
```

Ce que la banque offre au client.

### Application Service

```text
Payment Orchestration Service
```

Ce que le système fournit pour supporter l’exécution métier.

Le client ne consomme pas nécessairement directement le service applicatif.

---

## 4. Business Process vs Application Process

### Business Process

```text
Execute Instant Payment
```

### Application Process

```text
Orchestrate Instant Payment Transaction
```

Le second automatise tout ou partie du premier.

Une erreur fréquente consiste à modéliser le flux applicatif comme s’il était le processus métier.

---

## 5. Business Object vs Data Object

```text
Business Object: Payment Order
Data Object: Payment Transaction
```

Le Data Object peut réaliser le Business Object.

Ainsi le modèle relie :

- concept métier ;
- représentation logique applicative ;
- réalisation physique future.

---

## 6. Business Role vs application

Le rôle métier peut utiliser des services applicatifs.

Exemple :

```text
Business Role: Fraud Analyst
       uses
Application Service: Fraud Investigation Service
       realized by
Application Component: Fraud Operations Portal
```

Cette vue est utile pour l’expérience utilisateur et les dépendances opérationnelles.

---

## 7. Capability mapping

Une capability peut être supportée par plusieurs applications.

### Exemple

```text
Capability: Payment Exception Management

Applications:
- Payment Operations Portal
- Case Management
- Fraud Engine
- Payment Ledger
```

Une heatmap peut ensuite révéler :

- redondance ;
- dette technique ;
- absence de couverture ;
- dépendance excessive à une application legacy.

---

## 8. Application portfolio rationalization

MayaBank possède :

```text
Legacy Payment Engine A
Legacy Payment Engine B
New Payment Orchestrator
```

Les trois supportent partiellement :

```text
Real-Time Payment Processing
Payment Status Management
Exception Handling
```

Le mapping Capability↔Application permet d’identifier les doublons.

---

## 9. Process/Application matrix

Une vue matricielle peut montrer :

| Business Process | App A | App B | App C |
|---|---:|---:|---:|
| Initiate Payment | X | | X |
| Validate Payment | X | X | X |
| Handle Exception | X | X | |
| Track Status | | X | X |

Cette matrice ne remplace pas le modèle, mais elle exploite ses relations.

---

## 10. Service/Application matrix

| Application Service | Provider | Consumers |
|---|---|---|
| Payment Initiation | Payment Orchestrator | Mobile, Web, Partners |
| Fraud Scoring | Fraud Engine | Payment Orchestrator |
| Limit Verification | Limit Service | Payment Orchestrator |
| Status Query | Payment Status | Mobile, Operations |

Elle est très utile pour les analyses d’impact.

---

## 11. Data/Application matrix

| Data Object | Writer | Readers |
|---|---|---|
| Payment Transaction | Payment Ledger | Orchestrator, Status, Reporting |
| Fraud Assessment | Fraud Engine | Orchestrator, Operations |
| Customer Limit | Limit Service | Orchestrator |

Cette vue permet de détecter plusieurs writers ou un ownership ambigu.

---

## 12. Impact analysis

Question :

> Que se passe-t-il si Legacy Payment Engine est décommissionné ?

Le modèle peut remonter :

```text
Legacy Payment Engine
  → Application Services
  → Business Processes
  → Business Services
  → Capabilities
  → Stakeholders
```

et descendre :

```text
Legacy Payment Engine
  → Data Objects
  → Technology Dependencies
```

C’est une des principales valeurs d’un repository de modèles cohérent.

---

## 13. Criticality propagation

Si :

```text
Business Service: Instant Payment Service = Critical
```

alors les dépendances peuvent être analysées :

```text
Business Process
Application Service
Application Component
Technology Service
Node
```

ArchiMate ne calcule pas automatiquement la criticité, mais le graphe permet cette analyse.

---

## 14. Requirement traceability

Exemple :

```text
Requirement: Payment Processing 24/7
   ↓
Business Process: Execute Instant Payment
   ↓
Application Service: Payment Orchestration Service
   ↓
Application Component: Payment Orchestrator
```

Le modèle relie Motivation et réalisation.

---

## 15. Security traceability

```text
Requirement: Strong Authentication
  → Business Service: Partner Payment Service
  → Application Interface: Partner Payment API
  → Application Component: API Facade
```

Puis la Technology Layer montrera les contrôles techniques.

---

## 16. Baseline vs Target mapping

### Baseline

```text
Business Process: Execute Payment
  → Legacy Payment Engine
  → Shared DB
```

### Target

```text
Business Process: Execute Payment
  → Payment Orchestration Service
  → Payment Orchestrator
  → Fraud/Limit/Ledger services
```

Le métier reste relativement stable ; la réalisation applicative change.

---

## 17. Transition architecture

Pendant la migration :

```text
Mobile App
  → Routing Layer
      ├→ Legacy Payment Engine
      └→ New Payment Orchestrator
```

Le modèle peut montrer les deux réalisations et les work packages associés plus tard.

---

## 18. Ownership organisationnel

Le mapping Business/Application ne doit pas forcer une relation illégitime pour exprimer « owner ».

On peut documenter :

- application owner ;
- domain owner ;
- product team ;
- service owner ;

via propriétés, conventions ou relations adaptées.

La sémantique doit rester explicite.

---

## 19. Exemple complet MayaBank

```text
Goal
24/7 resilient instant payments
     ↓
Capability
Real-Time Payment Processing
     ↓
Business Process
Execute Instant Payment
     ↓
Business Service
Instant Payment Service
     ↓ supported by
Application Service
Payment Orchestration Service
     ↓ realized by
Application Component
Payment Orchestrator
     ↓ accesses
Data Object
Payment Transaction
```

Ajout d’intégrations :

```text
Payment Orchestrator
   uses Fraud Scoring Service
   uses Limit Verification Service
   produces Payment Authorized Event
```

---

## 20. Questions

### Q1
Pourquoi mapper Business Process vers Application Service plutôt que directement vers une technologie ?

**Parce que l’application fournit un comportement au métier ; la technologie réalise ensuite l’environnement nécessaire.**

### Q2
Une Capability doit-elle être identique à une application ?

**Non. Une capability est une aptitude, généralement supportée par plusieurs éléments métier/applicatifs.**

### Q3
Pourquoi distinguer Business Object et Data Object ?

**Pour séparer le sens métier de sa représentation logique automatisée.**

### Q4
Quel mapping aide le plus à rationaliser un portefeuille ?

**Capability/Application, complété par Process/Application et Service/Application.**

---

## À retenir

> **Une bonne Application Architecture explique d’abord ce qu’elle supporte.**

Le lien Business↔Application transforme une cartographie de logiciels en véritable architecture d’entreprise.
