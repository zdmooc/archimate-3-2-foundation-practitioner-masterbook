# Views & Viewpoints — 50 QCM

> Répondre sans consulter la correction. Une seule réponse est attendue par question.

## Q251
Dans la gestion des vues ArchiMate, quel terme correspond à : « la partie prenante à laquelle une vue doit répondre » ?
- **A.** View
- **B.** Concern
- **C.** Stakeholder
- **D.** Viewpoint

## Q252
Dans la gestion des vues ArchiMate, quel terme correspond à : « l’intérêt, question ou préoccupation d’un stakeholder » ?
- **A.** View
- **B.** Concern
- **C.** Goal
- **D.** Viewpoint

## Q253
Dans la gestion des vues ArchiMate, quel terme correspond à : « la convention qui définit comment construire une vue pour certains concerns » ?
- **A.** Model
- **B.** View
- **C.** Stakeholder
- **D.** Viewpoint

## Q254
Dans la gestion des vues ArchiMate, quel terme correspond à : « la représentation d’un système à partir d’un ensemble de concerns » ?
- **A.** Concern
- **B.** Viewpoint
- **C.** Layer
- **D.** View

## Q255
Un CIO veut comprendre quels objectifs stratégiques sont soutenus par les capacités de l’entreprise. Quelle vue est la plus adaptée ?
- **A.** Deployment View
- **B.** Physical View
- **C.** Strategy/Capability View
- **D.** Technology View

## Q256
Un responsable métier veut comprendre l’enchaînement des activités d’un processus et les rôles impliqués. Quelle vue ?
- **A.** Business Process Cooperation View
- **B.** Physical View
- **C.** Migration View
- **D.** Technology View

## Q257
Un Product Owner veut voir les services qui constituent une offre bancaire et les contrats associés. Quelle vue ?
- **A.** Implementation View
- **B.** Technology View
- **C.** Product View
- **D.** Deployment View

## Q258
Un architecte applicatif veut comprendre les dépendances et coopérations entre applications. Quelle vue ?
- **A.** Strategy View
- **B.** Organization View
- **C.** Application Cooperation View
- **D.** Physical View

## Q259
Un métier veut savoir quelles applications supportent un processus métier. Quelle vue ?
- **A.** Organization View
- **B.** Technology View
- **C.** Physical View
- **D.** Application Usage View

## Q260
Un architecte plateforme veut voir composants, services technologiques, nœuds et logiciels système. Quelle vue ?
- **A.** Motivation View
- **B.** Organization View
- **C.** Technology View
- **D.** Product View

## Q261
Un architecte veut montrer Business → Application → Technology dans une même vue. Quel type de vue est particulièrement adapté ?
- **A.** Layered View
- **B.** Goal View
- **C.** Product View
- **D.** Organization View

## Q262
Un directeur de programme veut voir baseline, transition, target, gaps et work packages. Quelle vue ?
- **A.** Business Process View
- **B.** Implementation & Migration View
- **C.** Application Cooperation View
- **D.** Physical View

## Q263
Un CISO veut comprendre dépendances IAM, secrets, applications et services. Quel choix est le plus pertinent ?
- **A.** uniquement une Organization View
- **B.** une seule Product View standard
- **C.** une vue cross-layer Security orientée concern
- **D.** aucune vue, car Security n’existe pas comme layer

## Q264
Un SRE veut voir service métier, applications, plateforme et observabilité pour analyser un incident. Quelle vue ?
- **A.** uniquement Organization View
- **B.** une vue cross-layer Incident Impact
- **C.** uniquement Strategy View
- **D.** uniquement Product View

## Q265
Un responsable Green IT veut relier applications, capacité, serveurs, énergie et objectifs carbone. Quelle vue ?
- **A.** uniquement Business Process View
- **B.** une vue cross-layer Green IT
- **C.** uniquement Application Cooperation View
- **D.** uniquement Motivation View

## Q266
Quelle est la différence correcte entre Viewpoint et View ?
- **A.** Viewpoint = stakeholder; View = concern.
- **B.** Viewpoint = élément; View = relation.
- **C.** Ils sont synonymes.
- **D.** Viewpoint = manière/convention de construire; View = représentation produite

## Q267
Quelle chaîne est la plus correcte ?
- **A.** Stakeholder → Concern → Viewpoint → View
- **B.** Concern → Artifact → Stakeholder → View
- **C.** Viewpoint → Node → Goal → Stakeholder
- **D.** View → Concern → Stakeholder → Device

## Q268
Pourquoi une vue ne doit-elle pas tout montrer ?
- **A.** Parce qu’elle doit répondre à un concern précis et rester lisible.
- **B.** Parce qu’une View ne peut contenir qu’un type d’élément.
- **C.** Parce qu’ArchiMate limite à 10 éléments.
- **D.** Parce que les couches ne peuvent jamais être mélangées.

