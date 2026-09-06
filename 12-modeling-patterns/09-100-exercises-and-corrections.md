# 100 exercices de patterns et corrections

Les exercices sont volontairement courts et différents. L’objectif est de construire des réflexes de discrimination et de réparation.

---

# A. Choisir le bon élément — 1 à 40

### 1
Une aptitude à traiter des paiements en temps réel.

**Réponse : Capability.**

### 2
La suite d’étapes qui valide puis exécute un paiement.

**Réponse : Business Process.**

### 3
La responsabilité « Fraud Analyst ».

**Réponse : Business Role.**

### 4
L’équipe « Fraud Operations ».

**Réponse : Business Actor.**

### 5
La fonctionnalité applicative exposée « Payment Status ».

**Réponse : Application Service.**

### 6
`GET /payments/{id}` comme point d’accès.

**Réponse : Application Interface.**

### 7
Le logiciel métier `Payment Orchestrator`.

**Réponse : Application Component.**

### 8
Kafka comme produit de plateforme.

**Réponse : System Software.**

### 9
La fonctionnalité technique de streaming fournie aux applications.

**Réponse : Technology Service.**

### 10
`Payment Authorized` comme changement d’état applicatif.

**Réponse : Application Event.**

### 11
Le JSON transporté avec `Payment Authorized`.

**Réponse : Data Object**, si l’on représente l’information logique structurée.

### 12
Le concept métier « Payment Order ».

**Réponse : Business Object.**

### 13
La table physique `PAYMENT_TX`.

**Réponse : Artifact**, si ce niveau technologique est utile.

### 14
Oracle Database comme moteur.

**Réponse : System Software.**

### 15
Un serveur rack informatique.

**Réponse : Device.**

### 16
Un UPS de datacenter.

**Réponse : Equipment.**

### 17
Le réseau IP inter-site.

**Réponse : Communication Network.**

### 18
Le réseau d’alimentation électrique du datacenter.

**Réponse : Distribution Network.**

### 19
Le site/datacenter hébergeant l’infrastructure.

**Réponse : Facility.**

### 20
« Adopt Event-Driven Architecture » comme direction stratégique.

**Réponse : Course of Action.**

### 21
« Deploy Kafka Platform » comme chantier de transformation.

**Réponse : Work Package.**

### 22
« Kafka Platform Ready for Production » comme résultat du chantier.

**Réponse : Deliverable.**

### 23
« Wave 1 Go-Live Completed ».

**Réponse : Implementation Event.**

### 24
État stable où legacy et cible coexistent.

**Réponse : Plateau.**

### 25
Absence d’event backbone entre baseline et target.

**Réponse : Gap.**

### 26
Pression réglementaire qui motive le changement.

**Réponse : Driver.**

### 27
Conclusion « architecture actuelle incapable de tenir le SLA ».

**Réponse : Assessment.**

### 28
« Improve Payment Reliability ».

**Réponse : Goal.**

### 29
« Payment success rate ≥ 99.99% ».

**Réponse : Outcome.**

### 30
« All privileged operations shall use MFA ».

**Réponse : Requirement.**

### 31
« Payment data must remain in EU-hosted environments ».

**Réponse : Constraint.**

### 32
Plusieurs composants applicatifs coopérant comme ensemble.

**Réponse : Application Collaboration.**

### 33
Comportement collectif effectué par cette collaboration.

**Réponse : Application Interaction.**

### 34
Un portail par lequel un service métier est accessible.

**Réponse : Business Interface.**

### 35
Une offre « Premium Payments » regroupant plusieurs services et contrats.

**Réponse : Product.**

### 36
Le contrat qui encadre l’offre.

**Réponse : Contract.**

### 37
Une ressource stratégique « Payment Engineering Team ».

**Réponse : Resource.**

### 38
Les étapes « Receive → Validate → Execute → Confirm » vues comme création de valeur.

**Réponse : Value Stream.**

### 39
Le réseau électrique qui alimente deux salles informatiques.

**Réponse : Distribution Network.**

### 40
Un fichier de configuration déployé sur OpenShift.

**Réponse : Artifact.**

---

# B. Choisir la relation — 41 à 70

### 41
Une équipe tient un rôle.

**Réponse : Assignment.**

### 42
Un rôle exécute un processus.

