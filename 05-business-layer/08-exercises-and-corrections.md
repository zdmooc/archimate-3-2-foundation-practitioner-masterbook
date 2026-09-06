# Business Layer — Exercices et corrections

Ces exercices servent à vérifier que les concepts sont compris **par discrimination**, pas seulement mémorisés.

Essaie de répondre avant de lire la correction.

---

# Série A — Choisir le bon élément

## Q1
Une unité organisationnelle réelle gère les opérations de paiement.

A. Business Role
B. Business Actor
C. Business Function
D. Business Collaboration

**Réponse : B — Business Actor.**

On représente l’entité organisationnelle réelle capable d’exécuter des comportements.

---

## Q2
`Payment Approver` décrit une responsabilité tenue par plusieurs personnes.

A. Business Actor
B. Business Role
C. Business Service
D. Business Function

**Réponse : B — Business Role.**

---

## Q3
Deux rôles coopèrent comme une unité pour traiter une fraude complexe.

A. Grouping
B. Business Actor
C. Business Collaboration
D. Business Function

**Réponse : C — Business Collaboration.**

---

## Q4
Un portail est modélisé comme le point métier par lequel un client accède à un service.

A. Business Interface
B. Business Service
C. Application Component
D. Representation

**Réponse : A — Business Interface.**

---

## Q5
`Execute Instant Payment` décrit une séquence qui mène à un résultat métier.

A. Business Function
B. Business Process
C. Business Event
D. Capability

**Réponse : B — Business Process.**

---

## Q6
`Fraud Management` regroupe durablement des comportements liés à une responsabilité métier.

A. Business Process
B. Business Function
C. Business Interaction
D. Course of Action

**Réponse : B — Business Function.**

---

## Q7
`Joint Fraud Investigation` est réalisé collectivement par plusieurs rôles.

A. Business Interaction
B. Business Event
C. Business Service
D. Value Stream

**Réponse : A — Business Interaction.**

---

## Q8
`Payment Rejected` représente un fait métier survenu.

A. Business Function
B. Business Event
C. Business Object
D. Outcome

**Réponse : B — Business Event.**

---

## Q9
`Instant Payment Service` est ce que MayaBank expose à ses clients.

A. Business Service
B. Business Process
C. Product
D. Business Interface

**Réponse : A — Business Service.**

---

## Q10
`Payment Order` est un concept informationnel du domaine métier.

A. Representation
B. Data Object
C. Business Object
D. Artifact

**Réponse : C — Business Object.**

---

## Q11
`Payment Confirmation PDF` est la forme perceptible d’une information métier.

A. Contract
B. Representation
C. Business Object
D. Application Interface

**Réponse : B — Representation.**

---

## Q12
`Corporate Payments Agreement` formalise droits et obligations entre MayaBank et un client.

A. Requirement
B. Contract
C. Principle
D. Business Object générique uniquement

**Réponse : B — Contract.**

---

## Q13
`MayaBank Premium Banking` regroupe plusieurs services et un accord sous une offre unique.

A. Product
B. Application Component
C. Business Service
D. Capability

**Réponse : A — Product.**

---

# Série B — Confusions

## Q14 — Actor ou Role ?

`Corporate Customer` peut-il être Actor ou Role ?

**Réponse : oui, selon l’intention.**

- Actor si l’on représente une entité/organisation réelle ;
- Role si l’on représente le rôle générique de consommateur dans une interaction métier.

Le contexte est plus important que le vocabulaire naturel.

---

## Q15 — Process ou Function ?

`Payment Operations`.

**Réponse : généralement Business Function** si l’on représente une responsabilité stable.

`Resolve Payment Exception` serait plus naturellement un Business Process.

---

## Q16 — Process ou Service ?

Le client consomme `Instant Payment` mais ne connaît pas le déroulement interne.

**Réponse : Business Service** pour le comportement exposé ; le processus interne peut être `Execute Instant Payment`.

---

## Q17 — Capability ou Process ?

`Real-Time Payment Processing`.

**Réponse : Capability** si l’on exprime l’aptitude de l’entreprise.

Un processus concret peut être `Execute Instant Payment`.

---

## Q18 — Product ou Application ?

`Mobile Banking` est vendu comme offre Premium mais désigne aussi une application mobile dans certaines discussions.

**Réponse : il faut désambiguïser.**

- offre métier → Product ;
- logiciel mobile → Application Component.

Un bon modèle doit utiliser des noms qui évitent cette ambiguïté.

---

# Série C — Relations

## Q19
Un Payments Operations Team remplit le rôle Payment Operations Specialist.

Quelle sémantique de relation ?

