# MayaBank — Cross-Layer Review Cases

Ces cas servent à tester la cohérence du modèle global. Ils ne demandent pas seulement de reconnaître un élément ArchiMate ; ils obligent à traverser plusieurs couches et à justifier les relations.

## Cas 1 — Un incident Kafka

Kafka devient indisponible.

Questions :

- quels Technology Services sont touchés ?
- quelles Application Components dépendent du streaming ?
- quels Application Events ne circulent plus ?
- quels Business Processes sont réellement bloqués ?
- quels Business Services restent disponibles en mode dégradé ?

Correction attendue : remonter depuis `System Software: Kafka` vers `Event Streaming Service`, puis vers les consumers applicatifs, les events/processus et enfin les services métier.

## Cas 2 — Le Payment Orchestrator tombe

Le modèle doit permettre d’identifier :

- Payment Orchestration Service ;
- Execute Instant Payment ;
- Payment API consumers ;
- Fraud/Limit/Ledger dependencies ;
- observability/SLO ;
- HA/DR path.

## Cas 3 — Nouveau Requirement : RTO < 15 min

Il faut vérifier :

- quel Business Service est concerné ;
- quelles applications sont critiques ;
- quelles données doivent être répliquées ;
- quels Technology Services supportent le DR ;
- quels Work Packages sont nécessaires si le gap existe.

## Cas 4 — Le CISO impose la suppression des secrets statiques

Trace attendue :

```text
Driver/Concern
→ Goal
→ Requirement
→ Application consumers
→ Secrets Management Service
→ System Software
→ Work Package
→ Deliverable
```

## Cas 5 — Une API partenaire doit être ajoutée

Ne pas créer seulement `API Partner`.

Identifier :

- Business Service ;
- Application Service ;
- Application Interface ;
- provider component ;
- consumer actor/application ;
- Contract ;
- auth requirement ;
- observability requirement.

## Cas 6 — Un nouveau topic Kafka

Question préalable : quel fait métier/applicatif transporte-t-il ?

Le topic ne doit pas remplacer l’Application Event.

## Cas 7 — Un payload `PaymentSettledEvent`

Type attendu : Data Object côté application. Il peut être relié à `Application Event: Payment Settled`.

## Cas 8 — Le métier veut réduire le MTTR

Ne pas commencer par `Grafana` ou un outil.

Commencer par : Goal → Requirement → capability/architecture → Distributed Observability Service → implementation.

## Cas 9 — Deux microservices partagent le même schéma

Le modèle doit faire apparaître le coupling et déclencher une revue sur ownership, Access relationships et source of truth.

## Cas 10 — Le legacy reste actif après la migration

La migration ne peut pas être considérée terminée tant que les conditions de décommission ne sont pas remplies.

## Cas 11 — Une capability nommée `OpenShift`

Correction : OpenShift est un produit technologique. La capability doit exprimer une aptitude, par exemple Cloud-Native Application Delivery.

## Cas 12 — Une capability nommée `Kafka`

Correction : Event Streaming Platform Engineering ou autre aptitude réellement recherchée.

## Cas 13 — Une `Payment REST API` modélisée comme Service

Demander si l’on parle du point d’accès ou de la fonctionnalité. Si point d’accès : Application Interface.

## Cas 14 — `Instant Payment Service` modélisé comme Application Component

Correction : distinguer Business Service / Application Service / provider component selon le concern.

## Cas 15 — `Payment Order` modélisé comme Data Object dans une vue métier

Correction probable : Business Object dans la vue métier ; Data Object pour l’implémentation applicative.

## Cas 16 — `payment-orchestrator.jar`

Type attendu : Artifact.

Il peut réaliser un Application Component et être déployé sur un Node.

## Cas 17 — Un serveur OpenShift

S’il s’agit du matériel informatique physique : Device.

S’il s’agit d’un environnement d’exécution logique : Node.

## Cas 18 — Une baie de refroidissement

Type attendu : Equipment, pas Device.

## Cas 19 — Réseau IP inter-site

Type attendu : Communication Network.

## Cas 20 — Distribution électrique A/B

Type attendu : Distribution Network.

## Cas 21 — Une équipe exécute un processus

Relation principale : Assignment entre structure active et behavior.

## Cas 22 — Une fonction réalise un service

Relation : Realization.

## Cas 23 — Un service supporte un processus métier

Relation : Serving du service vers le consumer.

## Cas 24 — Un process lit une donnée

Relation : Access(read).

## Cas 25 — Une donnée est transmise entre deux comportements

Si l’intention est le transfert : Flow, éventuellement avec l’objet transporté documenté.

## Cas 26 — Un événement déclenche un process

Relation : Triggering.

## Cas 27 — Un CIO veut comprendre le programme

Vue recommandée : executive/strategy/layered/migration à faible détail technique.

## Cas 28 — Un SRE veut analyser un incident

Vue recommandée : Application Cooperation + Technology/Deployment + observability + impact chain.

## Cas 29 — Un Data Architect veut connaître le source of truth

Vue : Information/Data Lineage avec Business Objects, Data Objects, readers/writers et owner.

