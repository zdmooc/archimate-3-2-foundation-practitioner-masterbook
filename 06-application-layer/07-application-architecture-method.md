# Construire une Application Architecture de qualité

Une bonne Application Architecture n’est pas un inventaire d’applications ni un diagramme rempli de flèches. Elle doit expliquer **comment les systèmes supportent le métier, quels services ils exposent, comment ils coopèrent, quelles données ils manipulent et comment ils évolueront**.

---

## 1. Commencer par le besoin métier

Avant de dessiner les applications, identifier :

- capabilities concernées ;
- business processes ;
- business services ;
- business objects ;
- requirements ;
- stakeholders.

### Exemple

```text
Capability: Real-Time Payment Processing
Business Process: Execute Instant Payment
Business Object: Payment Order
Requirement: 24/7 processing
Requirement: End-to-End Traceability
```

Ensuite seulement :

```text
Application Service: Payment Orchestration Service
Application Component: Payment Orchestrator
```

---

## 2. Étape 1 — Définir la portée

Questions :

- quel domaine ?
- quel produit/service métier ?
- quelle transformation ?
- quels systèmes inclus ?
- quels systèmes externes ?
- quel niveau de détail ?

MayaBank :

```text
Scope: Instant Payment Processing
In: channels, orchestration, fraud, limits, ledger, clearing integration
Out: card payments, securities, loans
```

---

## 3. Étape 2 — Cartographier le paysage applicatif

Créer une vue Landscape avec :

- principaux Application Components ;
- domaines ;
- externes ;
- legacy/target ;
- dépendances majeures.

Éviter de commencer par les endpoints.

---

## 4. Étape 3 — Identifier les services applicatifs

Pour chaque composant :

> Qu’est-ce qu’il fournit réellement à son environnement ?

Exemple :

```text
Payment Orchestrator
  - Payment Initiation Service
  - Payment Orchestration Service
  - Payment Status Service
```

Cela rend les dépendances plus stables que des flèches application-à-application.

---

## 5. Étape 4 — Identifier les comportements internes

Utiliser :

- Function pour responsabilités ;
- Process pour séquences ;
- Interaction pour comportements collectifs ;
- Event pour changements d’état.

Ne pas modéliser le code méthode par méthode.

---

## 6. Étape 5 — Modéliser les interfaces

Pour les services critiques :

- REST API ;
- partner API ;
- event interface ;
- UI ;
- file interface si nécessaire.

Exemple :

```text
Payment Initiation Service
  exposed through Payment Public API
```

---

## 7. Étape 6 — Modéliser les données

Identifier :

- Data Objects ;
- writers ;
- readers ;
- sources of truth ;
- transformations ;
- Business Object realization.

### MayaBank

```text
Payment Transaction
Fraud Assessment
Customer Limit
Payment Status
Clearing Instruction
```

---

## 8. Étape 7 — Modéliser les intégrations

Chaque dépendance importante doit avoir un sens.

Au lieu de :

```text
A → B
```

préciser :

```text
A uses Service X provided by B
```

ou :

```text
A produces Event Y consumed by B
```

ou :

```text
A writes Data Object Z read by B
```

---

## 9. Étape 8 — Séparer synchrone et asynchrone

### Synchrone

```text
Payment Orchestrator
  uses Fraud Scoring Service
```

### Asynchrone

```text
Payment Orchestrator
  produces Payment Authorized Event

Settlement Adapter
  reacts to Payment Authorized Event
```

Cette distinction influence :

- coupling ;
- availability ;
- failure modes ;
- observability ;
- migration.

---

## 10. Étape 9 — Baseline

Documenter seulement ce qui est nécessaire à l’analyse.

### MayaBank Baseline

- monolithe paiement ;
- règles fraude embarquées ;
- shared DB ;
- batch settlement ;
- interfaces point-to-point ;
- faible traçabilité.

---

## 11. Étape 10 — Target

### MayaBank Target

- Payment Orchestrator ;
- Fraud Engine ;
- Limit Service ;
- Payment Ledger ;
- API services ;
- event streaming ;
- clear data ownership ;
- observability by design.

---

## 12. Étape 11 — Gap analysis

Exemples de gaps applicatifs :

- service Payment Status absent ;
- plusieurs sources of truth ;
- API externe non standardisée ;
- aucune event backbone ;
- shared database ;
- duplicate validation logic ;
- legacy dependency.

Les gaps alimenteront Implementation & Migration.

