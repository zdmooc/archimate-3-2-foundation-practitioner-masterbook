# Import, export et formats d'échange

## 1. Trois besoins différents

Ne pas confondre :

- sauvegarder le modèle natif Archi ;
- échanger un modèle avec un autre outil ;
- exporter une vue pour communication.

## 2. Format natif `.archimate`

Le fichier natif Archi est un XML propre à Archi.

Il contient notamment :

- éléments ;
- relations ;
- dossiers ;
- vues ;
- objets graphiques ;
- propriétés et documentation.

C'est le format utilisé par le fichier MayaBank de ce dépôt.

## 3. Open Exchange Format

Archi permet également de travailler avec le format d'échange ArchiMate pour l'interopérabilité avec d'autres outils.

Utiliser le format d'échange lorsqu'on veut :

- migrer un modèle ;
- intégrer un autre outil ;
- automatiser un pipeline indépendant du format natif Archi.

## 4. Native format ≠ Exchange format

Un `.archimate` natif et un XML Open Exchange ne sont pas la même chose.

Le premier vise la fidélité au modèle Archi.
Le second vise l'interopérabilité.

## 5. CSV / tableurs

Les imports tabulaires peuvent être utiles pour :

- catalogue applicatif ;
- inventaire de capabilities ;
- technologies ;
- properties.

Mais importer un inventaire brut ne construit pas une architecture.

Il faut ensuite :

- typer ;
- dédupliquer ;
- relier ;
- créer les views.

## 6. Export de vues

Pour communication, exporter une vue en image/PDF selon le besoin.

Règle : conserver le modèle source Archi comme source de vérité ; l'image exportée est un livrable dérivé.

## 7. Export et Git

Éviter de versionner des centaines d'images générées si elles ne sont pas nécessaires.

Préférer :

```text
model source
+ selected published diagrams
+ documentation
```

## 8. Interopérabilité

Avant un échange :

1. identifier le format cible ;
2. vérifier les concepts supportés ;
3. vérifier les propriétés ;
4. vérifier les views ;
5. vérifier les styles ;
6. tester sur un petit modèle.

## 9. Contrôle après import

Après import :

- compter les éléments ;
- compter les relations ;
- ouvrir les views ;
- vérifier les IDs ;
- vérifier les propriétés ;
- vérifier les caractères spéciaux ;
- vérifier les relations de source à cible.

## 10. Artifact vs Deliverable

Le fichier `.archimate` est un fichier technique du travail de modélisation.

Le dossier d'architecture officiellement remis au projet peut être un `Deliverable` dans la vue transformation.

Ne pas confondre l'objet physique fichier et le concept d'implémentation/livraison.

## 11. Backup

Avant migration de format ou upgrade majeur :

- sauvegarder le fichier natif ;
- commit Git ;
- tester l'ouverture dans la nouvelle version ;
- vérifier les views critiques.

## 12. Definition of Done

Un échange est réussi lorsque la sémantique reste intacte, pas seulement lorsque le fichier s'ouvre.
