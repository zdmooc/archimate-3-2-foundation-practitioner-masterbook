# Cheat Sheet 05 — Implementation & Migration

## Les éléments

| Élément | Question | Exemple MayaBank |
|---|---|---|
| Work Package | Quel travail de transformation ? | Build Event Streaming Platform |
| Deliverable | Quel résultat défini produit ce travail ? | Production Kafka Platform |
| Implementation Event | Quel jalon/fait de transformation ? | Event Platform Ready |
| Plateau | Quel état architectural relativement stable ? | Hybrid Payments |
| Gap | Quel écart existe entre deux états ? | No Event Backbone |

## Chaîne transformation type

```text
Baseline Plateau
→ Gap
→ Course of Action
→ Work Package
→ Deliverable
→ Implementation Event
→ Transition Plateau
→ Work Packages suivants
→ Target Plateau
```

## MayaBank P0 → P4

```text
P0 Legacy
→ WP1 OpenShift Foundation
→ WP2 API Management
→ WP3 Event Streaming
→ P1 Foundations Ready
→ WP4 Payment Orchestrator
→ WP5 Observability
→ P2 Hybrid Payments
→ WP6 Data Migration
→ WP7 Instant Payment Wave 1
→ P3 Target Core Active
→ WP8 Remaining Flows
→ WP9 Decommission Legacy
→ P4 Target
```

## Distinctions critiques

### Course of Action vs Work Package
- Course of Action = orientation stratégique choisie.
- Work Package = travail concret exécuté pour transformer.

```text
Course of Action: Adopt Event-Driven Integration
→ Work Package: Build Event Streaming Platform
```

### Deliverable vs Artifact
- Deliverable = résultat défini de transformation/projet.
- Artifact = représentation concrète déployable ou stockée.

Un `Production Event Platform` peut être Deliverable.
Une image OCI est Artifact.

### Implementation Event vs Application/Business/Technology Event
- Implementation Event = jalon ou événement de transformation.
- Application Event = fait applicatif.
- Business Event = fait métier.
- Technology Event = fait technique.

`Kafka Platform Ready` = Implementation Event.
`Payment Authorized` = Application Event.
`Payment Request Received` = Business Event.
`Node Failure Detected` = Technology Event.

### Plateau vs Environment
Plateau = état architectural relativement stable.
DEV/TEST/UAT/PROD ne sont pas automatiquement des Plateaus.

### Plateau vs Release
Une release peut contribuer à atteindre un Plateau, mais une release n’est pas automatiquement un Plateau.

### Gap vs Assessment
- Assessment = constat/évaluation motivant le changement.
- Gap = différence structurée entre états d’architecture.

Exemple :

```text
Assessment: legacy platform cannot meet latency target
Gap: no event backbone in baseline versus target
```

## Baseline / Transition / Target

Ces termes décrivent des **rôles d’états**, pas de nouveaux types d’éléments.

On les représente généralement avec Plateau :

```text
Plateau P0 = Baseline
Plateau P2 = Transition
Plateau P4 = Target
```

## Cutover et rollback

ArchiMate n’a pas un élément dédié “Rollback”. Modéliser le concern avec :
- Work Packages ;
- Deliverables ;
- Implementation Events ;
- Plateaus ;
- Requirements/Constraints ;
- relations de dépendance/triggering pertinentes.

## Decommissioning

Un bon modèle de migration doit rendre visible :
1. ce qui devient actif ;
2. ce qui coexiste temporairement ;
3. les dépendances restantes ;
4. le Work Package de sortie ;
5. l’Implementation Event confirmant la désactivation ;
6. le Plateau cible sans le legacy.

## Green IT et transformation

Ne pas conclure : `migration → baisse CO2e` sans chaîne causale.

Modèle crédible :

```text
Work Package: Migrate workload
→ Deliverable: workload running on target
→ Implementation Event: legacy workload stopped
→ Work Package: decommission hardware
→ Outcome: lower active infrastructure footprint
```

## Réflexes Practitioner

La meilleure réponse est généralement celle qui :
- montre les Gaps explicitement ;
- sépare stratégie et exécution ;
- montre au moins un Plateau de transition quand la coexistence est significative ;
- relie Work Packages, Deliverables et Events ;
- ne cache pas la sortie du legacy ;
- relie Requirements de migration/RTO/sécurité aux travaux concrets.