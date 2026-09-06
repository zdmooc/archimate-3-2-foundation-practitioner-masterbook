# Partie V — Business Layer : comment l’entreprise agit et délivre de la valeur

La **Business Layer** décrit l’organisation métier, ses responsabilités, ses comportements, ses services, ses informations et les offres qu’elle fournit.

Elle permet de répondre à des questions comme :

- **Qui agit ?** → `Business Actor`, `Business Role`, `Business Collaboration`
- **Par quel point de contact un service est-il exposé ?** → `Business Interface`
- **Que fait le métier ?** → `Business Process`, `Business Function`, `Business Interaction`
- **Qu’est-ce qui déclenche ou signale un changement ?** → `Business Event`
- **Quel comportement est exposé à un consommateur ?** → `Business Service`
- **Quelle information métier est manipulée ?** → `Business Object`
- **Sous quelle forme cette information devient-elle perceptible ?** → `Representation`
- **Quel accord encadre une offre ou une interaction ?** → `Contract`
- **Quelle offre cohérente est proposée au client ?** → `Product`

---

## 1. La chaîne mentale Business

```text
WHO
Actor / Role / Collaboration
    ↓
WHAT THEY DO
Process / Function / Interaction / Event
    ↓
WHAT THEY EXPOSE
Business Service via Business Interface
    ↓
WHAT INFORMATION THEY USE
Business Object / Representation / Contract
    ↓
WHAT IS OFFERED
Product
```

Cette chaîne est pédagogique : elle aide à lire une architecture, mais elle ne signifie pas que tous les modèles doivent contenir tous ces éléments.

---

## 2. Pourquoi la Business Layer est centrale

Une architecture d’entreprise ne doit pas commencer par les applications.

Avant de demander :

> Quelle application remplaçons-nous ?

il faut souvent demander :

- quel service métier doit être rendu ?
- quel processus produit ce service ?
- quel rôle en porte la responsabilité ?
- quels objets métier sont utilisés ?
- quelle valeur est offerte au client ?

Les applications viendront ensuite soutenir ces comportements.

---

## 3. Exemple MayaBank : paiement instantané

MayaBank veut représenter son activité de paiement instantané.

### Active Structure

- `MayaBank` — Business Actor
- `Payments Operations Team` — Business Actor
- `Payment Operations Specialist` — Business Role
- `Fraud Analyst` — Business Role
- `Payment Operations Collaboration` — Business Collaboration
- `Mobile Banking Channel` — Business Interface, si le modèle veut montrer un point métier d’accès au service

### Behavior

- `Initiate Instant Payment` — Business Process
- `Perform Fraud Control` — Business Function ou Process selon l’intention de modélisation
- `Resolve Payment Exception` — Business Process
- `Payment Rejected` — Business Event
- `Instant Payment Service` — Business Service

### Passive Structure

- `Payment Order` — Business Object
- `Customer Mandate` — Business Object
- `Payment Status` — Business Object
- `Payment Confirmation` — Representation si l’on veut représenter une forme perceptible communiquée au client
- `Payment Service Agreement` — Contract

### Product

- `MayaBank Instant Payment Offering` — Product

Le Product peut regrouper une offre cohérente de services et d’éléments associés. Il ne représente pas l’application technique de paiement.

---

## 4. Business Layer vs Strategy

La Strategy Layer décrit davantage :

- les capacités ;
- les ressources ;
- les value streams ;
- les courses of action.

La Business Layer décrit davantage :

- les acteurs et responsabilités ;
- les comportements opérationnels ;
- les services métier ;
- les objets et offres métier.

Exemple :

```text
Capability: Real-Time Payment Processing
        ↓ realized by / supported through business behavior
Business Process: Execute Instant Payment
        ↓ exposes
Business Service: Instant Payment Service
```

La capability exprime une aptitude.
Le process exprime un comportement.
Le service exprime un comportement exposé.

---

## 5. Business Layer vs Application Layer

Cette confusion est extrêmement fréquente.

### Business

- `Payment Operations Specialist`
- `Execute Payment`
- `Instant Payment Service`
- `Payment Order`

### Application

- `Payment Orchestrator`
- `Payment Validation Function`
- `Payment API Service`
- `Payment Data Object`

Le métier décrit **ce que l’entreprise fait**.
L’application décrit **comment un système logiciel automatise ou supporte une partie de ce comportement**.

---