## Cas 30 — Un Program Director veut connaître les dépendances de migration

Vue : Implementation & Migration — Gaps, Work Packages, Deliverables, Events, Plateaus.

## Cas 31 — Le flux retail migre avant corporate

Le modèle doit créer un état hybride explicite et un critère de routage.

## Cas 32 — Le target ledger devient source of truth

Représenter l’événement de bascule comme Implementation Event significatif et mettre à jour le Plateau suivant.

## Cas 33 — Rollback après data cutover

Le modèle doit montrer comment restaurer l’autorité de la donnée ou rejouer/réconcilier les changements. Un rollback purement applicatif est insuffisant.

## Cas 34 — Un nouveau Work Package `Build Kafka`

Il doit être relié au Gap traité et à la Course of Action/Goal qui le justifie.

## Cas 35 — Un Work Package sans Gap

À challenger : quel problème ou cible justifie ce travail ?

## Cas 36 — Un Deliverable `Kafka cluster`

Possible comme résultat de Work Package, mais ne pas le confondre avec l’Artifact ou le System Software lui-même.

## Cas 37 — `Hybrid Payments` utilisé comme environnement

Correction : `Plateau` représente un état relativement stable de l’architecture, pas un environnement Dev/Test/Prod.

## Cas 38 — Un Green IT gain après migration

Exiger la preuve : device retired/avoided, capacity released, utilization improved ou energy reduction.

## Cas 39 — Deux clusters remplacent quatre serveurs mais les quatre restent allumés

Aucun gain physique démontré tant que la capacité legacy n’est pas réellement retirée ou réutilisée.

## Cas 40 — Panne d’un PDU

Chaîne d’impact : Equipment → Devices → Nodes/System Software → Technology Services → Applications → Business Services.

## Cas 41 — Règle `Observable by Default`

Type : Principle. Elle peut être réalisée/concrétisée par Requirements comme correlation ID, tracing, logging structuré.

## Cas 42 — `Correlation ID` comme Business Object

Correction probable : Data Object ou Requirement selon le concern. Ce n’est pas un concept métier central par défaut.

## Cas 43 — `Fraud Analyst`

Type : Business Role.

L’équipe qui tient ce rôle est un Business Actor.

## Cas 44 — `Fraud Decision Collaboration`

Si plusieurs structures actives réalisent conjointement un comportement : Business Collaboration / Interaction selon ce qu’on modélise.

## Cas 45 — `Fraud Engine` fournit un score

Chaîne : Application Component → assigned Function → realizes Fraud Scoring Service → serves business/application consumer.

## Cas 46 — `OpenShift` fournit l’exécution conteneur

Chaîne : System Software → Technology Service → serves applications.

## Cas 47 — `Kafka` transporte `Payment Authorized`

Ne pas écrire `Kafka = Payment Authorized`. Le System Software fournit l’Event Streaming Service ; l’Application Event représente le fait.

## Cas 48 — Un legacy adapter temporaire

Il doit avoir un lifecycle explicite : créé dans un Work Package, présent dans Hybrid Plateau, retiré à un Implementation Event/Work Package.

## Cas 49 — Une application n’est reliée à aucun métier

Elle peut être transverse ou technique, mais le modèle doit justifier son existence ; sinon candidate à rationalisation.

## Cas 50 — Une technologie n’a aucun consumer

À challenger comme orphan technology.

## Cas 51 — Un Requirement n’a aucun élément satisfaisant

Gap potentiel ou défaut de traçabilité.

## Cas 52 — Un Business Service n’a aucun comportement réalisateur

Modèle incomplet ou service abstrait volontaire à documenter.

## Cas 53 — Un Application Service n’a aucun provider

Modèle incomplet.

## Cas 54 — Un Data Object a trois writers

Revue ownership et concurrence obligatoire.

## Cas 55 — Un event a six consumers

Le modèle doit montrer le blast radius et les contrats de compatibilité.

## Cas 56 — Un service critique dépend d’un unique HSM

Le modèle cross-layer doit révéler le SPOF physique/technologique.

## Cas 57 — La DR réplique les applications mais pas la donnée

Architecture DR incomplète.

## Cas 58 — Le target est déployé mais le monitoring n’est pas prêt

Le Plateau cible ne doit pas être considéré opérationnel si l’observabilité est un Requirement d’entrée.

## Cas 59 — Le CIO demande : « Pourquoi payons-nous Kafka ? »

Reverse trace : Kafka → Event Streaming Service → applications/events → business processes → capabilities/goals.

## Cas 60 — Le responsable métier demande : « Quel impact si Site A tombe ? »

Forward impact : Facility → Devices → Technology Services → Applications → Business Services → customer/business outcomes.

## Règle de correction

Pour chaque cas, une bonne réponse doit :

1. identifier les concepts ;
2. choisir les relations ;
3. vérifier la direction ;
4. traverser les couches utiles ;
5. sélectionner la vue adaptée ;
6. expliciter les informations manquantes au lieu de les inventer.

> **Le niveau Practitioner apparaît lorsqu’on sait naviguer dans le graphe d’architecture, pas seulement réciter les définitions.**