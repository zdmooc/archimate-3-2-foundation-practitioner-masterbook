# Implementation & Migration — 50 QCM

> Répondre sans consulter la correction. Une seule réponse est attendue par question.

## Q151
Quel concept Implementation & Migration correspond à : « ensemble de travaux conçu pour atteindre un objectif ou produire un résultat » ?
- **A.** Work Package
- **B.** Deliverable
- **C.** Course of Action
- **D.** Plateau

## Q152
Quel concept Implementation & Migration correspond à : « résultat précisément défini d’un Work Package » ?
- **A.** Artifact
- **B.** Deliverable
- **C.** Outcome
- **D.** Gap

## Q153
Quel concept Implementation & Migration correspond à : « événement de transformation indiquant un changement significatif d’état » ?
- **A.** Plateau
- **B.** Application Event
- **C.** Implementation Event
- **D.** Technology Event

## Q154
Quel concept Implementation & Migration correspond à : « état relativement stable de l’architecture à un moment donné » ?
- **A.** Deliverable
- **B.** Work Package
- **C.** Gap
- **D.** Plateau

## Q155
Quel concept Implementation & Migration correspond à : « différence entre deux états d’architecture » ?
- **A.** Requirement
- **B.** Assessment
- **C.** Gap
- **D.** Outcome

## Q156
« Construire la plateforme OpenShift de production » représente quoi dans une roadmap ?
- **A.** Work Package
- **B.** Course of Action
- **C.** Gap
- **D.** Plateau

## Q157
« Cluster OpenShift production prêt et documenté » est le résultat d’un lot de travaux. Quel élément ?
- **A.** Artifact
- **B.** Implementation Event
- **C.** Work Package
- **D.** Deliverable

## Q158
« Pilot Cutover Completed » marque le passage à une nouvelle phase de transformation. Quel élément ?
- **A.** Business Event
- **B.** Technology Event
- **C.** Application Event
- **D.** Implementation Event

## Q159
« Legacy Payment Platform » décrit un état stable avant migration. Quel élément ?
- **A.** Plateau
- **B.** Deliverable
- **C.** Gap
- **D.** Work Package

## Q160
« Hybrid Payment Platform » où legacy et cible coexistent est quoi ?
- **A.** Gap
- **B.** Course of Action
- **C.** Implementation Event
- **D.** Plateau

## Q161
« Target Payment Platform » est quoi ?
- **A.** Gap
- **B.** Goal
- **C.** Work Package
- **D.** Plateau

## Q162
L’absence d’event streaming entre baseline et target est quoi ?
- **A.** Gap
- **B.** Requirement
- **C.** Assessment
- **D.** Deliverable

## Q163
La règle « RPO ≤ 5 min » dans une migration est quoi ?
- **A.** Gap
- **B.** Plateau
- **C.** Requirement
- **D.** Work Package

## Q164
« Adopt a strangler migration approach » est quoi ?
- **A.** Gap
- **B.** Work Package
- **C.** Course of Action
- **D.** Plateau

## Q165
Pourquoi Course of Action et Work Package ne sont-ils pas synonymes ?
- **A.** Course of Action est un fichier; Work Package une API.
- **B.** Course of Action décrit l’approche; Work Package décrit les travaux exécutés.
- **C.** Work Package est toujours un Goal.
- **D.** Ils sont synonymes.

## Q166
Un fichier de livraison .zip produit par un projet est-il automatiquement un Deliverable ?
- **A.** Non, Deliverable n’existe pas.
- **B.** Oui, toujours.
- **C.** Oui, mais uniquement en Business Layer.
- **D.** Pas nécessairement; l’Artifact est le fichier concret, le Deliverable est le résultat de projet attendu.

## Q167
Le moment « legacy database becomes read-only » dans la bascule est le mieux représenté par quoi ?
- **A.** Technology Service
- **B.** Gap
- **C.** Business Object
- **D.** Implementation Event

## Q168
Une panne de base pendant le cutover est quoi ?
- **A.** Technology Event
- **B.** Implementation Event automatiquement
- **C.** Gap
- **D.** Plateau

## Q169
La fin d’un Work Package produit quoi le plus naturellement ?
- **A.** uniquement un Gap
- **B.** un ou plusieurs Deliverables
- **C.** un Business Actor
- **D.** toujours un Plateau

