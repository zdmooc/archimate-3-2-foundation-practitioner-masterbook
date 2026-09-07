# Partie XIX — Practitioner Scenario Bank

Cette partie contient **100 scénarios originaux** destinés au niveau ArchiMate 3 Practitioner.

Le format reproduit l’esprit du niveau Practitioner : situation d’architecture, quatre réponses plausibles et **notation graduée 5/3/1/0**. Les scénarios ne reproduisent aucune question officielle.

## Structure pédagogique

- Méthode de raisonnement Practitioner
- 100 scénarios S001–S100
- Corrections complètes avec classement 5/3/1/0
- Couverture et contrôle qualité

## Domaines couverts

Motivation, Strategy, Business, Application, Technology, Physical, Implementation & Migration, relationships, viewpoints, Instant Payment, API Banking, Kafka/Event Streaming, OpenShift/Kubernetes, IAM/Zero Trust, Fraud & Risk, Data Platform, Observability/SRE, multi-site/DR, GenAI Platform et Green IT.

---

# Méthode de raisonnement Practitioner

Le niveau Practitioner n’évalue pas seulement la reconnaissance d’un nom d’élément. Il évalue la capacité à choisir **la meilleure modélisation parmi plusieurs solutions plausibles**.

## Algorithme en 8 étapes

1. **Identifier le stakeholder.** Qui doit prendre une décision ?
2. **Reformuler le concern.** Quelle question exacte la vue doit-elle résoudre ?
3. **Séparer les niveaux.** Motivation, Strategy, Business, Application, Technology, Physical, Implementation & Migration.
4. **Choisir le type d’élément par sa sémantique**, jamais par le nom du produit.
5. **Choisir la relation par la question** : exécute ? réalise ? sert ? accède ? déclenche ? transfère ? influence ?
6. **Vérifier la direction et la légalité source/cible.**
7. **Vérifier la traçabilité cross-layer.** Le modèle peut-il être expliqué dans les deux sens ?
8. **Choisir la réponse la plus complète sans sur-modéliser.**

## Les quatre niveaux de réponse

### 5 points — meilleure
La réponse satisfait le concern, respecte la sémantique ArchiMate, conserve les niveaux d’abstraction et fournit une modélisation exploitable.

### 3 points — seconde
La réponse contient souvent un concept valable mais incomplet, trop général ou appliqué au mauvais niveau.

### 1 point — troisième
La réponse possède un fragment de vérité mais introduit une confusion importante, une perte de sémantique ou une vue mal ciblée.

### 0 point — distracteur
La réponse contredit directement le langage, ignore le concern ou transforme ArchiMate en simple dessin.

## Réflexes

- **Capability ≠ Process ≠ Application.**
- **Service ≠ Interface ≠ Component.**
- **Data Object ≠ Business Object ≠ Artifact.**
- **System Software ≠ Application Component.**
- **Node ≠ Device ≠ Facility ≠ Equipment.**
- **Goal ≠ Requirement ≠ Gap.**
- **Course of Action ≠ Work Package.**
- **Realization ≠ Serving.**
- **Triggering ≠ Flow.**
- **Access ≠ Flow.**
- **Viewpoint ≠ View.**
- **HA ≠ DR.**
- **Un produit technique n’est pas automatiquement une Capability.**
- **Une mesure CO2e n’est pas un Material.**

## Gestion de l’open book

L’open book sert à confirmer une définition ou une contrainte du métamodèle. Il ne remplace pas le raisonnement. Avant de chercher dans la référence, décider **ce qu’on veut vérifier** : définition, relation autorisée, direction, viewpoint, ou concept avancé.

---

# Scénarios S001–S100

## S001 — Motivation & gouvernance / choix d’élément
**Contexte.** Le CIO demande de corriger un modèle Motivation & gouvernance afin d’aligner pression réglementaire, objectifs et exigences. Le modèle actuel part de « objectifs vagues et exigences non tracées ». L’équipe hésite entre plusieurs concepts pour représenter le point central.

**Question.** Quelle option constitue le meilleur choix de modélisation pour le concept central dans ce contexte ?

- **A.** Utiliser **Assessment**, puis le relier aux éléments adjacents avec une sémantique explicite.
- **B.** Utiliser **Gap** partout afin de réduire le nombre de types d’éléments.
- **C.** Remplacer le concept par une note libre et ne modéliser que les composants techniques.
- **D.** Créer un élément personnalisé portant le nom du produit et l’utiliser comme concept universel.

## S002 — Motivation & gouvernance / choix de relation
**Contexte.** Dans une vue Motivation & gouvernance, l’équipe doit relier **Architecture Board** à **programme de transformation** autour de « architecture de conformité ». Le diagramme actuel utilise Serving sans justification.

**Question.** Quelle correction est la plus solide ?

- **A.** Employer **Influence** si la question sémantique correspond bien à la relation attendue.
- **B.** Conserver **Serving** parce qu’une relation déjà dessinée ne doit jamais être changée.
- **C.** Remplacer toutes les relations par Association pour éviter les erreurs.
- **D.** Supprimer la direction des relations et laisser le lecteur l’interpréter.

## S003 — Motivation & gouvernance / choix de vue
**Contexte.** Le CIO veut une représentation qui lui permette d’aligner pression réglementaire, objectifs et exigences. Le référentiel contient déjà les éléments nécessaires, mais la vue existante mélange tous les layers et dépasse cent éléments.

**Question.** Quelle stratégie de vue est la plus appropriée ?

- **A.** Construire une **Motivation View** centrée sur le concern, en réutilisant les éléments canoniques et seulement les relations nécessaires.
- **B.** Utiliser une **Layered View** même si elle ne répond pas au concern, afin d’uniformiser toutes les présentations.
- **C.** Créer une copie indépendante de chaque élément pour que la vue soit autonome.
- **D.** Afficher l’intégralité du modèle d’entreprise dans une seule vue.

## S004 — Motivation & gouvernance / traçabilité cross-layer
**Contexte.** Une décision Motivation & gouvernance doit être défendue devant le CIO. La cible est « drivers, assessments, goals et requirements explicitement reliés », mais le modèle ne permet pas de remonter du référentiel d’architecture jusqu’au besoin métier ou stratégique.

**Question.** Quelle amélioration apporte le plus de valeur pour la traçabilité ?

- **A.** Construire une chaîne cross-layer explicite reliant le concern, le service/capability pertinent, **architecture de conformité**, les composants/services technologiques et les éléments physiques ou de migration nécessaires.
- **B.** Ajouter uniquement davantage de propriétés techniques sur les nœuds.
- **C.** Fusionner toutes les couches en renommant chaque élément « solution ».
- **D.** Créer des relations Association entre chaque paire d’éléments pour garantir qu’il existe toujours un chemin.

## S005 — Motivation & gouvernance / transformation et gouvernance
**Contexte.** Le programme Motivation & gouvernance part de « objectifs vagues et exigences non tracées » et vise « drivers, assessments, goals et requirements explicitement reliés ». Le CIO veut une roadmap qui ne cache ni coexistence temporaire ni sortie du legacy.

**Question.** Quelle modélisation de transformation est la plus complète ?

- **A.** Identifier les Gaps, définir les Work Packages pour formaliser la chaîne Driver→Assessment→Goal→Requirement, leurs Deliverables, les Implementation Events et les Plateaus de transition/cible.
- **B.** Dessiner uniquement la cible finale, car la migration relève exclusivement du project management.
- **C.** Créer un Goal nommé « Migration » et l’utiliser comme unique élément de roadmap.
- **D.** Modéliser les versions logicielles comme des Plateaus sans vérifier si elles représentent réellement un état d’architecture stable.

## S006 — Strategy / capabilities / choix d’élément
**Contexte.** Le Directeur Transformation demande de corriger un modèle Strategy / capabilities afin de prioriser les capacités à renforcer. Le modèle actuel part de « capacités non cartographiées et investissements guidés par les applications ». L’équipe hésite entre plusieurs concepts pour représenter le point central.

**Question.** Quelle option constitue le meilleur choix de modélisation pour le concept central dans ce contexte ?

- **A.** Utiliser **Capability**, puis le relier aux éléments adjacents avec une sémantique explicite.
- **B.** Utiliser **Business Process** partout afin de réduire le nombre de types d’éléments.
- **C.** Remplacer le concept par une note libre et ne modéliser que les composants techniques.
- **D.** Créer un élément personnalisé portant le nom du produit et l’utiliser comme concept universel.

## S007 — Strategy / capabilities / choix de relation
**Contexte.** Dans une vue Strategy / capabilities, l’équipe doit relier **domaine Paiements** à **stratégie MayaBank** autour de « capacité de paiement temps réel ». Le diagramme actuel utilise Triggering sans justification.

**Question.** Quelle correction est la plus solide ?

- **A.** Employer **Realization** si la question sémantique correspond bien à la relation attendue.
- **B.** Conserver **Triggering** parce qu’une relation déjà dessinée ne doit jamais être changée.
- **C.** Remplacer toutes les relations par Association pour éviter les erreurs.
- **D.** Supprimer la direction des relations et laisser le lecteur l’interpréter.

## S008 — Strategy / capabilities / choix de vue
**Contexte.** Le Directeur Transformation veut une représentation qui lui permette de prioriser les capacités à renforcer. Le référentiel contient déjà les éléments nécessaires, mais la vue existante mélange tous les layers et dépasse cent éléments.

**Question.** Quelle stratégie de vue est la plus appropriée ?

- **A.** Construire une **Capability View** centrée sur le concern, en réutilisant les éléments canoniques et seulement les relations nécessaires.
- **B.** Utiliser une **Business Process Cooperation View** même si elle ne répond pas au concern, afin d’uniformiser toutes les présentations.
- **C.** Créer une copie indépendante de chaque élément pour que la vue soit autonome.
- **D.** Afficher l’intégralité du modèle d’entreprise dans une seule vue.

## S009 — Strategy / capabilities / traçabilité cross-layer
**Contexte.** Une décision Strategy / capabilities doit être défendue devant le Directeur Transformation. La cible est « capability map reliée aux goals et aux courses of action », mais le modèle ne permet pas de remonter du portfolio de transformation jusqu’au besoin métier ou stratégique.

**Question.** Quelle amélioration apporte le plus de valeur pour la traçabilité ?

- **A.** Construire une chaîne cross-layer explicite reliant le concern, le service/capability pertinent, **capacité de paiement temps réel**, les composants/services technologiques et les éléments physiques ou de migration nécessaires.
- **B.** Ajouter uniquement davantage de propriétés techniques sur les nœuds.
- **C.** Fusionner toutes les couches en renommant chaque élément « solution ».
- **D.** Créer des relations Association entre chaque paire d’éléments pour garantir qu’il existe toujours un chemin.

## S010 — Strategy / capabilities / transformation et gouvernance
**Contexte.** Le programme Strategy / capabilities part de « capacités non cartographiées et investissements guidés par les applications » et vise « capability map reliée aux goals et aux courses of action ». Le Directeur Transformation veut une roadmap qui ne cache ni coexistence temporaire ni sortie du legacy.

**Question.** Quelle modélisation de transformation est la plus complète ?

