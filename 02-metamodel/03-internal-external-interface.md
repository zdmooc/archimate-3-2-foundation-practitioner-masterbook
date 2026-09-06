# 10 — Internal, External et Interface

## 10.1 Une distinction fondamentale

Dans ArchiMate, il est souvent utile de distinguer :

- **ce qui se passe à l’intérieur** d’un acteur, composant ou plateforme ;
- **ce qui est exposé à l’environnement** ;
- **par où cet environnement y accède**.

Cette logique explique une grande partie des différences entre :

- Function / Process ;
- Service ;
- Interface.

---

## 10.2 Internal Behavior

Un comportement interne décrit ce qu’un élément réalise en interne.

Exemples :

```text
Business Process
Execute Payment
```

```text
Application Function
Route Payment
```

```text
Technology Function
Persist Event
```

Ces comportements ne sont pas nécessairement visibles directement pour le consommateur.

---

## 10.3 External Behavior : Service

Un Service représente un comportement explicitement exposé à l’environnement.

Exemples :

```text
Business Service
Instant Payment Service
```

```text
Application Service
Payment Routing Service
```

```text
Technology Service
Event Streaming Service
```

Le service répond à :

> Quelle fonctionnalité est fournie à un consommateur ?

---

## 10.4 Interface : le point d’accès

Une Interface représente un point d’accès où un ou plusieurs services peuvent être rendus disponibles.

Exemple applicatif :

```text
Application Component
Payment Gateway

Application Interface
REST /payments

Application Service
Payment Initiation
```

L’interface répond à :

> Par où accède-t-on à la fonctionnalité ?

Le service répond à :

> Quelle fonctionnalité reçoit-on ?

---

## 10.5 Analogie simple : restaurant

### Structure active

Restaurant / équipe de cuisine.

### Comportement interne

Préparer le repas.

### Service

Servir un repas au client.

### Interface

Comptoir, salle ou application de commande par laquelle le client accède au service.

Le service et l’interface ne sont donc pas la même chose.

---

## 10.6 Business Interface

Une Business Interface est un point d’accès à des services métier.

Exemples :

- agence ;
- centre d’appel ;
- canal de relation ;
- point d’interaction organisationnel.

MayaBank :

```text
Business Interface
Mobile Banking Channel
```

peut exposer :

```text
Business Service
Instant Payment Service
```

Il faut rester au niveau métier : le canal n’est pas nécessairement l’application mobile technique elle-même.

---

## 10.7 Application Interface

Une Application Interface est un point d’accès par lequel les services applicatifs sont disponibles.

Exemples :

- REST API ;
- messaging endpoint ;
- GUI applicative ;
- service endpoint.

MayaBank :

```text
Application Interface
Payment REST API
```

expose :

```text
Application Service
Payment Initiation
```

réalisé par :

```text
Application Component
Payment API Gateway
```

---

## 10.8 Technology Interface

Une Technology Interface est un point d’accès à des services technologiques fournis par un nœud.

Exemples possibles selon le niveau de modélisation :

- endpoint réseau ;
- interface de plateforme ;
- point d’accès technique.

Le but n’est pas de reproduire toute la configuration réseau, mais de représenter un point d’accès pertinent à l’architecture.

---

## 10.9 Service vs Interface — exemple API

Le terme “API” provoque souvent une confusion.

Supposons :

`POST /payments`

On peut vouloir modéliser :

### Fonctionnalité offerte

```text
Application Service
Payment Initiation
```

### Point d’accès

```text
Application Interface
Payment REST API
```

### Fournisseur logiciel

```text
Application Component
Payment Gateway
```

Le schéma mental devient :

```text
Application Component
Payment Gateway
      │
      ├─ exposes through
      ▼
Application Interface
Payment REST API
      │
      ▼
Application Service
Payment Initiation
```

Les relations exactes doivent respecter les règles du langage, mais les trois concepts doivent rester distincts.

---

## 10.10 Service vs Function

Supposons un Fraud Engine.

### Internal

```text
Application Function
Evaluate Fraud Rules
```

### External

```text
Application Service
Fraud Screening
```

Le composant peut changer son algorithme interne sans que le contrat fonctionnel exposé au consommateur change nécessairement.

