# Construire des vues propres dans Archi

## 1. Commencer par le concern

Ne jamais commencer par :

> « Je vais faire un diagramme de tous les composants. »

Commencer par :

```text
Stakeholder → Concern → Viewpoint → View
```

## 2. Créer une vue

Pour une vue MayaBank :

1. créer la vue dans le bon dossier ;
2. donner un nom explicite ;
3. documenter l'audience ;
4. glisser les éléments existants depuis le Models Tree ;
5. ajouter uniquement les relations nécessaires ;
6. revoir la densité visuelle.

## 3. Nommage recommandé

```text
EXEC-01 Payment Transformation Overview
BUS-01 Instant Payment Process
APP-01 Payment Application Cooperation
TEC-01 OpenShift Deployment
SEC-01 Payment Security Dependencies
OPS-01 Incident Impact
MIG-01 Payment Migration Roadmap
GREEN-01 Payment Carbon Dependency
```

## 4. Réutilisation

Un même élément peut apparaître dans plusieurs vues.

Le modèle garde :

- une identité logique ;
- plusieurs représentations graphiques.

## 5. Relations visibles

Une vue n'a pas besoin d'afficher toutes les relations existantes.

Elle doit afficher celles nécessaires au concern.

Exemple Incident Impact :

```text
Facility
→ Device
→ Node
→ Technology Service
→ Application Component
→ Business Service
```

Les relations de motivation ne sont pas nécessaires si la question porte uniquement sur le blast radius technique.

## 6. Direction visuelle

Choisir une lecture stable :

- gauche → droite pour flux ;
- haut → bas pour layers ;
- Baseline → Target pour migration.

Éviter les flèches dans tous les sens.

## 7. Grouping

`Grouping` peut aider visuellement et sémantiquement lorsque l'on veut regrouper des concepts partageant une caractéristique.

Ne pas utiliser un Grouping pour masquer une mauvaise structuration du modèle.

## 8. Notes

Les notes servent à expliquer :

- hypothèses ;
- décisions ;
- légende locale ;
- périmètre.

Elles ne doivent pas remplacer les concepts ArchiMate.

## 9. Legends dans Archi 5.8

Archi 5.8 introduit des Legends dynamiques dans les Views.

Utilisations pertinentes :

- vue executive avec plusieurs couches ;
- carte de capabilities avec états ;
- Baseline/Target ;
- criticité ;
- lifecycle.

Une Legend aide à lire la vue ; elle ne remplace pas le type ArchiMate.

## 10. Couleurs

Ne jamais créer une sémantique cachée uniquement par couleur.

Mauvais :

```text
rouge = critique
vert = cible
```

sans légende ni propriété.

Meilleur :

- propriété `criticality=high` ;
- propriété `lifecycle=target` ;
- légende visuelle correspondante.

## 11. Vue exécutive

Doit répondre en moins d'une minute à une question décisionnelle.

Exemple :

```text
Drivers
→ Capabilities
→ Target Payment Platform
→ Work Packages
→ Target Plateau
```

Pas de pods, topics ou tables.

## 12. Vue solution

Peut montrer :

```text
Business Process
→ Application Services
→ Application Components
→ Data Objects
→ Technology Services
```

## 13. Vue deployment

Peut montrer :

```text
Application Component
→ Artifact
→ OpenShift Cluster
→ Worker Pool
→ DB/Kafka Services
```

## 14. Revue de lisibilité

Avant validation :

- le titre dit-il la question ?
- l'audience est-elle claire ?
- chaque élément est-il utile ?
- les flèches sont-elles lisibles ?
- les niveaux d'abstraction sont-ils cohérents ?
- les noms sont-ils compréhensibles sans commentaire oral ?

## 15. Definition of Done

Une bonne vue :

- répond à un concern unique ou très cohérent ;
- utilise des éléments canoniques ;
- ne duplique pas les concepts ;
- reste lisible ;
- est explicable à son stakeholder cible.
