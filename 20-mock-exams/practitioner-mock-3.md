# Practitioner Mock 3 — Viewpoints, Physical Resilience, TOGAF, Repository, Events, API Gateway, Secrets, Canary

**Temps : 90 min · Open book · 8 scénarios · Barème 5/3/1/0 · Passage : 26/40.**

## P3-01 — Viewpoint Selection
Le CIO demande une vue qui montre uniquement les capacités stratégiques touchées, les services critiques, les applications majeures et les Work Packages de transformation. Le modèle complet contient plus de 500 éléments.

Quelle approche est la meilleure ?
- **A.** Partir de Stakeholder → Concern, sélectionner un viewpoint adapté ou personnalisé, réutiliser les éléments canoniques et ne montrer que la chaîne nécessaire à la décision CIO.
- **B.** Utiliser une Layered View avec toutes les applications et toutes les technologies ; la vue sera exhaustive mais beaucoup plus complexe que le concern.
- **C.** Copier les éléments principaux dans un nouveau modèle simplifié exclusivement pour le CIO.
- **D.** Afficher le modèle complet puis masquer visuellement quelques éléments sans définir le concern.

### Correction P3-01
- **A — 5.** Viewpoint et View sont guidés par le stakeholder et son concern, avec réutilisation du référentiel.
- **B — 3.** Une Layered View peut convenir, mais l'exhaustivité proposée dépasse le concern.
- **C — 1.** La simplification est utile mais la duplication casse l'identité et la traçabilité.
- **D — 0.** Une vue sans concern explicite devient un filtre graphique, pas un outil de décision.

## P3-02 — Physical Resilience
Le Platform Architect doit montrer comment une panne d'alimentation dans un datacenter peut affecter le service Instant Payment malgré la redondance OpenShift.

Quelle modélisation est la meilleure ?
- **A.** Facility → Distribution Networks/Equipment → Devices → Nodes/System Software → Application Components/Services → Business Service, avec Technology Event pour la panne et Triggering pour les conséquences pertinentes.
- **B.** Facility + UPS + workers + réseau ; bonne vue physique/technologique, mais elle ne démontre pas l'impact jusqu'au service métier.
- **C.** Ajouter une propriété `HA=true` sur le cluster et conclure que le service est résilient.
- **D.** Modéliser la panne électrique comme Business Event parce qu'elle a un impact métier.

### Correction P3-02
- **A — 5.** La chaîne cross-layer rend l'impact explicable et distingue les concepts Physical/Technology/Application/Business.
- **B — 3.** Correct pour une revue d'infrastructure mais incomplet pour l'impact business.
- **C — 1.** Une propriété ne prouve ni la dépendance ni l'absence de SPOF physique.
- **D — 0.** La nature de l'événement dépend du niveau où il se produit ; ici c'est technologique/physique.

## P3-03 — TOGAF ↔ ArchiMate
En Phase E/F TOGAF, le programme possède déjà une Target Architecture mais hésite entre plusieurs options de migration. Le sponsor demande une roadmap traçable.

Quelle proposition est la meilleure ?
- **A.** Utiliser TOGAF pour cadrer options/priorisation/gouvernance et ArchiMate pour représenter Gaps, Plateaus, Work Packages, Deliverables, Events et dépendances ; ne pas présenter le mapping comme une conversion normative 1:1.
- **B.** Utiliser uniquement Plateaus et Work Packages dans ArchiMate ; la roadmap devient lisible mais les critères de décision TOGAF et la gouvernance restent hors champ.
- **C.** Créer un élément ArchiMate pour chaque livrable TOGAF, même quand aucun concept du langage ne correspond directement.
- **D.** Remplacer l'ADM par ArchiMate puisque le langage contient des concepts de migration.

### Correction P3-03
- **A — 5.** TOGAF fournit méthode/gouvernance ; ArchiMate fournit représentation/analyse/traçabilité.
- **B — 3.** Bon modèle ArchiMate mais incomplet pour le processus de décision du programme.
- **C — 1.** Un mapping mécanique peut créer de faux équivalents et dégrader la sémantique.
- **D — 0.** ArchiMate n'est pas une méthode de transformation remplaçant l'ADM.

## P3-04 — Canonical Repository
Trois équipes ont créé trois éléments `Payment Orchestrator` différents pour leurs vues Application, Security et Migration. Les noms sont identiques mais les IDs diffèrent.

Quelle correction est la meilleure ?
- **A.** Définir un élément canonique unique, fusionner les doublons après revue sémantique, réutiliser cet élément dans toutes les Views et conserver les propriétés spécifiques au bon niveau.
- **B.** Conserver les trois éléments mais ajouter une Association entre eux ; la similitude est documentée mais la duplication reste.
- **C.** Renommer les trois copies `Payment Orchestrator APP/SEC/MIG` pour éviter la confusion.
- **D.** Copier l'intégralité de chaque sous-modèle dans un nouveau référentiel maître.

### Correction P3-04
- **A — 5.** Un référentiel cohérent réutilise l'identité logique ; les Views ne créent pas de nouveaux concepts.
- **B — 3.** Peut aider temporairement à identifier les doublons, mais ne résout pas la gouvernance de l'identité.
- **C — 1.** Les noms deviennent clairs, mais la fragmentation sémantique demeure.
- **D — 0.** La copie multiplie encore les identités et les divergences.

