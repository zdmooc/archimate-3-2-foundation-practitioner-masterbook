# Practitioner Mock 1 — Paiements, API, Kafka, OpenShift, IAM, Fraud, Data, SRE

**Temps : 90 min · Open book · 8 scénarios · Barème 5/3/1/0 · Passage : 26/40.**

## P1-01 — Résilience Instant Payment
Le CIO veut démontrer qu'un service Instant Payment reste disponible après perte d'un worker et peut être repris après perte d'un site. Le modèle actuel montre seulement deux clusters OpenShift.

Quelle amélioration est la meilleure ?
- **A.** Tracer Requirement RTO/RPO/disponibilité → Business Service Instant Payment → Application Service/Component → Technology Services/Nodes → Facilities, puis représenter séparément HA, DR, tests et Work Packages.
- **B.** Compléter les deux clusters par les bases, réseaux et réplications ; la vue devient une bonne Technology/Physical View mais ne remonte pas jusqu'au service métier ni à la transformation.
- **C.** Ajouter les propriétés RTO/RPO sur les clusters uniquement ; elles documentent l'infrastructure mais pas l'obligation portée par le service.
- **D.** Créer un seul élément « Resilient Platform » relié par Association à tous les objets.

### Correction P1-01
- **A — 5.** Réponse cross-layer complète ; elle distingue exigence, service, support technologique, physique et transformation, ainsi que HA et DR.
- **B — 3.** Techniquement utile et cohérent, mais incomplet pour le concern CIO et la traçabilité métier.
- **C — 1.** Les propriétés peuvent aider, mais la sémantique et la traçabilité de l'exigence sont perdues.
- **D — 0.** Élément fourre-tout + Association partout : faible valeur sémantique.

## P1-02 — API Banking
L'API Product Owner veut expliquer ce que consomme un partenaire, par quel point d'accès, et quel composant l'implémente.

Quelle modélisation est la meilleure ?
- **A.** Application Component → réalise Application Service → exposé via Application Interface ; le consommateur est servi par le Service, et le Product métier est séparé si l'offre commerciale est dans le concern.
- **B.** Représenter Service + Interface correctement mais omettre le Component ; la consommation est claire, l'implémentation ne l'est pas.
- **C.** Représenter seulement l'Application Interface « REST API » et y placer toutes les propriétés fonctionnelles.
- **D.** Modéliser l'API comme Device, car elle est accessible sur le réseau.

### Correction P1-02
- **A — 5.** Sépare structure, fonctionnalité et point d'accès, tout en conservant l'offre métier éventuelle.
- **B — 3.** Bonne sémantique d'exposition, mais traçabilité d'implémentation incomplète.
- **C — 1.** Une interface seule décrit le point d'accès mais confond facilement contrat fonctionnel et accès.
- **D — 0.** Une API n'est pas un matériel IT.

## P1-03 — Kafka / Event Streaming
Une équipe modélise `PaymentSettled` comme Data Object, le topic Kafka comme Application Event et Kafka comme Application Component. L'Integration Architect veut corriger la vue.

Quelle proposition est la meilleure ?
- **A.** `PaymentSettled` comme Application Event, payload comme Data Object, Kafka runtime comme System Software, Event Streaming comme Technology Service ; utiliser Flow pour le transfert et Triggering seulement pour la causalité.
- **B.** Corriger Event et Data Object mais laisser Kafka hors de la vue ; le niveau applicatif devient juste mais le transport technologique n'est plus traçable.
- **C.** Garder le topic comme Data Object parce qu'il contient des messages ; le payload et le canal restent alors confondus.
- **D.** Modéliser Kafka et les topics comme Facilities.

### Correction P1-03
- **A — 5.** Sépare fait, information, transport logiciel, service technologique et relations dynamiques.
- **B — 3.** Correct pour une vue purement applicative, mais insuffisant si le concern inclut la plateforme d'événements.
- **C — 1.** L'intuition « information » existe, mais topic/canal et payload sont mélangés.
- **D — 0.** Facility appartient au Physical Layer et n'a pas cette sémantique.

## P1-04 — OpenShift/Kubernetes
Le Platform Architect voit dans le référentiel : `OpenShift = Capability`, `Cluster Prod = Application Component`, `Pod = Business Actor`. Il veut un modèle exploitable sans sur-modéliser.

Quelle réponse est la meilleure ?
- **A.** Capability = aptitude organisationnelle de Platform Operations ; OpenShift runtime = System Software ; cluster = Node selon le concern ; workloads = Application Components représentés par Artifacts déployables ; Technology Services pour scheduling/ingress/etc. seulement si utiles.
- **B.** Corriger OpenShift en System Software et cluster en Node, mais ne pas descendre jusqu'aux workloads ; suffisant pour une Technology View de plateforme, moins pour la traçabilité application→plateforme.
- **C.** Modéliser tous les pods comme Nodes ; cela peut être défendable pour un concern d'exécution très fin, mais crée ici un niveau de détail inutile.
- **D.** Conserver Pod = Business Actor pour représenter « qui exécute ».

