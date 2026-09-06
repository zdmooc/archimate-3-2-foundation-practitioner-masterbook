# Partie VIII — Physical Layer : représenter le monde physique de l’architecture

La **Physical Layer** complète la Technology Layer lorsque l’architecture doit représenter des structures physiques, des équipements, des installations, des réseaux de distribution et des matières.

Elle répond à quatre questions principales :

- **Quel équipement physique agit sur de la matière ?** → `Equipment`
- **Dans quel environnement ou quelle installation physique cela se trouve-t-il ?** → `Facility`
- **Quel réseau transporte physiquement une matière ou une forme d’énergie ?** → `Distribution Network`
- **Quelle matière physique est créée, utilisée, stockée, déplacée ou transformée ?** → `Material`

Cette couche est particulièrement utile pour :

- datacenters ;
- sites industriels ;
- énergie ;
- refroidissement ;
- logistique ;
- infrastructures physiques ;
- Green IT ;
- continuité d’activité multi-site ;
- analyse des dépendances entre IT et environnement physique.

---

## 1. La chaîne mentale Physical

```text
WHERE PHYSICALLY?
Facility
   ↓
WHAT PHYSICAL MACHINES / TOOLS?
Equipment
   ↓
WHAT PHYSICAL FLOWS?
Distribution Network
   ↓
WHAT PHYSICAL MATTER / RESOURCE?
Material
```

Cette chaîne est pédagogique. Elle aide à lire un modèle, mais ArchiMate n’impose pas qu’un modèle Physical contienne tous ces éléments.

---

## 2. Physical Layer vs Technology Layer

La distinction centrale est la suivante :

### Technology Layer

Elle décrit principalement l’infrastructure IT et les services technologiques.

Exemples :

- `Device: OpenShift Worker Server`
- `System Software: Red Hat OpenShift`
- `Communication Network: Datacenter IP Network`
- `Technology Service: Container Runtime Service`

### Physical Layer

Elle décrit davantage l’environnement physique et les ressources physiques qui ne sont pas simplement des ressources IT logiques ou informatiques.

Exemples :

- `Facility: Datacenter Paris`
- `Equipment: UPS System`
- `Equipment: Chiller`
- `Distribution Network: Power Distribution Network`
- `Material: Electrical Energy`

Le bon modèle peut relier les deux couches.

---

## 3. Exemple MayaBank : datacenter

MayaBank exploite une plateforme critique sur deux sites.

### Facilities

- `MayaBank DC East`
- `MayaBank DC West`

### Technology Devices

- OpenShift Worker Servers
- Database Servers
- Storage Appliances
- Network Appliances

### Physical Equipment

- UPS
- Power Distribution Unit
- Cooling Units
- Diesel Generator

### Distribution Networks

- Electrical Distribution
- Cooling Water Distribution
- Fuel Distribution, si pertinent

### Materials

- Electrical Energy
- Cooling Water
- Fuel

La valeur de la Physical Layer apparaît lorsqu’on veut montrer qu’un service IT critique dépend aussi de ressources physiques.

---

## 4. Serveur physique : Device ou Equipment ?

Pour un serveur utilisé comme ressource informatique, le concept le plus naturel est généralement `Device`.

```text
Device: OpenShift Worker Server
```

Même si le serveur est physiquement réel, il joue ici le rôle de **ressource IT capable d’héberger ou d’exécuter du logiciel**.

`Equipment` sera davantage utilisé pour des machines, outils ou installations physiques manipulant de la matière ou participant à un processus physique.

Exemples :

- UPS ;
- chiller ;
- groupe électrogène ;
- pompe ;
- convoyeur ;
- robot industriel.

---

## 5. Communication Network vs Distribution Network

### Communication Network

Transporte de l’information.

Exemples :

- réseau Ethernet ;
- WAN ;
- backbone IP ;
- réseau inter-datacenter.

### Distribution Network

Transporte une matière ou une ressource physique.

Exemples :

- alimentation électrique ;
- réseau d’eau glacée ;
- réseau de carburant ;
- réseau de distribution thermique.

### Réflexe

