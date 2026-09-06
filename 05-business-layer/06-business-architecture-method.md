# Construire une Business Architecture ArchiMate de qualité

Une Business Architecture utile ne consiste pas à aligner tous les éléments Business Layer disponibles. Elle doit répondre à une question d’architecture précise et relier responsabilités, comportements, services, informations et offres.

---

## 1. Commencer par le concern

Avant de modéliser, formuler la question.

Exemples :

- qui est responsable du traitement d’une exception de paiement ?
- quels processus réalisent le service Instant Payment ?
- quels Business Objects sont critiques ?
- quelles applications supportent les comportements métier ?
- quelles offres sont impactées par la suppression d’un système legacy ?

Une vue différente sera probablement nécessaire pour chaque concern.

---

## 2. Étape 1 — identifier les services métier

Le Business Service est souvent un excellent point d’entrée.

Exemple :

`Instant Payment Service`

Puis demander :

- qui le consomme ?
- quel processus le réalise ?
- quels rôles exécutent ce processus ?
- quelles informations sont utilisées ?
- par quelle interface métier est-il exposé ?
- à quel Product appartient-il ?

---

## 3. Étape 2 — remonter vers les comportements internes

Exemple :

```text
Business Service: Instant Payment Service
← realized by
Business Process: Execute Instant Payment
```

Le processus peut ensuite être décomposé conceptuellement :

```text
Capture Payment
Validate Payment
Control Fraud
Execute Payment
Confirm Payment
```

Ne descends pas au niveau BPMN si ce détail n’est pas nécessaire pour le concern.

---

## 4. Étape 3 — affecter les responsabilités

```text
Role: Payment Initiator
Role: Payment Operations Specialist
Role: Fraud Analyst
```

Puis relier les rôles aux comportements appropriés.

Le but n’est pas de reproduire l’organigramme complet, mais d’identifier les responsabilités importantes pour l’architecture.

---

## 5. Étape 4 — identifier les Business Objects

Exemples :

- Payment Order
- Customer Mandate
- Payment Status
- Fraud Case

Demande ensuite :

- qui crée l’objet ?
- qui le lit ?
- qui le modifie ?
- quelle application le matérialise ?
- quelle donnée est système de référence ?

Cette étape prépare naturellement le passage vers Data/Application Architecture.

---

## 6. Étape 5 — identifier interfaces et consommateurs

Une Business Interface devient utile lorsque le mode d’accès au service fait partie du concern.

Exemples :

- Mobile Banking Channel
- Corporate Banking Portal
- Branch Counter
- Operations Desk

Ne modélise pas toutes les interfaces simplement parce qu’elles existent.

---

## 7. Étape 6 — rattacher services et contrats à un Product

Pour une vue d’offre :

```text
Product: Corporate Instant Payments
├─ Instant Payment Service
├─ Payment Status Service
├─ Exception Support Service
└─ Corporate Payments Agreement
```

Cette vue est particulièrement utile pour les stakeholders métier et produit.

---

## 8. Étape 7 — relier Strategy et Business

Une Business Architecture est plus forte lorsqu’elle explique **quelle capability elle réalise** et **quel value stream elle supporte**.

Exemple :

```text
Capability: Real-Time Payment Processing
↓
Value Stream: Deliver Instant Payment
↓
Business Process: Execute Instant Payment
↓
Business Service: Instant Payment Service
```

---

## 9. Étape 8 — relier Business et Application

Exemple :

```text
Business Process: Execute Instant Payment
↑ served by
Application Service: Payment Orchestration Service
↑ realized by
Application Component: Payment Orchestrator
```

Cette chaîne donne immédiatement une architecture traçable.

---

## 10. Baseline vs Target

### Baseline

- processus manuels ;
- responsabilités dupliquées ;
- services fragmentés ;
- interfaces multiples ;
- dépendance forte à une application legacy.

### Target

- responsabilités clarifiées ;
- process simplifiés ;
- services métier stables ;
- applications découplées ;
- plus grande automatisation.

La Business Architecture permet de vérifier qu’une migration technique correspond réellement à une amélioration métier.

---

## 11. Vue executive

Pour une direction, montrer peu d’éléments :

```text
Driver
→ Goal
→ Capability
→ Business Service
→ Product
```

Éviter les détails d’interface ou de séquence si le concern porte sur la valeur et la transformation.

---

## 12. Vue opérations

Pour les opérations :

```text
Business Event
→ Business Process
→ Business Role
→ Business Object
→ Business Service
```

Cela permet d’expliquer responsabilité, déclenchement, informations et résultat.

---

## 13. Vue transformation

Pour un programme de migration :

```text
Baseline Business Process
→ Gap
→ Target Business Process
→ Business Service
→ Work Package
```

Les éléments Implementation & Migration seront étudiés plus tard, mais la Business Layer fournit le contenu de référence.

---

## 14. Niveau de granularité

Un modèle trop fin devient illisible.

### Trop fin

- chaque validation ;
- chaque champ ;
- chaque clic utilisateur ;
- chaque message technique.

### Trop grossier

```text
Business Process: Payments
```

Ce nom ne permet aucune analyse.

### Niveau utile

```text
Initiate Payment
Validate Payment
Execute Payment
Resolve Exception
```

Assez précis pour analyser les dépendances, assez abstrait pour rester architectural.

---

## 15. Naming conventions

### Actor

Nom d’entité : `Payments Operations Team`

### Role

Nom de responsabilité : `Payment Operations Specialist`

### Process

Verbe + objet : `Execute Instant Payment`

### Function

Nom de domaine/responsabilité : `Fraud Management`

### Event

Fait survenu : `Payment Rejected`

### Service

Nom d’offre comportementale : `Instant Payment Service`

### Business Object

Nom métier : `Payment Order`

Cette discipline rend les modèles beaucoup plus faciles à lire.

---

## 16. Critères de qualité

Un bon modèle Business doit être :

- sémantiquement correct ;
- compréhensible sans explication orale permanente ;
- cohérent avec Strategy ;
- traçable vers Application ;
- adapté au stakeholder ;
- assez simple pour être maintenu.

---

## 17. Checklist avant de publier une vue

1. Quelle question cette vue répond-elle ?
2. Chaque élément est-il au bon niveau ?
3. Actor et Role sont-ils correctement séparés ?
4. Process et Function sont-ils justifiés ?
5. Service signifie-t-il réellement comportement exposé ?
6. Product est-il une offre et non une application ?
7. Les relations ont-elles une sémantique précise ?
8. Le nombre d’éléments est-il raisonnable ?
9. Les noms sont-ils métier et stables ?
10. Les liens vers Strategy/Application sont-ils visibles lorsque nécessaires ?

---

## À retenir

> **Une Business Architecture ArchiMate doit raconter qui fait quoi, pour délivrer quel service, avec quelles informations, dans quelle offre, et comment cela se relie à la stratégie et aux applications.**
