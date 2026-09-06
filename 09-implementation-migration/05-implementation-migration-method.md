# Construire une Implementation & Migration Architecture de qualité

Une bonne architecture de migration ne commence pas par un calendrier. Elle commence par les **états d’architecture** et par les **écarts** qui doivent être fermés.

---

## 1. Étape 1 — Définir le concern

Avant de modéliser, préciser ce que la vue doit aider à décider.

Exemples :

- ordre de migration ;
- dépendances entre chantiers ;
- coexistence legacy/cible ;
- data cutover ;
- décommissionnement ;
- readiness pour un go-live ;
- réduction du risque ;
- architecture transitoire ;
- fermeture de gaps.

Une vue destinée au comité d’investissement sera différente d’une vue destinée aux architectes de migration.

---

## 2. Étape 2 — Modéliser Baseline et Target

Créer deux états compréhensibles.

### Baseline

Uniquement les éléments utiles à la transformation.

### Target

Uniquement les éléments qui matérialisent les changements structurants.

Éviter de créer deux inventaires exhaustifs illisibles.

---

## 3. Étape 3 — Identifier les Gaps

Comparer Baseline et Target.

Pour chaque changement, poser :

> Qu’est-ce qui existe dans la cible mais pas dans la baseline ?

> Qu’est-ce qui doit disparaître ?

> Qu’est-ce qui doit être modifié ?

> Qu’est-ce qui doit être conservé temporairement ?

Exemples :

- missing API governance ;
- missing OpenShift runtime ;
- duplicated business rules ;
- legacy database coupling ;
- missing observability ;
- manual deployment ;
- missing DR automation.

---

## 4. Étape 4 — Regrouper les Gaps en Work Packages

Un Work Package doit produire un résultat cohérent.

Mauvais découpage :

```text
WP create namespace
WP create route
WP create secret
WP add dashboard
```

Trop technique pour une roadmap d’entreprise.

Meilleur découpage :

```text
WP Platform Foundation
WP Integration Foundation
WP Payment Core Modernization
WP Migration Wave 1
WP Legacy Exit
```

---

## 5. Étape 5 — Définir les Deliverables

Pour chaque Work Package, demander :

> Qu’est-ce qui doit exister pour considérer le travail comme réellement livré ?

Exemple :

```text
WP: Platform Foundation
```

Deliverables :

- production platform ;
- IAM integration ;
- observability ;
- backup/restore ;
- operational runbook ;
- security evidence.

Cela améliore fortement la gouvernance Phase G.

---

## 6. Étape 6 — Identifier les Implementation Events

Les événements doivent correspondre à des changements d’état significatifs.

Exemples :

- Platform Ready ;
- Pilot Go-Live ;
- Target DB Becomes Authoritative ;
- Legacy Writes Disabled ;
- Legacy Powered Off.

Ne pas représenter tous les meetings ou checkpoints administratifs.

---

## 7. Étape 7 — Créer les Transition Plateaus

Un Transition Plateau est justifié lorsque l’état intermédiaire possède :

- une durée significative ;
- une architecture spécifique ;
- des règles d’exploitation particulières ;
- des risques propres ;
- des dépendances temporaires.

Exemple :

```text
Hybrid Plateau
- target APIs active
- legacy core remains authoritative
- Kafka active for migrated events
- dual reconciliation enabled
```

---

## 8. Étape 8 — Séquencer

Identifier les dépendances structurantes.

Questions :

- quel work package fournit un prérequis ?
- quel deliverable doit exister avant le suivant ?
- quels travaux peuvent être parallèles ?
- quelles migrations dépendent d’un data cutover ?
- quel decommission dépend de la fermeture de quels flux ?

---

## 9. Étape 9 — Ajouter rollback et exit

Deux omissions sont fréquentes :

### Rollback

Le modèle doit montrer comment un état stable précédent peut être retrouvé si nécessaire.

### Exit

Chaque composant temporaire et chaque legacy doit avoir un chemin de sortie.

