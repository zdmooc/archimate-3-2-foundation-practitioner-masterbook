# TOGAF Phases E, F, G ↔ ArchiMate Implementation & Migration

ArchiMate et TOGAF sont complémentaires : TOGAF fournit une méthode de transformation ; ArchiMate fournit un langage pour représenter les architectures, les écarts et le chemin d’implémentation.

Cette correspondance n’est pas une équivalence mécanique un-pour-un. Elle sert à choisir les bons concepts de modélisation au bon moment.

---

## 1. Phase E — Opportunities & Solutions

La Phase E consolide les résultats des architectures Business, Data, Application et Technology afin d’identifier comment la cible peut être réalisée.

Questions typiques :

- quels gaps doivent être traités ?
- quels work packages sont nécessaires ?
- quelles dépendances existent ?
- faut-il des Transition Architectures ?
- quelles options de réalisation sont crédibles ?
- quels bénéfices et risques sont associés ?

### Concepts ArchiMate particulièrement utiles

- `Gap`
- `Work Package`
- `Plateau`
- `Deliverable`
- `Course of Action`
- `Capability`

### Exemple MayaBank

```text
Gap: no event backbone
→ Work Package: Establish Event Streaming Platform

Gap: monolith deployment model
→ Work Package: Build OpenShift Platform

Gap: point-to-point payment integration
→ Work Package: Implement Payment Orchestrator and API Layer
```

---

## 2. Phase E et Transition Architectures

TOGAF peut identifier des Transition Architectures lorsque la cible ne peut pas être atteinte directement.

ArchiMate peut les représenter avec `Plateau`.

```text
Baseline Plateau
→ Transition Plateau A
→ Transition Plateau B
→ Target Plateau
```

Le Plateau montre **l’état architectural** ; la Phase E explique **pourquoi cet état intermédiaire est nécessaire et comment il s’inscrit dans la réalisation de la cible**.

---

## 3. Phase F — Migration Planning

La Phase F transforme les grands choix de réalisation en plan de migration plus précis.

Questions typiques :

- dans quel ordre exécuter les work packages ?
- quelles dépendances bloquent les autres travaux ?
- quelles priorités appliquer ?
- quels risques et bénéfices influencent le séquencement ?
- quels plateaus doivent être atteints ?
- quelle roadmap devient le plan de migration ?

### Concepts ArchiMate utiles

- `Work Package`
- `Implementation Event`
- `Plateau`
- `Deliverable`
- `Gap`

### Exemple

```text
WP1 OpenShift Foundation
WP2 Kafka Foundation
WP3 API Foundation
        ↓
WP4 Payment Orchestrator
        ↓
WP5 Wave 1 Migration
        ↓
WP6 Wave 2 Migration
        ↓
WP7 Legacy Decommission
```

---

## 4. Phase E vs Phase F

La confusion est classique.

### Phase E

Met l’accent sur :

- options de réalisation ;
- regroupement des gaps ;
- work packages initiaux ;
- transition architectures ;
- architecture roadmap initiale.

### Phase F

Met l’accent sur :

- priorisation ;
- séquencement ;
- dépendances ;
- plan de migration détaillé ;
- consolidation du roadmap.

### Mémo

```text
E = WHAT IMPLEMENTATION OPTIONS / WORK PACKAGES?
F = IN WHAT ORDER / WITH WHAT MIGRATION PLAN?
```

---

## 5. Phase G — Implementation Governance

La Phase G ne construit pas directement les solutions.

Elle gouverne l’implémentation afin que les projets restent conformes à l’architecture approuvée.

Questions :

- les deliverables satisfont-ils les exigences d’architecture ?
- les écarts sont-ils acceptables ?
- les décisions d’implémentation restent-elles conformes ?
- les architecture contracts sont-ils respectés ?
- les changements nécessitent-ils une exception ou une révision ?

### ArchiMate aide à tracer

```text
Requirement
→ Target Architecture Element
→ Work Package
→ Deliverable
→ Plateau
```

Cette traçabilité permet de comparer ce qui était demandé et ce qui est effectivement livré.

---

## 6. Phase G et Deliverable

Un Deliverable peut servir de point de contrôle architectural.

Exemple :

```text
Requirement:
Critical services must expose logs, metrics and traces

Work Package:
Implement Observability Foundation

Deliverable:
Production Observability Integration
```

La gouvernance peut vérifier si le Deliverable réalise correctement les exigences.

---

## 7. Phase H — Architecture Change Management

Même si la partie Implementation & Migration est surtout associée à E/F/G, Phase H reste pertinente.

Une fois le Target Plateau atteint :

- un nouveau driver peut apparaître ;
- un assessment peut révéler un problème ;
- un nouveau gap peut être identifié ;
- un nouveau cycle de transformation peut démarrer.

```text
Target Plateau 2028
    ↓ new Driver
Assessment
    ↓
New Goal / Requirement
    ↓
New Gap
    ↓
New Work Packages
```

L’architecture est donc cyclique, pas figée.

---

## 8. Architecture Roadmap vs Implementation & Migration Plan

Le modèle ArchiMate peut représenter visuellement :

- plateaus ;
- work packages ;
- gaps ;
- dependencies ;
- implementation events.

Mais il ne remplace pas tous les détails d’un Implementation & Migration Plan TOGAF.

Le plan peut inclure davantage :

- coûts ;
- ressources ;
- risques ;
- gouvernance ;
- calendrier ;
- dépendances organisationnelles ;
- business value.

ArchiMate fournit la vue structurée de l’architecture et de sa transformation.

---

## 9. Exemple MayaBank E → F → G

### Phase E

Identifie :

- Gap OpenShift
- Gap Kafka
- Gap API
- Gap Orchestration
- Gap Observability

Regroupe en :

- WP Platform Foundation
- WP Integration Foundation
- WP Payment Core Modernization
- WP Migration Waves

Définit :

- Transition Plateau A
- Transition Plateau B

### Phase F

Séquence :

1. OpenShift + IAM + Observability
2. Kafka + API
3. Payment Orchestrator
4. Pilot
5. Retail Migration
6. Corporate Migration
7. Legacy Exit

### Phase G

Contrôle :

- security requirements ;
- traceability ;
- HA/DR ;
- API standards ;
- event contracts ;
- operational readiness ;
- architecture deviations.

---

## 10. Erreurs fréquentes

### Erreur 1

Mettre `TOGAF Phase E` comme Work Package.

Une phase ADM est une étape méthodologique, pas un Work Package d’implémentation de la solution.

### Erreur 2

Confondre Architecture Roadmap et Plateau.

- Roadmap = chemin de transformation ;
- Plateau = état relativement stable.

### Erreur 3

Confondre Work Package et projet Jira.

Un Work Package est un concept de modélisation de travail de transformation, pas un ticket technique.

### Erreur 4

Utiliser Phase G comme simple suivi projet.

Phase G concerne la **gouvernance de conformité architecturale** de l’implémentation.

---

## 11. Questions de contrôle

1. Identifier les work packages initiaux → surtout **Phase E**.
2. Les prioriser et séquencer → surtout **Phase F**.
3. Vérifier la conformité pendant l’exécution → **Phase G**.
4. Représenter une Transition Architecture → `Plateau` est très adapté.
5. Représenter les différences Baseline/Target → `Gap`.
6. Représenter le travail d’implémentation → `Work Package`.

---

## À retenir

> **TOGAF dit comment conduire la transformation ; ArchiMate permet de la représenter.**

Pour MayaBank : **E identifie le chemin et les work packages, F les séquence, G gouverne leur conformité**.