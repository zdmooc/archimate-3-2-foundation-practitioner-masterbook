# 1 — Pourquoi ArchiMate ?

## 1.1 Le problème qu’ArchiMate résout

Une entreprise complexe ne possède pas une seule architecture. Elle possède simultanément :

- des objectifs stratégiques ;
- des capacités métier ;
- des processus ;
- des produits et services ;
- des applications ;
- des données ;
- des plateformes techniques ;
- des infrastructures ;
- des programmes de transformation ;
- des dépendances entre tous ces éléments.

Le problème apparaît lorsque chaque équipe décrit cette réalité avec son propre vocabulaire.

Un métier parle de **capability**, de produit et de parcours client. Une équipe applicative parle de composants, d’API et de services. Une équipe infrastructure parle de clusters, de nœuds, de réseau et de stockage. Un programme de transformation parle de lots, de jalons et de cible.

Sans langage commun, les diagrammes deviennent des dessins locaux difficiles à relier.

**ArchiMate fournit ce langage commun.**

Il permet de représenter différents domaines de l’entreprise avec une sémantique cohérente et de montrer comment ils se relient.

---

## 1.2 ArchiMate n’est pas un outil de dessin

Cette distinction est fondamentale.

ArchiMate est un **langage de modélisation d’architecture d’entreprise**.

Un outil comme Archi, Sparx Enterprise Architect ou un éditeur compatible permet de créer les modèles. Mais l’outil n’est pas le langage.

De la même manière :

- UML n’est pas draw.io ;
- BPMN n’est pas Camunda Modeler ;
- SQL n’est pas DBeaver ;
- ArchiMate n’est pas Archi.

Un diagramme peut être visuellement élégant et pourtant être sémantiquement faux.

L’objectif d’ArchiMate est d’apporter :

1. un vocabulaire ;
2. des concepts précisément définis ;
3. des relations sémantiques ;
4. des règles de combinaison ;
5. des mécanismes de vues adaptés aux stakeholders.

---

## 1.3 Modèle, diagramme et réalité

Il faut distinguer trois niveaux.

### Réalité

La banque possède réellement des équipes, des applications, des plateformes, des flux et des processus.

### Modèle

Le modèle est une représentation structurée d’une partie de cette réalité.

### Vue

Une vue sélectionne une partie du modèle pour répondre à une préoccupation donnée.

Ainsi, un même **Application Component** peut apparaître :

- dans une vue d’intégration ;
- dans une vue de migration ;
- dans une vue de sécurité ;
- dans une vue de dépendances métier ;
- dans une vue technologique.

Ce n’est pas cinq applications différentes. C’est **le même élément du modèle montré dans cinq vues**.

C’est une différence majeure avec une collection de dessins indépendants.

---

## 1.4 Exemple : MayaBank

MayaBank veut moderniser ses paiements instantanés.

Une présentation PowerPoint pourrait montrer :

```text
Canal Mobile
   ↓
API
   ↓
Paiement
   ↓
Kafka
   ↓
Clearing
```

Le dessin donne une intuition, mais plusieurs questions restent ambiguës :

- « Canal Mobile » est-il un acteur, une application ou un canal métier ?
- « API » représente-t-elle une interface, un service applicatif ou une technologie ?
- « Paiement » est-il un processus métier, une capability ou une application ?
- « Kafka » est-il représenté comme produit, nœud, system software ou service technologique ?
- le clearing est-il un service externe, une application ou un acteur ?

ArchiMate oblige à clarifier ces choix.

On pourrait par exemple distinguer :

```text
Customer
   ↓ uses
Mobile Payment Service
   ↓ supported by
Payment Initiation Business Process
   ↓ uses
Payment API Application Service
   ↓ realized by
Payment Orchestrator Application Component
   ↓ uses
Event Streaming Technology Service
   ↓ realized by
Kafka Platform / System Software
```

Le modèle devient plus précis parce que chaque élément possède une signification.

---

## 1.5 À quoi sert ArchiMate en pratique ?

### Comprendre un système complexe

ArchiMate permet de représenter plusieurs niveaux sans perdre leur relation.

### Communiquer avec plusieurs audiences

Une direction générale n’a pas besoin de la même vue qu’un architecte technique.

### Analyser les dépendances

Exemple :

> Si l’application Legacy Payment Engine disparaît, quels processus métier, services, interfaces et infrastructures sont impactés ?

### Modéliser une transformation

ArchiMate peut représenter :

- Baseline ;
- Target ;
- Plateaus ;
- Gaps ;
- Work Packages ;
- Deliverables ;
- dépendances de transformation.

### Relier stratégie et technologie

Une transformation peut être suivie depuis un **Driver** jusqu’à un **Node** ou un **Artifact**.

Exemple :

```text
Driver: Instant payment regulation
→ Goal: 24/7 real-time payment capability
→ Requirement: End-to-end processing < target latency
→ Capability: Real-Time Payment Processing
→ Business Process: Execute Payment
→ Application Service: Payment Orchestration
→ Application Component: Payment Orchestrator
→ Technology Service: Container Runtime
→ Node: OpenShift Worker
```

C’est cette continuité qui rend le langage puissant.

---

## 1.6 ArchiMate n’est pas TOGAF

TOGAF et ArchiMate sont complémentaires mais différents.

### TOGAF

Répond principalement à :

> **Comment conduire et gouverner le travail d’architecture ?**

### ArchiMate

Répond principalement à :

> **Comment représenter et communiquer l’architecture ?**

