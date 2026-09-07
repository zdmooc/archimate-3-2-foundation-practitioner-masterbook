# Practitioner Mock 4 — Portfolio, Network, BCP, Product, Roles, Services, Deployment, Plateaus

**Temps : 90 min · Open book · 8 scénarios · Barème 5/3/1/0 · Passage : 26/40.**

## P4-01 — Portfolio Rationalization
Le CIO veut identifier quelles applications peuvent être rationalisées sans casser des services métier critiques. Le portefeuille contient des doublons fonctionnels, des technologies obsolètes et des coûts élevés.

Quelle approche est la meilleure ?
- **A.** Tracer Goals/Assessments → Capabilities/Business Services → Application Services/Components → Technology dependencies ; construire une vue de portefeuille montrant valeur, redondance, criticité, obsolescence et Work Packages de rationalisation/decommissioning.
- **B.** Produire un inventaire Application Component avec coûts et versions ; utile pour le portefeuille, mais sans capacité/service métier il est difficile d'évaluer l'impact d'une suppression.
- **C.** Supprimer toutes les applications ayant des fonctions similaires et modéliser une seule cible.
- **D.** Modéliser chaque coût applicatif comme Business Service pour le rendre visible au CIO.

### Correction P4-01
- **A — 5.** La rationalisation devient une décision métier/stratégique traçable jusqu'aux applications, technologies et travaux de sortie.
- **B — 3.** Bon inventaire d'application portfolio, mais l'impact business reste implicite.
- **C — 1.** L'intention de consolidation existe, mais elle ignore dépendances, exigences et trajectoire.
- **D — 0.** Un coût n'est pas un Business Service.

## P4-02 — Network Dependency
Un incident réseau coupe l'accès à Kafka entre deux sites. L'équipe veut déterminer quels paiements, services et processus sont touchés.

Quelle modélisation est la meilleure ?
- **A.** Communication Network/Path et Technology Services → Nodes/System Software → Application Components/Services → Business Processes/Services ; Technology Event pour la coupure, Triggering pour les conséquences et vue cross-layer Incident Impact.
- **B.** Technology View réseau détaillée avec liens, équipements, Kafka et clusters ; utile au diagnostic mais sans remontée jusqu'aux services métier.
- **C.** Utiliser Flow entre les deux Facilities pour représenter la panne réseau elle-même.
- **D.** Modéliser le WAN comme Distribution Network parce qu'il distribue des paquets.

### Correction P4-02
- **A — 5.** Distingue connectivité technologique, événement et impact métier.
- **B — 3.** Bonne vue d'exploitation mais insuffisante pour prioriser selon l'impact business.
- **C — 1.** Flow peut représenter un transfert de données, pas la panne du réseau.
- **D — 0.** Le transport d'information relève de Communication Network/Path, pas du Physical Distribution Network.

## P4-03 — Business Continuity
Le comité BCP veut relier la perte d'un site, les processus métiers critiques, les équipes de reprise, les applications et les exigences de continuité.

Quelle proposition est la meilleure ?
- **A.** Requirements/Goals de continuité → Business Processes/Services et Roles responsables → Application/Technology dependencies → Facilities ; scénarios d'événements et Work Packages/Deliverables de reprise/test pour démontrer la capacité de continuité.
- **B.** Vue DR Application/Technology complète ; solide techniquement, mais les responsabilités métier et Requirements BCP restent séparés.
- **C.** Modéliser « Business Continuity » comme un unique Business Process qui contient tous les systèmes.
- **D.** Utiliser uniquement un Goal « No Downtime » relié à chaque Facility.

### Correction P4-03
- **A — 5.** Répond au concern BCP en reliant exigences, métier, responsabilités, support technique/physique et préparation.
- **B — 3.** Bonne architecture de reprise IT mais pas un modèle BCP complet.
- **C — 1.** La continuité peut contenir des comportements, mais un élément fourre-tout perd la structure et les responsabilités.
- **D — 0.** Un Goal seul ne démontre ni réalisation ni dépendances.

## P4-04 — Product Modeling
Le Product Owner hésite entre `Instant Payment Product`, `Instant Payment Service`, `Payment REST API` et `Payment Orchestrator`, tous actuellement modélisés Product.

Quelle correction est la meilleure ?
- **A.** Product pour l'offre cohérente de valeur pouvant agréger services/contrats ; Business Service pour la fonctionnalité métier ; Application Interface/Service pour l'API ; Application Component pour l'Orchestrator.
- **B.** Product + Business Service correctement séparés, mais garder API et Orchestrator comme un seul Application Component ; utilisable dans une vue très synthétique, moins précis pour exposition/consommation.
- **C.** Utiliser Product pour toute chose visible par un client ou un utilisateur.
- **D.** Remplacer Product par Application Service partout.

### Correction P4-04
- **A — 5.** Respecte les niveaux d'offre, comportement métier, exposition applicative et structure logicielle.
- **B — 3.** Synthèse possible, mais elle masque le point d'accès et la fonctionnalité exposée.
- **C — 1.** L'orientation externe est pertinente mais insuffisante pour définir Product.
- **D — 0.** Un Product n'est pas une fonctionnalité applicative.