- **A.** Identifier les Gaps, définir les Work Packages pour cartographier les capabilities et décider des courses of action, leurs Deliverables, les Implementation Events et les Plateaus de transition/cible.
- **B.** Dessiner uniquement la cible finale, car la migration relève exclusivement du project management.
- **C.** Créer un Goal nommé « Migration » et l’utiliser comme unique élément de roadmap.
- **D.** Modéliser les versions logicielles comme des Plateaus sans vérifier si elles représentent réellement un état d’architecture stable.

## S011 — Business services & processes / choix d’élément
**Contexte.** Le Responsable Paiements demande de corriger un modèle Business services & processes afin de séparer orchestration métier et service exposé au client. Le modèle actuel part de « processus et services métier confondus ». L’équipe hésite entre plusieurs concepts pour représenter le point central.

**Question.** Quelle option constitue le meilleur choix de modélisation pour le concept central dans ce contexte ?

- **A.** Utiliser **Business Service**, puis le relier aux éléments adjacents avec une sémantique explicite.
- **B.** Utiliser **Business Function** partout afin de réduire le nombre de types d’éléments.
- **C.** Remplacer le concept par une note libre et ne modéliser que les composants techniques.
- **D.** Créer un élément personnalisé portant le nom du produit et l’utiliser comme concept universel.

## S012 — Business services & processes / choix de relation
**Contexte.** Dans une vue Business services & processes, l’équipe doit relier **Business Process Execute Instant Payment** à **Customer** autour de « Instant Payment Service ». Le diagramme actuel utilise Access sans justification.

**Question.** Quelle correction est la plus solide ?

- **A.** Employer **Realization** si la question sémantique correspond bien à la relation attendue.
- **B.** Conserver **Access** parce qu’une relation déjà dessinée ne doit jamais être changée.
- **C.** Remplacer toutes les relations par Association pour éviter les erreurs.
- **D.** Supprimer la direction des relations et laisser le lecteur l’interpréter.

## S013 — Business services & processes / choix de vue
**Contexte.** Le Responsable Paiements veut une représentation qui lui permette de séparer orchestration métier et service exposé au client. Le référentiel contient déjà les éléments nécessaires, mais la vue existante mélange tous les layers et dépasse cent éléments.

**Question.** Quelle stratégie de vue est la plus appropriée ?

- **A.** Construire une **Business Process Cooperation View** centrée sur le concern, en réutilisant les éléments canoniques et seulement les relations nécessaires.
- **B.** Utiliser une **Technology View** même si elle ne répond pas au concern, afin d’uniformiser toutes les présentations.
- **C.** Créer une copie indépendante de chaque élément pour que la vue soit autonome.
- **D.** Afficher l’intégralité du modèle d’entreprise dans une seule vue.

## S014 — Business services & processes / traçabilité cross-layer
**Contexte.** Une décision Business services & processes doit être défendue devant le Responsable Paiements. La cible est « processus interne réalisant un service métier externe », mais le modèle ne permet pas de remonter du domaine métier Paiements jusqu’au besoin métier ou stratégique.

**Question.** Quelle amélioration apporte le plus de valeur pour la traçabilité ?

- **A.** Construire une chaîne cross-layer explicite reliant le concern, le service/capability pertinent, **Instant Payment Service**, les composants/services technologiques et les éléments physiques ou de migration nécessaires.
- **B.** Ajouter uniquement davantage de propriétés techniques sur les nœuds.
- **C.** Fusionner toutes les couches en renommant chaque élément « solution ».
- **D.** Créer des relations Association entre chaque paire d’éléments pour garantir qu’il existe toujours un chemin.

## S015 — Business services & processes / transformation et gouvernance
**Contexte.** Le programme Business services & processes part de « processus et services métier confondus » et vise « processus interne réalisant un service métier externe ». Le Responsable Paiements veut une roadmap qui ne cache ni coexistence temporaire ni sortie du legacy.

**Question.** Quelle modélisation de transformation est la plus complète ?

- **A.** Identifier les Gaps, définir les Work Packages pour restructurer le modèle métier autour des rôles, processus et services, leurs Deliverables, les Implementation Events et les Plateaus de transition/cible.
- **B.** Dessiner uniquement la cible finale, car la migration relève exclusivement du project management.
- **C.** Créer un Goal nommé « Migration » et l’utiliser comme unique élément de roadmap.
- **D.** Modéliser les versions logicielles comme des Plateaus sans vérifier si elles représentent réellement un état d’architecture stable.

## S016 — Application / API / choix d’élément
**Contexte.** L’Architecte Solution demande de corriger un modèle Application / API afin de modéliser correctement composant, service et API. Le modèle actuel part de « API, service et composant sont tous appelés API ». L’équipe hésite entre plusieurs concepts pour représenter le point central.

**Question.** Quelle option constitue le meilleur choix de modélisation pour le concept central dans ce contexte ?

- **A.** Utiliser **Application Interface**, puis le relier aux éléments adjacents avec une sémantique explicite.
- **B.** Utiliser **Application Service** partout afin de réduire le nombre de types d’éléments.
- **C.** Remplacer le concept par une note libre et ne modéliser que les composants techniques.
- **D.** Créer un élément personnalisé portant le nom du produit et l’utiliser comme concept universel.

## S017 — Application / API / choix de relation
**Contexte.** Dans une vue Application / API, l’équipe doit relier **Payment Orchestrator** à **Mobile Banking** autour de « Payment Initiation Service ». Le diagramme actuel utilise Realization sans justification.

**Question.** Quelle correction est la plus solide ?

- **A.** Employer **Serving** si la question sémantique correspond bien à la relation attendue.
- **B.** Conserver **Realization** parce qu’une relation déjà dessinée ne doit jamais être changée.
- **C.** Remplacer toutes les relations par Association pour éviter les erreurs.
- **D.** Supprimer la direction des relations et laisser le lecteur l’interpréter.

## S018 — Application / API / choix de vue
**Contexte.** L’Architecte Solution veut une représentation qui lui permette de modéliser correctement composant, service et API. Le référentiel contient déjà les éléments nécessaires, mais la vue existante mélange tous les layers et dépasse cent éléments.

**Question.** Quelle stratégie de vue est la plus appropriée ?

- **A.** Construire une **Application Cooperation View** centrée sur le concern, en réutilisant les éléments canoniques et seulement les relations nécessaires.
- **B.** Utiliser une **Organization View** même si elle ne répond pas au concern, afin d’uniformiser toutes les présentations.
- **C.** Créer une copie indépendante de chaque élément pour que la vue soit autonome.
- **D.** Afficher l’intégralité du modèle d’entreprise dans une seule vue.

## S019 — Application / API / traçabilité cross-layer
**Contexte.** Une décision Application / API doit être défendue devant l’Architecte Solution. La cible est « component→service→interface et consommateurs explicités », mais le modèle ne permet pas de remonter de l’API Management jusqu’au besoin métier ou stratégique.

**Question.** Quelle amélioration apporte le plus de valeur pour la traçabilité ?

- **A.** Construire une chaîne cross-layer explicite reliant le concern, le service/capability pertinent, **Payment Initiation Service**, les composants/services technologiques et les éléments physiques ou de migration nécessaires.
- **B.** Ajouter uniquement davantage de propriétés techniques sur les nœuds.
- **C.** Fusionner toutes les couches en renommant chaque élément « solution ».
- **D.** Créer des relations Association entre chaque paire d’éléments pour garantir qu’il existe toujours un chemin.

## S020 — Application / API / transformation et gouvernance
**Contexte.** Le programme Application / API part de « API, service et composant sont tous appelés API » et vise « component→service→interface et consommateurs explicités ». L’Architecte Solution veut une roadmap qui ne cache ni coexistence temporaire ni sortie du legacy.

**Question.** Quelle modélisation de transformation est la plus complète ?

- **A.** Identifier les Gaps, définir les Work Packages pour normaliser le modèle d’exposition API, leurs Deliverables, les Implementation Events et les Plateaus de transition/cible.
- **B.** Dessiner uniquement la cible finale, car la migration relève exclusivement du project management.
- **C.** Créer un Goal nommé « Migration » et l’utiliser comme unique élément de roadmap.
- **D.** Modéliser les versions logicielles comme des Plateaus sans vérifier si elles représentent réellement un état d’architecture stable.

## S021 — Technology platform / choix d’élément
**Contexte.** L’Architecte Plateforme demande de corriger un modèle Technology platform afin de distinguer runtime, service technologique et nœud. Le modèle actuel part de « OpenShift modélisé tantôt comme application, tantôt comme capability ». L’équipe hésite entre plusieurs concepts pour représenter le point central.

**Question.** Quelle option constitue le meilleur choix de modélisation pour le concept central dans ce contexte ?

- **A.** Utiliser **System Software**, puis le relier aux éléments adjacents avec une sémantique explicite.
- **B.** Utiliser **Application Component** partout afin de réduire le nombre de types d’éléments.
- **C.** Remplacer le concept par une note libre et ne modéliser que les composants techniques.
- **D.** Créer un élément personnalisé portant le nom du produit et l’utiliser comme concept universel.

## S022 — Technology platform / choix de relation
**Contexte.** Dans une vue Technology platform, l’équipe doit relier **OpenShift Runtime** à **Payment Orchestrator** autour de « Container Execution Service ». Le diagramme actuel utilise Assignment sans justification.

**Question.** Quelle correction est la plus solide ?

- **A.** Employer **Serving** si la question sémantique correspond bien à la relation attendue.
- **B.** Conserver **Assignment** parce qu’une relation déjà dessinée ne doit jamais être changée.
- **C.** Remplacer toutes les relations par Association pour éviter les erreurs.
- **D.** Supprimer la direction des relations et laisser le lecteur l’interpréter.

## S023 — Technology platform / choix de vue
**Contexte.** L’Architecte Plateforme veut une représentation qui lui permette de distinguer runtime, service technologique et nœud. Le référentiel contient déjà les éléments nécessaires, mais la vue existante mélange tous les layers et dépasse cent éléments.

**Question.** Quelle stratégie de vue est la plus appropriée ?

- **A.** Construire une **Technology View** centrée sur le concern, en réutilisant les éléments canoniques et seulement les relations nécessaires.
- **B.** Utiliser une **Product View** même si elle ne répond pas au concern, afin d’uniformiser toutes les présentations.
- **C.** Créer une copie indépendante de chaque élément pour que la vue soit autonome.
- **D.** Afficher l’intégralité du modèle d’entreprise dans une seule vue.

## S024 — Technology platform / traçabilité cross-layer
**Contexte.** Une décision Technology platform doit être défendue devant l’Architecte Plateforme. La cible est « System Software, Technology Service et Nodes clairement séparés », mais le modèle ne permet pas de remonter d’OpenShift jusqu’au besoin métier ou stratégique.

**Question.** Quelle amélioration apporte le plus de valeur pour la traçabilité ?

- **A.** Construire une chaîne cross-layer explicite reliant le concern, le service/capability pertinent, **Container Execution Service**, les composants/services technologiques et les éléments physiques ou de migration nécessaires.
- **B.** Ajouter uniquement davantage de propriétés techniques sur les nœuds.
- **C.** Fusionner toutes les couches en renommant chaque élément « solution ».
- **D.** Créer des relations Association entre chaque paire d’éléments pour garantir qu’il existe toujours un chemin.

