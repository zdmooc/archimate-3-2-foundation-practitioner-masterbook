# Stakeholder, Concern, Viewpoint et View

Cette chaîne est au cœur de la communication architecturale.

---

## 1. Stakeholder

Un `Stakeholder` est une personne, un groupe ou une organisation ayant un intérêt dans les effets de l’architecture.

Exemples MayaBank :

- CIO ;
- Head of Payments ;
- Enterprise Architect ;
- Solution Architect ;
- Platform Architect ;
- CISO ;
- Operations Manager ;
- Program Director ;
- Green IT Lead ;
- Risk Officer.

---

## 2. Concern

Un `Concern` correspond à un intérêt, une préoccupation ou un sujet important pour un stakeholder dans le contexte de l’architecture.

Exemples :

```text
CIO
Concern: simplification du SI et time-to-market

CISO
Concern: exposition, séparation des responsabilités, chiffrement

Program Director
Concern: séquencement des vagues et dépendances

Green IT Lead
Concern: consommation, consolidation, décommissionnement
```

Le concern explique **pourquoi la vue existe**.

---

## 3. Viewpoint

Le `Viewpoint` définit une manière de construire une vue pour répondre à un ou plusieurs concerns.

Il détermine notamment :

- le niveau d’abstraction ;
- les concepts à privilégier ;
- les relations à montrer ;
- les éléments à masquer ;
- l’audience principale.

---

## 4. View

La `View` est le résultat concret.

Exemple :

```text
Viewpoint: Application Usage
View: Instant Payment Business-to-Application Support
```

Cette vue peut montrer :

```text
Business Process: Execute Instant Payment
Application Service: Payment Orchestration Service
Application Component: Payment Orchestrator
Application Component: Fraud Engine
```

---

## 5. Une matrice simple de sélection

| Stakeholder | Concern | Vue utile |
|---|---|---|
| CIO | vision globale / impact | Layered / Strategy / Capability |
| Head of Payments | fonctionnement métier | Business Process / Product |
| Solution Architect | dépendances applicatives | Application Cooperation / Usage |
| Platform Architect | déploiement | Technology / Deployment |
| Program Director | migration | Implementation & Migration |
| CISO | contrôles / exposition | Motivation + Application + Technology |
| Operations | run / dépendances | Technology / Application Cooperation |
| Green IT Lead | consommation / consolidation | Technology + Physical + Migration |

---

## 6. Mauvais réflexe : choisir le viewpoint avant le concern

Mauvaise démarche :

```text
"Je vais faire une Layered View parce que je l’aime bien."
```

Meilleure démarche :

```text
1. Qui doit décider ?
2. Quelle question doit être résolue ?
3. Quel niveau de détail est nécessaire ?
4. Quelle vue répond à ce besoin ?
```

---

## 7. Exemple MayaBank — même sujet, trois audiences

### CIO

Question : la transformation réduit-elle la complexité et améliore-t-elle la capacité temps réel ?

Vue :

```text
Driver → Goal → Capability → Target Platform → Target Plateau
```

### Solution Architect

Question : comment les composants coopèrent-ils ?

Vue :

```text
API Gateway → Payment Orchestrator → Fraud Engine → Kafka → Ledger Adapter
```

### Operations

Question : où sont les dépendances critiques d’exploitation ?

Vue :

```text
Application Components → Artifacts → OpenShift → Kafka/PostgreSQL → Nodes → Sites
```

Le sujet est identique. La vue est différente.

---

## 8. Concern vs Requirement

Un concern n’est pas une exigence.

```text
Concern: disponibilité 24/7
Requirement: RTO < 15 min
```

Le concern exprime le sujet de préoccupation.
Le requirement formalise une propriété à satisfaire.

---

## 9. Stakeholder vs Business Actor

Un stakeholder est défini par son **intérêt dans l’architecture**.
Un business actor est défini par sa **capacité à exécuter un comportement métier**.

La même personne réelle peut être représentée différemment selon la vue.

---

## 10. Checklist

Avant de créer une vue :

- stakeholder identifié ;
- concern explicite ;
- décision attendue connue ;
- niveau d’abstraction choisi ;
- viewpoint adapté ;
- contenu minimal suffisant ;
- relations lisibles ;
- légende si nécessaire.

---

## À retenir

> **Une bonne vue commence par le stakeholder et son concern, pas par l’outil de dessin.**