## Q170
Quel élément permet de représenter explicitement l’état intermédiaire après migration de 20 % des flux ?
- **A.** Business Process
- **B.** Plateau
- **C.** Requirement
- **D.** Gap

## Q171
Comment représenter un roadmap ArchiMate ?
- **A.** Par une combinaison de Plateaus, Work Packages, Gaps, Deliverables et Implementation Events.
- **B.** Par un Device.
- **C.** Par un Business Process uniquement.
- **D.** Par un unique élément Roadmap obligatoire.

## Q172
Le rollback est-il un élément ArchiMate dédié ?
- **A.** Oui, c’est un Application Event obligatoire.
- **B.** Non, car ArchiMate ne modélise pas la migration.
- **C.** Non; il se modélise avec Requirements, Work Packages, Deliverables, Events et Plateaus selon le concern.
- **D.** Oui, Rollback est un élément officiel.

## Q173
« Rollback plan approved » est le plus naturellement quoi ?
- **A.** Business Service
- **B.** Deliverable
- **C.** Plateau
- **D.** Gap

## Q174
« Execute rollback » est le plus naturellement quoi ?
- **A.** Work Package ou activité détaillée selon le niveau
- **B.** Plateau
- **C.** Business Object
- **D.** Gap

## Q175
« Rollback completed, legacy restored » peut marquer quoi ?
- **A.** Implementation Event menant à un Plateau restauré
- **B.** Data Object
- **C.** Business Event menant à un Product
- **D.** Capability

## Q176
Pourquoi la coexistence temporaire doit-elle être modélisée ?
- **A.** Parce qu’elle crée des dépendances, risques et coûts spécifiques au Plateau de transition.
- **B.** Parce qu’un Plateau remplace tous les composants.
- **C.** Parce qu’ArchiMate exige exactement trois plateaus.
- **D.** Parce que tout système legacy est un Gap.

## Q177
Une migration de données possède un moment où la cible devient source de vérité. Quel concept marque ce basculement ?
- **A.** Application Interface
- **B.** Implementation Event
- **C.** Business Role
- **D.** Gap

## Q178
Avant ce basculement, legacy et cible sont synchronisés. Quel concept représente l’état stable de coexistence ?
- **A.** Deliverable
- **B.** Plateau
- **C.** Gap
- **D.** Work Package

## Q179
Après le basculement, il reste des dépendances vers le legacy. Comment les représenter ?
- **A.** Uniquement comme Outcome.
- **B.** En supprimant le legacy du modèle immédiatement.
- **C.** Comme des relations/dépendances existantes dans le Plateau cible provisoire et éventuellement des Gaps restants.
- **D.** Comme Business Actor.

## Q180
Le décommissionnement du legacy doit-il être explicite ?
- **A.** Non, ArchiMate ne peut pas le montrer.
- **B.** Non, la migration implique toujours automatiquement le retrait.
- **C.** Oui, si l’objectif inclut la suppression réelle des coûts, risques ou impacts.
- **D.** Seulement pour les applications SaaS.

## Q181
Quel Work Package termine logiquement une stratégie de Strangler complète ?
- **A.** Create Capability
- **B.** Define Driver
- **C.** Create Baseline
- **D.** Legacy Exit / Decommissioning

## Q182
« licences legacy résiliées » est le plus naturellement quoi ?
- **A.** Deliverable ou résultat de décommissionnement
- **B.** Application Service
- **C.** Value Stream
- **D.** Technology Event

## Q183
« CMDB nettoyée après retrait » peut être quoi ?
- **A.** Plateau
- **B.** Gap
- **C.** Deliverable
- **D.** Goal

## Q184
Pourquoi un composant temporaire de migration doit-il avoir un exit path ?
- **A.** Parce que Plateau est interdit.
- **B.** Pour éviter qu’un élément de transition devienne une dette permanente non gouvernée.
- **C.** Parce que Work Package ne peut produire qu’un livrable.
- **D.** Parce que tous les composants doivent être supprimés.

## Q185
Quel couple exprime le mieux « où nous sommes » et « ce qui manque » ?
- **A.** Work Package + Business Actor
- **B.** Goal + Device
- **C.** Plateau + Gap
- **D.** Deliverable + Product