## S025 — Technology platform / transformation et gouvernance
**Contexte.** Le programme Technology platform part de « OpenShift modélisé tantôt comme application, tantôt comme capability » et vise « System Software, Technology Service et Nodes clairement séparés ». L’Architecte Plateforme veut une roadmap qui ne cache ni coexistence temporaire ni sortie du legacy.

**Question.** Quelle modélisation de transformation est la plus complète ?

- **A.** Identifier les Gaps, définir les Work Packages pour normaliser la plateforme d’exécution, leurs Deliverables, les Implementation Events et les Plateaus de transition/cible.
- **B.** Dessiner uniquement la cible finale, car la migration relève exclusivement du project management.
- **C.** Créer un Goal nommé « Migration » et l’utiliser comme unique élément de roadmap.
- **D.** Modéliser les versions logicielles comme des Plateaus sans vérifier si elles représentent réellement un état d’architecture stable.

## S026 — Physical / datacenter / choix d’élément
**Contexte.** Le Responsable Infrastructure demande de corriger un modèle Physical / datacenter afin de relier infrastructure IT et contraintes physiques. Le modèle actuel part de « datacenter, serveurs, UPS et énergie mélangés dans Technology ». L’équipe hésite entre plusieurs concepts pour représenter le point central.

**Question.** Quelle option constitue le meilleur choix de modélisation pour le concept central dans ce contexte ?

- **A.** Utiliser **Facility**, puis le relier aux éléments adjacents avec une sémantique explicite.
- **B.** Utiliser **Node** partout afin de réduire le nombre de types d’éléments.
- **C.** Remplacer le concept par une note libre et ne modéliser que les composants techniques.
- **D.** Créer un élément personnalisé portant le nom du produit et l’utiliser comme concept universel.

## S027 — Physical / datacenter / choix de relation
**Contexte.** Dans une vue Physical / datacenter, l’équipe doit relier **MayaBank DC East** à **worker servers** autour de « hébergement physique du service de paiement ». Le diagramme actuel utilise Influence sans justification.

**Question.** Quelle correction est la plus solide ?

- **A.** Employer **Composition** si la question sémantique correspond bien à la relation attendue.
- **B.** Conserver **Influence** parce qu’une relation déjà dessinée ne doit jamais être changée.
- **C.** Remplacer toutes les relations par Association pour éviter les erreurs.
- **D.** Supprimer la direction des relations et laisser le lecteur l’interpréter.

## S028 — Physical / datacenter / choix de vue
**Contexte.** Le Responsable Infrastructure veut une représentation qui lui permette de relier infrastructure IT et contraintes physiques. Le référentiel contient déjà les éléments nécessaires, mais la vue existante mélange tous les layers et dépasse cent éléments.

**Question.** Quelle stratégie de vue est la plus appropriée ?

- **A.** Construire une **Layered View** centrée sur le concern, en réutilisant les éléments canoniques et seulement les relations nécessaires.
- **B.** Utiliser une **Application Usage View** même si elle ne répond pas au concern, afin d’uniformiser toutes les présentations.
- **C.** Créer une copie indépendante de chaque élément pour que la vue soit autonome.
- **D.** Afficher l’intégralité du modèle d’entreprise dans une seule vue.

## S029 — Physical / datacenter / traçabilité cross-layer
**Contexte.** Une décision Physical / datacenter doit être défendue devant le Responsable Infrastructure. La cible est « Device, Facility, Equipment, Distribution Network et Material distingués », mais le modèle ne permet pas de remonter du datacenter bi-site jusqu’au besoin métier ou stratégique.

**Question.** Quelle amélioration apporte le plus de valeur pour la traçabilité ?

- **A.** Construire une chaîne cross-layer explicite reliant le concern, le service/capability pertinent, **hébergement physique du service de paiement**, les composants/services technologiques et les éléments physiques ou de migration nécessaires.
- **B.** Ajouter uniquement davantage de propriétés techniques sur les nœuds.
- **C.** Fusionner toutes les couches en renommant chaque élément « solution ».
- **D.** Créer des relations Association entre chaque paire d’éléments pour garantir qu’il existe toujours un chemin.

## S030 — Physical / datacenter / transformation et gouvernance
**Contexte.** Le programme Physical / datacenter part de « datacenter, serveurs, UPS et énergie mélangés dans Technology » et vise « Device, Facility, Equipment, Distribution Network et Material distingués ». Le Responsable Infrastructure veut une roadmap qui ne cache ni coexistence temporaire ni sortie du legacy.

**Question.** Quelle modélisation de transformation est la plus complète ?

- **A.** Identifier les Gaps, définir les Work Packages pour construire la vue Physical et ses dépendances, leurs Deliverables, les Implementation Events et les Plateaus de transition/cible.
- **B.** Dessiner uniquement la cible finale, car la migration relève exclusivement du project management.
- **C.** Créer un Goal nommé « Migration » et l’utiliser comme unique élément de roadmap.
- **D.** Modéliser les versions logicielles comme des Plateaus sans vérifier si elles représentent réellement un état d’architecture stable.

## S031 — Implementation & Migration / choix d’élément
**Contexte.** Le Program Manager demande de corriger un modèle Implementation & Migration afin de rendre explicite la trajectoire baseline→target. Le modèle actuel part de « legacy monolithique ». L’équipe hésite entre plusieurs concepts pour représenter le point central.

**Question.** Quelle option constitue le meilleur choix de modélisation pour le concept central dans ce contexte ?

- **A.** Utiliser **Plateau**, puis le relier aux éléments adjacents avec une sémantique explicite.
- **B.** Utiliser **Goal** partout afin de réduire le nombre de types d’éléments.
- **C.** Remplacer le concept par une note libre et ne modéliser que les composants techniques.
- **D.** Créer un élément personnalisé portant le nom du produit et l’utiliser comme concept universel.

## S032 — Implementation & Migration / choix de relation
**Contexte.** Dans une vue Implementation & Migration, l’équipe doit relier **Work Package Payment Core Migration** à **roadmap de transformation** autour de « état Hybrid Payments ». Le diagramme actuel utilise Serving sans justification.

**Question.** Quelle correction est la plus solide ?

- **A.** Employer **Realization** si la question sémantique correspond bien à la relation attendue.
- **B.** Conserver **Serving** parce qu’une relation déjà dessinée ne doit jamais être changée.
- **C.** Remplacer toutes les relations par Association pour éviter les erreurs.
- **D.** Supprimer la direction des relations et laisser le lecteur l’interpréter.

## S033 — Implementation & Migration / choix de vue
**Contexte.** Le Program Manager veut une représentation qui lui permette de rendre explicite la trajectoire baseline→target. Le référentiel contient déjà les éléments nécessaires, mais la vue existante mélange tous les layers et dépasse cent éléments.

**Question.** Quelle stratégie de vue est la plus appropriée ?

- **A.** Construire une **Implementation & Migration View** centrée sur le concern, en réutilisant les éléments canoniques et seulement les relations nécessaires.
- **B.** Utiliser une **Application Cooperation View** même si elle ne répond pas au concern, afin d’uniformiser toutes les présentations.
- **C.** Créer une copie indépendante de chaque élément pour que la vue soit autonome.
- **D.** Afficher l’intégralité du modèle d’entreprise dans une seule vue.

## S034 — Implementation & Migration / traçabilité cross-layer
**Contexte.** Une décision Implementation & Migration doit être défendue devant le Program Manager. La cible est « plateforme cible stable après extinction du legacy », mais le modèle ne permet pas de remonter du programme de migration jusqu’au besoin métier ou stratégique.

**Question.** Quelle amélioration apporte le plus de valeur pour la traçabilité ?

- **A.** Construire une chaîne cross-layer explicite reliant le concern, le service/capability pertinent, **état Hybrid Payments**, les composants/services technologiques et les éléments physiques ou de migration nécessaires.
- **B.** Ajouter uniquement davantage de propriétés techniques sur les nœuds.
- **C.** Fusionner toutes les couches en renommant chaque élément « solution ».
- **D.** Créer des relations Association entre chaque paire d’éléments pour garantir qu’il existe toujours un chemin.

## S035 — Implementation & Migration / transformation et gouvernance
**Contexte.** Le programme Implementation & Migration part de « legacy monolithique » et vise « plateforme cible stable après extinction du legacy ». Le Program Manager veut une roadmap qui ne cache ni coexistence temporaire ni sortie du legacy.

**Question.** Quelle modélisation de transformation est la plus complète ?

- **A.** Identifier les Gaps, définir les Work Packages pour modéliser Gaps, Work Packages, Deliverables, Events et Plateaus, leurs Deliverables, les Implementation Events et les Plateaus de transition/cible.
- **B.** Dessiner uniquement la cible finale, car la migration relève exclusivement du project management.
- **C.** Créer un Goal nommé « Migration » et l’utiliser comme unique élément de roadmap.
- **D.** Modéliser les versions logicielles comme des Plateaus sans vérifier si elles représentent réellement un état d’architecture stable.

## S036 — Relationships / choix d’élément
**Contexte.** Le Modeling Lead demande de corriger un modèle Relationships afin de corriger les relations plausibles visuellement mais fausses sémantiquement. Le modèle actuel part de « relations génériques et directions incohérentes ». L’équipe hésite entre plusieurs concepts pour représenter le point central.

**Question.** Quelle option constitue le meilleur choix de modélisation pour le concept central dans ce contexte ?

- **A.** Utiliser **Serving**, puis le relier aux éléments adjacents avec une sémantique explicite.
- **B.** Utiliser **Realization** partout afin de réduire le nombre de types d’éléments.
- **C.** Remplacer le concept par une note libre et ne modéliser que les composants techniques.
- **D.** Créer un élément personnalisé portant le nom du produit et l’utiliser comme concept universel.

## S037 — Relationships / choix de relation
**Contexte.** Dans une vue Relationships, l’équipe doit relier **Payment Initiation Service** à **Execute Instant Payment** autour de « service applicatif fourni au processus métier ». Le diagramme actuel utilise Realization sans justification.

**Question.** Quelle correction est la plus solide ?

- **A.** Employer **Serving** si la question sémantique correspond bien à la relation attendue.
- **B.** Conserver **Realization** parce qu’une relation déjà dessinée ne doit jamais être changée.
- **C.** Remplacer toutes les relations par Association pour éviter les erreurs.
- **D.** Supprimer la direction des relations et laisser le lecteur l’interpréter.

## S038 — Relationships / choix de vue
**Contexte.** Le Modeling Lead veut une représentation qui lui permette de corriger les relations plausibles visuellement mais fausses sémantiquement. Le référentiel contient déjà les éléments nécessaires, mais la vue existante mélange tous les layers et dépasse cent éléments.

**Question.** Quelle stratégie de vue est la plus appropriée ?

- **A.** Construire une **Layered View** centrée sur le concern, en réutilisant les éléments canoniques et seulement les relations nécessaires.
- **B.** Utiliser une **Motivation View** même si elle ne répond pas au concern, afin d’uniformiser toutes les présentations.
- **C.** Créer une copie indépendante de chaque élément pour que la vue soit autonome.
- **D.** Afficher l’intégralité du modèle d’entreprise dans une seule vue.

