# Practitioner Checklist — Relations

Avant de considérer une vue ArchiMate comme prête :

## Sémantique

- [ ] Chaque relation exprime un sens précis.
- [ ] `Association` n’est pas utilisée par défaut.
- [ ] `Realization` signifie réellement « met en œuvre / concrétise ».
- [ ] `Serving` signifie réellement « fournit une fonctionnalité à ».
- [ ] `Assignment` relie correctement structure active et responsabilité/comportement.
- [ ] `Access` représente bien un accès à un élément passif.
- [ ] `Triggering` représente bien causalité ou séquence.
- [ ] `Flow` représente bien un transfert.

## Direction

- [ ] La source et la cible sont identifiées.
- [ ] La flèche peut être lue comme une phrase vraie.
- [ ] La direction n’a pas été choisie selon la disposition graphique.

## Validité

- [ ] Les types source/cible sont autorisés par le métamodèle.
- [ ] Les Junctions combinent des relations de même type.
- [ ] Les relations dérivées respectent les règles de dérivation.
- [ ] Aucun raccourci graphique ne change la sémantique.

## Cross-layer

- [ ] Business ↔ Application reste traçable.
- [ ] Application ↔ Technology reste traçable.
- [ ] Data Object ↔ Business Object ↔ Artifact sont distingués.
- [ ] Service ↔ comportement interne ↔ structure active sont distingués.
- [ ] Migration ↔ architecture cible reste traçable.

## Qualité de vue

- [ ] Le diagramme n’est pas saturé de relations.
- [ ] Les relations importantes sont nommées si nécessaire.
- [ ] Les Flows précisent ce qui circule lorsque cela apporte de la valeur.
- [ ] Les Access précisent read/write/read-write lorsque cela compte.
- [ ] Les influences positives/négatives sont compréhensibles.

## Test oral

Choisir dix relations au hasard et expliquer chacune en moins de 15 secondes :

```text
A [relation] B
parce que ...
```

Si l’explication n’est pas nette, revoir le modèle.