## 6. Les trois familles du Business Layer

### 6.1 Active Structure

Qui est capable d’exécuter un comportement métier ?

- Business Actor
- Business Role
- Business Collaboration
- Business Interface

### 6.2 Behavior

Que fait le métier ?

- Business Process
- Business Function
- Business Interaction
- Business Event
- Business Service

### 6.3 Passive Structure et offre

Qu’est-ce qui est utilisé, transporté, formalisé ou offert ?

- Business Object
- Contract
- Representation
- Product

---

## 7. Le premier grand piège : Actor vs Role

Une personne ou une organisation réelle ne doit pas être confondue avec sa responsabilité.

```text
Actor: MayaBank Payments Operations Team
Role : Payment Operations Specialist
```

Le même Actor peut jouer plusieurs Roles.
Un même Role peut être tenu par plusieurs Actors.

Cette séparation devient essentielle lorsqu’on analyse une réorganisation, une externalisation ou une automatisation.

---

## 8. Le deuxième grand piège : Process vs Function

### Process

Met l’accent sur une séquence ou un flux de comportements orienté vers un résultat.

### Function

Regroupe des comportements selon un critère, souvent une compétence ou une responsabilité stable.

Exemple :

```text
Business Function: Fraud Management
Business Process : Handle Suspicious Payment
```

`Fraud Management` existe comme fonction organisationnelle.
`Handle Suspicious Payment` décrit un déroulement orienté résultat.

---

## 9. Le troisième grand piège : Process vs Service

Un Process est un comportement interne.
Un Service est un comportement exposé à l’environnement.

```text
Business Process: Execute Instant Payment
Business Service: Instant Payment Service
```

Le service répond à :

> Qu’est-ce que le consommateur reçoit ?

Le processus répond à :

> Quel comportement interne produit ce résultat ?

---

## 10. Le quatrième grand piège : Product vs Application

Dans ArchiMate, `Product` ne signifie pas logiciel.

Un Product représente une offre cohérente de services et/ou d’éléments passifs, souvent accompagnée d’un Contract.

Exemple :

```text
Product: MayaBank Premium Account
Business Services:
- Account Management Service
- Instant Payment Service
- Card Service
Contract:
- Premium Banking Agreement
```

L’application `Core Banking System` peut réaliser ou supporter des services applicatifs qui soutiennent cette offre, mais elle n’est pas le Product.

---

## 11. Du Strategy au Business

MayaBank peut partir de :

```text
Goal: paiement instantané 24/7 fiable
↓
Capability: Real-Time Payment Processing
↓
Value Stream: Deliver Instant Payment
↓
Business Process: Execute Instant Payment
↓
Business Service: Instant Payment Service
```

Cette chaîne relie intention, aptitude, création de valeur et exécution opérationnelle.

---

## 12. Du Business vers l’Application

```text
Business Service: Instant Payment Service
↓ supported by
Application Service: Payment Orchestration Service
↓ realized by
Application Component: Payment Orchestrator
```

La séparation des niveaux évite les architectures où une technologie devient artificiellement un besoin métier.

---

## 13. Questions de contrôle

### Q1
`Payments Operations Team` est-il plutôt un Actor ou un Role ?

**Réponse : Actor**, si l’on représente l’entité organisationnelle réelle capable d’exécuter des comportements.

### Q2
`Payment Operations Specialist` ?

**Réponse : Role**, si l’on représente une responsabilité que différents acteurs peuvent tenir.

### Q3
`Execute Instant Payment` ?

**Réponse : Business Process**, si l’on modélise une séquence de comportements menant à un résultat métier.

### Q4
`Instant Payment Service` ?

**Réponse : Business Service**, si l’on modélise le comportement exposé au consommateur.

### Q5
`Payment Order` ?

**Réponse : Business Object**, si l’on représente le concept informationnel utilisé dans le domaine métier.

### Q6
`Payment Confirmation PDF` ?

**Réponse : Representation**, si l’on veut modéliser la forme perceptible sous laquelle une information est présentée.

### Q7
`Premium Banking` ?

**Réponse : Product**, si l’on modélise une offre cohérente de services/éléments proposée comme un tout.

---

## À retenir

> **Business Layer = qui agit + ce que le métier fait + ce qu’il expose + quelles informations il utilise + ce qu’il offre.**

Le bon réflexe consiste à modéliser le métier indépendamment des applications, puis à relier les deux couches explicitement.