## S039 — Relationships / traçabilité cross-layer
**Contexte.** Une décision Relationships doit être défendue devant le Modeling Lead. La cible est « relations précises avec source/cible et direction validées », mais le modèle ne permet pas de remonter du modèle d’entreprise jusqu’au besoin métier ou stratégique.

**Question.** Quelle amélioration apporte le plus de valeur pour la traçabilité ?

- **A.** Construire une chaîne cross-layer explicite reliant le concern, le service/capability pertinent, **service applicatif fourni au processus métier**, les composants/services technologiques et les éléments physiques ou de migration nécessaires.
- **B.** Ajouter uniquement davantage de propriétés techniques sur les nœuds.
- **C.** Fusionner toutes les couches en renommant chaque élément « solution ».
- **D.** Créer des relations Association entre chaque paire d’éléments pour garantir qu’il existe toujours un chemin.

## S040 — Relationships / transformation et gouvernance
**Contexte.** Le programme Relationships part de « relations génériques et directions incohérentes » et vise « relations précises avec source/cible et direction validées ». Le Modeling Lead veut une roadmap qui ne cache ni coexistence temporaire ni sortie du legacy.

**Question.** Quelle modélisation de transformation est la plus complète ?

- **A.** Identifier les Gaps, définir les Work Packages pour auditer Assignment, Realization, Serving, Access, Triggering et Flow, leurs Deliverables, les Implementation Events et les Plateaus de transition/cible.
- **B.** Dessiner uniquement la cible finale, car la migration relève exclusivement du project management.
- **C.** Créer un Goal nommé « Migration » et l’utiliser comme unique élément de roadmap.
- **D.** Modéliser les versions logicielles comme des Plateaus sans vérifier si elles représentent réellement un état d’architecture stable.

## S041 — Views & viewpoints / choix d’élément
**Contexte.** Le CISO demande de corriger un modèle Views & viewpoints afin de voir les dépendances sécurité qui conditionnent le paiement. Le modèle actuel part de « un grand diagramme unique pour tous les stakeholders ». L’équipe hésite entre plusieurs concepts pour représenter le point central.

**Question.** Quelle option constitue le meilleur choix de modélisation pour le concept central dans ce contexte ?

- **A.** Utiliser **Viewpoint**, puis le relier aux éléments adjacents avec une sémantique explicite.
- **B.** Utiliser **View** partout afin de réduire le nombre de types d’éléments.
- **C.** Remplacer le concept par une note libre et ne modéliser que les composants techniques.
- **D.** Créer un élément personnalisé portant le nom du produit et l’utiliser comme concept universel.

## S042 — Views & viewpoints / choix de relation
**Contexte.** Dans une vue Views & viewpoints, l’équipe doit relier **Security Viewpoint** à **Security View** autour de « Security concern ». Le diagramme actuel utilise Composition sans justification.

**Question.** Quelle correction est la plus solide ?

- **A.** Employer **Association** si la question sémantique correspond bien à la relation attendue.
- **B.** Conserver **Composition** parce qu’une relation déjà dessinée ne doit jamais être changée.
- **C.** Remplacer toutes les relations par Association pour éviter les erreurs.
- **D.** Supprimer la direction des relations et laisser le lecteur l’interpréter.

## S043 — Views & viewpoints / choix de vue
**Contexte.** Le CISO veut une représentation qui lui permette de voir les dépendances sécurité qui conditionnent le paiement. Le référentiel contient déjà les éléments nécessaires, mais la vue existante mélange tous les layers et dépasse cent éléments.

**Question.** Quelle stratégie de vue est la plus appropriée ?

- **A.** Construire une **custom cross-layer Security View** centrée sur le concern, en réutilisant les éléments canoniques et seulement les relations nécessaires.
- **B.** Utiliser une **Capability View** même si elle ne répond pas au concern, afin d’uniformiser toutes les présentations.
- **C.** Créer une copie indépendante de chaque élément pour que la vue soit autonome.
- **D.** Afficher l’intégralité du modèle d’entreprise dans une seule vue.

## S044 — Views & viewpoints / traçabilité cross-layer
**Contexte.** Une décision Views & viewpoints doit être défendue devant le CISO. La cible est « vues ciblées, réutilisant les mêmes éléments logiques », mais le modèle ne permet pas de remonter du catalogue de vues jusqu’au besoin métier ou stratégique.

**Question.** Quelle amélioration apporte le plus de valeur pour la traçabilité ?

- **A.** Construire une chaîne cross-layer explicite reliant le concern, le service/capability pertinent, **Security concern**, les composants/services technologiques et les éléments physiques ou de migration nécessaires.
- **B.** Ajouter uniquement davantage de propriétés techniques sur les nœuds.
- **C.** Fusionner toutes les couches en renommant chaque élément « solution ».
- **D.** Créer des relations Association entre chaque paire d’éléments pour garantir qu’il existe toujours un chemin.

## S045 — Views & viewpoints / transformation et gouvernance
**Contexte.** Le programme Views & viewpoints part de « un grand diagramme unique pour tous les stakeholders » et vise « vues ciblées, réutilisant les mêmes éléments logiques ». Le CISO veut une roadmap qui ne cache ni coexistence temporaire ni sortie du legacy.

**Question.** Quelle modélisation de transformation est la plus complète ?

- **A.** Identifier les Gaps, définir les Work Packages pour définir stakeholder→concern→viewpoint→view, leurs Deliverables, les Implementation Events et les Plateaus de transition/cible.
- **B.** Dessiner uniquement la cible finale, car la migration relève exclusivement du project management.
- **C.** Créer un Goal nommé « Migration » et l’utiliser comme unique élément de roadmap.
- **D.** Modéliser les versions logicielles comme des Plateaus sans vérifier si elles représentent réellement un état d’architecture stable.

## S046 — Instant Payment / choix d’élément
**Contexte.** Le Product Owner Paiements demande de corriger un modèle Instant Payment afin de tracer le service instantané de bout en bout. Le modèle actuel part de « paiement synchrone monolithique et couplé ». L’équipe hésite entre plusieurs concepts pour représenter le point central.

**Question.** Quelle option constitue le meilleur choix de modélisation pour le concept central dans ce contexte ?

- **A.** Utiliser **Business Service**, puis le relier aux éléments adjacents avec une sémantique explicite.
- **B.** Utiliser **Application Service** partout afin de réduire le nombre de types d’éléments.
- **C.** Remplacer le concept par une note libre et ne modéliser que les composants techniques.
- **D.** Créer un élément personnalisé portant le nom du produit et l’utiliser comme concept universel.

## S047 — Instant Payment / choix de relation
**Contexte.** Dans une vue Instant Payment, l’équipe doit relier **Execute Instant Payment** à **Customer** autour de « Instant Payment Service ». Le diagramme actuel utilise Flow sans justification.

**Question.** Quelle correction est la plus solide ?

- **A.** Employer **Serving** si la question sémantique correspond bien à la relation attendue.
- **B.** Conserver **Flow** parce qu’une relation déjà dessinée ne doit jamais être changée.
- **C.** Remplacer toutes les relations par Association pour éviter les erreurs.
- **D.** Supprimer la direction des relations et laisser le lecteur l’interpréter.

## S048 — Instant Payment / choix de vue
**Contexte.** Le Product Owner Paiements veut une représentation qui lui permette de tracer le service instantané de bout en bout. Le référentiel contient déjà les éléments nécessaires, mais la vue existante mélange tous les layers et dépasse cent éléments.

**Question.** Quelle stratégie de vue est la plus appropriée ?

- **A.** Construire une **Layered View** centrée sur le concern, en réutilisant les éléments canoniques et seulement les relations nécessaires.
- **B.** Utiliser une **Physical View** même si elle ne répond pas au concern, afin d’uniformiser toutes les présentations.
- **C.** Créer une copie indépendante de chaque élément pour que la vue soit autonome.
- **D.** Afficher l’intégralité du modèle d’entreprise dans une seule vue.

## S049 — Instant Payment / traçabilité cross-layer
**Contexte.** Une décision Instant Payment doit être défendue devant le Product Owner Paiements. La cible est « orchestration explicite, services applicatifs, events et plateforme résiliente », mais le modèle ne permet pas de remonter du Payment Hub jusqu’au besoin métier ou stratégique.

**Question.** Quelle amélioration apporte le plus de valeur pour la traçabilité ?

- **A.** Construire une chaîne cross-layer explicite reliant le concern, le service/capability pertinent, **Instant Payment Service**, les composants/services technologiques et les éléments physiques ou de migration nécessaires.
- **B.** Ajouter uniquement davantage de propriétés techniques sur les nœuds.
- **C.** Fusionner toutes les couches en renommant chaque élément « solution ».
- **D.** Créer des relations Association entre chaque paire d’éléments pour garantir qu’il existe toujours un chemin.

## S050 — Instant Payment / transformation et gouvernance
**Contexte.** Le programme Instant Payment part de « paiement synchrone monolithique et couplé » et vise « orchestration explicite, services applicatifs, events et plateforme résiliente ». Le Product Owner Paiements veut une roadmap qui ne cache ni coexistence temporaire ni sortie du legacy.

**Question.** Quelle modélisation de transformation est la plus complète ?

- **A.** Identifier les Gaps, définir les Work Packages pour séparer métier, orchestration, événements et runtime, leurs Deliverables, les Implementation Events et les Plateaus de transition/cible.
- **B.** Dessiner uniquement la cible finale, car la migration relève exclusivement du project management.
- **C.** Créer un Goal nommé « Migration » et l’utiliser comme unique élément de roadmap.
- **D.** Modéliser les versions logicielles comme des Plateaus sans vérifier si elles représentent réellement un état d’architecture stable.

## S051 — API Banking / choix d’élément
**Contexte.** L’API Product Manager demande de corriger un modèle API Banking afin de clarifier exposition, consommation et responsabilité des API. Le modèle actuel part de « interfaces propriétaires et exposition hétérogène ». L’équipe hésite entre plusieurs concepts pour représenter le point central.

**Question.** Quelle option constitue le meilleur choix de modélisation pour le concept central dans ce contexte ?

- **A.** Utiliser **Application Interface**, puis le relier aux éléments adjacents avec une sémantique explicite.
- **B.** Utiliser **Technology Interface** partout afin de réduire le nombre de types d’éléments.
- **C.** Remplacer le concept par une note libre et ne modéliser que les composants techniques.
- **D.** Créer un élément personnalisé portant le nom du produit et l’utiliser comme concept universel.

## S052 — API Banking / choix de relation
**Contexte.** Dans une vue API Banking, l’équipe doit relier **API Facade** à **Partner Application** autour de « Account Information Service ». Le diagramme actuel utilise Access sans justification.

**Question.** Quelle correction est la plus solide ?

- **A.** Employer **Serving** si la question sémantique correspond bien à la relation attendue.
- **B.** Conserver **Access** parce qu’une relation déjà dessinée ne doit jamais être changée.
- **C.** Remplacer toutes les relations par Association pour éviter les erreurs.
- **D.** Supprimer la direction des relations et laisser le lecteur l’interpréter.

## S053 — API Banking / choix de vue
**Contexte.** L’API Product Manager veut une représentation qui lui permette de clarifier exposition, consommation et responsabilité des API. Le référentiel contient déjà les éléments nécessaires, mais la vue existante mélange tous les layers et dépasse cent éléments.

