# MayaBank — Physical, Green IT, HA & DR Architecture

Cette fiche descend jusqu’aux infrastructures physiques et montre comment éviter deux erreurs fréquentes : confondre Technology et Physical, et revendiquer des gains Green IT sans démontrer quels assets physiques disparaissent réellement.

## 1. Facilities

- MayaBank Site A
- MayaBank Site B
- Production Data Hall A
- Production Data Hall B
- Network Room
- Backup Area

`Facility` représente l’environnement physique dans lequel des équipements sont installés ou des activités physiques peuvent avoir lieu.

## 2. Devices

Les équipements informatiques actifs restent généralement des `Device` :

- compute server ;
- storage appliance ;
- network appliance ;
- HSM appliance.

Exemple :

```text
Device: OpenShift Worker Server A1
Device: Kafka Server A2
Device: Database Server A3
```

## 3. Equipment

Pour la couche Physical, exemples :

- UPS ;
- PDU ;
- generator ;
- cooling unit ;
- chiller ;
- rack ;
- physical security equipment.

Un serveur informatique n’est pas automatiquement `Equipment` : dans ArchiMate, le concept `Device` est généralement plus pertinent pour le matériel IT capable de traitement/stockage/communication.

## 4. Distribution Networks

Exemples :

- electrical distribution A ;
- electrical distribution B ;
- cooling distribution ;
- fuel distribution for generators.

Ils ne doivent pas être confondus avec les `Communication Network` IP/MPLS/etc.

## 5. Material

`Material` sert aux matières physiques utilisées ou produites.

Dans un modèle IT, son usage est moins fréquent. Il peut être utile pour des concerns liés aux ressources physiques, à l’énergie/fuel ou à des environnements industriels, mais il ne doit pas être utilisé pour représenter une donnée ou un artifact logiciel.

## 6. Physical deployment chain

```text
Application Component
← Artifact
→ Node
→ Device
→ Facility
```

Le niveau exact dépend du concern : une vue de solution peut s’arrêter au Node ; une vue Green IT ou datacenter peut descendre aux Devices et Facilities.

## 7. Site A / Site B

Exemple :

```text
Facility: Site A
  contains → Devices A

Facility: Site B
  contains → Devices B
```

Les deux sites sont reliés par une `Communication Network` ou des `Paths` logiques/techniques pour la réplication et les flux applicatifs.

## 8. HA intra-site

La haute disponibilité au sein d’un site peut reposer sur :

- plusieurs workers OpenShift ;
- plusieurs brokers Kafka ;
- plusieurs instances DB ;
- redondance réseau ;
- alimentation A/B ;
- stockage redondant.

Une vue HA doit montrer les dépendances critiques, pas seulement deux boîtes dupliquées.

## 9. DR inter-site

### Exemple actif/passif

```text
Site A = primary
Site B = standby
```

### Exemple actif/actif

Certains services peuvent fonctionner simultanément sur les deux sites si l’application et la donnée le permettent.

Le modèle doit distinguer :

- application availability ;
- platform availability ;
- database replication ;
- Kafka replication ;
- object storage replication ;
- network dependency ;
- DNS/global routing dependency.

## 10. RPO/RTO

RPO et RTO sont des exigences/propriétés qui doivent être reliées à la criticité métier.

Exemple :

```text
Business Service: Instant Payment Service
→ Requirement: RTO < target
→ Requirement: RPO = target
→ Application Components
→ Technology DR Services
→ Sites
```

## 11. Green IT baseline

Le Baseline peut contenir :

- serveurs physiques sous-utilisés ;
- environnements dédiés par application ;
- surprovisionnement ;
- équipements legacy non consolidables ;
- stockage redondant peu rationalisé ;
- coexistence prolongée.

## 12. Green IT target

La cible peut viser :

- consolidation ;
- mutualisation de plateforme ;
- élasticité ;
- réduction de la capacité inactive ;
- meilleure densité d’usage ;
- décommissionnement de matériels ;
- réduction du nombre de plateformes parallèles.

## 13. Attention au faux gain

Mauvais raisonnement :

```text
Legacy workload moved to OpenShift
→ carbon saving achieved
```

Insuffisant.

Il faut vérifier :

```text
Legacy workload migrated
→ legacy capacity really removed or reused
→ physical assets powered down / avoided / consolidated
→ measured or estimated footprint changes
```

## 14. Build vs Use concern

L’empreinte peut distinguer :

- fabrication/embodied carbon ;
- consommation électrique/usage ;
- stockage ;
- réseau ;
- backup ;
- renouvellement matériel.

ArchiMate ne calcule pas ces valeurs. Elles peuvent être associées comme propriétés ou données d’analyse aux éléments pertinents.

## 15. Green IT view

Une vue utile peut relier :

```text
Goal: Reduce IT Footprint
→ Course of Action: Consolidate Platforms
→ Work Package: Migrate Legacy Payments
→ Plateau: Target Shared OpenShift Platform
→ Devices decommissioned / avoided
→ Facilities / energy dependencies
```

## 16. Capacity concern

Pour chaque Device ou Node important, des propriétés peuvent documenter :

- CPU ;
- RAM ;
- storage ;
- utilization ;
- power ;
- lifecycle ;
- site ;
- criticality.

Ces propriétés facilitent l’analyse mais ne changent pas la sémantique de l’élément.

## 17. SPOF physical analysis

Exemples à rechercher :

- unique PDU ;
- unique network path ;
- unique storage controller ;
- unique HSM ;
- unique inter-site link ;
- shared cooling dependency.

Une architecture logiquement redondante peut rester physiquement fragile si plusieurs composants partagent la même dépendance.

## 18. Cross-layer incident example

```text
Equipment: PDU A failure
→ impacts Device group
→ impacts OpenShift Workers
→ impacts Technology Service
→ impacts Payment Orchestrator
→ impacts Business Service: Instant Payment
```

Cette vue démontre la valeur du modèle d’entreprise pour l’analyse d’impact.

## 19. Decommissioning evidence

Un Work Package de décommissionnement devrait produire des Deliverables tels que :

- legacy application disabled ;
- legacy DB archived ;
- traffic removed ;
- infrastructure released ;
- monitoring removed ;
- support contract terminated ;
- hardware decommissioned or reallocated.

## 20. Anti-patterns

- utiliser `Equipment` pour tout matériel IT ;
- utiliser `Distribution Network` pour un réseau IP ;
- confondre Node logique et serveur physique ;
- afficher un gain carbone sans expliquer le changement d’asset ou d’usage ;
- ignorer la coexistence temporaire qui augmente parfois l’empreinte pendant la migration ;
- déclarer un DR sans montrer la donnée et la connectivité.

## 21. Vue physique synthétique

```text
Business Service
→ Applications
→ Technology Services
→ Nodes
→ Devices
→ Facilities
→ Energy / Cooling Dependencies
```

> **La couche Physical devient stratégique lorsque la résilience, la capacité, le coût ou l’empreinte environnementale dépendent de la réalité matérielle.**