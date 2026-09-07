# Score, analyse des erreurs et protocole de révision

## Foundation

Score de passage utilisé pour l'entraînement : **24/40**.

| Score | Interprétation d'entraînement |
|---:|---|
| 36–40 | maîtrise très solide |
| 32–35 | prêt avec marge |
| 28–31 | zone correcte mais confusions à fermer |
| 24–27 | seuil atteint, marge insuffisante |
| <24 | revoir les domaines faibles |

## Practitioner

Le barème gradué attribue 5 points à la meilleure réponse, 3 à la seconde, 1 à la troisième et 0 au distracteur. Le seuil utilisé est **26/40**.

| Score | Interprétation d'entraînement |
|---:|---|
| 36–40 | excellent raisonnement Practitioner |
| 32–35 | prêt avec marge |
| 28–31 | niveau correct, améliorer discrimination |
| 26–27 | seuil atteint, marge insuffisante |
| <26 | retravailler scénarios et méthode |

## Taxonomie des erreurs

Pour chaque erreur, choisir une cause principale :

1. **ELEMENT** — mauvais type d'élément.
2. **LAYER** — bon mot mais mauvais niveau d'abstraction.
3. **RELATION** — mauvaise sémantique de relation.
4. **DIRECTION** — bonne relation mais sens inversé.
5. **SOURCE/TARGET** — relation non valide entre source/cible.
6. **VIEWPOINT** — vue mal choisie pour stakeholder/concern.
7. **TRANSFORMATION** — confusion Goal/Gap/Work Package/Deliverable/Event/Plateau.
8. **CROSS-LAYER** — chaîne incomplète entre métier, application et technologie.
9. **OVERMODELING** — réponse trop détaillée ou inventaire sans concern.
10. **UNDERMODELING** — réponse correcte mais ne permet pas la décision.

## Journal de correction

| Mock | Score | ELEMENT | RELATION | VIEWPOINT | TRANSFORMATION | CROSS-LAYER | Action |
|---|---:|---:|---:|---:|---:|---:|---|
| Foundation 1 | | | | | | | |
| Foundation 2 | | | | | | | |
| Foundation 3 | | | | | | | |
| Foundation 4 | | | | | | | |
| Practitioner 1 | | | | | | | |
| Practitioner 2 | | | | | | | |
| Practitioner 3 | | | | | | | |
| Practitioner 4 | | | | | | | |

## Protocole de remédiation

Une erreur n'est pas « corrigée » lorsque la réponse a été lue. Elle est corrigée lorsque l'on sait :

- expliquer pourquoi la bonne réponse est meilleure ;
- expliquer pourquoi chaque distracteur est moins bon ;
- reconstruire un exemple différent ;
- choisir le bon élément/relation sans regarder la fiche ;
- remonter et descendre une chaîne cross-layer lorsqu'elle est impliquée.

## Stratégie open book Practitioner

Ne pas parcourir la spécification au hasard. Avant d'ouvrir la référence, identifier ce que l'on veut confirmer :

- définition exacte d'un élément ;
- relation autorisée ;
- direction ;
- différence entre deux concepts proches ;
- mécanisme de viewpoint ;
- concept avancé ou cross-layer.

L'open book doit **confirmer** un raisonnement, pas remplacer l'analyse du scénario.

## Definition of Done avant l'examen

### Foundation
- au moins trois mocks consécutifs à **32/40 ou plus** ;
- aucune confusion récurrente sur les éléments cœur ;
- relations principales reconnues avec leur direction ;
- distinction View/Viewpoint maîtrisée ;
- Implementation & Migration sans confusion Goal/Gap/Plateau/Work Package.

### Practitioner
- au moins trois séries à **32/40 ou plus** ;
- savoir justifier 5/3/1/0, pas seulement reconnaître la réponse 5 ;
- savoir construire une vue depuis Stakeholder → Concern ;
- savoir raisonner cross-layer ;
- savoir corriger un modèle trop détaillé ou insuffisant ;
- utiliser la référence uniquement pour confirmation ciblée.
