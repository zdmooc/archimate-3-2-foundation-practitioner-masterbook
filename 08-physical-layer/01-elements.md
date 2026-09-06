# Les éléments Physical — Equipment, Facility, Distribution Network et Material

La Physical Layer contient peu d’éléments, mais chacun répond à une question très différente. Le risque principal n’est donc pas d’oublier un élément ; c’est de choisir le mauvais.

---

# 1. Equipment

Un **Equipment** représente un élément physique capable de réaliser un comportement physique, notamment créer, utiliser, stocker, déplacer ou transformer une matière.

Le mot-clé est : **machine ou outil physique**.

## Exemples génériques

- groupe électrogène ;
- UPS ;
- chiller ;
- pompe ;
- système de ventilation ;
- robot industriel ;
- convoyeur ;
- système de manutention.

## Exemple MayaBank

Dans un datacenter bancaire :

```text
Equipment: UPS System
Equipment: Cooling Unit
Equipment: Diesel Generator
```

Ces équipements ne sont pas des composants applicatifs et ne sont pas non plus du `System Software`.

---

# 2. Equipment vs Device

C’est la confusion la plus importante de cette partie.

## Device

`Device` appartient à la Technology Layer.

Il représente une ressource IT physique capable d’héberger, stocker ou exécuter du logiciel ou des artifacts.

Exemples :

- serveur x86 ;
- appliance réseau ;
- storage appliance ;
- smartphone, si pertinent pour la vue ;
- terminal technique.

## Equipment

`Equipment` appartient à la Physical Layer.

Il représente une machine ou un outil physique dans un processus matériel.

Exemples :

- UPS ;
- chiller ;
- pompe ;
- générateur.

## Tableau de décision

| Élément réel | Concept recommandé | Pourquoi |
|---|---|---|
| serveur OpenShift | Device | ressource IT |
| switch réseau | Device | infrastructure IT |
| baie de stockage | Device | infrastructure IT |
| UPS | Equipment | équipement énergétique |
| chiller | Equipment | équipement de refroidissement |
| groupe électrogène | Equipment | équipement de production énergétique |

Le contexte reste important, mais cette règle couvre la plupart des architectures SI.

---

# 3. Facility

Une **Facility** représente une structure physique ou un environnement physique.

Elle répond à :

> **Où physiquement se trouve ou se déroule quelque chose ?**

## Exemples

- datacenter ;
- bâtiment ;
- salle informatique ;
- agence bancaire ;
- site industriel ;
- entrepôt ;
- salle serveur ;
- zone technique.

## Exemple MayaBank

```text
Facility: MayaBank DC East
Facility: MayaBank DC West
Facility: Paris Operations Center
```

Une Facility peut contenir des Devices et des Equipment selon le niveau du modèle.

---

# 4. Facility vs Node

`Node` appartient à la Technology Layer.

`Facility` appartient à la Physical Layer.

### Node

Représente une ressource computationnelle ou technologique sur laquelle des artifacts peuvent être déployés ou exécutés.

### Facility

Représente un environnement ou une structure physique.

Exemple :

```text
Facility: DC East
  contains
Device: Worker Server 01
  contains / hosts
System Software: OpenShift Node Runtime
```

Le datacenter n’est donc pas un Node simplement parce qu’il contient de l’IT.

---

# 5. Distribution Network

Un **Distribution Network** représente un réseau physique servant à transporter des matières ou de l’énergie.

Il répond à :

> **Par quel réseau physique cette ressource est-elle distribuée ?**

## Exemples

- réseau électrique ;
- réseau d’eau ;
- réseau d’eau glacée ;
- réseau de carburant ;
- distribution de gaz ;
- réseau thermique.

## Exemple datacenter

```text
Distribution Network: Electrical Power Distribution
Distribution Network: Cooling Water Distribution
```

---

# 6. Distribution Network vs Communication Network

### Communication Network

Transporte de l’information.

Exemples :

- Ethernet ;
- IP WAN ;
- SD-WAN ;
- fibre inter-datacenter ;
- réseau MPLS.

### Distribution Network

Transporte une ressource physique.

