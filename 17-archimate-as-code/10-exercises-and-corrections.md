# 10 — Exercices et corrections

## Série A — comprendre le workflow

### 1
Une équipe veut pouvoir relire les changements d’architecture dans une pull request. Quel format est le plus adapté ?

**Correction :** une vue textuelle `.puml` est adaptée car le diff est lisible.

### 2
Une vue compile sans erreur. Peut-on conclure qu’elle respecte ArchiMate ?

**Correction :** non. Compilation syntaxique et validité sémantique sont différentes.

### 3
Pourquoi pinner la version PlantUML en CI ?

**Correction :** pour rendre les builds reproductibles et maîtriser les changements d’outil.

### 4
Doit-on committer tous les SVG générés ?

**Correction :** pas nécessairement. Ils peuvent être produits comme artefacts CI.

### 5
Quelle source de vérité choisir entre Archi et PlantUML ?

**Correction :** le projet doit la définir explicitement selon le workflow ; éviter deux masters divergents.

## Série B — syntaxe et sémantique

### 6
`Kafka` est déclaré `Application_Event`. Erreur ?

**Correction :** oui dans le concern plateforme. Kafka est plutôt System Software ; l’événement est le fait transporté.

### 7
`Payment REST API` est modélisée seulement comme `Application_Service` alors que le concern porte sur le point d’accès. Que manque-t-il ?

**Correction :** une Application Interface.

### 8
Un composant fournit un service. Quelle relation ?

**Correction :** Realization du composant vers le service.

### 9
Un service est consommé par un processus. Quelle relation ?

**Correction :** Serving du service vers le processus consommateur.

### 10
Une flèche est inversée uniquement pour améliorer le layout. Acceptable ?

**Correction :** non. Utiliser les variantes d’orientation sans changer la direction sémantique.

## Série C — repository

### 11
Pourquoi `APP-01-payment-orchestration.puml` est préférable à `diagram1.puml` ?

**Correction :** il encode concern, numéro et sujet.

### 12
Pourquoi éviter un include contenant toute l’entreprise ?

**Correction :** couplage excessif, compréhension difficile, build lent et faible autonomie des vues.

### 13
À quoi servent les IDs stables ?

**Correction :** garder une référence durable au concept même si son label évolue.

### 14
Une PR ajoute 80 relations dans une seule vue. Que faire ?

**Correction :** revoir le concern et probablement scinder la vue.

### 15
Quelle information doit expliquer un commentaire PlantUML ?

**Correction :** le pourquoi, l’état architectural ou l’hypothèse, pas répéter le label.

## Série D — CI/CD

### 16
Quel est le premier quality gate automatique ?

**Correction :** compilation syntaxique de tous les `.puml`.

### 17
Peut-on automatiser complètement le choix Serving vs Realization ?

**Correction :** non de manière générale ; la revue humaine du sens reste nécessaire.

### 18
Un pipeline devrait-il s’exécuter sur toute modification du dépôt ?

**Correction :** pas forcément ; des `paths` ciblés réduisent le bruit.

### 19
Quel format de sortie privilégier pour la doc web ?

**Correction :** SVG.

### 20
Que publier après CI ?

**Correction :** les SVG générés, logs et éventuellement rapports de validation.

## Série E — MayaBank

### 21
Quel fichier pour la vue cible de paiement exécutive ?

**Correction :** `EXEC-01-payment-target-traceability.puml`.

### 22
Quel fichier pour l’exécution OpenShift/Kafka ?

**Correction :** `TEC-01-payment-runtime.puml`.

### 23
Quel fichier pour la migration Legacy→Hybrid→Target ?

**Correction :** `MIG-01-payment-roadmap.puml`.

### 24
Comment montrer le concern IAM ?

**Correction :** vue `SEC-*` séparant Requirement, Technology Service, System Software et consommateurs.

### 25
Pourquoi ne pas tout placer dans EXEC-01 ?

**Correction :** la vue exécutive doit rester orientée décision et traçabilité, pas runtime détaillé.

## Série F — Practitioner

