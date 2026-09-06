# MayaBank — Physical Architecture complète

Cette vue fil rouge prolonge la Business, Application et Technology Architecture jusqu’au monde physique.

Le concern principal est :

> **La plateforme de paiement instantané reste-t-elle disponible en cas de panne de composant, de salle ou de site, et quelles dépendances physiques déterminent réellement cette résilience ?**

---

## 1. Contexte

MayaBank veut exploiter sa nouvelle plateforme de paiement sur deux sites physiques.

### Site East

`Facility: MayaBank DC East`

### Site West

`Facility: MayaBank DC West`

Les deux sites doivent pouvoir porter les fonctions critiques de paiement.

---

## 2. Technology Layer par site

### DC East

- Device: OCP Worker E1
- Device: OCP Worker E2
- Device: OCP Worker E3
- Device: Kafka Node E1
- Device: Database Node E1
- Communication Network: East Datacenter Fabric

### DC West

- Device: OCP Worker W1
- Device: OCP Worker W2
- Device: OCP Worker W3
- Device: Kafka Node W1
- Device: Database Node W1
- Communication Network: West Datacenter Fabric

---

## 3. Physical Equipment

### DC East

- Equipment: UPS East A
- Equipment: UPS East B
- Equipment: Generator East
- Equipment: Cooling Unit East A
- Equipment: Cooling Unit East B

### DC West

- Equipment: UPS West A
- Equipment: UPS West B
- Equipment: Generator West
- Equipment: Cooling Unit West A
- Equipment: Cooling Unit West B

---

## 4. Distribution Networks

### East

- Distribution Network: Power Feed East A
- Distribution Network: Power Feed East B
- Distribution Network: Cooling Distribution East

### West

- Distribution Network: Power Feed West A
- Distribution Network: Power Feed West B
- Distribution Network: Cooling Distribution West

---

## 5. Materials

- Material: Electrical Energy
- Material: Cooling Water
- Material: Backup Generator Fuel

Ces éléments ne représentent pas les mesures de consommation. Les mesures restent des données ou propriétés.

---

## 6. Application → Technology → Physical

Pour le composant principal :

```text
Application Component: Payment Orchestrator
→ Artifact: payment-orchestrator-image
→ System Software: OpenShift
→ Device: OCP Worker
→ Facility: DC East / DC West
```

Puis les dépendances physiques :

```text
Facility
→ Power Distribution
→ UPS / Generator
→ Electrical Energy
```

et :

```text
Facility
→ Cooling Distribution
→ Cooling Equipment
→ Cooling Water
```

---

## 7. Kafka

L’event streaming reste modélisé technologiquement :

```text
Technology Service: Event Streaming Service
→ System Software: Kafka
→ Devices: Kafka Nodes
→ Facilities: East / West
```

La Physical Layer ajoute la dépendance de chaque Kafka Node au site réel.

---

## 8. Base de données

### Option A — PostgreSQL distribué

```text
Database Service
→ PostgreSQL System Software
→ Database Devices East/West
```

### Option B — Oracle / Exadata

```text
Database Service
→ Oracle RAC / Grid Infrastructure
→ Exadata Device(s)
→ Facility East / West
```

La Physical Layer ne change pas la logique Oracle ; elle indique les lieux et dépendances matérielles.

---

## 9. Réseau inter-site

Le flux de données inter-site est représenté par :

```text
Communication Network: East-West Inter-DC Network
```

Il ne faut pas le confondre avec :

```text
Distribution Network: Power Feed East
```

Le premier transporte de l’information.
Le second transporte de l’énergie.

---

## 10. Baseline

La plateforme legacy possède :

- majorité des traitements sur DC East ;
- serveurs dédiés par application ;
- dépendances électriques peu documentées ;
- reprise partielle sur DC West ;
- capacité surdimensionnée ;
- visibilité limitée sur consommation et utilisation.

---

## 11. Target

La cible possède :

- plateforme OpenShift sur deux sites ;
- séparation des worker pools ;
- Kafka résilient ;
- base répliquée / standby selon architecture retenue ;
- observabilité centralisée ;
- chemins d’alimentation A/B ;
- dépendances de refroidissement identifiées ;
- stratégie de backup et DR indépendante du site primaire.

---

## 12. Gaps physiques

### Gap 1 — dépendances électriques non tracées

Risque : fausse impression de redondance.

### Gap 2 — plateforme legacy concentrée sur East

Risque : perte de site.

### Gap 3 — inventaire énergie incomplet

Risque : incapacité à mesurer le gain Green IT.

### Gap 4 — stockage et backup partagent certains risques de site

Risque : reprise compromise.

### Gap 5 — refroidissement non représenté dans les dossiers d’architecture

Risque : dépendance invisible.

---

## 13. Target Green IT

Le modèle cible peut suivre :

```text
Goal: Reduce Physical Footprint
→ Requirement: Consolidate workloads
→ Technology Service: Container Platform
→ Devices: Shared Worker Pool
→ Facilities: East / West
```

Puis les métriques externes permettent de comparer :

- nombre de Devices ;
- CPU/RAM installés ;
- taux d’utilisation ;
- puissance moyenne ;
- stockage ;
- empreinte de fabrication ;
- consommation annuelle ;
- empreinte carbone.

---

## 14. Vue de sinistre

### Scénario 1 — perte d’un worker

Impact limité si le cluster et les workloads sont correctement redondés.

### Scénario 2 — perte d’un UPS

La vue Physical permet de vérifier quel ensemble de Devices en dépend.

### Scénario 3 — perte de refroidissement East

Le problème peut affecter plusieurs racks et services simultanément.

### Scénario 4 — perte complète de DC East

La continuité dépend de la capacité réelle du site West, des données, du réseau, de l’IAM, du DNS, de Kafka et des bases.

---

## 15. Vue synthétique

```text
Business Service: Instant Payment
        ↓
Application Service: Payment Orchestration
        ↓
Application Component: Payment Orchestrator
        ↓
Artifact: Container Image
        ↓
System Software: OpenShift
        ↓
Device: Worker Server
        ↓
Facility: DC East / DC West
        ↓
Equipment + Distribution Networks + Materials
```

Cette chaîne rend visible la dépendance complète entre valeur métier et monde physique.

---

## 16. Questions de revue MayaBank

1. les deux sites sont-ils réellement indépendants ?
2. les bases et Kafka survivent-ils à la perte d’un site ?
3. le réseau inter-site constitue-t-il un SPOF ?
4. les sauvegardes sont-elles physiquement séparées ?
5. les capacités West suffisent-elles au mode dégradé ?
6. les chemins électriques A/B sont-ils réellement indépendants ?
7. les systèmes de refroidissement sont-ils redondants ?
8. quelles ressources physiques ont le plus fort impact environnemental ?
9. quels Devices peuvent être consolidés ?
10. quels éléments doivent apparaître dans les runbooks PRA ?

---

## À retenir

> **La résilience de MayaBank n’est pas seulement une propriété des pods, clusters ou bases : elle dépend aussi des Facilities, réseaux physiques et Equipment qui les maintiennent en fonctionnement.**