**Question.** Quelle stratégie de vue est la plus appropriée ?

- **A.** Construire une **Application Cooperation View** centrée sur le concern, en réutilisant les éléments canoniques et seulement les relations nécessaires.
- **B.** Utiliser une **Facility View** même si elle ne répond pas au concern, afin d’uniformiser toutes les présentations.
- **C.** Créer une copie indépendante de chaque élément pour que la vue soit autonome.
- **D.** Afficher l’intégralité du modèle d’entreprise dans une seule vue.

## S054 — API Banking / traçabilité cross-layer
**Contexte.** Une décision API Banking doit être défendue devant l’API Product Manager. La cible est « services applicatifs exposés via interfaces gouvernées », mais le modèle ne permet pas de remonter de l’API Gateway jusqu’au besoin métier ou stratégique.

**Question.** Quelle amélioration apporte le plus de valeur pour la traçabilité ?

- **A.** Construire une chaîne cross-layer explicite reliant le concern, le service/capability pertinent, **Account Information Service**, les composants/services technologiques et les éléments physiques ou de migration nécessaires.
- **B.** Ajouter uniquement davantage de propriétés techniques sur les nœuds.
- **C.** Fusionner toutes les couches en renommant chaque élément « solution ».
- **D.** Créer des relations Association entre chaque paire d’éléments pour garantir qu’il existe toujours un chemin.

## S055 — API Banking / transformation et gouvernance
**Contexte.** Le programme API Banking part de « interfaces propriétaires et exposition hétérogène » et vise « services applicatifs exposés via interfaces gouvernées ». L’API Product Manager veut une roadmap qui ne cache ni coexistence temporaire ni sortie du legacy.

**Question.** Quelle modélisation de transformation est la plus complète ?

- **A.** Identifier les Gaps, définir les Work Packages pour modéliser API product, services, interfaces, consumers et policies, leurs Deliverables, les Implementation Events et les Plateaus de transition/cible.
- **B.** Dessiner uniquement la cible finale, car la migration relève exclusivement du project management.
- **C.** Créer un Goal nommé « Migration » et l’utiliser comme unique élément de roadmap.
- **D.** Modéliser les versions logicielles comme des Plateaus sans vérifier si elles représentent réellement un état d’architecture stable.

## S056 — Kafka / Event Streaming / choix d’élément
**Contexte.** L’Architecte EDA demande de corriger un modèle Kafka / Event Streaming afin d’éviter de confondre événement, payload, topic et plateforme Kafka. Le modèle actuel part de « topic Kafka modélisé comme événement métier ». L’équipe hésite entre plusieurs concepts pour représenter le point central.

**Question.** Quelle option constitue le meilleur choix de modélisation pour le concept central dans ce contexte ?

- **A.** Utiliser **Application Event**, puis le relier aux éléments adjacents avec une sémantique explicite.
- **B.** Utiliser **Data Object** partout afin de réduire le nombre de types d’éléments.
- **C.** Remplacer le concept par une note libre et ne modéliser que les composants techniques.
- **D.** Créer un élément personnalisé portant le nom du produit et l’utiliser comme concept universel.

## S057 — Kafka / Event Streaming / choix de relation
**Contexte.** Dans une vue Kafka / Event Streaming, l’équipe doit relier **Payment Orchestrator** à **Fraud Analytics** autour de « Event Streaming Service ». Le diagramme actuel utilise Triggering sans justification.

**Question.** Quelle correction est la plus solide ?

- **A.** Employer **Flow** si la question sémantique correspond bien à la relation attendue.
- **B.** Conserver **Triggering** parce qu’une relation déjà dessinée ne doit jamais être changée.
- **C.** Remplacer toutes les relations par Association pour éviter les erreurs.
- **D.** Supprimer la direction des relations et laisser le lecteur l’interpréter.

## S058 — Kafka / Event Streaming / choix de vue
**Contexte.** L’Architecte EDA veut une représentation qui lui permette d’éviter de confondre événement, payload, topic et plateforme Kafka. Le référentiel contient déjà les éléments nécessaires, mais la vue existante mélange tous les layers et dépasse cent éléments.

**Question.** Quelle stratégie de vue est la plus appropriée ?

- **A.** Construire une **cross-layer Event-Driven View** centrée sur le concern, en réutilisant les éléments canoniques et seulement les relations nécessaires.
- **B.** Utiliser une **Organization View** même si elle ne répond pas au concern, afin d’uniformiser toutes les présentations.
- **C.** Créer une copie indépendante de chaque élément pour que la vue soit autonome.
- **D.** Afficher l’intégralité du modèle d’entreprise dans une seule vue.

## S059 — Kafka / Event Streaming / traçabilité cross-layer
**Contexte.** Une décision Kafka / Event Streaming doit être défendue devant l’Architecte EDA. La cible est « event, data object, artifact, system software et technology service séparés », mais le modèle ne permet pas de remonter de Kafka jusqu’au besoin métier ou stratégique.

**Question.** Quelle amélioration apporte le plus de valeur pour la traçabilité ?

- **A.** Construire une chaîne cross-layer explicite reliant le concern, le service/capability pertinent, **Event Streaming Service**, les composants/services technologiques et les éléments physiques ou de migration nécessaires.
- **B.** Ajouter uniquement davantage de propriétés techniques sur les nœuds.
- **C.** Fusionner toutes les couches en renommant chaque élément « solution ».
- **D.** Créer des relations Association entre chaque paire d’éléments pour garantir qu’il existe toujours un chemin.

## S060 — Kafka / Event Streaming / transformation et gouvernance
**Contexte.** Le programme Kafka / Event Streaming part de « topic Kafka modélisé comme événement métier » et vise « event, data object, artifact, system software et technology service séparés ». L’Architecte EDA veut une roadmap qui ne cache ni coexistence temporaire ni sortie du legacy.

**Question.** Quelle modélisation de transformation est la plus complète ?

- **A.** Identifier les Gaps, définir les Work Packages pour modéliser production, transfert et consommation d’événements, leurs Deliverables, les Implementation Events et les Plateaus de transition/cible.
- **B.** Dessiner uniquement la cible finale, car la migration relève exclusivement du project management.
- **C.** Créer un Goal nommé « Migration » et l’utiliser comme unique élément de roadmap.
- **D.** Modéliser les versions logicielles comme des Plateaus sans vérifier si elles représentent réellement un état d’architecture stable.

## S061 — OpenShift / Kubernetes / choix d’élément
**Contexte.** Le Platform Architect demande de corriger un modèle OpenShift / Kubernetes afin de relier workloads applicatifs, artefacts et plateforme d’exécution. Le modèle actuel part de « produits Kubernetes utilisés comme catégories métier ». L’équipe hésite entre plusieurs concepts pour représenter le point central.

**Question.** Quelle option constitue le meilleur choix de modélisation pour le concept central dans ce contexte ?

- **A.** Utiliser **Node**, puis le relier aux éléments adjacents avec une sémantique explicite.
- **B.** Utiliser **Capability** partout afin de réduire le nombre de types d’éléments.
- **C.** Remplacer le concept par une note libre et ne modéliser que les composants techniques.
- **D.** Créer un élément personnalisé portant le nom du produit et l’utiliser comme concept universel.

## S062 — OpenShift / Kubernetes / choix de relation
**Contexte.** Dans une vue OpenShift / Kubernetes, l’équipe doit relier **OpenShift Cluster** à **Payment workload** autour de « Container Execution Service ». Le diagramme actuel utilise Composition sans justification.

**Question.** Quelle correction est la plus solide ?

- **A.** Employer **Serving** si la question sémantique correspond bien à la relation attendue.
- **B.** Conserver **Composition** parce qu’une relation déjà dessinée ne doit jamais être changée.
- **C.** Remplacer toutes les relations par Association pour éviter les erreurs.
- **D.** Supprimer la direction des relations et laisser le lecteur l’interpréter.

## S063 — OpenShift / Kubernetes / choix de vue
**Contexte.** Le Platform Architect veut une représentation qui lui permette de relier workloads applicatifs, artefacts et plateforme d’exécution. Le référentiel contient déjà les éléments nécessaires, mais la vue existante mélange tous les layers et dépasse cent éléments.

**Question.** Quelle stratégie de vue est la plus appropriée ?

- **A.** Construire une **Deployment/Technology View** centrée sur le concern, en réutilisant les éléments canoniques et seulement les relations nécessaires.
- **B.** Utiliser une **Value Stream View** même si elle ne répond pas au concern, afin d’uniformiser toutes les présentations.
- **C.** Créer une copie indépendante de chaque élément pour que la vue soit autonome.
- **D.** Afficher l’intégralité du modèle d’entreprise dans une seule vue.

## S064 — OpenShift / Kubernetes / traçabilité cross-layer
**Contexte.** Une décision OpenShift / Kubernetes doit être défendue devant le Platform Architect. La cible est « component→artifact→node/system software→technology service », mais le modèle ne permet pas de remonter d’OpenShift jusqu’au besoin métier ou stratégique.

**Question.** Quelle amélioration apporte le plus de valeur pour la traçabilité ?

- **A.** Construire une chaîne cross-layer explicite reliant le concern, le service/capability pertinent, **Container Execution Service**, les composants/services technologiques et les éléments physiques ou de migration nécessaires.
- **B.** Ajouter uniquement davantage de propriétés techniques sur les nœuds.
- **C.** Fusionner toutes les couches en renommant chaque élément « solution ».
- **D.** Créer des relations Association entre chaque paire d’éléments pour garantir qu’il existe toujours un chemin.

## S065 — OpenShift / Kubernetes / transformation et gouvernance
**Contexte.** Le programme OpenShift / Kubernetes part de « produits Kubernetes utilisés comme catégories métier » et vise « component→artifact→node/system software→technology service ». Le Platform Architect veut une roadmap qui ne cache ni coexistence temporaire ni sortie du legacy.

**Question.** Quelle modélisation de transformation est la plus complète ?

- **A.** Identifier les Gaps, définir les Work Packages pour normaliser runtime, artifacts, clusters et dependencies, leurs Deliverables, les Implementation Events et les Plateaus de transition/cible.
- **B.** Dessiner uniquement la cible finale, car la migration relève exclusivement du project management.
- **C.** Créer un Goal nommé « Migration » et l’utiliser comme unique élément de roadmap.
- **D.** Modéliser les versions logicielles comme des Plateaus sans vérifier si elles représentent réellement un état d’architecture stable.

## S066 — IAM / Zero Trust / choix d’élément
**Contexte.** Le CISO demande de corriger un modèle IAM / Zero Trust afin de tracer identité, authentification, autorisation et secrets. Le modèle actuel part de « identités humaines et workloads gérées séparément sans vue commune ». L’équipe hésite entre plusieurs concepts pour représenter le point central.

**Question.** Quelle option constitue le meilleur choix de modélisation pour le concept central dans ce contexte ?

- **A.** Utiliser **Application Service**, puis le relier aux éléments adjacents avec une sémantique explicite.
- **B.** Utiliser **Principle** partout afin de réduire le nombre de types d’éléments.
- **C.** Remplacer le concept par une note libre et ne modéliser que les composants techniques.
- **D.** Créer un élément personnalisé portant le nom du produit et l’utiliser comme concept universel.