Un Transition Plateau sans Work Package de sortie est un risque d’architecture.

---

## 10. Étape 10 — Tracer vers Motivation et Requirements

Chaque grand Work Package devrait pouvoir être justifié.

```text
Driver
→ Goal
→ Requirement
→ Gap
→ Work Package
→ Deliverable
→ Plateau
```

Si un Work Package majeur n’a aucun lien avec un Gap, une Requirement ou un objectif, demander pourquoi il existe.

---

## 11. Étape 11 — Tracer vers Business/Application/Technology

Un Work Package doit modifier quelque chose dans l’architecture.

Exemple :

```text
WP: Implement Payment Orchestrator
→ creates/changes
Application Component: Payment Orchestrator
→ enables
Application Service: Payment Orchestration Service
→ supports
Business Process: Execute Instant Payment
```

---

## 12. Étape 12 — Adapter la vue au stakeholder

### Executive view

- 4–7 Work Packages ;
- 3–5 Plateaus ;
- principaux gaps ;
- bénéfices ;
- grandes dépendances.

### Program view

- work packages détaillés ;
- deliverables ;
- events ;
- dependencies ;
- transition states.

### Architecture governance view

- requirements ;
- target elements ;
- work packages ;
- deliverables ;
- compliance points.

---

## 13. Tests de qualité

### Test 1 — Every Gap Has a Response

Chaque gap important doit être traité par au moins un Work Package ou une décision explicite.

### Test 2 — Every Work Package Has a Reason

Chaque Work Package doit être relié à un besoin architectural.

### Test 3 — Every Temporary Element Has an Exit

Adapters, bridges, dual-write, legacy routing doivent avoir une fin prévue.

### Test 4 — Plateaus Are Actually Stable

Un Plateau n’est pas chaque micro-étape du projet.

### Test 5 — Target Removes Obsolete Elements

La cible ne doit pas simplement ajouter de nouvelles technologies.

### Test 6 — Data Authority Is Explicit

À chaque plateau, il doit être possible de comprendre qui est source de vérité pour les domaines critiques.

### Test 7 — Operational Readiness Exists

La transformation doit inclure exploitation, observabilité, sécurité, backup et DR.

---

## 14. Anti-patterns

### Technology Shopping List

```text
Kafka
OpenShift
API Gateway
Grafana
```

sans Gap ni objectif.

### Big Bang by Default

Choisir un big bang alors que la coexistence est possible et que le risque n’est pas justifié.

### Eternal Hybrid

Architecture transitoire qui devient permanente par absence de sortie.

### Data Migration Last Minute

Traiter la donnée seulement quelques jours avant le cutover.

### No Decommission

Le roadmap finit au go-live de la cible, mais pas à l’arrêt de la baseline.

### Project Plan Masquerading as Architecture

Des centaines de tâches sans lecture architecturale.

---

## 15. Template de chapitre / vue

```text
Concern
Baseline Plateau
Target Plateau
Gaps
Work Packages
Deliverables
Implementation Events
Transition Plateaus
Dependencies
Rollback
Decommission
Risks
Requirements Traceability
```

---

## 16. Questions de contrôle

1. Quel est le premier objet à modéliser ? **Le concern et les états Baseline/Target.**
2. Que faire après les gaps ? **Les regrouper en Work Packages cohérents.**
3. Pourquoi définir des Deliverables ? **Pour rendre le résultat et la gouvernance vérifiables.**
4. Quand créer un Plateau intermédiaire ? **Quand l’état transitoire est stable et architecturalement significatif.**
5. Que doit avoir un composant temporaire ? **Un exit explicite.**
6. Quel test détecte le “technology for technology’s sake” ? **Every Work Package Has a Reason.**

---

## À retenir

> **Une bonne Implementation & Migration Architecture est lisible comme une démonstration : pourquoi changer, ce qui manque, quel travail ferme chaque gap, quel état on atteint ensuite, et comment on sort du legacy.**