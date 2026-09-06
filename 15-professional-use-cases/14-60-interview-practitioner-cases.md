# 60 cas d'entretien et Practitioner — Use cases professionnels

L'objectif est de choisir **le bon concept, la bonne vue ou la bonne chaîne cross-layer**, puis de justifier le choix.

## A. Instant Payment — 1 à 5

### 1
Un client initie un paiement via mobile. Que représenter comme point d'accès applicatif ?

**Correction :** `Application Interface`, par exemple Payment Initiation API. Le service fourni derrière est un `Application Service`.

### 2
Le métier demande « paiement exécuté ». Event ou Data Object ?

**Correction :** le fait/changement d'état est un `Business Event` ou `Application Event` selon le concern ; le message qui le décrit est un `Data Object`.

### 3
Le Payment Orchestrator fournit une fonctionnalité au processus `Execute Instant Payment`.

**Correction :** représenter l'`Application Service` réalisé par le composant/comportement, puis `Serving` vers le processus métier.

### 4
On veut montrer l'impact d'une panne de Kafka sur les paiements.

**Correction :** vue cross-layer Technology → Application → Business, pas seulement une topologie Kafka.

### 5
Legacy et cible traitent chacun une partie des flux pendant trois mois.

**Correction :** `Transition Plateau`.

## B. API Banking — 6 à 10

### 6
« Account Balance API » : service ou interface ?

**Correction :** dépend du concern. Fonctionnalité fournie = Application Service ; point d'accès = Application Interface.

### 7
OpenAPI YAML ?

**Correction :** souvent `Artifact` si l'on représente le contrat/configuration technique déployable ou géré.

### 8
`API Management` est une capacité organisationnelle stable.

**Correction :** `Capability` possible. Le produit gateway n'est pas cette capability.

### 9
Un partenaire externe consomme une API bancaire.

**Correction :** vue Application Usage / Layered montrant acteur/consumer, interface, service et composants.

### 10
On retire une ancienne API SOAP.

**Correction :** Work Package + Implementation Event de retrait, puis Target Plateau sans cette interface.

## C. Kafka / Event Streaming — 11 à 15

### 11
`payments.completed.v1` est-il un Application Event ?

**Correction :** non par défaut. C'est un topic technique ; `Payment Completed` est l'événement.

### 12
Le JSON envoyé sur Kafka ?

**Correction :** `Data Object` au niveau logique/applicatif ; un schéma/fichier concret peut être un `Artifact`.

### 13
Kafka fournit du streaming aux applications.

**Correction :** modéliser `Technology Service: Event Streaming Service` servi/réalisé par le `System Software: Kafka`.

### 14
Deux applications communiquent par événement.

**Correction :** vue Application Cooperation ; événements/flows pertinents, sans réduire le modèle au topic.

### 15
Le CIO veut savoir quelles capabilities dépendent de Kafka.

**Correction :** vue d'impact cross-layer Kafka Service → applications → business processes → capabilities.

## D. OpenShift / Kubernetes — 16 à 20

### 16
Un container image ?

**Correction :** `Artifact`.

### 17
Un worker OpenShift ?

**Correction :** `Node` pour le runtime/processing resource ; `Device` si l'on montre la machine physique sous-jacente.

### 18
OpenShift ?

**Correction :** généralement `System Software`; les services qu'il fournit peuvent être des `Technology Services`.

### 19
Argo CD ?

**Correction :** `System Software` lorsqu'on modélise l'outil runtime ; `Deployment Automation Service` comme Technology Service si le concern est la fonctionnalité fournie.

### 20
Une application a trois replicas dans un seul cluster. DR validé ?

**Correction :** non. Cela couvre de la HA locale, pas forcément la perte du site/cluster.

## E. Cloud — 21 à 25

### 21
Une landing zone est-elle un Node ?

**Correction :** non comme règle générale. C'est un ensemble de services, politiques, réseaux, identités et ressources.

### 22
Un managed database service ?

**Correction :** `Technology Service` côté consommation ; le moteur/runtime sous-jacent peut être représenté comme `System Software` si pertinent.

### 23
Rehost / refactor ?

**Correction :** classifications de stratégie/migration ; ne pas inventer des types ArchiMate. `Course of Action` ou propriétés de Work Packages selon le concern.

### 24
Une application reste dépendante du mainframe on-prem après migration cloud.

**Correction :** vue Layered/Technology Usage montrant explicitement la dépendance hybride.

### 25
Le cloud réduit-il automatiquement le carbone ?

**Correction :** non. Il faut analyser utilisation, services, physical footprint évité, decommissioning et mesures.

## F. IAM / Zero Trust — 26 à 30

### 26
MFA ?

**Correction :** exigence/contrôle dans la motivation/sécurité ; les services/technologies qui le réalisent sont modélisés séparément.

### 27
Identity Provider ?

**Correction :** généralement `System Software`; `Identity Service` comme Technology Service.

### 28
Customer, Payment Operator et service account sont-ils le même type ?

**Correction :** non. Business actors/roles et identités techniques répondent à des concerns différents.

### 29
Une panne de l'IdP empêche plusieurs applications de fonctionner.

