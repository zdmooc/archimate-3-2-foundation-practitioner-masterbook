# 7 — ArchiMate et TOGAF

## 7.1 Deux standards complémentaires

TOGAF et ArchiMate répondent à des questions différentes.

### TOGAF

Fournit principalement :

- une méthode de développement d’architecture ;
- des mécanismes de gouvernance ;
- un cadre de contenu ;
- des techniques d’architecture ;
- une logique de transformation.

### ArchiMate

Fournit principalement :

- un langage de modélisation ;
- des concepts ;
- des relations ;
- des vues ;
- des viewpoints.

Une formule simple :

```text
TOGAF = HOW TO DEVELOP AND GOVERN ARCHITECTURE
ArchiMate = HOW TO MODEL AND COMMUNICATE ARCHITECTURE
```

---

## 7.2 TOGAF n’impose pas ArchiMate

Il est possible d’appliquer TOGAF avec d’autres notations.

Il est également possible d’utiliser ArchiMate hors d’un contexte TOGAF.

Mais les deux standards sont particulièrement cohérents lorsqu’ils sont combinés.

---

## 7.3 Preliminary Phase

TOGAF Preliminary prépare la capacité d’architecture.

ArchiMate peut aider à représenter :

- organisation de la fonction architecture ;
- rôles ;
- responsabilités ;
- services d’architecture ;
- outils et plateformes de support.

Ce n’est pas une correspondance mécanique “une phase = un viewpoint”.

Le langage sert à représenter ce qui est utile.

---

## 7.4 Phase A — Architecture Vision

Phase A définit la vision, le scope, les stakeholders, concerns et la valeur attendue.

ArchiMate est particulièrement utile pour :

- Stakeholder ;
- Driver ;
- Assessment ;
- Goal ;
- Outcome ;
- Requirement ;
- Capability ;
- Value Stream ;
- vues très haut niveau de Baseline et Target.

Exemple MayaBank :

```text
Driver: Instant payment adoption
→ Goal: Real-time customer payment experience
→ Capability: Real-Time Payment Processing
→ Outcome: Faster confirmation and fewer manual exceptions
```

---

## 7.5 Phase B — Business Architecture

ArchiMate couvre très naturellement la Business Architecture.

Concepts utiles :

- Business Actor ;
- Business Role ;
- Business Collaboration ;
- Business Process ;
- Business Function ;
- Business Interaction ;
- Business Service ;
- Business Object ;
- Product ;
- Capability ;
- Value Stream.

Exemple :

```text
Payment Operations Role
→ Handle Payment Exception Process
→ Exception Management Business Service
```

---

## 7.6 Phase C — Data Architecture

ArchiMate n’est pas un langage spécialisé de modélisation de données détaillée.

Il peut toutefois représenter l’information à un niveau architectural grâce à :

- Business Object ;
- Data Object ;
- Representation ;
- Artifact ;
- relations d’Access et de Realization.

Exemple :

```text
Business Object: Payment Instruction
↓ realized by
Data Object: Payment Message
↓ realized by
Artifact: ISO 20022 XML Document
```

Cette chaîne permet de distinguer concept métier, représentation applicative et artefact concret.

---

## 7.7 Phase C — Application Architecture

Concepts particulièrement utiles :

- Application Component ;
- Application Collaboration ;
- Application Interface ;
- Application Function ;
- Application Process ;
- Application Interaction ;
- Application Event ;
- Application Service ;
- Data Object.

Exemple MayaBank :

```text
Application Component: Payment Orchestrator
→ realizes
Application Service: Payment Routing
→ serves
Business Process: Execute Payment
```

---

## 7.8 Phase D — Technology Architecture

Concepts utiles :

- Node ;
- Device ;
- System Software ;
- Technology Collaboration ;
- Technology Interface ;
- Path ;
- Communication Network ;
- Technology Function ;
- Technology Process ;
- Technology Service ;
- Artifact.

Exemple :

```text
System Software: Kafka Platform
→ realizes
Technology Service: Event Streaming
→ serves
Application Component: Payment Orchestrator
```

---

## 7.9 Phase E — Opportunities & Solutions

Phase E cherche notamment à transformer les écarts d’architecture en options de réalisation, work packages et transition states.

ArchiMate Implementation & Migration devient particulièrement utile avec :

- Work Package ;
- Deliverable ;
- Plateau ;
- Gap.

Exemple :

```text
Gap: No real-time orchestration
→ addressed by
Work Package: Build Payment Orchestration
→ produces
Deliverable: Payment Orchestrator Production Release
→ enables
Plateau: Hybrid Real-Time Payments
```

---

## 7.10 Phase F — Migration Planning

Phase F priorise et séquence les travaux.

ArchiMate peut représenter :

- dépendances entre Work Packages ;
- Plateaus successifs ;
- Implementation Events ;
- Deliverables ;
- impacts sur les éléments d’architecture.