**Réponse : Assignment.**

### 43
Une fonction interne met en œuvre un service.

**Réponse : Realization.**

### 44
Un service applicatif fournit une fonctionnalité à un processus métier.

**Réponse : Serving.**

### 45
Une fonction lit une donnée.

**Réponse : Access(read).**

### 46
Une fonction écrit une donnée.

**Réponse : Access(write).**

### 47
Un comportement en déclenche un autre.

**Réponse : Triggering.**

### 48
Une instruction de paiement est transférée d’un comportement à un autre.

**Réponse : Flow.**

### 49
Un composant est une partie constitutive forte d’une plateforme.

**Réponse : Composition.**

### 50
Un produit regroupe plusieurs services relativement indépendants.

**Réponse : Aggregation.**

### 51
`Instant Payment Service` est une spécialisation de `Payment Service`.

**Réponse : Specialization.**

### 52
Un driver affecte un goal positivement ou négativement.

**Réponse : Influence.**

### 53
Un lien pertinent existe mais aucun sens plus précis n’est requis.

**Réponse : Association.**

### 54
Une image de conteneur concrétise un composant applicatif.

**Réponse : Realization.**

### 55
Un Data Object concrétise un Business Object.

**Réponse : Realization.**

### 56
Un service technologique fournit un runtime à un composant applicatif.

**Réponse : Serving.**

### 57
Un composant exécute une fonction applicative.

**Réponse : Assignment.**

### 58
Une fonction d’application produit un service exposé.

**Réponse : Realization.**

### 59
Un événement `Payment Received` démarre `Validate Payment`.

**Réponse : Triggering.**

### 60
`Validate Payment` transmet un `Payment Context` à `Fraud Check`.

**Réponse : Flow.**

### 61
Un Business Process modifie `Payment Order`.

**Réponse : Access(write).**

### 62
Un composant consulte `Customer Profile`.

**Réponse : Access(read),** si la relation directe est permise au niveau choisi ; sinon modéliser le comportement qui effectue l’accès.

### 63
Plusieurs relations Serving convergent avec une logique AND.

**Réponse : AND Junction** utilisant des relations de même type selon les règles applicables.

### 64
Deux chemins alternatifs représentent un OR.

**Réponse : OR Junction**, si la sémantique et le type de relations sont valides.

### 65
Une capability est soutenue par plusieurs ressources et comportements.

**Réponse : utiliser les relations autorisées appropriées ; ne pas choisir Association par défaut.**

### 66
Une API Interface rend un service accessible.

**Réponse : relation d’exposition/assignment selon le métamodèle applicable ; vérifier la matrice plutôt que d’inventer une relation décorative.**

### 67
Un Requirement influence la conception d’un composant.

**Réponse : vérifier les relations de motivation autorisées ; souvent la traçabilité est exprimée via Realization/Influence selon les types exacts.**

### 68
Un Work Package produit un Deliverable.

**Réponse : relation de réalisation appropriée au métamodèle Implementation & Migration.**

### 69
Un Gap est associé à deux Plateaus comparés.

**Réponse : utiliser les relations autorisées par le métamodèle, pas une flèche inventée.**

### 70
Une relation directe semble déductible d’un chemin cross-layer.

**Réponse : vérifier les règles de Derived Relationships avant de la tracer.**

---

# C. Réparer le modèle — 71 à 100

### 71
`Capability: Kafka`.

**Correction :** `System Software: Kafka`; la capability doit exprimer une aptitude, par exemple `Real-Time Event Processing`.

### 72
`Application Event: payment.authorized.topic`.

**Correction :** Event = `Payment Authorized`; topic = mécanisme technique/propriété.

### 73
`Data Object: Oracle`.

**Correction :** Oracle = System Software ; la donnée doit être un concept comme `Payment Transaction`.

### 74
`Application Component: POST /payments`.

**Correction :** endpoint = Application Interface ; fournisseur = Application Component.

### 75
`Application Service: Payment Orchestrator`.

**Correction :** si l’on parle du logiciel, utiliser Application Component ; le service exposé est `Payment Orchestration Service`.

### 76
`Business Actor: Payment Operator`.

**Correction :** probablement Business Role ; l’Actor serait l’équipe ou l’unité qui tient ce rôle.