## P3-05 — Event Modeling
Un architecte veut modéliser : « PaymentAccepted » déclenche la génération d'un message JSON envoyé vers Kafka, puis consommé par Settlement.

Quelle chaîne est la meilleure ?
- **A.** Application Event `PaymentAccepted` ; Data Object pour le payload logique ; Triggering vers le comportement de publication si causalité ; Flow pour le transfert du message ; Kafka System Software/Technology Service selon le concern ; Settlement consomme via services/comportements appropriés.
- **B.** Application Event + Flow directement vers Settlement ; utile pour une vue simplifiée d'échanges mais sans distinguer payload, publication ni plateforme.
- **C.** Data Object `PaymentAccepted` et Application Event `KafkaTopic` ; la vue inverse fait et canal.
- **D.** Utiliser Triggering pour tous les liens puisqu'un événement est présent.

### Correction P3-05
- **A — 5.** Sépare fait, payload, causalité, transfert et plateforme.
- **B — 3.** Vue synthétique acceptable si le concern est uniquement l'échange, mais moins précise et moins traçable.
- **C — 1.** Les notions existent mais sont attribuées aux mauvais concepts.
- **D — 0.** Triggering n'exprime pas le transfert de données.

## P3-06 — API Gateway
Le modèle représente API Gateway à la fois comme Application Interface, Application Component et System Software dans trois vues. L'équipe veut supprimer la contradiction.

Quelle approche est la meilleure ?
- **A.** Déterminer le concern : produit/runtime de gateway = souvent System Software ; fonction logique propre au domaine applicatif peut être Application Component ; API exposée = Application Interface ; éviter de forcer un seul type pour tous les rôles et expliciter les relations entre eux.
- **B.** Choisir System Software partout, car tout API Gateway est un produit technique ; cohérent pour l'infrastructure mais perd les interfaces exposées et fonctions applicatives éventuelles.
- **C.** Choisir Application Component partout parce que la gateway traite des requêtes applicatives.
- **D.** Créer un type personnalisé `APIGateway` et abandonner les concepts ArchiMate.

### Correction P3-06
- **A — 5.** Un même produit réel peut participer à plusieurs concepts architecturaux selon le concern ; les éléments doivent représenter des rôles sémantiques distincts.
- **B — 3.** Défendable pour une Technology View, insuffisant pour l'exposition d'API.
- **C — 1.** Peut convenir à certains rôles logiques, mais généraliser supprime la distinction plateforme/interface.
- **D — 0.** Un type custom n'est pas nécessaire pour résoudre une confusion de concern.

## P3-07 — Secrets Management
Le CISO veut montrer qui peut obtenir un secret, comment il est distribué à un workload et quelle plateforme le protège. La vue actuelle relie `Vault` directement à `Secret` par Flow.

Quelle proposition est la meilleure ?
- **A.** Requirement/Principle de gestion des secrets → Application Components/workload identities → Secrets Technology Service réalisé par System Software Vault → interfaces/Access pertinents vers la représentation du secret ; utiliser Flow uniquement lorsqu'un transfert est réellement le concern.
- **B.** Technology View avec Vault, interfaces, workloads et Flow de distribution ; bonne vue d'exploitation, mais sans Requirements ni gouvernance d'identité.
- **C.** Représenter chaque secret comme Material puisque c'est une ressource protégée.
- **D.** Utiliser Serving entre tous les workloads et tous les secrets pour montrer l'autorisation.

### Correction P3-07
- **A — 5.** Distingue exigence, identité, service, logiciel et accès à l'information.
- **B — 3.** Techniquement pertinente mais moins complète pour le CISO.
- **C — 1.** Un secret n'est pas une matière physique au sens du Physical Layer.
- **D — 0.** Serving n'exprime pas une autorisation d'accès à un objet passif.

## P3-08 — Canary / Progressive Delivery
Le programme veut montrer qu'une nouvelle version est déployée progressivement sur 5 %, 25 %, puis 100 % du trafic, avec possibilité de rollback.

Quelle modélisation est la meilleure ?
- **A.** Course of Action pour la stratégie progressive si utile, Work Package/Deliverables pour l'implémentation, Implementation Events pour les gates/cutovers significatifs, Plateaus uniquement lorsque les états intermédiaires sont architecturalement stables et utiles ; Requirements pour rollback/observability.
- **B.** Utiliser Work Packages et Events pour les étapes 5/25/100 ; bonne représentation de déploiement même sans Plateaus si les états intermédiaires ne sont pas assez stables pour en justifier.
- **C.** Créer automatiquement un Plateau par pourcentage, même si chaque état dure quelques minutes et n'est pas un état architectural pertinent.
- **D.** Utiliser Flow pour représenter le pourcentage de trafic comme roadmap de migration.

### Correction P3-08
- **A — 5.** Modélise stratégie, travaux, gates et états seulement lorsque leur sémantique le justifie.
- **B — 3.** Très raisonnable pour une livraison progressive ; il manque seulement la vision stratégique/exigences complète.
- **C — 1.** Pas forcément illégal, mais généralement une sur-modélisation de states non significatifs.
- **D — 0.** Flow ne remplace pas les concepts de transformation.