```text
DATA / INFORMATION → Communication Network
ENERGY / MATERIAL → Distribution Network
```

---

## 6. Physical Layer et Green IT

La Physical Layer devient très utile lorsqu’on veut dépasser une vision purement logicielle du numérique.

Une application consomme indirectement :

- des ressources de calcul ;
- de l’électricité ;
- du refroidissement ;
- du stockage ;
- des équipements ;
- des surfaces de datacenter ;
- des renouvellements matériels.

ArchiMate ne devient pas pour autant une calculette carbone.

Le modèle sert à **représenter les dépendances**.

Exemple :

```text
Application Component: Payment Orchestrator
→ deployed via Artifact
→ Device: OCP Worker Server
→ located in Facility: DC East
→ depends on Equipment: Cooling System
→ depends on Distribution Network: Power Distribution
```

Les valeurs carbone, énergie, puissance, durée de vie ou PUE peuvent être ajoutées sous forme de propriétés, annotations ou mécanismes de spécialisation/customization selon le besoin.

---

## 7. Physical Layer et continuité d’activité

Une architecture HA ou DR n’est pas seulement une question de clusters.

Deux clusters peuvent être indépendants logiquement mais partager :

- le même bâtiment ;
- la même arrivée électrique ;
- le même système de refroidissement ;
- le même opérateur réseau ;
- le même local technique.

Une vue Physical peut rendre ces dépendances visibles.

Exemple :

```text
Cluster A → Facility DC1
Cluster B → Facility DC1
```

Cela montre immédiatement qu’un incident de site peut affecter les deux.

Une vraie architecture multi-site peut montrer :

```text
Cluster A → Facility DC East
Cluster B → Facility DC West
```

avec réseaux, énergie et dépendances physiques distinctes.

---

## 8. Physical Layer et architecture cloud

Dans le cloud public, le modélisateur ne connaît pas toujours les détails physiques.

Il ne faut donc pas inventer des racks, serveurs ou datacenters précis.

On peut rester au niveau approprié :

```text
Facility: Cloud Region France
```

si la localisation physique ou réglementaire est pertinente.

Mais si le fournisseur ne donne pas le détail exact de l’infrastructure, le modèle doit rester abstrait.

Le principe est :

> **ne modéliser physiquement que ce qui est connu, pertinent et utile au concern.**

---

## 9. Les quatre concepts à ne pas confondre

| Concept | Question | Exemple |
|---|---|---|
| Equipment | quelle machine physique ? | UPS |
| Facility | quel lieu / environnement physique ? | Datacenter |
| Distribution Network | quel réseau transporte matière/énergie ? | réseau électrique |
| Material | quelle matière ou ressource physique ? | énergie électrique |

---

## 10. Passage Technology → Physical

Pattern utile :

```text
Application Component
→ Artifact
→ Device
→ Facility
→ Equipment / Distribution Network / Material
```

Exemple MayaBank :

```text
Payment Orchestrator
→ payment-orchestrator-image
→ OpenShift Worker Server
→ MayaBank DC East
→ Electrical Distribution
→ Electrical Energy
```

La Physical Layer permet ainsi de poursuivre la traçabilité jusqu’aux dépendances matérielles.

---

## 11. Questions de contrôle

### Q1
Un serveur physique hébergeant OpenShift ?

**Réponse : Device**, lorsqu’il est modélisé comme ressource informatique.

### Q2
Un groupe électrogène ?

**Réponse : Equipment.**

### Q3
Un datacenter ?

**Réponse : Facility.**

### Q4
Un backbone IP inter-site ?

**Réponse : Communication Network.**

### Q5
Un réseau de distribution électrique ?

**Réponse : Distribution Network.**

### Q6
L’électricité consommée par le site ?

**Réponse : Material**, si le modèle veut représenter explicitement la ressource physique/énergétique.

---

## À retenir

> **Technology décrit l’infrastructure IT ; Physical permet de représenter le monde physique qui rend cette infrastructure possible.**

La couche devient particulièrement utile pour les datacenters, la résilience de site, l’énergie, le refroidissement, les infrastructures physiques et les analyses Green IT.