# 5 — Éléments, relations, vues et viewpoints

## 5.1 Les quatre briques à distinguer

Un modèle ArchiMate utilise quatre notions qu’il faut absolument séparer :

1. **Element** ;
2. **Relationship** ;
3. **View** ;
4. **Viewpoint**.

Les confondre conduit rapidement à des modèles incohérents.

---

## 5.2 Element

Un **Element** représente un concept architectural.

Exemples :

- Business Actor ;
- Capability ;
- Application Component ;
- Node ;
- Goal ;
- Work Package.

Un élément possède un type qui lui donne sa sémantique.

Exemple :

```text
Payment Orchestrator
Type = Application Component
```

Le nom décrit l’instance.

Le type décrit ce qu’elle signifie dans le langage.

---

## 5.3 Relationship

Une **Relationship** exprime une dépendance sémantique entre deux concepts.

Exemples :

```text
Payment Orchestrator
   realizes
Payment Routing Service
```

```text
Payment Operations Role
   assigned to
Handle Payment Exception Process
```

```text
Payment Validation Process
   accesses
Payment Instruction
```

Une relation doit être choisie pour son sens, pas pour obtenir une ligne visuellement pratique.

---

## 5.4 View

Une **View** est ce que l’on montre à une audience pour répondre à un concern donné.

Exemple :

> Le Head of Payments veut comprendre comment la modernisation améliore le service client.

La vue pourrait montrer :

```text
Driver
Goal
Capability
Business Service
Application Services majeurs
Work Packages principaux
```

Elle n’a aucune raison d’afficher les détails de chaque nœud Kubernetes.

---

## 5.5 Viewpoint

Un **Viewpoint** décrit une manière de construire une vue destinée à certaines préoccupations.

Une façon simple de mémoriser :

```text
Viewpoint = règle / perspective de construction
View      = représentation obtenue
```

### Analogie

Un plan de métro et une carte routière peuvent décrire la même ville.

Ils sélectionnent des informations différentes selon le besoin.

Le viewpoint joue le rôle du type de carte.

La view est la carte concrète produite.

---

## 5.6 Stakeholder et Concern

Une vue ne doit pas être créée sans savoir à qui elle s’adresse.

### Stakeholder

Partie ayant un intérêt dans l’architecture.

Exemples :

- Sponsor ;
- Head of Payments ;
- CISO ;
- Operations ;
- Product Owner ;
- Enterprise Architect.

### Concern

Question, intérêt ou préoccupation concernant l’architecture.

Exemples :

- continuité de service ;
- coût ;
- sécurité ;
- migration ;
- responsabilité métier ;
- dépendances applicatives ;
- résilience.

---

## 5.7 Exemple : trois vues du même modèle

Considérons le même système MayaBank.

### Vue Sponsor

Question : pourquoi investir ?

```text
Driver → Goal → Capability → Outcome
```

### Vue Solution Architect

Question : comment le métier est-il supporté ?

```text
Business Process
→ Application Service
→ Application Component
→ Data Object
```

### Vue Platform Architect

Question : sur quoi tourne la solution ?

```text
Application Component
→ Artifact
→ Node
→ System Software
→ Technology Service
```

Le modèle est commun ; les vues diffèrent.

---

## 5.8 Une vue ne doit pas devenir une copie du référentiel

Une erreur fréquente consiste à afficher tous les éléments disponibles.

Un référentiel peut contenir :

- 2 000 applications ;
- 6 000 interfaces ;
- 1 500 processus ;
- 10 000 technologies.

Aucune vue humaine ne doit nécessairement montrer cette totalité.

Une vue est une **sélection intentionnelle**.

---

## 5.9 Relation vs proximité visuelle

Deux éléments placés côte à côte ne sont pas nécessairement liés sémantiquement.

Inversement, deux éléments peuvent être liés dans le modèle même si une vue particulière n’affiche pas leur relation.

Il faut donc distinguer :

- la sémantique du modèle ;
- la mise en page de la vue.

---

## 5.10 Réutilisation d’éléments