**Correction :** Incident Impact view du Technology Service vers applications puis business services/processes.

### 30
Vault et IdP sont-ils équivalents ?

**Correction :** non. Secrets management et identity/authentication sont des services différents.

## G. Fraud & Risk — 31 à 35

### 31
Un modèle ML de fraude ?

**Correction :** souvent `Artifact` lorsqu'on représente le modèle versionné déployé.

### 32
Fraud Detection ?

**Correction :** `Capability` lorsqu'on parle de l'aptitude organisationnelle ; ce n'est pas le modèle ML.

### 33
Fraud Score ?

**Correction :** `Data Object`/information, pas automatiquement Event.

### 34
Le service fraude tombe. Le paiement doit-il continuer ?

**Correction :** cela relève d'une décision/requirement de degraded mode, puis des comportements applicatifs associés.

### 35
On veut tracer pourquoi un paiement a été rejeté.

**Correction :** Data lineage / decision trace reliant Payment, features, model/rules, Fraud Decision et processus métier.

## H. Data Platform — 36 à 40

### 36
Oracle Database = Data Object ?

**Correction :** non. DBMS = System Software ; les données logiques = Data Objects.

### 37
Payment dataset ?

**Correction :** Data Object si l'on modélise le dataset logique.

### 38
Parquet file ?

**Correction :** Artifact si l'on modélise sa matérialisation physique/technologique.

### 39
Data lake ?

**Correction :** ne pas choisir un type par le nom. Décomposer services, software, data objects, applications et consumers.

### 40
Le régulateur veut la provenance d'un rapport.

**Correction :** Information Structure + lineage cross-layer.

## I. Observability / SRE — 41 à 45

### 41
SLO = Technology Service ?

**Correction :** non. SLO est une mesure/objectif/requirement selon le concern.

### 42
Prometheus ?

**Correction :** System Software ; `Metrics Service` comme Technology Service.

### 43
Un dashboard est-il la capability Observability ?

**Correction :** non. C'est une représentation/outillage, pas l'aptitude globale.

### 44
Kafka dégradé provoque une baisse du taux de succès paiement.

**Correction :** vue incident cross-layer avec Technology Event, Technology Service, applications, business service et outcome/metrics.

### 45
Le métier veut un dashboard sans détails techniques.

**Correction :** View adaptée au stakeholder ; ne pas lui montrer tous les pods/nodes.

## J. Multi-site / DR — 46 à 50

### 46
RPO=0 ?

**Correction :** Requirement/property, pas nouveau type d'élément.

### 47
Backup = DR ?

**Correction :** non. Backup est une capacité/service de récupération parmi d'autres.

### 48
Deux sites utilisent le même service IAM central dans Site A.

**Correction :** le modèle révèle un SPOF cross-site potentiel.

### 49
Un DR test terminé ?

**Correction :** peut être `Implementation Event` s'il marque un changement d'état significatif de la readiness.

### 50
La base est répliquée mais le DNS ne bascule pas.

**Correction :** DR end-to-end non démontré ; ajouter la dépendance DNS au modèle.

## K. GenAI Platform — 51 à 55

### 51
LLM = Capability ?

**Correction :** non. AI/GenAI capability est l'aptitude ; modèle/runtime sont application/technology/artifact selon le concern.

### 52
Prompt template ?

**Correction :** Data Object ou Artifact selon niveau logique vs matérialisation/configuration.

### 53
Vector DB ?

**Correction :** moteur = System Software ; Vector Storage Service = Technology Service ; embeddings = Data Objects.

### 54
RAG ?

**Correction :** modéliser la chaîne retrieval/orchestration/data/model plutôt qu'un rectangle générique unique.

### 55
LLM SaaS externe ?

**Correction :** external provider + external application/technology service/interface selon le concern.

## L. Green IT — 56 à 60

### 56
CO2e annuel = Business Object ?

**Correction :** non. C'est une mesure/propriété.

### 57
Migration OpenShift terminée, anciens serveurs toujours actifs.

**Correction :** le bénéfice physique n'est pas réalisé ; absence d'Implementation Event de decommissioning.

### 58
Une application n'a presque plus d'utilisateurs.

**Correction :** relier Business Services/Capabilities à l'Application Component pour décider rationalisation avant optimisation technique.

### 59
Une base conserve cinq années de données inutiles.

**Correction :** Requirement/Principle de lifecycle → data objects → storage services → physical impact.

### 60
Le CIO veut prioriser les actions Green IT.

**Correction :** vue portfolio combinant valeur/capability, application lifecycle, infrastructure utilization, carbon/cost properties et migration/decommissioning.

## Méthode de réponse en entretien

Pour chaque scénario :

```text
1. Reformuler le concern.
2. Nommer le stakeholder.
3. Identifier la couche.
4. Choisir l'élément.
5. Choisir la relation.
6. Dire quelle vue utiliser.
7. Ajouter la trace vers le métier.
8. Ajouter Baseline/Target si la question implique une transformation.
```

La qualité d'une réponse d'architecte vient moins du nombre de produits cités que de la capacité à **expliquer le pourquoi, les dépendances, les risques et le chemin de transformation**.