### 26
Le CIO demande le lien entre résilience et investissements techniques. Quelle vue ?

**Correction :** cross-layer ciblée Goal/Requirement→Capability→services→plateforme.

### 27
Les Ops veulent savoir ce qui tombe si Kafka est indisponible. Quelle approche ?

**Correction :** Technology/Application impact view, pas Executive Strategy view.

### 28
Un architecte déclare un `Node` pour chaque pod Kubernetes. Est-ce toujours correct ?

**Correction :** non. Le niveau de détail dépend du concern ; éviter de reproduire tout Kubernetes sans valeur architecturale.

### 29
Une vue Target contient encore Legacy Payment Engine sans indication. Problème ?

**Correction :** oui, sauf s’il fait réellement partie de la cible. Sinon clarifier Transition/Baseline.

### 30
Comment lier un ADR au modèle ?

**Correction :** documentation Markdown/metadata ; l’ADR explique la décision, les vues montrent ses conséquences.

## Série G — correction de modèles

### 31
`OpenShift` = Capability.

**Correction :** faux en général ; OpenShift est une plateforme/System Software. `Container Platform Management` pourrait être une Capability.

### 32
`CO2e = Material`.

**Correction :** faux. C’est une mesure/propriété/Assessment selon le concern.

### 33
`payment.completed.v1 = Application Event`.

**Correction :** le topic n’est pas le fait ; distinguer event, payload et infrastructure de transport.

### 34
`OAuth = Business Service`.

**Correction :** généralement non. Séparer Identity/Authorization Technology Services et mécanismes/protocoles.

### 35
`DR Test = Plateau`.

**Correction :** non par défaut. Cela peut être Work Package, Deliverable ou Implementation Event selon ce que l’on veut exprimer.

## Série H — gouvernance

### 36
Qui doit reviewer `SEC-*` ?

**Correction :** un owner sécurité/architecture identifié par la gouvernance du projet.

### 37
Un changement de label sans changement sémantique exige-t-il un nouvel ID ?

**Correction :** non en principe.

### 38
Un composant disparaît de la Target. Que vérifier ?

**Correction :** Work Package de décommissionnement, consommateurs résiduels et plateau de transition.

### 39
Un SVG change sans modification `.puml`. Que suspecter ?

**Correction :** changement de version PlantUML, de thème ou de génération.

### 40
Pourquoi garder `render.sh` dans Git ?

**Correction :** rendre la commande de génération explicite et reproductible.

## Série I — avancé

### 41
Faut-il construire un parseur ArchiMate complet dans ce dépôt ?

**Correction :** non. Commencer par des gates simples et utiles.

### 42
Peut-on utiliser PlantUML dans un dépôt applicatif ?

**Correction :** oui, particulièrement pour les vues Solution Architecture proches du code.

### 43
Faut-il générer une vue pour chaque élément ?

**Correction :** non. Les vues répondent à des concerns.

### 44
Un diagramme devient illisible. Premier réflexe ?

**Correction :** réduire le scope ou scinder la vue, pas ajouter des artifices graphiques.

### 45
Pourquoi utiliser Markdown en complément ?

**Correction :** pour décisions, hypothèses, risques et contexte qui ne doivent pas surcharger le diagramme.

## Série J — entretien

### 46
Expliquez Architecture as Code en une phrase.

**Correction :** représentation d’architecture sous forme de sources texte versionnées, reviewables et générables automatiquement.

### 47
Quel bénéfice principal par rapport à PowerPoint ?

**Correction :** traçabilité fine des changements et reproductibilité.

### 48
Quel risque principal ?

**Correction :** croire qu’un fichier qui compile est automatiquement un modèle sémantiquement correct.

### 49
Archi ou PlantUML ?

**Correction :** dépend du workflow ; Archi pour repository interactif, PlantUML pour views-as-code et CI, souvent complémentaires.

### 50
Quel est le but final ?

**Correction :** rendre les décisions d’architecture traçables du besoin jusqu’au delivery, pas simplement générer de beaux diagrammes.
