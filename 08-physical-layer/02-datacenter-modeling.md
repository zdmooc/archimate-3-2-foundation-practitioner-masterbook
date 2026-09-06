# Modéliser un datacenter avec ArchiMate

Un datacenter est un excellent cas pour comprendre la complémentarité entre Technology Layer et Physical Layer.

Une modélisation utile doit répondre à plusieurs niveaux :

1. quels services technologiques sont fournis ;
2. quels logiciels système les réalisent ;
3. quels Devices les hébergent ;
4. dans quelles Facilities ils se trouvent ;
5. de quels équipements physiques ils dépendent ;
6. de quels réseaux d’énergie/refroidissement ils dépendent.

---

## 1. Vue logique minimale

```text
Technology Service: Container Platform Service
→ System Software: OpenShift
→ Device: Worker Servers
→ Facility: DC East
```

Cette vue suffit pour montrer où la plateforme s’exécute physiquement.

---

## 2. Vue physique enrichie

```text
Facility: DC East
├─ Device: Worker Servers
├─ Device: Database Servers
├─ Device: Network Appliances
├─ Equipment: UPS A
├─ Equipment: UPS B
├─ Equipment: Cooling Unit A
├─ Equipment: Cooling Unit B
├─ Distribution Network: Power Feed A
├─ Distribution Network: Power Feed B
└─ Distribution Network: Cooling Distribution
```

Cette vue montre que l’IT dépend d’une infrastructure plus large que les seuls serveurs.

---

## 3. Redondance électrique A/B

Une architecture peut déclarer des serveurs redondants tout en dépendant d’un même chemin électrique.

La Physical Layer permet de rendre cela visible.

### Mauvais raccourci

```text
Server A + Server B = HA
```

### Analyse plus complète

```text
Server A → Power Feed A
Server B → Power Feed B
Power Feed A → UPS A
Power Feed B → UPS B
```

Si les deux UPS dépendent ensuite du même point de distribution amont, la redondance apparente doit être questionnée.

---

## 4. Refroidissement

Le refroidissement est souvent ignoré dans les modèles IT.

Pourtant, une panne de refroidissement peut arrêter un datacenter aussi sûrement qu’une panne de calcul.

On peut représenter :

```text
Equipment: Chiller A
Equipment: Chiller B
Distribution Network: Cooling Water Network
Material: Cooling Water
Facility: Data Hall 1
```

L’objectif n’est pas de transformer ArchiMate en schéma HVAC détaillé. Il s’agit d’exprimer les dépendances architecturales pertinentes.

---

## 5. Datacenter, salle et zone

Selon le concern, plusieurs niveaux de Facility peuvent être utiles :

```text
Facility: DC East
  └─ Facility: Data Hall A
      └─ Facility: Secure Cage Payments
```

Cette granularité peut servir pour :

- isolation physique ;
- conformité ;
- analyse de sinistre ;
- capacité ;
- migration de salle ;
- criticité.

Mais une vue exécutive n’a probablement pas besoin du niveau rack/cage.

---

## 6. Réseau IT vs réseau physique de distribution

Dans un même datacenter :

```text
Communication Network: Datacenter IP Fabric
Distribution Network: Electrical Power Distribution
```

Les deux peuvent être critiques, mais ils transportent des choses différentes.

Le premier transporte de l’information.
Le second transporte de l’énergie.

---

## 7. Stockage

Une baie de stockage utilisée comme infrastructure IT peut être modélisée comme `Device`.

```text
Device: Enterprise Storage Array
Technology Service: Block Storage Service
```

La salle qui l’héberge reste une Facility.

Les systèmes de refroidissement ou d’alimentation qui la supportent relèvent du Physical.

---

## 8. Mainframe / Exadata / appliances

Un Exadata Database Machine ou une appliance spécialisée peut être modélisé à plusieurs niveaux selon le concern.

### Vue architecture de plateforme

```text
Node / Device: Exadata Database Machine
System Software: Oracle Database / Grid Infrastructure
Technology Service: Database Service
```

### Vue physique

```text
Device: Exadata Rack
→ Facility: DC East
→ depends on Power Distribution / Cooling
```

Il est inutile de modéliser chaque composant interne si la question porte seulement sur la dépendance du service de paiement au datacenter.

---

## 9. OpenShift on-prem

Pattern simple :

```text
Facility: DC East
  ├─ Device: OCP Worker 1
  ├─ Device: OCP Worker 2
  ├─ Device: OCP Worker 3
  └─ Communication Network: OCP Network

System Software: OpenShift
Technology Service: Container Platform Service
```

Puis :

```text
Equipment: UPS
Distribution Network: Power Distribution
```

La vue devient intéressante pour expliquer ce qui est réellement redondé.

---

## 10. Datacenter multi-site

MayaBank possède deux sites :

```text
Facility: DC East
Facility: DC West
```

Chaque site possède :

- sa plateforme OpenShift ;
- ses ressources DB ;
- son énergie ;
- son refroidissement ;
- sa connectivité.

Une bonne vue DR doit vérifier les dépendances partagées :

- opérateur télécom commun ;
- même fournisseur électrique ;
- même région géographique ;
- même stockage externe ;
- même service DNS ou IAM ;
- même source de sauvegarde.

Certaines de ces dépendances sont Technology ; d’autres Physical.

---

## 11. Single Points of Failure physiques

Un SPOF peut être :

- une arrivée électrique ;
- un UPS ;
- un chiller ;
- une salle ;
- une fibre ;
- un bâtiment ;
- une zone géographique.

Une vue Physical est donc particulièrement adaptée à la question :

> **Quels éléments physiques peuvent arrêter plusieurs composants logiquement redondants ?**

---

## 12. Baseline vs Target

### Baseline

```text
Legacy Payment Servers
→ Facility DC East only
→ single cooling dependency
```

### Target

```text
OCP Cluster East → DC East
OCP Cluster West → DC West
```

avec chemins physiques séparés.

Le modèle permet alors d’expliquer que la transformation améliore non seulement le logiciel mais aussi la résilience physique.

---

## 13. Questions d’architecture à poser

Pour chaque service critique :

1. où s’exécute-t-il ?
2. quelles Facilities sont impliquées ?
3. quels Devices portent réellement la charge ?
4. quelles alimentations électriques sont nécessaires ?
5. quel refroidissement est nécessaire ?
6. quels réseaux de communication sont nécessaires ?
7. existe-t-il un SPOF physique commun ?
8. la reprise après sinistre utilise-t-elle un autre site réel ?
9. les sauvegardes partagent-elles le même risque de site ?
10. le modèle distingue-t-il correctement logique et physique ?

---

## À retenir

> **Une architecture de datacenter n’est pas complète si elle montre seulement les serveurs.**

ArchiMate permet de relier les services technologiques aux Devices, aux Facilities et aux dépendances physiques qui déterminent réellement disponibilité et résilience.