---

## 13. Étape 12 — Transition

La cible n’arrive pas en une seule étape.

### Transition 1

```text
Legacy remains system of record
New API facade introduced
```

### Transition 2

```text
New Orchestrator handles new flows
Legacy handles residual flows
```

### Transition 3

```text
Ledger migrated
Legacy decommissioned
```

Cette progression sera reliée aux Plateaus et Work Packages.

---

## 14. View catalogue recommandé

### Application Landscape View

Comprendre le portefeuille.

### Application Cooperation View

Comprendre les dépendances entre composants et services.

### Application Usage View

Comprendre comment le métier utilise les services applicatifs.

### API View

Comprendre providers, services, interfaces et consumers.

### Event View

Comprendre producers, events, consumers et payloads.

### Data Usage View

Comprendre writers/readers et Data Objects.

### Migration View

Comprendre Baseline/Target/Transition.

---

## 15. Critères de qualité

Une vue de qualité doit :

- répondre à une question ;
- avoir une audience ;
- utiliser des éléments sémantiquement corrects ;
- conserver un niveau de granularité cohérent ;
- éviter les flèches sans sens ;
- être traçable aux requirements ;
- être lisible sans explication orale de 30 minutes.

---

## 16. Anti-pattern : architecture catalogue

```text
App1
App2
App3
App4
App5
```

Cela documente l’existence, pas l’architecture.

Ajoute les relations métier/services/data.

---

## 17. Anti-pattern : architecture produit

```text
OpenShift
Kafka
PostgreSQL
Keycloak
Prometheus
```

Ce n’est pas encore une Application Architecture.

C’est une liste technologique.

Il faut montrer ce que les applications font et pourquoi ces technologies sont nécessaires.

---

## 18. Anti-pattern : architecture endpoint

100 endpoints sur une vue unique ne montrent pas la structure de l’entreprise.

Regroupe les endpoints derrière des services/interfaces architecturales pertinentes.

---

## 19. Anti-pattern : tout est synchrone

Une flèche générique masque souvent la nature de l’intégration.

Documenter les patterns :

- request/response ;
- publish/subscribe ;
- batch/file ;
- shared data ;
- callback/webhook.

---

## 20. Anti-pattern : application = base de données

Une application ne doit pas être réduite à son DB.

Séparer :

- Application Component ;
- Data Object ;
- System Software database ;
- Artifact table/schema si nécessaire.

---

## 21. Architecture decision support

Le modèle doit aider à répondre :

- que remplace-t-on ?
- que garde-t-on ?
- quelles dépendances cassent ?
- quelles applications sont redondantes ?
- quels services sont critiques ?
- quelles données sont dupliquées ?
- quels risques apparaissent pendant la transition ?

---

## 22. Use case : choisir monolithe vs services

ArchiMate ne décide pas à ta place.

Il permet de comparer :

### Option A

```text
Single Payment Component
  realizes many services
```

### Option B

```text
Validation Component
Routing Component
Status Component
Ledger Component
```

Puis on analyse :

- dependencies ;
- change frequency ;
- ownership ;
- resilience ;
- data ;
- operations.

---

## 23. Use case : acheter un SaaS

Le SaaS peut être représenté par :

- Application Component si la solution concrète est importante ;
- Application Service si seul le service fourni compte ;
- Business Actor pour le fournisseur externe selon la vue.

Le niveau dépend de la connaissance et du concern.

---

## 24. Use case : external clearing

```text
Business Actor: Clearing Network
Application Service: Clearing Connectivity Service
Application Component: Clearing Adapter
Data Object: Clearing Instruction
```

Le modèle distingue partenaire, service applicatif, composant local et donnée.

---

## 25. Questions de revue d’architecture

Avant de valider une vue :

1. chaque Component a-t-il une responsabilité claire ?
2. les Services sont-ils réellement exposés ?
3. les Interfaces sont-elles des points d’accès et non des fonctions ?
4. Event et payload sont-ils distingués ?
5. Data Object et database sont-ils distingués ?
6. le métier est-il relié ?
7. la Technology Layer est-elle séparée ?
8. Baseline et Target sont-ils comparables ?
9. les gaps sont-ils visibles ?
10. l’audience comprend-elle la vue ?

---

## À retenir

> **Commence par le métier, exprime les services, révèle les structures, explicite les données et intégrations, puis compare Baseline et Target.**

C’est ainsi qu’une cartographie applicative devient une architecture exploitable.
