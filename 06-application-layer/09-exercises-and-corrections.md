# Application Layer — exercices et corrections

Ces exercices vérifient la capacité à **choisir le bon élément**, **distinguer les niveaux** et **lire des architectures API/event-driven**.

---

# Partie A — Choisir le bon élément

## Q1
`Payment Orchestrator` est une unité logicielle modulaire.

**Réponse : Application Component.**

---

## Q2
`Payment Orchestration Service` représente une fonctionnalité exposée aux consommateurs.

**Réponse : Application Service.**

---

## Q3
`Payment REST API` représente le point d’accès à un service applicatif.

**Réponse : Application Interface.**

---

## Q4
`Validate Payment` représente une responsabilité automatisée interne.

**Réponse : Application Function.**

---

## Q5
`Orchestrate Instant Payment` décrit une séquence de comportements automatisés.

**Réponse : Application Process.**

---

## Q6
`Evaluate Payment Risk` est réalisé collectivement par Payment Orchestrator, Fraud Engine et Limit Service.

**Réponse : Application Interaction.**

---

## Q7
`Payment Authorized` représente un changement d’état.

**Réponse : Application Event.**

---

## Q8
`Payment Transaction` est une donnée logique utilisée par plusieurs applications.

**Réponse : Data Object.**

---

## Q9
`Payments Collaboration` regroupe plusieurs composants travaillant ensemble.

**Réponse : Application Collaboration.**

---

## Q10
Kafka lui-même, dans l’architecture technique.

**Réponse : System Software, pas Application Component.**

---

# Partie B — Confusions

## Q11 — Component ou Service ?

`Fraud Engine`.

**Application Component.** C’est la structure logicielle.

`Fraud Scoring`.

**Application Service** si l’on parle de la fonctionnalité exposée.

---

## Q12 — Interface ou Service ?

`GET /payments/{id}/status`.

**Application Interface** si le modèle représente ce point d’accès.

`Get Payment Status`.

**Application Service.**

---

## Q13 — Function ou Process ?

`Fraud Detection` comme responsabilité stable.

**Application Function.**

`Evaluate Payment from request to decision`.

**Application Process.**

---

## Q14 — Process ou Interaction ?

`Coordinate Payment` exécuté par le Payment Orchestrator.

**Application Process.**

`Fraud Decision Exchange` réalisé par plusieurs composants.

**Application Interaction.**

---

## Q15 — Event ou Data Object ?

`Payment Settled`.

**Application Event.**

`PaymentSettledPayload`.

**Data Object.**

---

## Q16 — Business Object ou Data Object ?

`Payment Order` dans le vocabulaire métier.

**Business Object.**

`Payment Transaction Record` dans les systèmes.

**Data Object.**

---

## Q17 — Data Object ou Artifact ?

`Customer Profile` modèle logique.

**Data Object.**

`CUSTOMER_PROFILE` table.

**Artifact** si l’on modélise la réalisation physique.

---

## Q18 — Application Component ou System Software ?

`Payment Status Service implementation`.

**Application Component.**

`PostgreSQL DBMS`.

**System Software.**

---

# Partie C — APIs

## Q19
Un architecte représente une API uniquement comme `Application Service`. Qu’est-ce qui manque potentiellement ?

**Correction :** si le point d’accès est important, ajouter une `Application Interface`. Le service décrit ce qui est fourni ; l’interface décrit par où on y accède.

---

## Q20
MayaBank possède `Payment Initiation Service`, accessible via REST et via une interface partenaire. Combien de services faut-il obligatoirement créer ?

**Correction :** pas nécessairement deux. Un même Application Service peut être exposé via plusieurs interfaces si la fonctionnalité fournie reste la même.

---

## Q21
Un microservice Java expose trois APIs. Doit-on créer trois Application Components ?

**Correction :** non. Le composant représente la structure logicielle. Il peut réaliser plusieurs services/interfaces.

---

## Q22
Un endpoint change de `/v1/payments` vers `/v2/payments`. Faut-il dupliquer tout le modèle ?

**Correction :** seulement si la coexistence/version a un impact architectural. Sinon, gérer ce niveau dans OpenAPI ou la documentation détaillée.

---

# Partie D — Event-driven

## Q23
Le topic Kafka `payments.authorized.v1` est modélisé comme `Application Event: Payment Authorized`. Quel est le problème ?

**Correction :** le topic est un mécanisme technique ; l’Application Event représente le fait/changement d’état.

---

## Q24
Un payload Avro est modélisé comme `Application Event`.

**Correction :** au niveau logique, il s’agit plutôt d’un Data Object ; l’Artifact peut représenter sa réalisation physique/schema.

---

## Q25
Kafka est placé comme Application Component entre deux applications.

**Correction :** si l’on représente la plateforme technique Kafka, utiliser la Technology Layer, par exemple System Software + Event Streaming Technology Service.

---

## Q26
`Payment Accepted` déclenche le Settlement Adapter. Quel concept est utile ?

**Application Event** pour le changement d’état ; le consommateur peut réagir à cet événement.

---

## Q27
Le modèle montre uniquement `Producer → Kafka → Consumer`. Pourquoi est-il insuffisant ?

