# Partie XI — Views & Viewpoints : montrer la bonne architecture au bon interlocuteur

Un modèle ArchiMate peut contenir des centaines ou des milliers d’éléments. Une **View** sélectionne une partie de ce modèle pour répondre à un besoin de communication précis. Un **Viewpoint** définit la manière de construire cette vue pour un type de préoccupation donné.

La compétence importante n’est donc pas seulement de savoir modéliser, mais de savoir **quoi montrer, à qui, pourquoi et avec quel niveau de détail**.

---

## 1. Chaîne mentale

```text
Stakeholder
   ↓ has
Concern
   ↓ addressed by
Viewpoint
   ↓ governs construction of
View
   ↓ selects from
Architecture Model
```

Exemple MayaBank :

```text
Stakeholder: CIO
Concern: impact global de la modernisation paiements
Viewpoint: Layered / migration-oriented
View: MayaBank Payment Transformation — Executive View
```

Le même modèle peut produire d’autres vues :

- vue métier pour le Head of Payments ;
- vue applicative pour l’Architecte Solution ;
- vue plateforme pour l’Architecte OpenShift ;
- vue migration pour le Program Manager ;
- vue risque pour le RSSI ;
- vue Green IT pour le responsable sobriété.

---

## 2. View vs Viewpoint

### Viewpoint

Un **Viewpoint** définit les conventions de construction d’une vue : types de concepts pertinents, relations, niveau d’abstraction, stakeholders et concerns visés.

### View

Une **View** est la représentation concrète produite à partir du modèle pour une situation donnée.

```text
Viewpoint = HOW TO BUILD
View      = WHAT YOU SEE
```

Piège : le viewpoint n’est pas le diagramme lui-même.

---

## 3. Pourquoi plusieurs vues sont nécessaires

Une seule vue globale contenant tout est presque toujours mauvaise.

Le CIO n’a pas besoin de voir :

- tous les endpoints ;
- tous les topics Kafka ;
- tous les PVC ;
- chaque pod ;
- chaque table Oracle.

L’équipe plateforme n’a pas besoin d’une vue limitée aux drivers stratégiques.

Le bon modèle contient la richesse. La bonne vue filtre cette richesse.

---

## 4. Les grands types de préoccupations

### Stratégique

- pourquoi changer ?
- quelles capacités sont critiques ?
- quelle valeur attend-on ?

### Métier

- qui fait quoi ?
- quels processus ?
- quels services métier ?

### Application

- quelles applications supportent le métier ?
- quels services et dépendances ?

### Technologie

- où cela s’exécute ?
- quels services techniques ?
- quelles dépendances réseau/plateforme ?

### Transformation

- où sommes-nous ?
- quelles transitions ?
- quels work packages ?

### Risque / conformité

- quels actifs sont exposés ?
- quels contrôles et exigences ?

### Exploitation

- quelles dépendances critiques ?
- quels points de panne ?
- quelle observabilité ?

---

## 5. Viewpoints standards et viewpoints personnalisés

ArchiMate fournit des viewpoints utiles comme points de départ. Ils ne doivent pas devenir une contrainte empêchant d’adapter une vue à un stakeholder réel.

Un bon architecte peut :

1. partir d’un viewpoint standard ;
2. sélectionner les concepts nécessaires ;
3. adapter le niveau de détail ;
4. conserver la sémantique ArchiMate ;
5. documenter l’objectif de la vue.

---

## 6. Le problème du niveau d’abstraction

Une vue exécutive peut montrer :

```text
Capability: Real-Time Payments
Application: Target Payment Platform
Technology: OpenShift Platform
Plateau: Target 2028
```

Une vue solution peut décomposer :

```text
Payment API Gateway
Payment Orchestrator
Fraud Engine
Kafka
PostgreSQL
OpenShift
```

Une vue déploiement peut descendre encore davantage.

Les trois vues peuvent être correctes parce qu’elles répondent à des concerns différents.

---

## 7. Règle de densité

Une vue doit être lisible en quelques secondes pour son audience principale.

Signes d’une mauvaise vue :

- trop de types d’éléments ;
- lignes qui se croisent partout ;
- aucune hiérarchie visuelle ;
- plusieurs niveaux d’abstraction mélangés ;
- relations non nommées lorsque leur sens est ambigu ;
- détails inutiles pour l’audience.

---

## 8. Questions de contrôle

### Q1
Un diagramme concret présenté au CIO est-il une View ou un Viewpoint ?

**View.**

### Q2
Le cadre qui indique quels concepts employer pour construire une vue est-il une View ou un Viewpoint ?

**Viewpoint.**

### Q3
Peut-on produire plusieurs vues à partir du même modèle ?

**Oui.** C’est même l’un des intérêts fondamentaux d’un modèle d’architecture partagé.

### Q4
Faut-il toujours utiliser exactement un viewpoint standard sans adaptation ?

**Non.** Le viewpoint doit servir le concern, tout en conservant une sémantique cohérente.

---

## À retenir

> **Modèle = connaissance architecturale ; View = sélection adaptée ; Viewpoint = règles de construction de cette sélection.**
