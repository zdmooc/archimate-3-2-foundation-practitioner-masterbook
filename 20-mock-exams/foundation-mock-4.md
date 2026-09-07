# Foundation Mock 4 — 40 QCM

**Temps : 60 min · Closed book · Passage : 24/40.**

Ce mock teste la **correction d'anti-patterns**.

**F4-01.** Un modèle utilise Concern pour représenter l'entité « CISO ». Que choisir ?  
A. Stakeholder · B. Driver · C. Business Role · D. View
**F4-02.** Un modèle utilise Assessment pour « pression réglementaire ». Que choisir ?  
A. Goal · B. Driver · C. Requirement · D. Outcome
**F4-03.** Un modèle utilise Driver pour « risque élevé dû au monolithe » issu d'une analyse. Que choisir ?  
A. Assessment · B. Constraint · C. Goal · D. Gap
**F4-04.** Un modèle utilise Outcome pour « devenir une banque résiliente ». Que choisir ?  
A. Goal · B. Requirement · C. Deliverable · D. Course of Action
**F4-05.** Un modèle utilise Goal pour « RTO inférieur à 15 min atteint ». Que choisir ?  
A. Outcome · B. Gap · C. Requirement · D. Assessment
**F4-06.** Un modèle utilise Gap pour « le service doit survivre à la perte d'un worker ». Que choisir ?  
A. Requirement · B. Constraint · C. Goal · D. Plateau
**F4-07.** Un modèle utilise Requirement pour « aucune donnée hors UE ». Quel concept précise le mieux la restriction ?  
A. Constraint · B. Driver · C. Outcome · D. Value
**F4-08.** Kubernetes est modélisé comme Capability « Kubernetes ». Que corriger ?  
A. Capability « Container Platform Operations » et technologie séparée · B. Conserver tel quel · C. Business Process · D. Product
**F4-09.** Une séquence « Initier→Valider→Confirmer » est appelée Value Stream alors que l'ordre opérationnel est le concern. Que choisir ?  
A. Business Process · B. Value Stream · C. Capability · D. Course of Action
**F4-10.** Un lot de migration concret est modélisé Course of Action. Que choisir ?  
A. Work Package · B. Goal · C. Value Stream · D. Resource
**F4-11.** « Fraud Reviewer » est modélisé Business Actor alors que plusieurs équipes peuvent porter cette responsabilité. Que choisir ?  
A. Business Role · B. Business Service · C. Business Function · D. Stakeholder
**F4-12.** « MayaBank Operations » est une entité organisationnelle mais est modélisée Role. Que choisir ?  
A. Business Actor · B. Business Process · C. Business Service · D. Capability
**F4-13.** Un comportement séquentiel est modélisé Business Function. Que choisir ?  
A. Business Process · B. Business Role · C. Business Object · D. Product
**F4-14.** Un regroupement durable « Fraud Management » sans ordre imposé est modélisé Process. Que choisir ?  
A. Business Function · B. Event · C. Service · D. Collaboration
**F4-15.** La fonctionnalité métier consommée par le client est modélisée Interface. Que choisir ?  
A. Business Service · B. Business Process · C. Business Actor · D. Contract
**F4-16.** Payment Orchestrator est modélisé Application Service alors que le concern est la structure logicielle. Que choisir ?  
A. Application Component · B. Application Interface · C. Artifact · D. Node
**F4-17.** L'URL REST est modélisée Application Service alors que le concern est le point d'accès. Que choisir ?  
A. Application Interface · B. Application Function · C. Application Component · D. Data Object
**F4-18.** Une fonctionnalité applicative consommée est modélisée Function. Que choisir ?  
A. Application Service · B. Application Process · C. Technology Service · D. Interface
**F4-19.** Payment Instruction logique est modélisé Business Object dans une vue applicative de structures de données. Que choisir ?  
A. Data Object · B. Artifact · C. Material · D. Contract
**F4-20.** Une VM est modélisée Device alors que le concern est la ressource d'exécution logique. Que choisir ?  
A. Node · B. Facility · C. Equipment · D. System Software
**F4-21.** Un serveur physique est modélisé Node alors que le concern est le matériel IT. Que choisir ?  
A. Device · B. Facility · C. Equipment · D. Path
**F4-22.** OpenShift runtime est modélisé Application Component. Que choisir ?  
A. System Software · B. Technology Service · C. Node · D. Artifact
**F4-23.** « Event Streaming Service » consommé par les applications est modélisé System Software. Que choisir ?  
A. Technology Service · B. Application Service · C. Technology Function · D. Device
**F4-24.** Une image OCI est modélisée Data Object. Que choisir ?  
A. Artifact · B. Material · C. Application Component · D. Business Object
**F4-25.** Un datacenter est modélisé Device. Que choisir ?  
A. Facility · B. Node · C. Equipment · D. Communication Network
**F4-26.** Un UPS est modélisé Device. Que choisir dans le Physical Layer ?  
A. Equipment · B. Facility · C. Material · D. Distribution Network
**F4-27.** Un travail de migration est modélisé Course of Action. Que choisir ?  
A. Work Package · B. Plateau · C. Deliverable · D. Implementation Event
**F4-28.** « Dossier de cutover validé » est réduit à Artifact alors que le concern est le résultat du programme. Que choisir ?  
A. Deliverable · B. Outcome · C. Gap · D. Work Package
**F4-29.** Chaque sprint est modélisé Plateau. Quelle correction ?  
A. Réserver Plateau aux états relativement stables · B. Garder un Plateau par sprint · C. Utiliser Gap par sprint · D. Utiliser Facility
**F4-30.** Un besoin manquant entre baseline et target est modélisé Requirement alors qu'on veut représenter l'écart. Que choisir ?  
A. Gap · B. Constraint · C. Outcome · D. Driver
**F4-31.** Une équipe « sert » un processus qu'elle exécute. Quelle relation ?  
A. Assignment · B. Serving · C. Flow · D. Influence
**F4-32.** Une fonction interne « sert » un service qu'elle implémente. Quelle relation ?  
A. Realization · B. Serving · C. Access · D. Triggering
**F4-33.** Un service applicatif « réalise » un consommateur métier. Quelle relation traduit la fourniture au consommateur ?  
A. Serving · B. Access · C. Flow · D. Assignment
**F4-34.** Une fonction utilise Flow pour signifier qu'elle lit un Data Object. Quelle relation ?  
A. Access · B. Flow · C. Triggering · D. Realization
**F4-35.** Un Technology Event transfère des données vers un autre système ; le modèle utilise Triggering pour le transfert. Quelle relation décrit le transfert ?  
A. Flow · B. Triggering · C. Serving · D. Influence
**F4-36.** « Panne détectée » cause « failover démarré » mais le modèle utilise Flow. Quelle relation ?  
A. Triggering · B. Access · C. Realization · D. Aggregation
**F4-37.** Un Assessment de risque est relié à un Goal par Serving. Quelle relation est plus adaptée à l'effet motivationnel ?  
A. Influence · B. Flow · C. Access · D. Assignment
**F4-38.** Une équipe appelle « View » le cadre de conventions servant à construire des représentations. Que choisir ?  
A. Viewpoint · B. Concern · C. Model · D. Plateau
**F4-39.** Une équipe appelle « Viewpoint » le diagramme réellement montré au CIO. Que choisir ?  
A. View · B. Stakeholder · C. Driver · D. Capability
**F4-40.** Chaque vue recrée une copie différente du même Payment Orchestrator. Quelle correction ?  
A. Réutiliser un élément canonique unique dans plusieurs Views · B. Garder les copies · C. Tout fusionner en note libre · D. Utiliser Association entre copies