### 77
`Business Process: Fraud Management` alors qu’on veut une aptitude stratégique.

**Correction :** Capability `Fraud Management`.

### 78
`Requirement: Improve Reliability`.

**Correction :** Goal `Improve Reliability`; Requirement = propriété vérifiable.

### 79
`Outcome: Improve Reliability` identique au Goal.

**Correction :** formuler un résultat observable, par exemple `Payment success rate ≥ 99.99%`.

### 80
`Work Package: Adopt Cloud Strategy`.

**Correction :** Course of Action si c’est une direction ; Work Package si c’est un chantier concret comme `Migrate Payment Platform to Cloud`.

### 81
`Plateau: PROD` sans contexte de transformation.

**Correction :** représenter l’environnement avec les éléments Application/Technology appropriés ; Plateau seulement si `PROD` décrit réellement un état architectural stable de transformation.

### 82
`Equipment: Rack Server`.

**Correction :** Device pour un serveur IT.

### 83
`Distribution Network: MPLS WAN`.

**Correction :** Communication Network.

### 84
`Communication Network: Electrical Grid`.

**Correction :** Distribution Network.

### 85
Tous les liens sont Association.

**Correction :** requalifier en Assignment, Realization, Serving, Access, Triggering, Flow, etc.

### 86
Le CIO reçoit un diagramme de 180 microservices.

**Correction :** produire une View exécutive plus abstraite à partir du même modèle.

### 87
La vue mélange `Core Banking` et `PaymentValidatorImpl.java` au même niveau.

**Correction :** harmoniser la granularité ou créer des vues séparées.

### 88
Le diagramme a des flèches gauche→droite non typées.

**Correction :** donner une sémantique relationnelle explicite et vérifier la direction.

### 89
Le payload JSON est représenté comme l’événement.

**Correction :** Event = fait ; Data Object = payload.

### 90
Kafka est représenté comme Application Component dans une vue plateforme générique.

**Correction :** System Software, sauf raison spécifique de modélisation documentée.

### 91
OpenShift est représenté comme Capability.

**Correction :** System Software / Technology Service selon le concern ; la capability pourrait être `Container Platform Operations`.

### 92
Une base PostgreSQL est un Business Object.

**Correction :** PostgreSQL = System Software ; business information = Business Object ; logical data = Data Object.

### 93
Un Goal est relié directement à un serveur sans explication.

**Correction :** restaurer la traçabilité via requirements/capabilities/application/technology ou utiliser une relation dérivée seulement si valide.

### 94
Un Gap est utilisé pour représenter un risque de cyberattaque.

**Correction :** Assessment/Concern pour le risque ; Gap pour la différence entre baseline et target.

### 95
Un Work Package est représenté comme composant applicatif.

**Correction :** Work Package dans Implementation & Migration ; Application Component pour le logiciel produit.

### 96
Un Deliverable `Payment Orchestrator Release` et l’image conteneur sont fusionnés en un seul Artifact.

**Correction :** Deliverable = résultat de transformation ; Artifact = élément déployable concret.

### 97
Un `Node Unavailable` est représenté comme Implementation Event.

**Correction :** Technology Event ; Implementation Event concerne la transformation/migration.

### 98
Le modèle Green IT contient `Carbon = 4 tonnes` comme élément personnalisé isolé.

**Correction :** porter la mesure comme property/metric reliée aux éléments appropriés et garder les éléments ArchiMate pour les dépendances architecturales.

### 99
La même vue montre motivations, 70 apps, 40 nodes, racks, UPS et work packages.

**Correction :** conserver un modèle intégré mais produire plusieurs Views adaptées aux stakeholders.

### 100
Une relation directe entre Business Service et Device est ajoutée « pour montrer l’impact » sans vérifier le chemin.

**Correction :** conserver la chaîne explicite Business→Application→Technology→Device ou utiliser une Derived Relationship seulement si les règles de dérivation la permettent.

---

# Barème personnel

- **90–100** : très bon réflexe de modélisation ;
- **80–89** : solide, revoir relations et cross-layer ;
- **70–79** : bonne base mais discriminations encore fragiles ;
- **<70** : retravailler les Parties II, V–XII avant Practitioner.

Le score n’est pas un seuil officiel d’examen ; c’est un indicateur interne de maîtrise.