## S067 — IAM / Zero Trust / choix de relation
**Contexte.** Dans une vue IAM / Zero Trust, l’équipe doit relier **IAM Platform** à **Payment APIs** autour de « Identity & Token Service ». Le diagramme actuel utilise Influence sans justification.

**Question.** Quelle correction est la plus solide ?

- **A.** Employer **Serving** si la question sémantique correspond bien à la relation attendue.
- **B.** Conserver **Influence** parce qu’une relation déjà dessinée ne doit jamais être changée.
- **C.** Remplacer toutes les relations par Association pour éviter les erreurs.
- **D.** Supprimer la direction des relations et laisser le lecteur l’interpréter.

## S068 — IAM / Zero Trust / choix de vue
**Contexte.** Le CISO veut une représentation qui lui permette de tracer identité, authentification, autorisation et secrets. Le référentiel contient déjà les éléments nécessaires, mais la vue existante mélange tous les layers et dépasse cent éléments.

**Question.** Quelle stratégie de vue est la plus appropriée ?

- **A.** Construire une **cross-layer Security View** centrée sur le concern, en réutilisant les éléments canoniques et seulement les relations nécessaires.
- **B.** Utiliser une **Product View** même si elle ne répond pas au concern, afin d’uniformiser toutes les présentations.
- **C.** Créer une copie indépendante de chaque élément pour que la vue soit autonome.
- **D.** Afficher l’intégralité du modèle d’entreprise dans une seule vue.

## S069 — IAM / Zero Trust / traçabilité cross-layer
**Contexte.** Une décision IAM / Zero Trust doit être défendue devant le CISO. La cible est « identités, services IAM, interfaces, policies, secrets et consumers tracés », mais le modèle ne permet pas de remonter de l’IAM / PAM / Secrets jusqu’au besoin métier ou stratégique.

**Question.** Quelle amélioration apporte le plus de valeur pour la traçabilité ?

- **A.** Construire une chaîne cross-layer explicite reliant le concern, le service/capability pertinent, **Identity & Token Service**, les composants/services technologiques et les éléments physiques ou de migration nécessaires.
- **B.** Ajouter uniquement davantage de propriétés techniques sur les nœuds.
- **C.** Fusionner toutes les couches en renommant chaque élément « solution ».
- **D.** Créer des relations Association entre chaque paire d’éléments pour garantir qu’il existe toujours un chemin.

## S070 — IAM / Zero Trust / transformation et gouvernance
**Contexte.** Le programme IAM / Zero Trust part de « identités humaines et workloads gérées séparément sans vue commune » et vise « identités, services IAM, interfaces, policies, secrets et consumers tracés ». Le CISO veut une roadmap qui ne cache ni coexistence temporaire ni sortie du legacy.

**Question.** Quelle modélisation de transformation est la plus complète ?

- **A.** Identifier les Gaps, définir les Work Packages pour modéliser human/workload identity et points de contrôle, leurs Deliverables, les Implementation Events et les Plateaus de transition/cible.
- **B.** Dessiner uniquement la cible finale, car la migration relève exclusivement du project management.
- **C.** Créer un Goal nommé « Migration » et l’utiliser comme unique élément de roadmap.
- **D.** Modéliser les versions logicielles comme des Plateaus sans vérifier si elles représentent réellement un état d’architecture stable.

## S071 — Fraud & Risk / choix d’élément
**Contexte.** Le Chief Risk Officer demande de corriger un modèle Fraud & Risk afin de relier décision de fraude, données, règles et services. Le modèle actuel part de « règles, modèle ML et décision métier dans un bloc opaque ». L’équipe hésite entre plusieurs concepts pour représenter le point central.

**Question.** Quelle option constitue le meilleur choix de modélisation pour le concept central dans ce contexte ?

- **A.** Utiliser **Application Function**, puis le relier aux éléments adjacents avec une sémantique explicite.
- **B.** Utiliser **Capability** partout afin de réduire le nombre de types d’éléments.
- **C.** Remplacer le concept par une note libre et ne modéliser que les composants techniques.
- **D.** Créer un élément personnalisé portant le nom du produit et l’utiliser comme concept universel.

## S072 — Fraud & Risk / choix de relation
**Contexte.** Dans une vue Fraud & Risk, l’équipe doit relier **Fraud Engine** à **Payment Orchestrator** autour de « Fraud Decision Service ». Le diagramme actuel utilise Triggering sans justification.

**Question.** Quelle correction est la plus solide ?

- **A.** Employer **Serving** si la question sémantique correspond bien à la relation attendue.
- **B.** Conserver **Triggering** parce qu’une relation déjà dessinée ne doit jamais être changée.
- **C.** Remplacer toutes les relations par Association pour éviter les erreurs.
- **D.** Supprimer la direction des relations et laisser le lecteur l’interpréter.

## S073 — Fraud & Risk / choix de vue
**Contexte.** Le Chief Risk Officer veut une représentation qui lui permette de relier décision de fraude, données, règles et services. Le référentiel contient déjà les éléments nécessaires, mais la vue existante mélange tous les layers et dépasse cent éléments.

**Question.** Quelle stratégie de vue est la plus appropriée ?

- **A.** Construire une **Layered Risk Decision View** centrée sur le concern, en réutilisant les éléments canoniques et seulement les relations nécessaires.
- **B.** Utiliser une **Physical View** même si elle ne répond pas au concern, afin d’uniformiser toutes les présentations.
- **C.** Créer une copie indépendante de chaque élément pour que la vue soit autonome.
- **D.** Afficher l’intégralité du modèle d’entreprise dans une seule vue.

## S074 — Fraud & Risk / traçabilité cross-layer
**Contexte.** Une décision Fraud & Risk doit être défendue devant le Chief Risk Officer. La cible est « sources de données, fonction de décision, service et impacts métier explicités », mais le modèle ne permet pas de remonter de la Fraud Platform jusqu’au besoin métier ou stratégique.

**Question.** Quelle amélioration apporte le plus de valeur pour la traçabilité ?

- **A.** Construire une chaîne cross-layer explicite reliant le concern, le service/capability pertinent, **Fraud Decision Service**, les composants/services technologiques et les éléments physiques ou de migration nécessaires.
- **B.** Ajouter uniquement davantage de propriétés techniques sur les nœuds.
- **C.** Fusionner toutes les couches en renommant chaque élément « solution ».
- **D.** Créer des relations Association entre chaque paire d’éléments pour garantir qu’il existe toujours un chemin.

## S075 — Fraud & Risk / transformation et gouvernance
**Contexte.** Le programme Fraud & Risk part de « règles, modèle ML et décision métier dans un bloc opaque » et vise « sources de données, fonction de décision, service et impacts métier explicités ». Le Chief Risk Officer veut une roadmap qui ne cache ni coexistence temporaire ni sortie du legacy.

**Question.** Quelle modélisation de transformation est la plus complète ?

- **A.** Identifier les Gaps, définir les Work Packages pour séparer scoring, rules, decision service et business outcome, leurs Deliverables, les Implementation Events et les Plateaus de transition/cible.
- **B.** Dessiner uniquement la cible finale, car la migration relève exclusivement du project management.
- **C.** Créer un Goal nommé « Migration » et l’utiliser comme unique élément de roadmap.
- **D.** Modéliser les versions logicielles comme des Plateaus sans vérifier si elles représentent réellement un état d’architecture stable.

## S076 — Data Platform / choix d’élément
**Contexte.** Le Data Architect demande de corriger un modèle Data Platform afin de tracer information métier, données logiques et implémentation. Le modèle actuel part de « tables, objets métier et fichiers représentés de la même manière ». L’équipe hésite entre plusieurs concepts pour représenter le point central.

**Question.** Quelle option constitue le meilleur choix de modélisation pour le concept central dans ce contexte ?

- **A.** Utiliser **Data Object**, puis le relier aux éléments adjacents avec une sémantique explicite.
- **B.** Utiliser **Business Object** partout afin de réduire le nombre de types d’éléments.
- **C.** Remplacer le concept par une note libre et ne modéliser que les composants techniques.
- **D.** Créer un élément personnalisé portant le nom du produit et l’utiliser comme concept universel.

## S077 — Data Platform / choix de relation
**Contexte.** Dans une vue Data Platform, l’équipe doit relier **Data Platform** à **Fraud & Analytics** autour de « Customer 360 Data Service ». Le diagramme actuel utilise Serving sans justification.

**Question.** Quelle correction est la plus solide ?

- **A.** Employer **Access** si la question sémantique correspond bien à la relation attendue.
- **B.** Conserver **Serving** parce qu’une relation déjà dessinée ne doit jamais être changée.
- **C.** Remplacer toutes les relations par Association pour éviter les erreurs.
- **D.** Supprimer la direction des relations et laisser le lecteur l’interpréter.

## S078 — Data Platform / choix de vue
**Contexte.** Le Data Architect veut une représentation qui lui permette de tracer information métier, données logiques et implémentation. Le référentiel contient déjà les éléments nécessaires, mais la vue existante mélange tous les layers et dépasse cent éléments.

**Question.** Quelle stratégie de vue est la plus appropriée ?

- **A.** Construire une **Information Structure + Application Cooperation View** centrée sur le concern, en réutilisant les éléments canoniques et seulement les relations nécessaires.
- **B.** Utiliser une **Organization View** même si elle ne répond pas au concern, afin d’uniformiser toutes les présentations.
- **C.** Créer une copie indépendante de chaque élément pour que la vue soit autonome.
- **D.** Afficher l’intégralité du modèle d’entreprise dans une seule vue.

## S079 — Data Platform / traçabilité cross-layer
**Contexte.** Une décision Data Platform doit être défendue devant le Data Architect. La cible est « Business Object→Data Object→Artifact et usages explicites », mais le modèle ne permet pas de remonter de la Data Platform jusqu’au besoin métier ou stratégique.

**Question.** Quelle amélioration apporte le plus de valeur pour la traçabilité ?

- **A.** Construire une chaîne cross-layer explicite reliant le concern, le service/capability pertinent, **Customer 360 Data Service**, les composants/services technologiques et les éléments physiques ou de migration nécessaires.
- **B.** Ajouter uniquement davantage de propriétés techniques sur les nœuds.
- **C.** Fusionner toutes les couches en renommant chaque élément « solution ».
- **D.** Créer des relations Association entre chaque paire d’éléments pour garantir qu’il existe toujours un chemin.

## S080 — Data Platform / transformation et gouvernance
**Contexte.** Le programme Data Platform part de « tables, objets métier et fichiers représentés de la même manière » et vise « Business Object→Data Object→Artifact et usages explicites ». Le Data Architect veut une roadmap qui ne cache ni coexistence temporaire ni sortie du legacy.

**Question.** Quelle modélisation de transformation est la plus complète ?

- **A.** Identifier les Gaps, définir les Work Packages pour construire lineage, ownership et accès, leurs Deliverables, les Implementation Events et les Plateaus de transition/cible.
- **B.** Dessiner uniquement la cible finale, car la migration relève exclusivement du project management.
- **C.** Créer un Goal nommé « Migration » et l’utiliser comme unique élément de roadmap.
- **D.** Modéliser les versions logicielles comme des Plateaus sans vérifier si elles représentent réellement un état d’architecture stable.

