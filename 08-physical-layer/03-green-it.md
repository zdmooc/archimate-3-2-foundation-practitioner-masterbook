# Physical Layer, énergie et Green IT

La Physical Layer est particulièrement utile pour relier une architecture numérique à ses conséquences matérielles : serveurs, datacenters, énergie, refroidissement, stockage physique et renouvellement matériel.

Elle ne remplace pas un outil de mesure environnementale. Elle permet surtout de **structurer les dépendances physiques** qui expliquent où se produisent les consommations et impacts.

---

## 1. Ce qu’ArchiMate peut représenter

ArchiMate peut représenter :

- les applications ;
- les infrastructures IT ;
- les Devices ;
- les Facilities ;
- les Equipment ;
- les Distribution Networks ;
- les Materials ;
- les motivations et exigences de sobriété.

Il peut donc relier :

```text
Goal: Reduce IT Environmental Impact
→ Requirement: reduce physical infrastructure footprint
→ Application Component
→ Technology Service
→ Device
→ Facility
→ Power / Cooling dependencies
```

---

## 2. Ce qu’ArchiMate ne calcule pas automatiquement

Le langage ne calcule pas :

- kWh ;
- kgCO2e ;
- PUE ;
- WUE ;
- émissions de fabrication ;
- durée de vie ;
- taux d’utilisation ;
- empreinte par transaction.

Ces mesures doivent venir de sources de données ou outils spécialisés.

Le modèle ArchiMate peut ensuite porter ou référencer ces valeurs via :

- propriétés ;
- annotations ;
- Data Objects ;
- Assessments ;
- Requirements ;
- mécanismes de specialization/customization.

---

## 3. Exemple : empreinte d’un serveur

```text
Device: OCP Worker 01
Properties:
- CPU cores: 32
- RAM: 256 GiB
- Average power: 410 W
- Manufacturing footprint: <measured value>
```

Ces propriétés ne deviennent pas de nouveaux concepts ArchiMate.

Le Device reste un Device.

---

## 4. Mesure vs ressource physique

Il faut distinguer :

```text
Material: Electrical Energy
Data Object: Power Consumption Measurement
Assessment: Current platform is under-utilized
```

- Material = ressource physique ;
- Data Object = donnée mesurée ;
- Assessment = interprétation architecturale.

Cette séparation est très puissante pour Green IT.

---

## 5. Relier Green IT à Motivation

Exemple :

```text
Stakeholder: Sustainability Officer
Driver: corporate decarbonization target
Assessment: legacy payment servers average 12% utilization
Goal: reduce infrastructure footprint
Outcome: fewer physical servers for same business volume
Requirement: target platform must support consolidation and autoscaling
```

Puis :

```text
Capability: Elastic Platform Operations
→ Application Architecture
→ Technology Service: Container Platform
→ Devices: consolidated worker pool
```

ArchiMate permet ainsi de relier l’objectif environnemental à une transformation technique.

---

## 6. Fabrication vs usage

Une analyse environnementale IT doit souvent distinguer :

### Fabrication

Impact associé à la fabrication d’équipements physiques.

### Usage

Impact associé notamment à :

- consommation électrique ;
- refroidissement ;
- réseau ;
- stockage ;
- exploitation.

Un modèle peut aider à identifier quels Devices et Facilities sont concernés, sans prétendre fournir lui-même le facteur d’émission.

---

## 7. Consolidation

### Baseline

```text
Application A → 4 dedicated servers
Application B → 4 dedicated servers
Application C → 4 dedicated servers
```

### Target

```text
Applications A/B/C
→ shared Container Platform Service
→ pooled worker Devices
```

Le modèle permet de montrer la consolidation.

Les gains réels doivent ensuite être mesurés avec des données de capacité, d’usage et d’empreinte.

---

## 8. Surdimensionnement

Un modèle peut rendre visibles :

- nombreux Devices dédiés ;
- faible mutualisation ;
- réplication excessive ;
- capacités inutilisées ;
- dépendances de stockage disproportionnées.