## Q269
Un même élément ArchiMate peut-il apparaître dans plusieurs vues ?
- **A.** Non, sauf Business Objects.
- **B.** Oui, et il devrait rester le même élément logique.
- **C.** Oui mais avec un autre type.
- **D.** Non, il faut le recréer à chaque vue.

## Q270
Pourquoi dupliquer le même composant logique dans chaque vue est-il un anti-pattern ?
- **A.** Parce que chaque vue doit utiliser des noms différents.
- **B.** Parce qu’un composant ne peut apparaître qu’une fois.
- **C.** Parce que deux rectangles identiques sont interdits.
- **D.** Parce que cela casse la cohérence, l’identité et la traçabilité du référentiel.

## Q271
Une vue Executive Transformation doit montrer quoi en priorité ?
- **A.** Goals, Capabilities, Plateaus, Gaps et Work Packages pertinents
- **B.** toutes les tables SQL
- **C.** tous les ports réseau
- **D.** tous les pods Kubernetes

## Q272
Une vue Deployment doit montrer quoi en priorité ?
- **A.** Goals uniquement
- **B.** Stakeholders uniquement
- **C.** Value Streams uniquement
- **D.** Artifacts, nodes, system software et déploiements/dépendances pertinentes

## Q273
Une vue Application Usage doit éviter quoi ?
- **A.** de montrer des processus métier
- **B.** de montrer des services applicatifs
- **C.** de devenir un inventaire technique de tous les nœuds
- **D.** de montrer des composants applicatifs pertinents

## Q274
Une vue Capability doit éviter quoi ?
- **A.** de remplacer les capacités par des produits techniques nommés sans justification
- **B.** de montrer des Goals
- **C.** de montrer des Resources
- **D.** de montrer des Value Streams

## Q275
Un stakeholder demande « si Kafka tombe, quels services métiers sont impactés ? ». Quel type de vue ?
- **A.** Product View uniquement
- **B.** Physical View uniquement
- **C.** Layered / impact analysis cross-layer
- **D.** Organization View uniquement

## Q276
Un stakeholder demande « quelles API exposent nos services de paiement aux partenaires ? ». Quelle vue ?
- **A.** Application Cooperation/Usage avec Interfaces et Services
- **B.** Migration View uniquement
- **C.** Physical View
- **D.** Strategy View

## Q277
Un stakeholder demande « quelles installations physiques supportent le service de paiement ? ». Quelle vue ?
- **A.** Layered avec Technology + Physical + Application/Business
- **B.** Product View uniquement
- **C.** Motivation View uniquement
- **D.** Organization View uniquement

## Q278
Un stakeholder demande « quels gaps empêchent le target ? ». Quelle vue ?
- **A.** Implementation & Migration View
- **B.** Technology View seule
- **C.** Organization View
- **D.** Application Cooperation View

## Q279
Un stakeholder demande « quels drivers et assessments justifient le programme ? ». Quelle vue ?
- **A.** Deployment View
- **B.** Physical View
- **C.** Application Usage View
- **D.** Motivation View

## Q280
Un stakeholder demande « quelles capacités devons-nous renforcer ? ». Quelle vue ?
- **A.** Technology View
- **B.** Capability View
- **C.** Business Object View
- **D.** Deployment View

## Q281
Un stakeholder demande « comment les étapes de valeur conduisent-elles au résultat client ? ». Quelle vue ?
- **A.** Deployment View
- **B.** Technology View
- **C.** Value Stream View
- **D.** Migration View

## Q282
Un stakeholder demande « qui est responsable de quoi ? ». Quelle vue ?
- **A.** Data View
- **B.** Organization View
- **C.** Physical View
- **D.** Technology View

## Q283
Un stakeholder demande « quelles données passent entre applications ? ». Quelle vue ?
- **A.** Product View uniquement
- **B.** Physical View
- **C.** Capability View
- **D.** Application Cooperation / Information Structure selon le concern

## Q284
Une vue Security est-elle un viewpoint officiel obligatoire unique ?
- **A.** Non, car ArchiMate interdit la sécurité.
- **B.** Non; on peut construire une vue adaptée au concern sécurité avec les concepts pertinents.
- **C.** Oui, il existe un unique Security Layer.
- **D.** Oui, mais seulement en Foundation.

## Q285
Une vue Green IT est-elle un élément officiel ?
- **A.** Oui, Green IT est un élément Strategy.
- **B.** Oui, c’est un Technology Service.
- **C.** Non; c’est une vue construite à partir de concepts pertinents pour un concern Green IT.
- **D.** Non, et elle est interdite.

