# Cheat Sheet 10 — Réflexes Foundation / Practitioner

## Foundation — méthode rapide

Pour chaque QCM :

1. Identifier le **mot clé sémantique**.
2. Identifier le **layer**.
3. Identifier l’**aspect** : structure / behavior / passive / service/interface.
4. Éliminer les réponses du mauvais niveau.
5. Vérifier la distinction la plus proche.

## Foundation — mots déclencheurs

| Formulation | Réflexe |
|---|---|
| pressure, force, condition | Driver |
| evaluation, observation | Assessment |
| desired state | Goal |
| measurable result | Outcome |
| must satisfy | Requirement |
| restriction | Constraint |
| ability | Capability |
| sequence of value | Value Stream |
| strategic approach | Course of Action |
| responsibility | Role |
| organizational entity | Actor |
| ordered behavior | Process |
| grouped behavior | Function |
| exposed behavior | Service |
| access point | Interface |
| logical application | Application Component |
| platform/runtime | System Software |
| compute resource | Node |
| physical IT hardware | Device |
| site/building | Facility |
| non-IT physical equipment | Equipment |
| concrete deployable | Artifact |
| transformation work | Work Package |
| stable architecture state | Plateau |
| difference baseline/target | Gap |

## Foundation — relations

```text
executes        → Assignment
implements      → Realization
provides to     → Serving
reads/writes    → Access
causes          → Triggering
transfers       → Flow
affects goal    → Influence
```

## Practitioner — algorithme en 8 étapes

1. Identifier le stakeholder.
2. Reformuler le concern.
3. Identifier la couche dominante.
4. Repérer les concepts mal typés.
5. Repérer les relations incorrectes.
6. Vérifier la traçabilité cross-layer.
7. Vérifier transformation/baseline/target si concern pertinent.
8. Choisir la réponse la plus complète **sans sur-modéliser**.

## Practitioner — classement 5/3/1/0

### 5 points
- répond précisément au concern ;
- sémantique correcte ;
- abstraction maîtrisée ;
- relations cohérentes ;
- traçabilité utile ;
- pas de bruit inutile.

### 3 points
- solution largement correcte ;
- manque une couche, une responsabilité ou une relation ;
- ou vue correcte mais trop limitée.

### 1 point
- contient une intuition utile ;
- mais confusion importante de niveau/type/relation.

### 0 point
- contredit la sémantique ;
- remplace tout par un type générique ;
- ou ne répond pas au concern.

## Open book Practitioner

Ne pas chercher au hasard.

Avant d’ouvrir la référence :

> “Je veux vérifier quoi exactement ?”

- définition d’un élément ;
- relation autorisée ;
- direction ;
- notion avancée ;
- viewpoint.

## Les 15 pièges les plus rentables à revoir

1. Goal / Outcome / Requirement.
2. Capability / Process / Function.
3. Actor / Role.
4. Process / Service.
5. Service / Interface.
6. Component / Service.
7. Business Object / Data Object / Artifact.
8. Application Component / System Software.
9. System Software / Technology Service.
10. Node / Device / Facility / Equipment.
11. Event / payload / topic.
12. Course of Action / Work Package.
13. Plateau / release / environment.
14. Access / Flow / Triggering.
15. Viewpoint / View.

## Stratégie de temps — Foundation

- 40 questions / 60 min.
- Premier passage : répondre aux évidentes.
- Marquer les discriminations douteuses.
- Revenir seulement ensuite.
- Ne pas transformer une question de vocabulaire en débat d’architecture complet.

## Stratégie de temps — Practitioner

- 8 scénarios / 90 min.
- Environ 10–11 min/scénario maximum, avec marge de revue.
- Lire d’abord la question finale, puis le contexte.
- Identifier immédiatement le concern.
- Comparer les réponses sur 4 axes : sémantique, couverture, abstraction, décision.

## Auto-diagnostic après un mock

Classer chaque erreur :

- E1 : mauvais élément ;
- E2 : mauvaise relation ;
- E3 : mauvaise direction ;
- E4 : mauvais layer ;
- E5 : mauvaise vue/viewpoint ;
- E6 : confusion baseline/target/migration ;
- E7 : manque de traçabilité cross-layer ;
- E8 : sur-modélisation ;
- E9 : lecture trop rapide.

Ne pas refaire un mock tant que le type d’erreur dominant n’est pas corrigé.

## Signal de préparation robuste

- Foundation : ≥ 32/40 plusieurs fois.
- Practitioner : ≥ 32/40 plusieurs fois.
- expliquer chaque mauvaise réponse sans regarder le corrigé ;
- corriger un diagramme en explicitant type, relation et concern ;
- présenter MayaBank de Motivation jusqu’au Plateau cible.