**Correction :** il ne montre ni le fait produit, ni la donnée, ni le service technique. Ajouter les concepts sémantiques rend l’architecture compréhensible.

---

# Partie E — Business ↔ Application

## Q28
`Execute Instant Payment` est automatisé par `Payment Orchestrator`. Quel découpage est préférable ?

```text
Business Process: Execute Instant Payment
Application Service: Payment Orchestration Service
Application Component: Payment Orchestrator
```

Le service applicatif sert le comportement métier ; le composant réalise le service.

---

## Q29
Pourquoi ne pas relier directement `Business Process → OpenShift` ?

**Correction :** parce qu’on saute le niveau applicatif et le service fourni. OpenShift est une réalisation technique, pas la fonctionnalité consommée par le métier.

---

## Q30
Une Capability `Real-Time Payment Processing` est supportée par trois applications. Est-ce un problème ?

**Correction :** non. Une capability est une aptitude ; elle peut être supportée par de nombreux éléments. Le mapping aide justement à analyser cette couverture.

---

# Partie F — Corriger le modèle

## Q31

```text
Capability: Fraud Engine
```

**Correction :** si `Fraud Engine` désigne un logiciel, utiliser Application Component. La capability pourrait être `Fraud Detection` ou `Payment Risk Management`.

---

## Q32

```text
Application Service: PostgreSQL
```

**Correction :** PostgreSQL est un produit de base de données/system software. Un service pourrait être `Relational Database Service` ou `Persistent Data Service` au niveau Technology.

---

## Q33

```text
Application Function: Payment REST API
```

**Correction :** une API comme point d’accès est plutôt une Application Interface. La Function serait `Initiate Payment` ou `Validate Payment`.

---

## Q34

```text
Application Event: Payment JSON
```

**Correction :** `Payment JSON` est une donnée/format, pas un changement d’état. Utiliser Data Object au niveau logique.

---

## Q35

```text
Data Object: Payment Database
```

**Correction :** préciser le concept. `Payment Transaction` peut être Data Object ; `PostgreSQL` System Software ; table/schema Artifact si nécessaire.

---

# Partie G — Mini-cas MayaBank

## Q36
MayaBank veut permettre au mobile et aux partenaires d’initier des paiements via deux canaux différents mais la même fonctionnalité métier/applicative.

**Solution :**

```text
Application Service: Payment Initiation Service
Application Interfaces:
- Mobile Payment API
- Partner Payment API
Application Component:
- Payment Orchestrator
```

---

## Q37
MayaBank veut que plusieurs applications réagissent au règlement d’un paiement.

**Solution :**

```text
Application Event: Payment Settled
Consumers:
- Notification Component
- Reporting Component
- Status Component
Data Object:
- PaymentSettled Payload
```

La Technology Layer montrera le broker/streaming service.

---

## Q38
MayaBank veut supprimer une base partagée.

**Solution :** créer une vue Data Usage montrant les writers/readers actuels, puis la cible avec un composant responsable et des services/events pour les consommateurs.

---

## Q39
MayaBank veut savoir quelles activités métier tomberaient si Fraud Engine était indisponible.

**Solution :** suivre les relations depuis `Fraud Engine → Fraud Scoring Service → Business Process(es) → Business Service/Capability`.

---

## Q40
MayaBank migre progressivement Legacy Payment Engine vers Payment Orchestrator.

**Solution :** représenter Baseline, Target et une Transition Architecture avec coexistence/routing, puis les gaps associés.

---

# Partie H — Questions de niveau Practitioner

## Q41
Une vue contient 80 microservices et aucun service applicatif. Le modèle est techniquement exact mais difficile à exploiter. Quelle amélioration ?

**Correction :** créer des vues par concern et introduire les Application Services pour exprimer les fonctionnalités fournies. Garder le détail dans le modèle sans l’exposer partout.

---

## Q42
Deux composants communiquent. Faut-il créer une Application Interaction ?

**Correction :** seulement si l’on veut représenter un comportement collectif. Une simple dépendance de service ne justifie pas nécessairement une Interaction.

---

## Q43
Une API Gateway est-elle toujours Application Component ?

**Correction :** non. Le choix dépend du concern et de la nature modélisée : responsabilité applicative logique, technology service ou system software.

---

## Q44
Un SaaS externe doit-il être modélisé en détail ?

**Correction :** pas nécessairement. Si seul le comportement fourni compte, un Application Service peut suffire ; si la solution concrète compte, ajouter le Component et le fournisseur.

---

## Q45
Pourquoi l’Application Layer est-elle centrale pour l’analyse d’impact ?

**Correction :** parce qu’elle relie comportements métier, services applicatifs, composants, données et dépendances technologiques.

---

# Grille de maîtrise

Tu maîtrises cette partie si tu peux expliquer sans hésiter :

1. Component vs Service ;
2. Service vs Interface ;
3. Function vs Process ;
4. Process vs Interaction ;
5. Event vs payload ;
6. Business Object vs Data Object ;
7. Data Object vs Artifact ;
8. Application Component vs System Software ;
9. API synchrone vs event-driven ;
10. Business↔Application mapping.

---

## À retenir

> **La difficulté de l’Application Layer n’est pas de mémoriser neuf éléments. Elle est de choisir le bon concept pour le bon niveau de sens.**
