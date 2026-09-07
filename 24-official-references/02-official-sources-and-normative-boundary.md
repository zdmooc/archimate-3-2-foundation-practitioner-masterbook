# 02 — Sources officielles et frontière normative

## A. Sources officielles de certification

### Programme ArchiMate
https://www.opengroup.org/certifications/archimate

Utilité : programme, version couverte, liens vers syllabus, factsheets, examens et self-study.

### Foundation Overview
https://help.opengroup.org/hc/en-us/articles/32127602186002-ArchiMate-3-Foundation-Certification-Overview

Utilité : finalité Foundation, compétences validées, public cible.

### Practitioner Overview
https://help.opengroup.org/hc/en-us/articles/32127678762642-ArchiMate-3-Practitioner-Certification-Overview

Utilité : application pratique, concepts avancés, cross-layer.

### Exam Q&As
https://help.opengroup.org/hc/en-us/articles/32115890396562-ArchiMate-Certification-Exam-Q-As

Utilité : deux niveaux, alignement 3.2, absence de Combined ArchiMate 3, référence open-book Part 2.

### Practitioner Certification Path
https://help.opengroup.org/hc/en-us/articles/32111056420626-ArchiMate-Practitioner-Certification-Path

### Certification & Accreditation — ArchiMate Examinations
https://certification.opengroup.org/examinations/archimate

### Informations de certification individuelle
https://www.opengroup.org/certifications/archimate-individual-certification

Utilité : format, barème, prérequis et politique de retake.

### Pearson VUE Advice Sheet
https://certification.opengroup.org/docs/Pearson_VUE_Advice_Sheet.pdf

Utilité : logistique et interface des examens.

## B. Matériel officiel de préparation

Practice tests officiels :
https://shop.opengroup.org/study-materials/practice-tests

Study materials :
https://shop.opengroup.org/study-materials

The Open Group indique que les practice tests officiels sont créés et maintenus par The Open Group et mis à jour pour les versions courantes.

Les QCM, scénarios et mocks de ce dépôt sont **originaux et non officiels**.

## C. Spécification et licences

Licensed Downloads :
https://www.opengroup.org/archimate-licensed-downloads

The Open Group indique pour les non-membres des mécanismes d'évaluation et de licence. Le masterbook ne reproduit donc pas la spécification ; il l'explique et produit ses propres exemples.

## D. TOGAF ↔ ArchiMate

Position officielle :
https://help.opengroup.org/hc/en-us/articles/32115987894930-How-the-ArchiMate-Language-and-the-TOGAF-Standard-Complement-Each-Other

Résumé :

```text
TOGAF = METHOD + GOVERNANCE
ArchiMate = MODEL + VISUALIZATION + ANALYSIS
```

The Open Group indique notamment :
- Phase A : capability, motivation, stakeholder views ;
- B–D : modèles Business / Information Systems / Technology ;
- E–F : Plateau, Gap, Work Package ;
- G : Requirements → Implementation traceability ;
- H : impact analysis via relationships.

La Partie XIII développe ce mapping avec MayaBank.

## E. Ce qui est normatif

Relèvent du standard ou du programme officiel :
- les types d'éléments ArchiMate ;
- les familles de relations ;
- la structure du langage ;
- view / viewpoint ;
- les mécanismes de personnalisation définis par le langage ;
- la version 3.2 ;
- les objectifs Foundation/Practitioner ;
- les formats et barèmes d'examen.

## F. Ce qui est pédagogique dans ce dépôt

Ne sont pas des prescriptions normatives The Open Group :
- les chaînes mentales du livre ;
- les arbres de décision ;
- les mnémotechniques ;
- les patterns MayaBank ;
- les checklists de revue ;
- les conventions de noms de views ;
- les patterns API/Kafka/OpenShift ;
- les quality gates Git/CI ;
- la méthode de préparation à l'entretien.

## G. Technologies ≠ types ArchiMate automatiques

```text
Kafka
OpenShift
PostgreSQL
API Gateway
OAuth/OIDC
Kubernetes Pod
LLM
Vector Database
Prometheus
PUE
```

sont des objets ou notions du monde réel. Le type ArchiMate dépend du concern.

Exemples fréquents :
- Kafka → System Software ;
- Event Streaming → Technology Service ;
- API endpoint → Application Interface ;
- fonctionnalité API → Application Service ;
- image OCI → Artifact ;
- datacenter → Facility.

RTO, RPO, latency, throughput, PUE, kWh ou kgCO2e ne deviennent pas automatiquement des éléments ArchiMate ; ils peuvent être portés par des propriétés, Requirements ou Outcomes selon le besoin.

## H. Règle de maintenance

Pour toute information susceptible de changer — format d'examen, prix, fournisseur, langue, ESL, retake — revérifier The Open Group avant réservation.