### Correction détaillée

- **F4-01 A.** CISO est la partie prenante ; son Concern est ce qu'il veut comprendre/contrôler.
- **F4-02 B.** La pression réglementaire est un Driver ; Assessment est son analyse.
- **F4-03 A.** Le risque constaté à l'issue de l'analyse est un Assessment.
- **F4-04 A.** « devenir résilient » est un Goal de haut niveau.
- **F4-05 A.** Un RTO atteint et mesuré est un Outcome.
- **F4-06 A.** La disponibilité exigée est un Requirement.
- **F4-07 A.** « aucune donnée hors UE » limite explicitement les options : Constraint.
- **F4-08 A.** Une Capability décrit une aptitude ; Kubernetes/OpenShift reste un moyen technologique.
- **F4-09 A.** Lorsque l'ordre opérationnel est central, Business Process est plus adapté que Value Stream.
- **F4-10 A.** Course of Action est l'approche ; Work Package est l'exécution concrète.
- **F4-11 A.** Role exprime la responsabilité indépendamment de l'équipe qui la porte.
- **F4-12 A.** Actor représente l'entité organisationnelle.
- **F4-13 A.** Process met en avant l'enchaînement du comportement.
- **F4-14 A.** Function regroupe du comportement par finalité sans ordre imposé.
- **F4-15 A.** Service = fonctionnalité métier fournie ; Interface = point d'accès.
- **F4-16 A.** Le Payment Orchestrator en tant que structure logicielle est Application Component.
- **F4-17 A.** Le point d'accès REST est Application Interface.
- **F4-18 A.** Une fonctionnalité applicative exposée au consommateur est Application Service.
- **F4-19 A.** En couche Application, l'information logique est Data Object.
- **F4-20 A.** Une VM comme ressource d'exécution logique est Node.
- **F4-21 A.** Le serveur physique en tant que matériel IT est Device.
- **F4-22 A.** OpenShift runtime est System Software.
- **F4-23 A.** La fonctionnalité de streaming consommée est Technology Service ; Kafka runtime peut être System Software.
- **F4-24 A.** Une image OCI est un Artifact déployable.
- **F4-25 A.** Datacenter = Facility.
- **F4-26 A.** UPS = Equipment dans le Physical Layer.
- **F4-27 A.** Travail de transformation concret = Work Package.
- **F4-28 A.** Deliverable représente le résultat défini d'un Work Package, pas seulement un fichier.
- **F4-29 A.** Plateau doit correspondre à un état architectural relativement stable.
- **F4-30 A.** Gap exprime ce qui manque entre baseline et target.
- **F4-31 A.** Assignment = qui exécute quoi.
- **F4-32 A.** Realization = ce qui concrétise/implémente quoi.
- **F4-33 A.** Serving = fournisseur vers consommateur.
- **F4-34 A.** Access exprime lecture/écriture d'un objet passif.
- **F4-35 A.** Flow exprime le transfert ; Triggering exprime causalité/séquence.
- **F4-36 A.** La panne déclenche le failover : Triggering.
- **F4-37 A.** Influence exprime l'effet sur un élément de Motivation.
- **F4-38 A.** Viewpoint = conventions/cadre de construction.
- **F4-39 A.** View = représentation produite pour des concerns.
- **F4-40 A.** Les Views doivent réutiliser les mêmes éléments logiques du référentiel pour préserver identité et traçabilité.