## Q286
Un diagramme contient 80 éléments sans question explicite. Quel premier défaut ?
- **A.** Il faut supprimer tous les services.
- **B.** Le concern n’est pas clairement cadré.
- **C.** Il faut ajouter des couleurs.
- **D.** Il manque forcément un Device.

## Q287
Quel est le meilleur critère de qualité d’une vue ?
- **A.** Elle tient sur une seule ligne.
- **B.** Elle contient le maximum d’éléments.
- **C.** Elle permet au stakeholder de répondre à sa question avec une sémantique correcte et une complexité maîtrisée.
- **D.** Elle utilise toutes les couleurs ArchiMate.

## Q288
Faut-il utiliser tous les types d’éléments disponibles dans chaque vue ?
- **A.** Oui uniquement Foundation.
- **B.** Non.
- **C.** Oui, sinon la vue est incomplète.
- **D.** Oui uniquement Technology.

## Q289
Peut-on utiliser des éléments de plusieurs couches dans une même vue ?
- **A.** Seulement Business + Application.
- **B.** Seulement avec Association.
- **C.** Oui, si le concern nécessite une analyse cross-layer.
- **D.** Non, jamais.

## Q290
Pourquoi une vue Executive et une vue Technology du même système peuvent-elles être différentes ?
- **A.** Parce que les noms doivent être différents.
- **B.** Parce qu’elles doivent dupliquer les éléments.
- **C.** Parce qu’elles répondent à des stakeholders et concerns différents tout en réutilisant le même modèle.
- **D.** Parce que les relations changent de sens.

## Q291
Quel Definition of Done est le plus pertinent pour une vue ?
- **A.** Stakeholder identifié, concern explicite, éléments nécessaires, relations justes, lisibilité vérifiée.
- **B.** au moins 50 éléments
- **C.** aucune relation
- **D.** toutes les couches

## Q292
Dans Archi, une View est-elle le modèle entier ?
- **A.** Non; c’est une représentation d’une sélection d’éléments du modèle.
- **B.** Non, car View n’existe pas.
- **C.** Oui, chaque View est un fichier indépendant.
- **D.** Oui, elle remplace le référentiel.

## Q293
Un même Payment Orchestrator apparaît dans APP-01 et TEC-01. Bonne pratique ?
- **A.** Le convertir en Node dans TEC-01.
- **B.** Créer deux Application Components différents.
- **C.** Réutiliser le même élément logique dans les deux vues.
- **D.** Le supprimer de TEC-01.

## Q294
Une vue de migration montre uniquement Work Packages mais aucun Plateau. Quel risque ?
- **A.** On voit les travaux mais pas les états d’architecture obtenus.
- **B.** Il faut seulement ajouter un Actor.
- **C.** Les Plateaus sont interdits avec Work Packages.
- **D.** Aucun.

## Q295
Une vue de capacité montre uniquement des Application Components. Quel défaut probable ?
- **A.** Il manque seulement des Events.
- **B.** Elle confond moyens techniques et aptitudes organisationnelles.
- **C.** Elle doit devenir Physical.
- **D.** Aucun, Component = Capability.

## Q296
Une vue de données montre des tables, Business Objects et Data Objects. Quel premier contrôle ?
- **A.** Vérifier le niveau d’abstraction et les relations entre concept métier, donnée logique et artefact physique.
- **B.** Ajouter un Plateau.
- **C.** Transformer toutes les tables en Actors.
- **D.** Supprimer tous les Business Objects.

## Q297
Une vue d’impact part d’un Device en panne et remonte vers Business Service. Quelle force d’ArchiMate cela illustre ?
- **A.** la traçabilité cross-layer
- **B.** la suppression des relations
- **C.** la notation Physical uniquement
- **D.** la spécialisation uniquement

## Q298
Une vue cible montre uniquement le target sans baseline. Est-ce toujours faux ?
- **A.** Non, baseline est interdit.
- **B.** Oui, car target doit être un Goal.
- **C.** Oui, toujours faux.
- **D.** Non; cela peut suffire pour certains concerns, mais pas pour analyser l’écart ou la transformation.

## Q299
Une vue d’entretien doit-elle montrer tous les détails techniques pour prouver son expertise ?
- **A.** Oui, au moins 100 éléments.
- **B.** Non; elle doit montrer les éléments nécessaires et expliquer les choix.
- **C.** Oui, le plus de détails possible.
- **D.** Non, aucune technologie ne doit apparaître.

## Q300
Quelle vue est la meilleure pour expliquer le lien Capability → Business Process → Application Service → Technology Service ?
- **A.** Product View
- **B.** Organization View
- **C.** Physical-only View
- **D.** Layered View