## S081 — Observability / SRE / choix d’élément
**Contexte.** Le SRE Lead demande de corriger un modèle Observability / SRE afin de relier signaux techniques, SLO et impact métier. Le modèle actuel part de « métriques techniques sans lien aux services critiques ». L’équipe hésite entre plusieurs concepts pour représenter le point central.

**Question.** Quelle option constitue le meilleur choix de modélisation pour le concept central dans ce contexte ?

- **A.** Utiliser **Requirement**, puis le relier aux éléments adjacents avec une sémantique explicite.
- **B.** Utiliser **Technology Service** partout afin de réduire le nombre de types d’éléments.
- **C.** Remplacer le concept par une note libre et ne modéliser que les composants techniques.
- **D.** Créer un élément personnalisé portant le nom du produit et l’utiliser comme concept universel.

## S082 — Observability / SRE / choix de relation
**Contexte.** Dans une vue Observability / SRE, l’équipe doit relier **Telemetry Platform** à **Payment Platform** autour de « Observability Service ». Le diagramme actuel utilise Influence sans justification.

**Question.** Quelle correction est la plus solide ?

- **A.** Employer **Serving** si la question sémantique correspond bien à la relation attendue.
- **B.** Conserver **Influence** parce qu’une relation déjà dessinée ne doit jamais être changée.
- **C.** Remplacer toutes les relations par Association pour éviter les erreurs.
- **D.** Supprimer la direction des relations et laisser le lecteur l’interpréter.

## S083 — Observability / SRE / choix de vue
**Contexte.** Le SRE Lead veut une représentation qui lui permette de relier signaux techniques, SLO et impact métier. Le référentiel contient déjà les éléments nécessaires, mais la vue existante mélange tous les layers et dépasse cent éléments.

**Question.** Quelle stratégie de vue est la plus appropriée ?

- **A.** Construire une **cross-layer Incident Impact View** centrée sur le concern, en réutilisant les éléments canoniques et seulement les relations nécessaires.
- **B.** Utiliser une **Capability View** même si elle ne répond pas au concern, afin d’uniformiser toutes les présentations.
- **C.** Créer une copie indépendante de chaque élément pour que la vue soit autonome.
- **D.** Afficher l’intégralité du modèle d’entreprise dans une seule vue.

## S084 — Observability / SRE / traçabilité cross-layer
**Contexte.** Une décision Observability / SRE doit être défendue devant le SRE Lead. La cible est « SLO/requirements, telemetry services, alerts et impact business reliés », mais le modèle ne permet pas de remonter de l’Observability Stack jusqu’au besoin métier ou stratégique.

**Question.** Quelle amélioration apporte le plus de valeur pour la traçabilité ?

- **A.** Construire une chaîne cross-layer explicite reliant le concern, le service/capability pertinent, **Observability Service**, les composants/services technologiques et les éléments physiques ou de migration nécessaires.
- **B.** Ajouter uniquement davantage de propriétés techniques sur les nœuds.
- **C.** Fusionner toutes les couches en renommant chaque élément « solution ».
- **D.** Créer des relations Association entre chaque paire d’éléments pour garantir qu’il existe toujours un chemin.

## S085 — Observability / SRE / transformation et gouvernance
**Contexte.** Le programme Observability / SRE part de « métriques techniques sans lien aux services critiques » et vise « SLO/requirements, telemetry services, alerts et impact business reliés ». Le SRE Lead veut une roadmap qui ne cache ni coexistence temporaire ni sortie du legacy.

**Question.** Quelle modélisation de transformation est la plus complète ?

- **A.** Identifier les Gaps, définir les Work Packages pour tracer service critique→SLI/SLO→telemetry→incident, leurs Deliverables, les Implementation Events et les Plateaus de transition/cible.
- **B.** Dessiner uniquement la cible finale, car la migration relève exclusivement du project management.
- **C.** Créer un Goal nommé « Migration » et l’utiliser comme unique élément de roadmap.
- **D.** Modéliser les versions logicielles comme des Plateaus sans vérifier si elles représentent réellement un état d’architecture stable.

## S086 — Multi-site / DR / choix d’élément
**Contexte.** Le BCP Manager demande de corriger un modèle Multi-site / DR afin de distinguer haute disponibilité et reprise après sinistre. Le modèle actuel part de « HA locale considérée comme PRA ». L’équipe hésite entre plusieurs concepts pour représenter le point central.

**Question.** Quelle option constitue le meilleur choix de modélisation pour le concept central dans ce contexte ?

- **A.** Utiliser **Requirement**, puis le relier aux éléments adjacents avec une sémantique explicite.
- **B.** Utiliser **Plateau** partout afin de réduire le nombre de types d’éléments.
- **C.** Remplacer le concept par une note libre et ne modéliser que les composants techniques.
- **D.** Créer un élément personnalisé portant le nom du produit et l’utiliser comme concept universel.

## S087 — Multi-site / DR / choix de relation
**Contexte.** Dans une vue Multi-site / DR, l’équipe doit relier **Secondary Site** à **Critical Payment Platform** autour de « Disaster Recovery Service ». Le diagramme actuel utilise Triggering sans justification.

**Question.** Quelle correction est la plus solide ?

- **A.** Employer **Serving** si la question sémantique correspond bien à la relation attendue.
- **B.** Conserver **Triggering** parce qu’une relation déjà dessinée ne doit jamais être changée.
- **C.** Remplacer toutes les relations par Association pour éviter les erreurs.
- **D.** Supprimer la direction des relations et laisser le lecteur l’interpréter.

## S088 — Multi-site / DR / choix de vue
**Contexte.** Le BCP Manager veut une représentation qui lui permette de distinguer haute disponibilité et reprise après sinistre. Le référentiel contient déjà les éléments nécessaires, mais la vue existante mélange tous les layers et dépasse cent éléments.

**Question.** Quelle stratégie de vue est la plus appropriée ?

- **A.** Construire une **Layered Resilience View** centrée sur le concern, en réutilisant les éléments canoniques et seulement les relations nécessaires.
- **B.** Utiliser une **Product View** même si elle ne répond pas au concern, afin d’uniformiser toutes les présentations.
- **C.** Créer une copie indépendante de chaque élément pour que la vue soit autonome.
- **D.** Afficher l’intégralité du modèle d’entreprise dans une seule vue.

## S089 — Multi-site / DR / traçabilité cross-layer
**Contexte.** Une décision Multi-site / DR doit être défendue devant le BCP Manager. La cible est « RTO/RPO, sites, réplication, failover et dependencies explicités », mais le modèle ne permet pas de remonter de la bi-site architecture jusqu’au besoin métier ou stratégique.

**Question.** Quelle amélioration apporte le plus de valeur pour la traçabilité ?

- **A.** Construire une chaîne cross-layer explicite reliant le concern, le service/capability pertinent, **Disaster Recovery Service**, les composants/services technologiques et les éléments physiques ou de migration nécessaires.
- **B.** Ajouter uniquement davantage de propriétés techniques sur les nœuds.
- **C.** Fusionner toutes les couches en renommant chaque élément « solution ».
- **D.** Créer des relations Association entre chaque paire d’éléments pour garantir qu’il existe toujours un chemin.

## S090 — Multi-site / DR / transformation et gouvernance
**Contexte.** Le programme Multi-site / DR part de « HA locale considérée comme PRA » et vise « RTO/RPO, sites, réplication, failover et dependencies explicités ». Le BCP Manager veut une roadmap qui ne cache ni coexistence temporaire ni sortie du legacy.

**Question.** Quelle modélisation de transformation est la plus complète ?

- **A.** Identifier les Gaps, définir les Work Packages pour modéliser scénarios de panne et état de reprise, leurs Deliverables, les Implementation Events et les Plateaus de transition/cible.
- **B.** Dessiner uniquement la cible finale, car la migration relève exclusivement du project management.
- **C.** Créer un Goal nommé « Migration » et l’utiliser comme unique élément de roadmap.
- **D.** Modéliser les versions logicielles comme des Plateaus sans vérifier si elles représentent réellement un état d’architecture stable.

## S091 — GenAI Platform / choix d’élément
**Contexte.** L’AI Platform Architect demande de corriger un modèle GenAI Platform afin de séparer capability AI, services applicatifs, modèles et runtime. Le modèle actuel part de « LLM, capability et plateforme confondus ». L’équipe hésite entre plusieurs concepts pour représenter le point central.

**Question.** Quelle option constitue le meilleur choix de modélisation pour le concept central dans ce contexte ?

- **A.** Utiliser **Application Service**, puis le relier aux éléments adjacents avec une sémantique explicite.
- **B.** Utiliser **Capability** partout afin de réduire le nombre de types d’éléments.
- **C.** Remplacer le concept par une note libre et ne modéliser que les composants techniques.
- **D.** Créer un élément personnalisé portant le nom du produit et l’utiliser comme concept universel.

## S092 — GenAI Platform / choix de relation
**Contexte.** Dans une vue GenAI Platform, l’équipe doit relier **GenAI Serving Component** à **Enterprise Copilot** autour de « LLM Inference Service ». Le diagramme actuel utilise Realization sans justification.

**Question.** Quelle correction est la plus solide ?

- **A.** Employer **Serving** si la question sémantique correspond bien à la relation attendue.
- **B.** Conserver **Realization** parce qu’une relation déjà dessinée ne doit jamais être changée.
- **C.** Remplacer toutes les relations par Association pour éviter les erreurs.
- **D.** Supprimer la direction des relations et laisser le lecteur l’interpréter.

## S093 — GenAI Platform / choix de vue
**Contexte.** L’AI Platform Architect veut une représentation qui lui permette de séparer capability AI, services applicatifs, modèles et runtime. Le référentiel contient déjà les éléments nécessaires, mais la vue existante mélange tous les layers et dépasse cent éléments.

**Question.** Quelle stratégie de vue est la plus appropriée ?

- **A.** Construire une **Layered GenAI Platform View** centrée sur le concern, en réutilisant les éléments canoniques et seulement les relations nécessaires.
- **B.** Utiliser une **Organization View** même si elle ne répond pas au concern, afin d’uniformiser toutes les présentations.
- **C.** Créer une copie indépendante de chaque élément pour que la vue soit autonome.
- **D.** Afficher l’intégralité du modèle d’entreprise dans une seule vue.

## S094 — GenAI Platform / traçabilité cross-layer
**Contexte.** Une décision GenAI Platform doit être défendue devant l’AI Platform Architect. La cible est « AI capability, application services, model artifacts, runtime et data dependencies séparés », mais le modèle ne permet pas de remonter de la GenAI Platform jusqu’au besoin métier ou stratégique.

**Question.** Quelle amélioration apporte le plus de valeur pour la traçabilité ?

- **A.** Construire une chaîne cross-layer explicite reliant le concern, le service/capability pertinent, **LLM Inference Service**, les composants/services technologiques et les éléments physiques ou de migration nécessaires.
- **B.** Ajouter uniquement davantage de propriétés techniques sur les nœuds.
- **C.** Fusionner toutes les couches en renommant chaque élément « solution ».
- **D.** Créer des relations Association entre chaque paire d’éléments pour garantir qu’il existe toujours un chemin.