TOGAF fournit notamment une méthode de développement d’architecture.

ArchiMate fournit un langage de modélisation.

On peut donc utiliser ArchiMate pour représenter des architectures produites pendant les phases TOGAF.

Mais ArchiMate ne remplace pas l’ADM et TOGAF n’impose pas qu’ArchiMate soit utilisé.

---

## 1.7 ArchiMate n’est pas UML

UML est principalement orienté vers la conception et la description de systèmes logiciels.

ArchiMate opère à un niveau plus large d’architecture d’entreprise.

### UML excelle pour

- classes ;
- séquences ;
- composants logiciels détaillés ;
- états ;
- interactions techniques.

### ArchiMate excelle pour

- stratégie ;
- capabilities ;
- organisation ;
- processus métier ;
- applications ;
- technologie ;
- transformation ;
- dépendances cross-layer.

Un architecte peut utiliser les deux.

ArchiMate peut dire **quelle application supporte quel processus métier** ; UML peut détailler ensuite la structure interne de cette application.

---

## 1.8 ArchiMate n’est pas BPMN

BPMN est spécialisé dans la modélisation détaillée de processus.

ArchiMate permet aussi de représenter un Business Process, mais généralement à un niveau architectural.

Exemple :

```text
ArchiMate
Customer Onboarding Process
   ↓
BPMN
Start → Verify Identity → Risk Check → Open Account → Notify Customer
```

ArchiMate situe le processus dans l’entreprise.

BPMN peut décrire précisément son déroulement.

---

## 1.9 Le principe de réduction de complexité

Un modèle d’architecture n’a pas pour objectif de montrer toute la réalité.

Il doit montrer **la bonne partie de la réalité pour répondre à une question**.

Une vue contenant 300 éléments est rarement meilleure qu’une vue contenant 20 éléments soigneusement sélectionnés.

La qualité d’un modèle dépend de :

- la justesse sémantique ;
- la cohérence ;
- la lisibilité ;
- la pertinence pour l’audience ;
- la capacité à répondre à une question.

---

## 1.10 Les trois réflexes d’un bon modélisateur

### Réflexe 1 — Quel concept est-ce réellement ?

Avant de dessiner, demander :

> Est-ce un acteur, un rôle, un comportement, un service, une information ou une capacité ?

### Réflexe 2 — Quelle relation exprime réellement le sens ?

Ne pas utiliser automatiquement Association.

Demander :

> Est-ce que A réalise B ? sert B ? déclenche B ? accède à B ? est composé de B ?

### Réflexe 3 — Pour qui construis-je cette vue ?

Une vue existe pour une audience et un concern.

---

## 1.11 Mini-cas : remplacer une application legacy

MayaBank veut remplacer `Legacy Payment Engine`.

Une mauvaise approche consiste à commencer directement par :

```text
Legacy Payment Engine → New Payment Engine
```

La vraie question d’architecture est plus large :

1. quels services métier dépendent de l’application ?
2. quels processus les utilisent ?
3. quelles données sont manipulées ?
4. quelles interfaces existent ?
5. quelles autres applications dépendent d’elle ?
6. quelle infrastructure l’héberge ?
7. quelles capabilities doivent rester disponibles ?
8. quels work packages réalisent la migration ?

ArchiMate permet de représenter ces dépendances dans un modèle commun.

---

## 1.12 Pièges fréquents

### Piège — Tout appeler “service”

Business Service, Application Service et Technology Service appartiennent à des niveaux différents.

### Piège — Confondre produit et application

Un Product ArchiMate est une offre cohérente de services et d’éléments associés. Ce n’est pas un logiciel.

### Piège — Confondre capability et application

Une capability décrit une **aptitude de l’entreprise**. Une application est un élément du paysage applicatif.

### Piège — Transformer le modèle en inventaire technique

ArchiMate peut représenter la technologie, mais sa valeur vient particulièrement des relations entre stratégie, métier, application et technologie.

### Piège — Utiliser Association partout

Association est volontairement générique. Une relation plus précise doit être préférée lorsqu’elle exprime correctement la sémantique.

---

## 1.13 Questions de compréhension

### Q1 — Quelle est la différence fondamentale entre ArchiMate et Archi ?

**Réponse :** ArchiMate est le langage ; Archi est un outil permettant de créer des modèles utilisant ce langage.

### Q2 — Pourquoi une vue n’est-elle pas le modèle complet ?

**Réponse :** parce qu’une vue sélectionne les éléments et relations pertinents pour répondre à un concern d’une audience donnée.

### Q3 — TOGAF et ArchiMate sont-ils concurrents ?

**Réponse :** non. TOGAF fournit principalement une méthode et des mécanismes de gouvernance d’architecture ; ArchiMate fournit un langage de modélisation.

### Q4 — Pourquoi ne faut-il pas commencer par les technologies ?

**Réponse :** parce qu’une architecture doit généralement expliquer la valeur, le besoin, les comportements et les dépendances avant de détailler la réalisation technique.

### Q5 — Quel est le principal bénéfice du cross-layer modeling ?

**Réponse :** rendre visibles les dépendances entre stratégie, métier, applications, technologie et transformation.

---

## À retenir

> **ArchiMate transforme des dessins d’architecture en un modèle sémantique cohérent.**

Le langage devient particulièrement utile lorsqu’on doit expliquer **pourquoi une transformation existe, ce que l’entreprise doit savoir faire, comment le métier fonctionne, quelles applications le supportent, sur quelles technologies elles reposent et comment la transition sera réalisée**.