### Correction P1-04
- **A — 5.** Bonne séparation Strategy/Application/Technology et niveau de détail concern-driven.
- **B — 3.** Bonne vue plateforme mais traçabilité applicative incomplète.
- **C — 1.** Pas toujours faux selon le concern, mais sur-modélisation injustifiée ici.
- **D — 0.** Un pod n'est pas une entité métier.

## P1-05 — IAM / Zero Trust
Le CISO veut montrer : exigence MFA, identité humaine, identité workload, service d'identité, secrets et applications consommatrices. Le modèle technique actuel montre uniquement Keycloak et Vault.

Quelle solution est la meilleure ?
- **A.** Construire une vue sécurité cross-layer : Principles/Requirements → rôles/acteurs concernés → Application Components → Identity/Secrets Technology Services → System Software → Nodes ; modéliser les secrets comme Data Object/Artifact selon le concern et les accès avec une sémantique explicite.
- **B.** Enrichir la Technology View avec Keycloak, Vault, interfaces et consommateurs ; bonne architecture technique, mais exigences et responsabilités métier restent hors champ.
- **C.** Ajouter seulement des propriétés `MFA=true` et `mTLS=true` sur les composants.
- **D.** Créer une nouvelle couche ArchiMate standard nommée Security.

### Correction P1-05
- **A — 5.** Répond au concern CISO de bout en bout et n'invente pas de layer.
- **B — 3.** Solide techniquement mais incomplet pour la gouvernance et les exigences.
- **C — 1.** Utile comme métadonnée, insuffisant comme modèle de dépendances et de responsabilités.
- **D — 0.** Security est un concern transversal, pas un layer standard distinct.

## P1-06 — Fraud & Risk
Le Risk Officer doit expliquer comment une obligation de détection de fraude est réalisée par le métier puis par des règles et un modèle ML, et quelles données alimentent la décision.

Quelle approche est la meilleure ?
- **A.** Requirement/Goal → Business Process de contrôle → Application Service de scoring → composants Rule Engine/ML → Data Objects de features/score ; Realization/Serving/Access choisis selon leur sémantique, avec Assessment séparé pour le risque constaté.
- **B.** Construire correctement la partie Application (services, composants, données) mais sans Motivation ni Business ; bon pour une revue solution, moins pour l'explicabilité réglementaire.
- **C.** Modéliser le score fraude comme Outcome uniquement ; cela exprime éventuellement un résultat, pas la donnée applicative utilisée pour décider.
- **D.** Modéliser le modèle ML comme Business Role.

### Correction P1-06
- **A — 5.** Chaîne complète obligation→métier→application→données avec distinction Assessment/Data Object.
- **B — 3.** Correct à un niveau solution mais insuffisant pour la traçabilité de l'obligation.
- **C — 1.** Confusion entre résultat Motivation et information manipulée.
- **D — 0.** Un modèle ML n'est pas une responsabilité métier.

## P1-07 — Data Platform / Source of Truth
Le CDO découvre que `Customer`, `Customer table`, `customer.avro` et `PostgreSQL` sont tous modélisés Data Object.

Quelle correction est la meilleure ?
- **A.** Business Object pour le concept métier Customer ; Data Object pour la représentation logique applicative ; Artifact pour une représentation concrète stockée/déployable lorsque pertinent ; PostgreSQL comme System Software et Database Service comme Technology Service ; tracer Access/Flow et ownership.
- **B.** Distinguer Business Object et Data Object mais ignorer les technologies de stockage ; suffisant pour une Information Structure View, incomplet pour lineage end-to-end.
- **C.** Garder tous les éléments comme Data Objects et utiliser des propriétés `physical=true/false`.
- **D.** Utiliser Material pour les tables parce qu'elles occupent du stockage physique.

### Correction P1-07
- **A — 5.** Sépare sémantique métier, information logique, représentation concrète et technologie, avec lineage.
- **B — 3.** Bonne vue informationnelle mais pas de traçabilité jusqu'au stockage/plateforme.
- **C — 1.** Les propriétés ne réparent pas la perte de sémantique du métamodèle.
- **D — 0.** Une table de données n'est pas une matière physique au sens du Physical Layer.

## P1-08 — Observability / SRE
Le SRE Lead veut partir d'un SLO métier et déterminer quels composants/nœuds/événements techniques peuvent expliquer une dégradation du service.

Quelle solution est la meilleure ?
- **A.** Requirement/SLO → Business/Application Services → Components → Technology Services/Nodes ; Technology Events pour incidents, Triggering pour causalité ; construire une vue Incident Impact permettant une analyse dans les deux sens.
- **B.** Construire une bonne Technology View Prometheus/Grafana/collectors/nodes ; utile pour l'exploitation, mais sans lien explicite vers le service et le SLO.
- **C.** Ajouter les métriques comme Capabilities afin qu'elles soient visibles dans la Strategy Layer.
- **D.** Utiliser Flow pour signifier qu'une panne « déclenche » un incident applicatif.

### Correction P1-08
- **A — 5.** Relie SLO, services et événements techniques, avec bonne distinction Triggering/Flow.
- **B — 3.** Vue d'exploitation valable mais concern d'impact métier incomplet.
- **C — 1.** Une métrique n'est pas une aptitude organisationnelle.
- **D — 0.** Flow = transfert ; la causalité relève de Triggering.
