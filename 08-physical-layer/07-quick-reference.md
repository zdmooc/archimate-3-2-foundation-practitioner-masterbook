# Quick Reference — Physical Layer

## Les 4 éléments

| Élément | Question | Exemple |
|---|---|---|
| Equipment | quelle machine physique agit ? | UPS, chiller, generator |
| Facility | où physiquement ? | datacenter, bâtiment, salle |
| Distribution Network | quel réseau transporte matière/énergie ? | power distribution, cooling network |
| Material | quelle ressource physique ? | electricity, water, fuel |

---

## Distinctions à mémoriser

### Device vs Equipment

```text
IT resource capable of hosting/executing software → Device
Physical machine/tool acting on material → Equipment
```

Exemples :

```text
Server → Device
Storage Array → Device
UPS → Equipment
Chiller → Equipment
Generator → Equipment
```

### Communication Network vs Distribution Network

```text
information/data → Communication Network
material/energy → Distribution Network
```

### Data Object vs Material

```text
Power Consumption Measurement → Data Object / property
Electrical Energy → Material
```

### Artifact vs Material

```text
container image → Artifact
fuel / water / electricity → Material
```

### Node vs Facility

```text
compute/runtime environment → Node
physical place/environment → Facility
```

---

## Pattern datacenter

```text
Application Component
→ Artifact
→ System Software
→ Device
→ Facility
→ Equipment / Distribution Network
→ Material
```

---

## Pattern Green IT

```text
Driver
→ Assessment
→ Goal
→ Requirement
→ Technology Service
→ Devices
→ Facilities
→ physical dependencies
```

Metrics such as kWh, kgCO2e, PUE and utilization are **properties/data**, not new ArchiMate element types.

---

## Pattern HA/DR

```text
Service
├─ Site A / Facility A
└─ Site B / Facility B
```

Then verify:

- independent power ;
- independent cooling ;
- independent communication paths ;
- independent storage/backup ;
- sufficient capacity ;
- no hidden common dependency.

---

## Exam traps

1. un serveur physique reste généralement `Device` dans un modèle IT ;
2. être physiquement tangible ne signifie pas automatiquement `Equipment` ;
3. une fibre de données reste Communication Network/Path ;
4. une mesure énergétique n’est pas Material ;
5. un fichier ou une image de conteneur n’est pas Material ;
6. un datacenter n’est pas un Node ;
7. Physical Layer ne remplace ni CMDB, ni plan électrique, ni outil carbone.

---

## MayaBank en une ligne

```text
Instant Payment
→ Payment Orchestrator
→ OpenShift
→ Worker Device
→ DC East/West
→ Power + Cooling dependencies
```

> **Physical Layer = le monde physique qui permet à la Technology Layer d’exister.**