Exemple :

```text
WP1 Platform Foundation
→ WP2 Event Streaming
→ WP3 Payment Orchestration Pilot
→ WP4 Legacy Routing Retirement
```

---

## 7.11 Phase G — Implementation Governance

ArchiMate n’est pas un outil de gouvernance à lui seul.

Mais un modèle cible peut servir de référence pour vérifier la conformité de l’implémentation.

Une vue peut montrer :

- composants approuvés ;
- services attendus ;
- dépendances autorisées ;
- technology standards ;
- transition architecture.

L’équipe de gouvernance compare alors la réalité du projet à l’architecture décidée.

---

## 7.12 Phase H — Architecture Change Management

Phase H surveille les changements et décide si l’architecture doit évoluer.

ArchiMate aide à l’analyse d’impact.

Exemple :

> Une nouvelle réglementation exige une validation supplémentaire avant clearing.

Le modèle permet d’identifier :

```text
Requirement
→ Business Process impacted
→ Application Service impacted
→ Application Component impacted
→ Data Object impacted
→ Work Package needed
```

---

## 7.13 Requirements Management

TOGAF Requirements Management est transversal.

ArchiMate possède le concept **Requirement**, qui permet de représenter un besoin à satisfaire et de le relier à d’autres concepts.

Mais il ne faut pas confondre :

```text
TOGAF Requirements Management = activité/mécanisme de gestion des exigences
ArchiMate Requirement = élément de modélisation représentant un besoin
```

---

## 7.14 ABB / SBB et ArchiMate

TOGAF distingue Architecture Building Block et Solution Building Block.

ArchiMate ne fournit pas des types d’éléments nommés ABB et SBB.

On peut toutefois utiliser ArchiMate pour représenter des concepts abstraits puis leur réalisation plus concrète.

Exemple conceptuel :

```text
Technology Service: Event Streaming
→ realized by
System Software: Kafka Platform
```

Il ne faut pas affirmer que `Technology Service = ABB` ou `Kafka = SBB` comme règle du langage. C’est une correspondance de modélisation possible dans un contexte donné.

---

## 7.15 Architecture Content vs ArchiMate

TOGAF parle de :

- Deliverables ;
- Artifacts ;
- Building Blocks ;
- catalogs ;
- matrices ;
- diagrams.

ArchiMate possède également des concepts appelés **Artifact** et **Deliverable**, mais leur sens appartient au langage ArchiMate.

Le simple fait que le mot soit identique ne signifie pas qu’il est strictement équivalent au concept TOGAF correspondant.

C’est un piège important.

---

## 7.16 Exemple end-to-end MayaBank

TOGAF permet de conduire la transformation :

```text
Phase A
Vision: modernize instant payments

Phase B
Target business capabilities/processes

Phase C
Target data + applications

Phase D
Target technology

Phase E
Work packages + transition architectures

Phase F
Migration sequencing

Phase G
Implementation governance

Phase H
Change management
```

ArchiMate permet de représenter cette transformation :

```text
Driver
→ Goal
→ Capability
→ Business Process
→ Application Service
→ Application Component
→ Technology Service
→ Node
→ Gap
→ Work Package
→ Plateau
```

Les deux standards se complètent.

---

## 7.17 Pièges fréquents

### “ArchiMate remplace TOGAF”

Faux.

### “TOGAF impose ArchiMate”

Faux.

### “Chaque phase ADM possède exactement un viewpoint ArchiMate”

Faux. Plusieurs vues peuvent être utiles selon les concerns.

### “ArchiMate Artifact = TOGAF Artifact”

À ne pas assimiler automatiquement.

### “ArchiMate Requirement = TOGAF Requirements Management”

Faux : élément de modèle vs activité de gestion.

---

## 7.18 Questions de compréhension

### Q1 — Quelle différence fondamentale entre TOGAF et ArchiMate ?

**Réponse :** TOGAF organise principalement le travail de développement/gouvernance d’architecture ; ArchiMate fournit un langage pour modéliser l’architecture.

### Q2 — Quelle partie d’ArchiMate est particulièrement utile pour Phases E/F ?

**Réponse :** Implementation & Migration, notamment Work Package, Deliverable, Plateau et Gap.

### Q3 — Peut-on utiliser ArchiMate pour modéliser la Data Architecture ?

**Réponse :** oui au niveau architectural avec Business Object, Data Object, Representation, Artifact et leurs relations, mais ce n’est pas un langage de modélisation de données détaillée comme un modèle relationnel.

### Q4 — TOGAF Requirement Management et ArchiMate Requirement sont-ils la même chose ?

**Réponse :** non. Le premier est une activité transverse de gestion ; le second est un élément du langage.

---

## À retenir

> **TOGAF structure le travail d’architecture ; ArchiMate structure sa représentation. Ensemble, ils permettent de passer de la méthode au modèle.**
