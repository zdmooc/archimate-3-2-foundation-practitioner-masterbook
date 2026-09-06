# Business Layer — Confusions critiques et méthode de choix

Ce chapitre rassemble les confusions qui coûtent le plus de points à l’examen et le plus de temps en modélisation réelle.

L’objectif n’est pas de réciter des définitions, mais de répondre rapidement à la question :

> **Quel concept exprime le mieux ce que je veux réellement dire ?**

---

## 1. Actor vs Role

### Actor

Entité réelle capable d’exécuter un comportement.

### Role

Responsabilité ou rôle joué par un acteur.

### Test rapide

```text
"qui existe dans l’organisation ?"
→ Actor

"quelle responsabilité cette entité joue-t-elle ?"
→ Role
```

### MayaBank

```text
Actor: Payments Operations Team
Role : Payment Operations Specialist
```

---

## 2. Role vs Stakeholder

### Role

Responsabilité d’exécution métier.

### Stakeholder

Intérêt dans les effets de l’architecture.

Exemple :

```text
Stakeholder: Head of Payments
Role       : Payment Approver
```

Une même personne réelle peut être représentée différemment selon le concern du modèle.

---

## 3. Collaboration vs Grouping

### Collaboration

Coopération métier ayant une sémantique collective.

### Grouping

Mécanisme générique d’organisation d’éléments.

```text
"ils travaillent ensemble"
→ Collaboration

"je veux juste les regrouper dans la vue"
→ Grouping
```

---

## 4. Interface vs Service

### Interface

Point d’accès.

### Service

Comportement exposé.

```text
Business Interface: Corporate Banking Portal
Business Service  : Instant Payment Service
```

Ne remplace pas un Service par une Interface simplement parce que les deux sont visibles depuis l’extérieur.

---

## 5. Business Interface vs Application Interface

### Business Interface

Point d’accès métier à un Business Service.

### Application Interface

Point d’accès technique/applicatif à un Application Service.

Exemple :

```text
Business Interface   : Corporate Banking Portal
Application Interface: Payments REST API
```

Le premier est un canal métier ; le second est un point d’accès applicatif.

---

## 6. Process vs Function

### Process

Séquence de comportements orientée vers un résultat.

### Function

Regroupement stable de comportements selon une responsabilité/compétence.

```text
Function: Fraud Management
Process : Investigate Suspicious Payment
```

### Question décisive

> Est-ce que je veux montrer un flux ou une responsabilité durable ?

Flux → Process.
Responsabilité durable → Function.

---

## 7. Process vs Interaction

### Process

Met l’accent sur l’enchaînement.

### Interaction

Met l’accent sur le comportement collectif de plusieurs participants.

```text
Process    : Resolve Payment Exception
Interaction: Joint Fraud Investigation
```

---

## 8. Process vs Event

### Process

Comportement qui se déroule.

### Event

Changement d’état ou fait métier survenu.

```text
Process: Execute Payment
Event  : Payment Rejected
```

Un nom au passé est souvent un indice d’Event, mais ce n’est pas une règle formelle.

---

## 9. Process vs Service

### Process

Comportement interne.

### Service

Comportement exposé.

```text
Process: Execute Instant Payment
Service: Instant Payment Service
```

Le consommateur n’a pas besoin de connaître le processus interne pour consommer le service.

---

## 10. Function vs Capability

### Function

Comportement métier regroupé selon une responsabilité.

### Capability

Aptitude que l’entreprise possède ou doit posséder.

```text
Capability: Fraud Detection
Function  : Fraud Management
```

La capability est davantage stratégique ; la function est opérationnelle/comportementale.

---

## 11. Capability vs Process

```text
Capability: Real-Time Payment Processing
Process   : Execute Instant Payment
```

Une capability peut être réalisée par plusieurs processus, rôles, applications et ressources.

Un Process n’est donc jamais un synonyme de capability.

---

## 12. Business Service vs Application Service

### Business Service

Comportement métier exposé.

### Application Service

Comportement applicatif exposé.

```text
Business Service   : Instant Payment Service
Application Service: Payment Orchestration Service
```

Le second peut soutenir le premier.

---

## 13. Business Object vs Data Object

### Business Object

Concept métier.

### Data Object

Donnée structurée manipulée automatiquement.

```text
Business Object: Payment Order
Data Object    : Payment Order Record
```

---

## 14. Business Object vs Representation

### Business Object

Concept informationnel.

### Representation

Forme perceptible de ce concept.

```text
Business Object: Payment Status
Representation : Payment Confirmation
```

---

## 15. Product vs Business Service

### Product

Offre cohérente proposée comme un tout.

### Service

Comportement exposé individuel.

```text
Product:
Corporate Payment Package

Services:
- Instant Payment Service
- Reporting Service
- Payment Status Service
```

---

## 16. Product vs Application

C’est l’un des pièges les plus dangereux pour un architecte IT.

```text
Product              : MayaBank Premium Banking
Application Component: Mobile Banking Application
```

Le Product est l’offre métier.
L’application soutient cette offre.

---

## 17. Contract vs Requirement

### Contract

Accord entre fournisseur et consommateur.

### Requirement

Propriété qui doit être satisfaite.

```text
Requirement: service available 24/7
Contract   : Corporate Payments SLA
```

---

## 18. Business Event vs Application Event

### Business Event

Fait métier.

### Application Event

Changement d’état au niveau applicatif.

```text
Business Event   : Payment Rejected
Application Event: Rejection Notification Generated
```

Dans une architecture événementielle, il faut être particulièrement rigoureux pour ne pas confondre événement métier et événement technique.

---

## 19. Tableau de décision rapide

| Si la question est… | Élément probable |
|---|---|
| Qui est l’entité réelle ? | Business Actor |
| Quelle responsabilité ? | Business Role |
| Qui coopère collectivement ? | Business Collaboration |
| Où le service est accessible ? | Business Interface |
| Quel flux produit un résultat ? | Business Process |
| Quelle responsabilité comportementale stable ? | Business Function |
| Quel comportement collectif ? | Business Interaction |
| Quel fait métier est survenu ? | Business Event |
| Quel comportement est exposé ? | Business Service |
| Quel concept métier est manipulé ? | Business Object |
| Sous quelle forme l’information est-elle perceptible ? | Representation |
| Quel accord encadre l’offre ? | Contract |
| Quelle offre cohérente est proposée ? | Product |

---

## 20. Exercice MayaBank

Classe chaque élément :

1. Payments Operations Team
2. Payment Approver
3. Execute Payment
4. Payment Rejected
5. Fraud Management
6. Instant Payment Service
7. Payment Order
8. Payment Confirmation PDF
9. Corporate Payments Agreement
10. Corporate Instant Payment Package

### Correction

1. Business Actor
2. Business Role
3. Business Process
4. Business Event
5. Business Function
6. Business Service
7. Business Object
8. Representation
9. Contract
10. Product

---

## À retenir

> **La meilleure réponse n’est pas le terme le plus familier ; c’est le concept dont la sémantique correspond exactement à l’intention du modèle.**