Mais le diagnostic de surdimensionnement doit s’appuyer sur des mesures.

Pattern :

```text
Device
→ Data Object: Utilization Metrics
→ Assessment: under-utilized infrastructure
→ Goal: optimize resource use
```

---

## 9. Autoscaling

L’autoscaling n’est pas intrinsèquement “vert”.

Il peut réduire le gaspillage s’il permet d’ajuster les ressources au besoin réel.

Mais il peut aussi augmenter la consommation si les politiques sont mal réglées.

Le modèle doit donc distinguer :

```text
Requirement: workload elasticity
Technology Service: Autoscaling Service
System Software: OpenShift / Kubernetes
Device Pool: Worker Nodes
```

Puis les données d’usage déterminent le bénéfice réel.

---

## 10. Storage lifecycle

Le stockage est un sujet Green IT majeur.

On peut représenter :

```text
Application Component
→ Data Object
→ Artifact / storage realization
→ Technology Service: Object Storage
→ Device: Storage Infrastructure
```

Puis relier des exigences :

- TTL ;
- archivage ;
- suppression ;
- compression ;
- tiering ;
- conservation réglementaire.

La décision architecturale doit arbitrer entre conformité, disponibilité, coût et sobriété.

---

## 11. Datacenter efficiency

Une Facility peut porter des propriétés comme :

- site ;
- région ;
- source énergétique ;
- PUE mesuré ;
- capacité ;
- contraintes réglementaires.

Le modèle peut alors comparer :

```text
Facility: DC Legacy
Facility: DC Optimized
```

sans confondre l’élément Facility avec les métriques qui le caractérisent.

---

## 12. Embodied carbon / renouvellement matériel

Le remplacement fréquent de Devices peut augmenter l’impact de fabrication.

Une architecture peut donc contenir des préoccupations comme :

```text
Driver: hardware refresh cycle
Assessment: premature replacement increases embodied impact
Goal: extend useful hardware lifetime where feasible
Requirement: target platform supports heterogeneous certified hardware
```

Le modèle aide à relier politique de cycle de vie et architecture.

---

## 13. Green IT ≠ réduction de serveurs uniquement

Une bonne analyse peut couvrir :

- compute ;
- mémoire ;
- stockage ;
- backup ;
- réseau ;
- datacenter ;
- logiciels ;
- données ;
- architecture applicative ;
- patterns d’usage ;
- durée de vie matérielle.

Le modèle ArchiMate permet de structurer ces dépendances de bout en bout.

---

## 14. Exemple MayaBank

### Baseline

- 18 serveurs dédiés paiement ;
- stockage local et partagé redondant ;
- faible taux d’utilisation ;
- deux salles physiques ;
- capacités surprovisionnées.

### Target

- plateforme OpenShift mutualisée ;
- worker pools ajustés ;
- stockage objet pour les usages adaptés ;
- observabilité des ressources ;
- politiques de cycle de vie des données.

### Chaîne ArchiMate

```text
Driver: Decarbonization Target
→ Assessment: Dedicated platform under-utilized
→ Goal: Reduce Resource Footprint
→ Requirement: Consolidate workloads safely
→ Technology Service: Container Platform
→ Device Pool: OCP Workers
→ Facility: DC East / DC West
```

---

## 15. Questions de contrôle

### Q1
Doit-on modéliser “100 kgCO2e” comme Material ?

**Non.** C’est une mesure/valeur, pas une matière architecturale au sens utile ici.

### Q2
Une valeur de consommation énergétique ?

Peut être une propriété ou un Data Object de mesure.

### Q3
L’électricité réellement consommée ?

Peut être représentée comme Material si cette dépendance physique est pertinente.

### Q4
Le datacenter ?

Facility.

### Q5
Le serveur mesuré ?

Device.

---

## À retenir

> **ArchiMate structure la causalité architecturale ; les outils Green IT fournissent les mesures.**

Le meilleur usage consiste à relier objectifs environnementaux, architecture applicative, plateforme technologique et infrastructure physique, puis à enrichir le modèle avec des mesures réelles.