**Réponse : Assignment.**

---

## Q20
`Execute Instant Payment` réalise `Instant Payment Service`.

**Réponse : Realization.**

---

## Q21
`Payment Order Received` provoque le démarrage de `Validate Payment`.

**Réponse : Triggering.**

---

## Q22
Une instruction de paiement circule entre deux comportements.

**Réponse : Flow.**

---

## Q23
`Execute Payment` lit et modifie `Payment Order`.

**Réponse : Access.**

---

## Q24
Une Application Service fournit son comportement au Business Process `Execute Payment`.

**Réponse : Serving.**

---

# Série D — Mini-cas MayaBank

## Cas 1 — Exception de paiement

Une transaction est rejetée. Les opérations et la fraude doivent travailler ensemble pour analyser le cas et informer le client.

### Question

Propose les éléments principaux.

### Correction possible

```text
Business Event      : Payment Rejected
Business Process    : Resolve Payment Exception
Business Roles      : Payment Operations Specialist, Fraud Analyst
Business Collaboration: Exception Resolution Collaboration
Business Interaction: Joint Fraud Investigation
Business Object     : Fraud Case
Business Service    : Payment Exception Resolution Service
Representation      : Customer Exception Notification
```

---

## Cas 2 — Offre Corporate Payments

MayaBank commercialise une offre entreprise comprenant initiation de paiements, reporting et support d’exception, sous contrat.

### Correction possible

```text
Product:
Corporate Payments Package

Business Services:
- Payment Initiation Service
- Payment Reporting Service
- Exception Support Service

Contract:
Corporate Payments Agreement
```

Les API techniques ne doivent pas remplacer ces Business Services dans la vue métier.

---

## Cas 3 — Migration d’une application legacy

Le `Legacy Payment Engine` doit être supprimé.

### Mauvaise réponse

```text
Legacy Engine → New Engine
```

### Bonne démarche

Identifier d’abord :

1. Business Services supportés ;
2. Business Processes dépendants ;
3. Business Objects manipulés ;
4. Roles impactés ;
5. Products dépendants.

Puis relier ces éléments à l’Application Layer pour analyser l’impact.

---

# Série E — Corriger le modèle

## Q25

Modèle :

```text
Business Actor: Fraud Analyst
Business Process: Fraud Management
Business Product: Kafka
```

Que corriger ?

### Correction

`Fraud Analyst` est probablement mieux modélisé comme Business Role.

`Fraud Management` est probablement une Business Function si l’on décrit une responsabilité durable.

`Kafka` n’est pas un Product métier ; il sera représenté plus tard comme élément technologique selon l’intention.

---

## Q26

Modèle :

```text
Business Service: Validate Payment
Business Process: Instant Payment Service
```

### Correction

Probablement inversé :

```text
Business Process: Validate/Execute Payment
Business Service: Instant Payment Service
```

Le service est exposé ; le processus est interne.

---

## Q27

Modèle :

```text
Business Object: payment_order SQL table
```

### Correction

Le Business Object devrait exprimer le concept métier :

```text
Business Object: Payment Order
```

La table SQL appartient à un niveau de réalisation technique plus bas.

---

# Série F — Questions Practitioner

## Q28

Une banque veut représenter les responsabilités indépendamment des équipes actuelles afin de préparer une externalisation. Quel concept doit être privilégié pour les responsabilités ?

A. Business Actor
B. Business Role
C. Business Product
D. Application Component

**Réponse : B.**

La séparation Role/Actor permet de changer l’entité responsable sans redéfinir la responsabilité.

---

## Q29

Un architecte veut montrer comment plusieurs processus internes produisent un comportement consommable par un client sans exposer le détail interne. Quel concept représente le comportement consommable ?

A. Business Function
B. Business Service
C. Business Event
D. Business Object

**Réponse : B.**

---

## Q30

Le modèle doit montrer une offre commerciale comprenant trois services et un accord contractuel. Quel concept doit être au centre ?

A. Product
B. Business Collaboration
C. Capability
D. Representation

**Réponse : A.**

---

# Score de maîtrise

- **0–15 bonnes réponses** : revoir les concepts de base.
- **16–22** : compréhension correcte, distinctions encore fragiles.
- **23–27** : bon niveau Foundation.
- **28–30** : très bonne maîtrise de la Business Layer ; passer aux scénarios cross-layer.

Ce barème est pédagogique et ne correspond pas à un barème officiel de certification.

---

## À retenir

> **Tu maîtrises la Business Layer lorsque tu peux choisir le bon élément sans regarder le nom naturel utilisé par l’entreprise.**
