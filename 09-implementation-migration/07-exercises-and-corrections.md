# Exercices et corrections — Implementation & Migration

Cette banque contient **60 cas originaux**. L’objectif est de savoir choisir le bon concept et raisonner sur une transformation, pas réciter une définition.

---

## A. Choisir le bon élément — 20 cas

### 1
« Construire la plateforme OpenShift de production. »

**Réponse : Work Package.** Ensemble de travaux de transformation.

### 2
« Plateforme OpenShift validée et prête à accueillir les applications. »

**Réponse : Deliverable.** Résultat défini du travail.

### 3
« L’ouverture de la plateforme aux premières applications. »

**Réponse : Implementation Event.** Changement d’état d’implémentation.

### 4
« État durant lequel le legacy traite 70 % des flux et la cible 30 %. »

**Réponse : Plateau.** État relativement stable.

### 5
« Absence d’event streaming dans la baseline, présence dans la cible. »

**Réponse : Gap.** Différence entre deux états.

### 6
« Adopter une migration progressive. »

**Réponse : Course of Action.** Direction stratégique, pas travail concret.

### 7
« Migration Wave 1 Retail. »

**Réponse : Work Package.** Si la vague représente un ensemble cohérent de travaux.

### 8
« Rollback Runbook validé. »

**Réponse : Deliverable.** Résultat produit et vérifiable.

### 9
« Payment Authorized. »

**Réponse : Application Event.** Pas Implementation Event : il s’agit du fonctionnement applicatif.

### 10
« Legacy Payment Platform powered off. »

**Réponse : Implementation Event.** Le programme change d’état.

### 11
« Target Payments 2028. »

**Réponse : Plateau**, si l’on représente l’état cible relativement stable.

### 12
« Réduire le time-to-market. »

**Réponse : Goal/Outcome selon contexte**, pas Plateau.

### 13
« Migration scripts livrés et testés. »

**Réponse : Deliverable.**

### 14
« payment-orchestrator:2.1 OCI image. »

**Réponse : Artifact.** Ce n’est pas automatiquement un Deliverable.

### 15
« La cible doit avoir un RPO de 0 pour le service critique. »

**Réponse : Requirement.**

### 16
« La baseline ne dispose pas de DR automatisé alors que la cible l’exige. »

**Réponse : Gap.**

### 17
« Le legacy ne scale pas horizontalement. »

**Réponse : Assessment** si diagnostic ; peut contribuer à formaliser un Gap.

### 18
« Architecture hybride stable pendant six mois. »

**Réponse : Plateau.**

### 19
« Décision Go/No-Go Cutover acceptée. »

**Réponse : Implementation Event** si cela marque un changement d’état significatif.

### 20
« Retirer les licences legacy et fermer les dépendances CMDB. »

**Réponse : Work Package** ou partie d’un Work Package `Legacy Exit`.

---

## B. Confusions — 15 cas

### 21 — Work Package vs Course of Action

`Adopt Event-Driven Architecture` ?

**Course of Action.** Direction choisie.

`Deploy Kafka Foundation` ?

**Work Package.** Travail concret.

### 22 — Deliverable vs Artifact

`Payment Release 1 accepted` ? → **Deliverable**.

`payment.jar` ? → **Artifact**.

### 23 — Plateau vs Environment

`Preproduction` ?

**Pas automatiquement Plateau.** C’est souvent un environnement technique.

### 24 — Plateau vs Goal

`Zero manual deployment` ?

**Goal/Outcome**, pas Plateau.

### 25 — Gap vs Requirement

`No centralized secrets management today` ? → **Gap/Assessment selon formulation**.

`All secrets must be centrally managed` ? → **Requirement**.

### 26 — Implementation Event vs Business Event

`New Product Launch` comme événement métier courant ? → **Business Event** possible.

`Migration Wave 2 Cutover` ? → **Implementation Event**.

### 27 — Baseline vs Plateau

Baseline est-il un élément ArchiMate ?

**Non comme type distinct.** Un Plateau peut représenter la baseline.

### 28 — Target vs Plateau

Target est-il un élément distinct ?

**Non.** Un Plateau peut représenter la target.

### 29 — Transition Architecture

Quel élément représente bien un état intermédiaire ?

**Plateau.**

### 30 — Roadmap

Une roadmap est-elle un unique élément ArchiMate ?

**Non.** Elle se représente par plusieurs éléments et relations : Plateaus, Work Packages, Events, Gaps, etc.

### 31 — Deliverable vs Requirement

`Security Architecture Approved` ? → **Deliverable** possible.

`All APIs must use OAuth2/OIDC` ? → **Requirement**.

### 32 — Event vs milestone

Tous les milestones projet doivent-ils être des Implementation Events ?

**Non.** Seulement ceux significatifs pour l’état de la transformation.