Supposons que `Payment Orchestrator` apparaisse dans quatre vues.

La bonne pratique consiste à réutiliser **le même élément** du modèle.

Ainsi, si son nom ou sa description change, toutes les vues restent cohérentes.

Créer quatre copies indépendantes du même composant détruit la valeur du référentiel.

---

## 5.11 Exemple de chaîne complète

```text
Stakeholder
Head of Payments
    │ has concern
    ▼
Concern
Payment resilience
    │ addressed by view
    ▼
View
Payment Resilience Overview
    │ built using concepts such as
    ▼
Goal → Requirement → Capability → Application Service → Technology Service
```

Cette chaîne montre que la vue doit exister pour répondre à une préoccupation.

---

## 5.12 Le bon niveau de détails

Une vue peut être :

- stratégique ;
- conceptuelle ;
- logique ;
- physique ;
- migration ;
- dépendances ;
- sécurité ;
- exploitation.

Aucune n’est “plus vraie” qu’une autre.

Elles représentent des projections différentes du même système.

---

## 5.13 Quand créer plusieurs vues ?

Créer plusieurs vues lorsqu’une seule vue oblige à mélanger trop de préoccupations.

Exemple :

Au lieu d’un seul diagramme géant :

1. Motivation View ;
2. Capability View ;
3. Business Process View ;
4. Application Cooperation View ;
5. Technology View ;
6. Migration View.

Toutes utilisent les mêmes éléments lorsque cela est pertinent.

---

## 5.14 Anti-pattern : une couleur = une sémantique inventée

Une équipe peut créer ses propres conventions visuelles, mais elle doit éviter que les couleurs remplacent les concepts ArchiMate.

Exemple mauvais :

```text
Rectangle rouge = application critique
Rectangle bleu = service
Rectangle vert = projet
```

sans utiliser les types ArchiMate réels.

Le modèle devient alors dépendant d’une légende locale.

---

## 5.15 Question : “Puis-je mettre un élément dans n’importe quelle vue ?”

Techniquement, un outil peut autoriser de nombreuses combinaisons.

Mais la question importante est :

> Cet élément est-il pertinent pour le concern et compatible avec le viewpoint choisi ?

Un bon modélisateur évite de surcharger les vues.

---

## 5.16 Exercice — View ou Viewpoint ?

### A. “Application Cooperation Viewpoint”

**Réponse :** Viewpoint.

### B. “MayaBank Payment Application Cooperation — 2027 Target”

**Réponse :** View.

### C. “Payment Orchestrator”

**Réponse :** Element.

### D. “Payment Orchestrator realizes Payment Routing Service”

**Réponse :** Relationship entre deux Elements.

---

## 5.17 Pièges fréquents

### View ≠ Viewpoint

La première est une représentation concrète.

Le second définit une perspective de construction.

### Element ≠ Shape

Une forme graphique représente un élément, mais l’élément existe dans le modèle indépendamment d’une vue donnée.

### Relationship ≠ ligne générique

Une relation possède une sémantique précise.

### Concern ≠ Requirement

Un concern est une préoccupation d’un stakeholder. Un Requirement est un besoin ou une propriété que l’architecture doit satisfaire.

---

## 5.18 Questions de compréhension

### Q1 — Pourquoi une même application peut-elle apparaître dans plusieurs vues ?

**Réponse :** parce que les vues répondent à des concerns différents tout en réutilisant le même élément du modèle.

### Q2 — Quelle différence entre View et Viewpoint ?

**Réponse :** le Viewpoint décrit la perspective et les conventions de construction ; la View est la représentation concrète produite.

### Q3 — Une relation est-elle seulement graphique ?

**Réponse :** non. Elle exprime une sémantique entre deux concepts du modèle.

### Q4 — Que faut-il déterminer avant de créer une vue ?

**Réponse :** l’audience/stakeholder et le concern auquel la vue doit répondre.

---

## À retenir

> **Element = ce qui existe dans le modèle. Relationship = comment les concepts sont liés. Viewpoint = comment regarder. View = ce que l’on montre.**