## S095 — GenAI Platform / transformation et gouvernance
**Contexte.** Le programme GenAI Platform part de « LLM, capability et plateforme confondus » et vise « AI capability, application services, model artifacts, runtime et data dependencies séparés ». L’AI Platform Architect veut une roadmap qui ne cache ni coexistence temporaire ni sortie du legacy.

**Question.** Quelle modélisation de transformation est la plus complète ?

- **A.** Identifier les Gaps, définir les Work Packages pour modéliser RAG, inference, guardrails, data et platform services, leurs Deliverables, les Implementation Events et les Plateaus de transition/cible.
- **B.** Dessiner uniquement la cible finale, car la migration relève exclusivement du project management.
- **C.** Créer un Goal nommé « Migration » et l’utiliser comme unique élément de roadmap.
- **D.** Modéliser les versions logicielles comme des Plateaus sans vérifier si elles représentent réellement un état d’architecture stable.

## S096 — Green IT / choix d’élément
**Contexte.** Le Green IT Lead demande de corriger un modèle Green IT afin de relier objectifs carbone à des changements d’architecture réellement mesurables. Le modèle actuel part de « CO2e attaché comme pseudo-élément sans cause architecturale ». L’équipe hésite entre plusieurs concepts pour représenter le point central.

**Question.** Quelle option constitue le meilleur choix de modélisation pour le concept central dans ce contexte ?

- **A.** Utiliser **Outcome**, puis le relier aux éléments adjacents avec une sémantique explicite.
- **B.** Utiliser **Material** partout afin de réduire le nombre de types d’éléments.
- **C.** Remplacer le concept par une note libre et ne modéliser que les composants techniques.
- **D.** Créer un élément personnalisé portant le nom du produit et l’utiliser comme concept universel.

## S097 — Green IT / choix de relation
**Contexte.** Dans une vue Green IT, l’équipe doit relier **Green IT transformation** à **CIO** autour de « sustainable platform outcome ». Le diagramme actuel utilise Access sans justification.

**Question.** Quelle correction est la plus solide ?

- **A.** Employer **Influence** si la question sémantique correspond bien à la relation attendue.
- **B.** Conserver **Access** parce qu’une relation déjà dessinée ne doit jamais être changée.
- **C.** Remplacer toutes les relations par Association pour éviter les erreurs.
- **D.** Supprimer la direction des relations et laisser le lecteur l’interpréter.

## S098 — Green IT / choix de vue
**Contexte.** Le Green IT Lead veut une représentation qui lui permette de relier objectifs carbone à des changements d’architecture réellement mesurables. Le référentiel contient déjà les éléments nécessaires, mais la vue existante mélange tous les layers et dépasse cent éléments.

**Question.** Quelle stratégie de vue est la plus appropriée ?

- **A.** Construire une **cross-layer Green IT View** centrée sur le concern, en réutilisant les éléments canoniques et seulement les relations nécessaires.
- **B.** Utiliser une **Application Cooperation View** même si elle ne répond pas au concern, afin d’uniformiser toutes les présentations.
- **C.** Créer une copie indépendante de chaque élément pour que la vue soit autonome.
- **D.** Afficher l’intégralité du modèle d’entreprise dans une seule vue.

## S099 — Green IT / traçabilité cross-layer
**Contexte.** Une décision Green IT doit être défendue devant le Green IT Lead. La cible est « goals/outcomes reliés aux applications, technologies, devices, facilities et decommissioning », mais le modèle ne permet pas de remonter du GreenOps / FinOps jusqu’au besoin métier ou stratégique.

**Question.** Quelle amélioration apporte le plus de valeur pour la traçabilité ?

- **A.** Construire une chaîne cross-layer explicite reliant le concern, le service/capability pertinent, **sustainable platform outcome**, les composants/services technologiques et les éléments physiques ou de migration nécessaires.
- **B.** Ajouter uniquement davantage de propriétés techniques sur les nœuds.
- **C.** Fusionner toutes les couches en renommant chaque élément « solution ».
- **D.** Créer des relations Association entre chaque paire d’éléments pour garantir qu’il existe toujours un chemin.

## S100 — Green IT / transformation et gouvernance
**Contexte.** Le programme Green IT part de « CO2e attaché comme pseudo-élément sans cause architecturale » et vise « goals/outcomes reliés aux applications, technologies, devices, facilities et decommissioning ». Le Green IT Lead veut une roadmap qui ne cache ni coexistence temporaire ni sortie du legacy.

**Question.** Quelle modélisation de transformation est la plus complète ?

- **A.** Identifier les Gaps, définir les Work Packages pour tracer mesure→assessment→goal/outcome→work package→asset retirement, leurs Deliverables, les Implementation Events et les Plateaus de transition/cible.
- **B.** Dessiner uniquement la cible finale, car la migration relève exclusivement du project management.
- **C.** Créer un Goal nommé « Migration » et l’utiliser comme unique élément de roadmap.
- **D.** Modéliser les versions logicielles comme des Plateaus sans vérifier si elles représentent réellement un état d’architecture stable.

---

# Corrections S001–S100

Pour tous les scénarios de **choix d’élément**, la meilleure réponse est celle qui sélectionne le concept ArchiMate adapté au concern au lieu de réduire artificiellement les types. Pour tous les scénarios de **relation**, la meilleure réponse est celle qui choisit la relation par sa sémantique et sa direction. Pour les **views**, la meilleure réponse est concern-driven et réutilise les éléments canoniques. Pour la **traçabilité**, la meilleure réponse construit une chaîne cross-layer explicable. Pour la **migration**, la meilleure réponse combine Gaps, Work Packages, Deliverables, Implementation Events et Plateaus.

### Barème détaillé des 100 scénarios

- **S001, S006, S011, S016, S021, S026, S031, S036, S041, S046, S051, S056, S061, S066, S071, S076, S081, S086, S091, S096** : meilleure réponse **A = 5**, B=3, C=1, D=0. La réponse A respecte le type d’élément et le niveau d’abstraction. B contient un concept voisin mais l’applique trop largement.
- **S002, S007, S012, S017, S022, S027, S032, S037, S042, S047, S052, S057, S062, S067, S072, S077, S082, S087, S092, S097** : meilleure réponse **A = 5**, C=3, B=1, D=0. A choisit la relation sémantiquement précise ; Association n’est qu’un repli.
- **S003, S008, S013, S018, S023, S028, S033, S038, S043, S048, S053, S058, S063, S068, S073, S078, S083, S088, S093, S098** : meilleure réponse **A = 5**, C=3, B=1, D=0. Une vue doit être centrée sur le concern et réutiliser le référentiel.
- **S004, S009, S014, S019, S024, S029, S034, S039, S044, S049, S054, S059, S064, S069, S074, S079, S084, S089, S094, S099** : meilleure réponse **A = 5**, B=3, D=1, C=0. Une vraie traçabilité cross-layer vaut plus qu’un enrichissement technique isolé.
- **S005, S010, S015, S020, S025, S030, S035, S040, S045, S050, S055, S060, S065, S070, S075, S080, S085, S090, S095, S100** : meilleure réponse **A = 5**, D=3, C=1, B=0. Une roadmap d’architecture doit montrer états, écarts, travaux, livrables et événements.

## Raisonnement par domaine

### Motivation & gouvernance
Le problème relève d’abord de la motivation : il faut distinguer la force qui pousse au changement, son évaluation, l’état désiré et l’exigence à satisfaire.

### Strategy / capabilities
Une capability décrit ce que l’organisation doit être capable de faire, indépendamment du workflow ou du produit technique choisi.

### Business services & processes
Le service représente la fonctionnalité visible de l’extérieur ; le processus représente l’enchaînement interne qui le réalise.

### Application / API
Le composant réalise une fonctionnalité ; le service est ce qui est fourni ; l’interface est le point d’accès par lequel le service est exposé.

### Technology platform
Un runtime ou middleware est du System Software ; la fonctionnalité consommée est un Technology Service ; la ressource d’exécution est un Node.

### Physical / datacenter
La couche Physical complète Technology quand la décision dépend de lieux, équipements, réseaux de distribution ou matières physiques.

### Implementation & Migration
Un Plateau représente un état d’architecture relativement stable ; les Work Packages et Deliverables expliquent comment cet état est atteint.

### Relationships
La bonne relation dépend de la question sémantique : qui exécute, qui réalise, qui sert, qui accède, qui déclenche ou ce qui est transféré.

### Views & viewpoints
Le viewpoint définit la manière de construire la représentation ; la view est la représentation effectivement produite pour un concern donné.

### Instant Payment
Le besoin est cross-layer : service métier, orchestration applicative, données/événements, services technologiques et résilience doivent rester distincts mais traçables.

### API Banking
L’API comme point d’accès est une interface ; la capacité fonctionnelle consommée est un service. La plateforme API reste distincte du service métier/applicatif.

### Kafka / Event Streaming
L’événement est un fait/changement d’état ; le payload est de l’information ; Kafka est System Software et l’event streaming fourni est un Technology Service.

### OpenShift / Kubernetes
Le concern technique exige de séparer composant logique, artefact déployable, runtime logiciel, nœud d’exécution et service technologique consommé.

### IAM / Zero Trust
Zero Trust est un concern et un ensemble de principes/exigences ; les mécanismes concrets se répartissent sur applications, interfaces, services et technologies.

### Fraud & Risk
Le modèle doit distinguer aptitude métier, comportement applicatif, service de décision et données/artefacts utilisés, puis les relier aux outcomes de risque.

### Data Platform
Le niveau métier décrit le concept informationnel, Application le Data Object logique et Technology/implementation l’Artifact concret.

### Observability / SRE
SLO est une exigence/objectif de service, pas un service technologique ; la plateforme d’observabilité fournit des services techniques qui aident à mesurer et opérer.

### Multi-site / DR
HA traite surtout les pannes locales et continuité immédiate ; DR traite la perte d’un site ou d’un domaine majeur avec RTO/RPO et trajectoire de reprise.

### GenAI Platform
L’aptitude organisationnelle AI est une Capability ; le service d’inférence est applicatif/technologique selon le concern ; le modèle est un artefact ou objet selon son rôle.

### Green IT
Une mesure carbone est une donnée/propriété/assessment selon le concern ; le gain doit être relié à une action architecturale réelle comme consolidation, extinction ou évitement.

---

# Couverture et contrôle qualité

- Scénarios : **100**
- Identifiants : **S001–S100**
- 20 domaines × 5 angles distincts
- Options par scénario : **4**
- Barème : **5 / 3 / 1 / 0**
- Scénarios couvrant : éléments, relations, viewpoints, cross-layer, migration
- Aucun scénario officiel reproduit
- Aucun placeholder

## Cinq angles par domaine

1. choix du bon élément ;
2. choix de la relation et de sa direction ;
3. choix de la vue / viewpoint ;
4. traçabilité cross-layer ;
5. transformation / gouvernance / migration.

## Utilisation recommandée

Passer **8 scénarios en 90 minutes**, classer soi-même les quatre propositions 5/3/1/0, puis comparer au corrigé. L’objectif n’est pas de mémoriser une lettre mais d’expliquer pourquoi une réponse est meilleure qu’une autre.