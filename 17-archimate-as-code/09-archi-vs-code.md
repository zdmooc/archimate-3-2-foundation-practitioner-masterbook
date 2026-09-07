# 9 — Archi vs PlantUML : quand utiliser quoi ?

## 9.1 Archi

Archi est préférable lorsque le besoin principal est :

- repository graphique riche ;
- réutilisation d’éléments dans de nombreuses views ;
- navigation interactive ;
- propriétés/documentation ;
- collaboration coArchi ;
- manipulation visuelle intensive ;
- échange de modèles.

## 9.2 PlantUML

PlantUML est préférable lorsque le besoin principal est :

- diff Git ;
- revue PR ;
- génération automatique ;
- documentation dans un dépôt logiciel ;
- intégration CI/CD ;
- petites/moyennes vues ciblées ;
- proximité avec les équipes engineering.

## 9.3 Comparaison

| Critère | Archi | PlantUML |
|---|---|---|
| Modélisation visuelle | excellente | indirecte |
| Repository sémantique | fort | à construire |
| Réutilisation d’éléments | native | conventions/includes |
| Git diff | XML/moins lisible | excellent |
| CI/CD | possible | naturel |
| Layout manuel | puissant | limité/automatique |
| Revue par développeurs | moyenne | excellente |
| Gros catalogue | excellent | demande discipline |
| Documentation-as-code | moyenne | excellente |

## 9.4 Ne pas opposer les deux

Architecture recommandée :

```text
Archi
= master model / exploration / repository

PlantUML
= selected governed views / documentation-as-code / CI
```

Il n’est pas nécessaire que chaque vue existe dans les deux formats.

## 9.5 Source de vérité

Un projet doit décider explicitement :

### Option A

Archi est source de vérité ; PlantUML sert de documentation dérivée.

### Option B

PlantUML est source de vérité pour certaines vues techniques.

### Option C

Deux référentiels complémentaires avec périmètres clairement définis.

Le pire scénario est d’avoir deux sources supposées officielles qui divergent.

## 9.6 MayaBank

Pour le masterbook :

```text
16-archi-practical-modeling/models/mayabank-enterprise.archimate
```

sert de modèle natif de démonstration.

La Partie XVII fournit des vues as-code indépendantes et focalisées :

```text
EXEC-01
APP-01
TEC-01
SEC-01
MIG-01
```

## 9.7 Synchronisation

Il n’existe pas ici de promesse de synchronisation bidirectionnelle automatique entre le fichier `.archimate` et les `.puml`.

La cohérence est assurée par :

- identifiants/noms stables ;
- registre canonique ;
- revue ;
- tests ;
- ownership.

## 9.8 Choix en mission

Si une banque possède déjà un repository Archi/HOPEX/LeanIX/etc., ne pas introduire PlantUML comme nouveau master repository sans besoin clair.

PlantUML peut toutefois être excellent pour les **Solution Architecture views versionnées avec le code applicatif**.

## 9.9 Entretien

Réponse attendue à « Pourquoi ArchiMate as Code si Archi existe ? » :

> Pour rendre certaines vues proches du delivery versionnables, reviewables et générables automatiquement, tout en conservant un repository de modèle plus riche lorsque nécessaire.

## 9.10 Règle finale

> **Choisir l’outil à partir du workflow d’architecture, pas à partir d’une préférence de diagramme.**
