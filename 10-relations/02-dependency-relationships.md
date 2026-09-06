# Relations de dépendance — Serving, Access, Influence, Association

Les relations de dépendance expriment qu’un élément **fournit quelque chose**, **accède à quelque chose**, **influence quelque chose**, ou possède un lien utile mais non plus précisément qualifié.

---

## 1. Serving

`Serving` signifie qu’un élément fournit sa fonctionnalité à un autre élément.

### Exemple Business/Application

```text
Application Service: Payment Status Service
  Serving → Business Process: Inform Customer
```

Le service applicatif fournit une fonctionnalité utilisée par le processus métier.

### Exemple Technology/Application

```text
Technology Service: Event Streaming Service
  Serving → Application Component: Payment Orchestrator
```

Le service technologique fournit une capacité technique au composant applicatif.

### Serving vs Realization

```text
Realization = réalise une abstraction
Serving = fournit une fonctionnalité à un consommateur
```

Exemple :

```text
Payment Validation Function
  Realization → Payment Validation Service

Payment Validation Service
  Serving → Execute Instant Payment Process
```

---

## 2. Access

`Access` représente l’accès d’un comportement ou d’une structure active à un élément passif.

L’accès peut être qualifié comme :

- lecture ;
- écriture ;
- lecture/écriture.

### Exemple

```text
Application Function: Validate Payment
  Access(read) → Data Object: Customer Limit

Application Function: Record Payment
  Access(write) → Data Object: Payment Transaction
```

### Access vs Flow

`Access` exprime l’utilisation d’un objet passif.

`Flow` exprime qu’une information, une valeur ou un objet est transféré d’un élément vers un autre.

```text
Fraud Check
  Access(read) → Fraud Rules
```

n’est pas la même chose que :

```text
Validation Process
  Flow(Payment Request) → Fraud Check
```

---

## 3. Influence

`Influence` exprime qu’un élément de motivation affecte un autre élément de motivation.

L’influence peut être positive ou négative selon le contexte et la notation utilisée.

### Exemple

```text
Driver: Increasing Instant Payment Volume
  Influence(+) → Goal: Improve Scalability

Constraint: Limited Migration Window
  Influence(-) → Goal: Accelerate Migration
```

Le modèle doit rendre compréhensible la nature de l’influence ; un simple signe sans contexte est rarement suffisant dans un modèle professionnel.

### Influence vs Serving

`Influence` appartient au raisonnement de motivation.

`Serving` appartient à la fourniture fonctionnelle.

Une réglementation peut influencer un objectif ; elle ne « sert » pas cet objectif.

---

## 4. Association

`Association` exprime une relation non spécifiée ou un lien pertinent lorsqu’aucun type plus précis n’est requis.

C’est la relation la plus générique du langage.

### Quand l’utiliser

Lorsque le modèle veut simplement montrer qu’un concept est associé à un autre sans affirmer une sémantique plus forte.

### Quand ne pas l’utiliser

Si l’on sait que :

- A réalise B → `Realization` ;
- A sert B → `Serving` ;
- A accède à B → `Access` ;
- A déclenche B → `Triggering`.

Dans ces cas, `Association` ferait perdre de l’information.

---

## 5. Exemple MayaBank

```text
Technology Service: Identity Service
  Serving → Application Component: Payment API

Application Function: Validate Customer
  Access(read) → Data Object: Customer Profile

Driver: Fraud Increase
  Influence → Goal: Strengthen Fraud Controls

Risk Register Entry
  Association → Work Package: Deploy Fraud Controls
```

La dernière association n’est pertinente que si le modèle ne veut pas affirmer un autre sens plus précis.

---

## 6. Méthode de choix

### Question 1

> Est-ce qu’un élément fournit une fonctionnalité à l’autre ?

→ `Serving`.

### Question 2

> Un comportement utilise-t-il une information passive ?

→ `Access`.

### Question 3

> Sommes-nous dans Motivation avec un effet positif/négatif ?

→ `Influence`.

### Question 4

> Aucun sens plus précis n’est-il nécessaire ?

→ éventuellement `Association`.

---

## 7. Pièges

1. `Serving` n’est pas « dépend de techniquement » au sens vague.
2. `Access` n’est pas réservé aux bases de données.
3. `Influence` ne doit pas remplacer toute relation entre éléments de Motivation.
4. `Association` ne doit jamais devenir la relation par défaut d’un modèle mal analysé.

---

## À retenir

```text
Serving = fournit à
Access = lit/écrit
Influence = affecte
Association = lien générique
```