## Q186
Quel couple exprime le mieux « ce que nous faisons » et « ce que nous livrons » ?
- **A.** Course of Action + Driver
- **B.** Work Package + Deliverable
- **C.** Gap + Plateau
- **D.** Capability + Business Object

## Q187
Quel couple exprime le mieux « approche choisie » et « exécution concrète » ?
- **A.** Course of Action + Work Package
- **B.** Plateau + Business Role
- **C.** Event + Device
- **D.** Goal + Data Object

## Q188
Quel enchaînement est le plus cohérent ?
- **A.** Work Package → Driver → Goal → Device
- **B.** Gap → Work Package → Deliverable → Implementation Event → Plateau
- **C.** Deliverable → Capability → Communication Network
- **D.** Plateau → Business Actor → Data Object → Gap

## Q189
Dans TOGAF, les Phases E/F sont particulièrement proches de quels concepts ArchiMate ?
- **A.** uniquement Business Actor
- **B.** uniquement Meaning
- **C.** Plateau, Gap, Work Package, Deliverable, Implementation Event
- **D.** uniquement Device

## Q190
La Phase G de TOGAF s’intéresse à la conformité d’implémentation. Quel usage ArchiMate est utile ?
- **A.** Transformer tout en Business Process.
- **B.** Tracer Requirements, Deliverables et éléments cible pour contrôler la conformité.
- **C.** Supprimer les modèles de transition.
- **D.** Utiliser uniquement Value Stream.

## Q191
Une migration Green IT annonce des économies mais ne retire aucun serveur. Quel risque de modélisation ?
- **A.** Le modèle cible omet la condition physique nécessaire à la réalisation du gain.
- **B.** Aucun, le Goal suffit.
- **C.** Il faut remplacer Work Package par Meaning.
- **D.** Le serveur doit devenir Material.

## Q192
« Power off legacy servers » est le plus naturellement quoi ?
- **A.** Business Object
- **B.** Value
- **C.** Work Package ou activité de décommissionnement
- **D.** Goal

## Q193
« Legacy servers powered off » est le plus naturellement quoi ?
- **A.** Capability
- **B.** Implementation Event ou Deliverable selon le concern
- **C.** Application Service
- **D.** Path

## Q194
« Carbon footprint reduced by 30% » est le plus naturellement quoi ?
- **A.** Plateau
- **B.** Outcome
- **C.** Work Package
- **D.** Gap

## Q195
Une roadmap doit-elle obligatoirement représenter toutes les dépendances techniques ?
- **A.** Uniquement les Business Objects.
- **B.** Non, aucune.
- **C.** Non; elle doit montrer celles nécessaires au concern et à la décision.
- **D.** Oui, absolument toutes.

## Q196
Un Plateau doit-il être confondu avec un environnement Dev/Test/Prod ?
- **A.** Non; Plateau exprime un état d’architecture, pas simplement un environnement.
- **B.** Oui, mais seulement Prod.
- **C.** Oui, toujours.
- **D.** Non, car Plateau est un service.

## Q197
Un Plateau doit-il être confondu avec une release logicielle ?
- **A.** Non car Release est une Capability.
- **B.** Oui, toute release est Plateau.
- **C.** Oui si version >1.
- **D.** Non; une release peut contribuer à un Plateau mais n’est pas automatiquement un Plateau.

## Q198
Un Gap doit-il être confondu avec un risque ?
- **A.** Non; Gap est un écart entre états, le risque peut être un Assessment.
- **B.** Non car Gap est un Device.
- **C.** Oui, ils sont synonymes.
- **D.** Oui si le risque est élevé.

## Q199
Un Gap doit-il être confondu avec un Requirement ?
- **A.** Oui, toujours.
- **B.** Oui en Phase F seulement.
- **C.** Non; le Requirement exprime un besoin, le Gap exprime ce qui manque pour passer d’un état à un autre.
- **D.** Non car Requirement est Physical.

## Q200
Pour une architecture cible sans plan de migration, quel manque principal faut-il signaler ?
- **A.** L’absence de Product.
- **B.** L’absence de Work Packages/Plateaus/Events nécessaires pour rendre la transition explicite.
- **C.** L’absence de Meaning.
- **D.** L’absence de Business Object uniquement.