## P4-05 — Actor vs Role
Dans la banque, `Payments Operations`, `Fraud Reviewer`, `Corporate Customer` et `Release Manager` sont tous modélisés Business Actor. Le modèle doit permettre les changements organisationnels sans casser les responsabilités.

Quelle approche est la meilleure ?
- **A.** Business Actors pour entités/personnes/organisations ; Business Roles pour responsabilités comme Fraud Reviewer/Release Manager ; Assignment des Actors aux Roles et des Roles aux comportements pertinents.
- **B.** Utiliser uniquement Roles pour tout ; les responsabilités restent claires mais l'organisation réelle et l'allocation des responsabilités disparaissent.
- **C.** Garder uniquement Actors et ajouter une propriété `role=`.
- **D.** Modéliser les équipes comme Business Services parce qu'elles fournissent du travail.

### Correction P4-05
- **A — 5.** Sépare organisation et responsabilité et permet de réallouer les rôles sans redéfinir le comportement.
- **B — 3.** Peut suffire dans une vue purement responsabilité, mais ne répond pas au besoin de transformation organisationnelle.
- **C — 1.** La propriété donne une information mais perd la sémantique explicite du Role et de l'Assignment.
- **D — 0.** Une équipe n'est pas un service métier.

## P4-06 — Component vs Service
Le dossier d'architecture décrit `Payment Orchestrator` comme le « service d'orchestration » et le modèle ne distingue pas composant, fonction interne et fonctionnalité exposée.

Quelle correction est la meilleure ?
- **A.** Application Component Payment Orchestrator → Assignment/behavior interne si utile → Realization d'Application Service Payment Orchestration ; consumers servis par ce Service ; Interface séparée si le point d'accès est dans le concern.
- **B.** Component + Service seulement ; bonne distinction minimale, mais comportement interne et Interface restent implicites.
- **C.** Garder un seul Application Service et ajouter une propriété `implementation=Payment Orchestrator`.
- **D.** Utiliser System Software pour le Payment Orchestrator parce qu'il s'exécute sur OpenShift.

### Correction P4-06
- **A — 5.** Sépare structure, comportement, service et accès selon les besoins du concern.
- **B — 3.** Modèle minimal correct mais moins riche pour l'analyse de responsabilité et d'exposition.
- **C — 1.** La propriété documente l'implémentation mais ne fournit pas de structure exploitable pour la traçabilité.
- **D — 0.** Le fait de s'exécuter sur une plateforme ne transforme pas une application métier en System Software.

## P4-07 — Artifact Deployment
Le Release Architect veut suivre un composant depuis son code logique jusqu'à l'image déployée sur OpenShift et au runtime qui l'exécute.

Quelle chaîne est la meilleure ?
- **A.** Application Component → représenté/réalisé par Artifact (image/package selon la relation appropriée au modèle) → déployé sur Node ; System Software fournit l'environnement/Technology Services ; conserver le Component comme identité logique.
- **B.** Artifact + Node + System Software ; excellente vue de déploiement mais sans lien vers le composant logique, l'impact applicatif est moins traçable.
- **C.** Remplacer le Component par l'Artifact puisque seule l'image est exécutée en production.
- **D.** Modéliser l'image OCI comme Material parce qu'elle occupe de l'espace disque.

### Correction P4-07
- **A — 5.** Relie logique applicative, représentation déployable et environnement d'exécution sans les confondre.
- **B — 3.** Très bonne Deployment/Technology View mais traçabilité logique incomplète.
- **C — 1.** L'Artifact est concret ; il ne remplace pas l'identité logique du Component dans tous les concerns.
- **D — 0.** Une image logicielle n'est pas un Material.

## P4-08 — Plateau Semantics
Le PMO modélise DEV, TEST, UAT, PROD, chaque version logicielle et chaque sprint comme Plateaus. L'architecte veut représenter seulement les états de transformation significatifs.

Quelle réponse est la meilleure ?
- **A.** Réserver Plateau aux états relativement stables et architecturalement significatifs (Baseline, Hybrid Transition, Target, etc.) ; utiliser Work Packages, Deliverables et Implementation Events pour les travaux/jalons, et modéliser les environnements avec les concepts techniques appropriés.
- **B.** Garder PROD comme Plateau si l'on définit explicitement un état cible de production, mais retirer les sprints ; cela peut être défendable selon le concern, sans résoudre tous les abus d'environnement/version.
- **C.** Garder un Plateau par release afin d'obtenir une chronologie exhaustive.
- **D.** Remplacer tous les Plateaus par Goals pour simplifier la roadmap.

### Correction P4-08
- **A — 5.** Le Plateau exprime un état architectural stable, pas une catégorie générique de version/environnement/jalon.
- **B — 3.** Peut fonctionner dans un concern précis où « production target » représente vraiment un état d'architecture, mais nécessite plus de discipline.
- **C — 1.** Une release peut contribuer à un Plateau sans être automatiquement un Plateau.
- **D — 0.** Goals et Plateaus ont des sémantiques différentes.