Cette séparation est précieuse en architecture.

---

## 10.11 Process vs Service

MayaBank peut avoir :

```text
Business Process
Execute Instant Payment
```

qui réalise :

```text
Business Service
Instant Payment Service
```

Le client consomme le service.

Le processus décrit comment la banque délivre ce service.

---

## 10.12 Interface vs Channel

Dans le langage naturel, “channel” peut être ambigu.

Exemple : `Mobile Channel`.

Il peut représenter :

- une Business Interface si l’on parle du canal métier ;
- un Application Component si l’on parle de l’application mobile ;
- une Application Interface si l’on parle d’un point d’accès logiciel.

Le contexte doit décider.

---

## 10.13 External vs Internal : pourquoi séparer ?

Cette séparation permet :

### Encapsulation

Le consommateur dépend du service, pas nécessairement de la réalisation interne.

### Substitution

On peut remplacer un fournisseur interne tout en conservant le même service.

### Analyse d’impact

On peut voir quels consommateurs utilisent un service même si sa réalisation change.

### Architecture orientée services

On distingue clairement contrat fonctionnel et implémentation.

---

## 10.14 Exemple de remplacement sans casser le service

Baseline :

```text
Legacy Payment Engine
realizes
Payment Routing Service
```

Target :

```text
Payment Orchestrator
realizes
Payment Routing Service
```

Le service reste conceptuellement le même alors que le composant qui le réalise change.

Cette modélisation permet d’expliquer une migration sans confondre besoin fonctionnel et solution.

---

## 10.15 Exemple cross-layer complet

```text
Business Service
Instant Payment Service
      ▲ realized by
Business Process
Execute Instant Payment
      ▲ served by
Application Service
Payment Orchestration
      ▲ realized by
Application Function
Coordinate Payment
      ▲ assigned from
Application Component
Payment Orchestrator
      ▲ served by
Technology Service
Container Execution
```

Ce modèle sépare :

- service métier ;
- comportement métier ;
- service applicatif ;
- comportement applicatif interne ;
- structure applicative ;
- service technologique.

---

## 10.16 Pièges fréquents

### API = Service

Pas nécessairement. Une API peut être modélisée comme Interface lorsqu’on veut représenter le point d’accès, tandis que la fonctionnalité offerte est un Application Service.

### Application Component = Application Service

Faux. Le composant est un fournisseur structurel ; le service est un comportement exposé.

### Business Process = Business Service

Faux. Le processus décrit le comportement interne ; le service décrit ce qui est exposé.

### Interface = UI seulement

Faux. Une interface peut être un point d’accès de différentes natures selon la couche.

---

## 10.17 Exercice MayaBank

### Situation

Le Payment Orchestrator propose une API permettant à l’application mobile de soumettre un paiement. En interne, il valide les paramètres, route le paiement et publie un événement.

### Modélisation possible

```text
Application Component
Payment Orchestrator

Application Interface
Payment REST API

Application Service
Payment Initiation

Application Function
Validate Payment

Application Function
Route Payment

Application Function
Publish Payment Event
```

Question : pourquoi ne pas tout appeler “Payment Service” ?

**Réponse :** parce que chaque concept représente une responsabilité différente : structure, point d’accès, fonctionnalité exposée et comportement interne.

---

## 10.18 Questions de compréhension

### Q1 — Que représente un Service ?

**Réponse :** un comportement explicitement exposé à l’environnement.

### Q2 — Que représente une Interface ?

**Réponse :** un point d’accès par lequel un service peut être fourni ou consommé.

### Q3 — Que représente une Function ?

**Réponse :** un comportement interne regroupé selon une responsabilité, compétence ou ressource.

### Q4 — Pourquoi séparer service et réalisation ?

**Réponse :** pour découpler ce qui est fourni de la manière dont cela est implémenté et faciliter l’analyse des transformations.

### Q5 — Une API doit-elle toujours être une Application Interface ?

**Réponse :** non. Le choix dépend de ce que l’on veut exprimer. L’API comme point d’accès se prête à Application Interface ; la fonctionnalité qu’elle offre se prête à Application Service.

---

## À retenir

> **Internal Behavior = comment cela fonctionne. Service = ce qui est fourni. Interface = par où on y accède.**