### 33 — Gap vs risk

`Vendor lock-in could delay exit` ?

**Risk**, pas Gap. Le Gap exprime une différence d’architecture.

### 34 — Work Package vs Project

Un Work Package peut-il représenter un projet ?

**Oui**, si ce niveau est adapté au modèle, mais il n’est pas limité à cette granularité.

### 35 — Plateau vs release

Une release applicative est-elle toujours un Plateau ?

**Non.** Seulement si elle définit un état architectural relativement stable pertinent.

---

## C. Séquencement — 10 cas

### 36
Payment Orchestrator dépend d’OpenShift et IAM.

Ordre logique : **Platform/IAM Foundation → Payment Orchestrator**.

### 37
Les événements doivent être gouvernés avant migration de masse.

Ordre : **Kafka + Schema Registry + Event Governance → Event Migration**.

### 38
Le pilot doit être observable de bout en bout.

Ordre : **Observability Foundation → Pilot Migration**.

### 39
Le legacy DB peut être arrêté quand ?

Après : **data migration + reconciliation + source-of-truth cutover + retention requirements satisfied**.

### 40
Le legacy peut-il être décommissionné dès que la cible tourne ?

**Non.** Il faut vérifier dépendances résiduelles, data retention, rollback window, contracts/licences et operating readiness.

### 41
Le Target DB devient source de vérité : quel concept ?

**Implementation Event** significatif.

### 42
État où target DB est source de vérité mais legacy reste read-only ?

**Transition Plateau.**

### 43
L’architecture API doit précéder la migration de clients externes.

Work Package **API Foundation** avant **Client Migration**.

### 44
DR doit-il être testé avant le go-live critique ?

Oui si l’exigence de résilience l’impose ; `DR Validation` peut être Deliverable/gate avant l’Implementation Event de cutover.

### 45
Le Work Package Legacy Exit doit apparaître quand ?

Dès la roadmap initiale, pas à la fin par surprise.

---

## D. TOGAF E/F/G — 10 cas

### 46
Identifier les grands Work Packages à partir des gaps.

**Phase E** principalement.

### 47
Définir les Transition Architectures.

**Phase E** principalement.

### 48
Prioriser et séquencer les Work Packages.

**Phase F** principalement.

### 49
Construire le plan de migration consolidé.

**Phase F**.

### 50
Vérifier qu’un projet respecte les exigences d’architecture.

**Phase G**.

### 51
Traiter une déviation d’architecture pendant delivery.

**Phase G** avec les mécanismes de gouvernance appropriés.

### 52
Représenter une Transition Architecture.

**Plateau** est adapté.

### 53
Représenter une différence Baseline/Target.

**Gap**.

### 54
Représenter le travail de réalisation.

**Work Package**.

### 55
TOGAF Phase E est-elle un Work Package ?

**Non.** C’est une phase de méthode ADM.

---

## E. Mini-scenarios Practitioner — 5 cas

### 56 — Migration bancaire critique

MayaBank veut migrer tous les paiements en une nuit. Le legacy reste utilisable et il existe plusieurs groupes de clients.

Quelle modélisation aide le mieux à réduire le risque ?

**Réponse :** plusieurs Work Packages de migration, des Transition Plateaus, des Implementation Events de cutover et des Deliverables de rollback/reconciliation.

### 57 — Temporary adapter

Un bridge legacy↔Kafka doit exister seulement pendant la coexistence.

Que faut-il rendre visible ?

**Réponse :** le bridge dans le Transition Plateau, le Work Package qui l’introduit et surtout le Work Package/Event qui le retire avant le Target Plateau.

### 58 — Data authority

Pendant six semaines, la base legacy reste source de vérité tandis que la cible reçoit une réplication. Ensuite la cible devient authoritative.

**Réponse :** deux Plateaus distincts séparés par un Implementation Event `Target DB Becomes Authoritative`.

### 59 — Architecture governance

Un projet livre une API sans le standard d’authentification prévu.

**Réponse :** le modèle doit permettre la traçabilité Requirement → Work Package/Deliverable ; Phase G doit gérer la non-conformité plutôt que modifier silencieusement la cible.

### 60 — Target jamais atteint

La nouvelle plateforme est en production mais l’ancien système reste actif sans date de sortie.

**Réponse :** la transformation est incomplète. Ajouter/renforcer le Work Package `Legacy Exit`, ses Deliverables et Implementation Events ; le Target Plateau doit refléter l’architecture réellement souhaitée.

---

## Score conseillé

- **0–40** : revoir les cinq éléments.
- **41–50** : bonne compréhension Foundation.
- **51–56** : niveau solide.
- **57–60** : très bonne discrimination pour les scenarios Practitioner.

Ce seuil est pédagogique et n’est pas un seuil officiel de certification.