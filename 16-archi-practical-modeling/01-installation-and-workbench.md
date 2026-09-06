# Installation et prise en main d'Archi 5.8

## 1. Version cible

Cette partie cible **Archi 5.8 GA**.

Pourquoi figer une version ?

- éviter qu'un tutoriel change au rythme des snapshots ;
- assurer des captures mentales cohérentes ;
- différencier version stable et développement ;
- pouvoir reproduire les labs.

## 2. Installation

Archi est disponible pour Windows, macOS et Linux.

Après installation :

1. lancer Archi ;
2. créer un nouveau modèle ;
3. vérifier les préférences générales ;
4. choisir les couleurs/notations avec modération ;
5. conserver le nommage en anglais pour les types ArchiMate et un nom métier clair pour les instances.

## 3. Les zones de travail

La pratique quotidienne tourne autour de quatre zones :

### Models Tree

Contient les éléments, relations et vues du modèle.

### Canvas / View

Zone où l'on construit une représentation pour un stakeholder et un concern.

### Properties

Permet de gérer notamment :

- nom ;
- documentation ;
- propriétés personnalisées ;
- apparence ;
- informations de l'élément sélectionné.

### Palette

Permet d'ajouter les concepts ArchiMate compatibles avec la vue.

## 4. Créer un modèle

Nom recommandé :

`MayaBank Enterprise Architecture`

Ne pas créer un modèle par diagramme.

Mauvais :

```text
payment-view.archimate
kafka-view.archimate
openshift-view.archimate
```

Meilleur :

```text
mayabank-enterprise.archimate
  ├─ canonical elements
  ├─ relationships
  └─ multiple views
```

## 5. Arbre initial

Archi crée les familles principales :

```text
Strategy
Business
Application
Technology & Physical
Motivation
Implementation & Migration
Other
Relations
Views
```

On peut créer des sous-dossiers pour organiser le référentiel sans changer la sémantique ArchiMate.

Exemple :

```text
Application
├─ Channels
├─ Payments
├─ Risk
├─ Integration
└─ Operations
```

## 6. Nommer les éléments

Préférer des noms stables :

```text
Payment Orchestrator
Fraud Decision Service
Payment Transaction
Event Streaming Service
OpenShift Production Platform
```

Éviter :

```text
New App
Payment v2 final
Kafka box
Server prod 3
```

## 7. Identité logique vs nom affiché

Un élément Archi possède un identifiant interne. Le nom peut évoluer ; l'identité reste stable.

Cela est important pour :

- relations ;
- vues ;
- Git ;
- coArchi ;
- analyse de changement.

## 8. Premier exercice

Créer :

- `Capability: Real-Time Payment Processing`
- `Business Process: Execute Instant Payment`
- `Application Component: Payment Orchestrator`
- `Technology Service: Event Streaming Service`
- `System Software: Kafka`
- `Node: OpenShift Production Cluster`

Puis vérifier qu'ils apparaissent dans les bons dossiers.

## 9. Erreur fréquente

Créer directement un rectangle dans une vue, puis recommencer dans une autre vue avec le même nom.

Correction : retrouver l'élément existant dans le Models Tree et le glisser dans la nouvelle vue.

## 10. Definition of Done d'une installation

- Archi démarre correctement ;
- modèle créé ;
- dossier de travail défini ;
- sauvegarde `.archimate` testée ;
- Git activé si collaboration prévue ;
- modèle test MayaBank ouvert sans erreur.