Exemples :

- électricité ;
- eau ;
- carburant ;
- chaleur/froid selon le modèle.

## Test mental

> Si la panne empêche les bits de circuler → probablement Communication Network.

> Si la panne empêche l’énergie ou une matière d’arriver → probablement Distribution Network.

---

# 7. Material

Un **Material** représente une matière ou ressource physique pertinente dans l’architecture.

## Exemples

- électricité ;
- eau ;
- carburant ;
- matière première ;
- produit physique ;
- pièces de rechange ;
- consommables.

Dans une architecture numérique, le concept est moins fréquent que dans l’industrie, mais il devient pertinent avec :

- énergie ;
- refroidissement ;
- logistique matériel ;
- Green IT ;
- datacenter physique.

---

# 8. Material vs Data Object

Un `Material` est physique.

Un `Data Object` est une donnée structurée destinée à un traitement automatisé.

```text
Material: Electrical Energy
Data Object: Power Consumption Measurement
```

La consommation électrique réelle et la donnée qui enregistre cette consommation sont deux choses différentes.

Cette distinction est essentielle pour les architectures Green IT.

---

# 9. Material vs Artifact

Un `Artifact` représente une réalisation physique ou déployable d’un élément logiciel ou informationnel.

Exemples :

- image OCI ;
- JAR ;
- fichier de configuration ;
- schéma SQL ;
- bundle déployable.

Un `Material` représente une matière physique.

```text
Artifact: payment-orchestrator:2.4.1
Material: Electrical Energy
```

Il ne faut jamais appeler `Material` une image Docker, un fichier ou un message Kafka.

---

# 10. Relations conceptuelles utiles

Sans entrer encore dans les règles détaillées de la Partie X :

- une Facility peut contenir ou agréger des Equipment et Devices ;
- un Equipment peut utiliser, transformer ou déplacer un Material ;
- un Distribution Network transporte ou relie des flux physiques ;
- des éléments Technology peuvent être localisés ou dépendre d’éléments Physical.

L’objectif principal est de représenter les dépendances physiques de façon intelligible.

---

# 11. Exemple MayaBank complet

```text
Facility: DC East
├─ Device: OpenShift Worker Server
├─ Device: Database Server
├─ Equipment: UPS System
├─ Equipment: Cooling Unit
├─ Distribution Network: Power Distribution
└─ Distribution Network: Cooling Distribution

Material: Electrical Energy
Material: Cooling Water
```

Puis :

```text
Payment Orchestrator
→ deployed as Artifact
→ hosted on Device
→ located in Facility
→ depends on physical energy and cooling infrastructure
```

Ce type de modèle permet de faire le lien entre architecture applicative et contraintes réelles du datacenter.

---

# 12. Cas de décision

## Cas A — baie informatique

Si elle est modélisée comme équipement de calcul ou de stockage : `Device`.

## Cas B — rack

Selon le concern, il peut être représenté comme structure physique, mais souvent il n’est pas nécessaire de descendre à ce niveau dans un modèle d’architecture d’entreprise.

## Cas C — PDU

Si l’on veut représenter son rôle dans la distribution électrique : `Equipment`, éventuellement lié à une `Distribution Network`.

## Cas D — câble Ethernet

Le réseau logique ou physique de communication est généralement représenté par `Communication Network` ou `Path` selon le besoin, pas par `Distribution Network`.

## Cas E — circuit électrique

`Distribution Network`.

---

# 13. Questions de contrôle

### Q1
Une salle informatique ?

**Facility.**

### Q2
Un serveur bare metal ?

**Device.**

### Q3
Un système de refroidissement ?

**Equipment.**

### Q4
Une alimentation électrique redondée A/B ?

**Distribution Network**, avec éventuellement les équipements associés.

### Q5
Une mesure de puissance en kW ?

La mesure elle-même est une information : **Data Object** ou propriété selon le modèle. La ressource consommée est `Material` si elle est représentée explicitement.

---

## À retenir

> **Device = IT physique. Equipment = machine physique hors logique IT. Facility = lieu physique. Distribution Network = transport physique. Material = ressource physique.**