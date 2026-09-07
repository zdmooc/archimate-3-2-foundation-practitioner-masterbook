# Practitioner Mock 2 — DR, Cloud, Green IT, GenAI, Data Cutover, Decommissioning

**Temps : 90 min · Open book · 8 scénarios · Barème 5/3/1/0 · Passage : 26/40.**

## P2-01 — Multi-site DR
Le comité de résilience exige une preuve que les services de paiement critiques respectent RPO/RTO et peuvent basculer du site East vers West. La vue actuelle montre uniquement deux bases répliquées.

Quelle proposition est la meilleure ?
- **A.** Tracer Requirements RPO/RTO → Business/Application Services critiques → Components → Technology Services/Nodes → Facilities, puis représenter réplication, failover, tests DR, Work Packages et Implementation Events.
- **B.** Compléter la Technology/Physical View avec réseaux, stockage, réplication et dépendances inter-sites ; techniquement solide mais sans lien explicite avec le service critique ni les exigences.
- **C.** Ajouter RPO/RTO comme propriétés des bases uniquement ; utile comme documentation locale mais insuffisant pour la traçabilité de bout en bout.
- **D.** Représenter le site West comme Plateau cible afin de montrer qu'il est le PRA.

### Correction P2-01
- **A — 5.** Relie l'obligation, les services, les dépendances technologiques/physiques et la transformation ; c'est le concern du comité.
- **B — 3.** Bonne vue DR technique mais elle ne démontre pas que les services métier couverts satisfont les Requirements.
- **C — 1.** Les propriétés ne remplacent pas la chaîne de dépendance ni la gouvernance du test.
- **D — 0.** Un site est une Facility ; Plateau représente un état architectural.

## P2-02 — Cloud Migration
MayaBank migre une application on-prem vers Azure en conservant plusieurs mois des dépendances hybrides. Le sponsor veut voir la trajectoire, les risques de coexistence et l'extinction du legacy.

Quelle modélisation est la meilleure ?
- **A.** Baseline/Transition/Target comme Plateaus, Gaps explicites, Work Packages et Deliverables, Implementation Events de cutover, dépendances hybrides dans le Plateau de transition et Work Package de decommissioning avec critères de sortie.
- **B.** Montrer Target + Work Packages de migration ; la cible et les travaux sont visibles mais la coexistence temporaire et ses risques ne le sont pas.
- **C.** Utiliser uniquement Flow entre « On-Prem » et « Cloud » pour matérialiser la migration.
- **D.** Créer un Goal « Move to Cloud » et supprimer toute modélisation Implementation & Migration.

### Correction P2-02
- **A — 5.** Rend explicites états, écarts, travaux, jalons, coexistence et sortie du legacy.
- **B — 3.** Correct mais incomplet pour un programme hybride où la transition elle-même est architecturalement significative.
- **C — 1.** Flow peut décrire un transfert mais pas une roadmap de transformation.
- **D — 0.** Un Goal ne remplace pas les concepts Implementation & Migration.

## P2-03 — Green IT
Le responsable Green IT veut prouver qu'une migration OpenShift réduit réellement l'empreinte. Le modèle actuel remplace les serveurs legacy par un cluster cible et affirme automatiquement « -40 % CO2e ».

Quelle approche est la meilleure ?
- **A.** Goal/Outcome de réduction → services/applications → Technology → Devices/Facilities/Equipment ; associer les mesures via propriétés/données pertinentes, distinguer énergie comme Material si utile, et représenter consolidation/extinction/decommissioning nécessaires pour matérialiser le gain.
- **B.** Produire un inventaire Physical complet avec watts, kWh et CO2e ; très utile pour le calcul mais sans traçabilité vers les services/applications qui causent ou justifient la consommation.
- **C.** Modéliser Electrical Energy comme Material et considérer que cela suffit à démontrer le gain carbone.
- **D.** Considérer qu'une migration vers OpenShift garantit par définition une baisse de CO2e.

### Correction P2-03
- **A — 5.** Le gain devient explicable et conditionné à des actions physiques réelles ; kgCO2e/kWh restent des mesures, pas des Materials.
- **B — 3.** Excellent inventaire de consommation, mais le concern architectural de causalité et de transformation reste incomplet.
- **C — 1.** Electrical Energy peut être Material selon le concern, mais cela ne constitue pas une démonstration de réduction.
- **D — 0.** Le changement de plateforme n'implique pas automatiquement un gain physique/carbone.

## P2-04 — GenAI Platform
Le CIO veut distinguer la capacité d'entreprise « AI-assisted Operations », l'assistant GenAI, le LLM, la base vectorielle, les données, la plateforme d'exécution et les exigences de sécurité.

Quelle proposition est la meilleure ?
- **A.** Capability au niveau Strategy ; Application Services/Components pour l'assistant et l'orchestration ; Data Objects pour prompts/contextes pertinents ; LLM runtime/vector DB/AI platform modélisés aux niveaux Application/Technology selon leur rôle ; Requirements sécurité/traçabilité reliés et vues cross-layer séparées par concern.
- **B.** Construire seulement une Application/Technology View détaillée des composants GenAI ; techniquement utile mais sans lien avec la Capability, les Goals et la gouvernance.
- **C.** Modéliser le LLM comme Capability « GPT » et y rattacher toutes les applications.
- **D.** Modéliser la base vectorielle comme Facility car elle stocke physiquement les embeddings.

### Correction P2-04
- **A — 5.** Sépare aptitude organisationnelle, solution applicative, données, plateforme et exigences.
- **B — 3.** Bon modèle solution mais insuffisant pour le concern CIO/enterprise architecture.
- **C — 1.** Le LLM est un moyen technique, pas l'aptitude organisationnelle elle-même.
- **D — 0.** Une base vectorielle n'est pas un site/bâtiment.

## P2-05 — Data Cutover / Source of Truth
Pendant la migration du Payment Ledger, l'ancien et le nouveau stockage coexistent. Le programme doit montrer quand le nouveau devient la source de vérité autoritative.

Quelle modélisation est la meilleure ?
- **A.** Plateau de coexistence, Gap d'ownership/autorité, Work Package de migration, Deliverables de données réconciliées, Implementation Event de bascule d'autorité, puis Plateau cible où le nouveau système est source de vérité.
- **B.** Utiliser Flow old→new et Access write/read pour représenter la copie et les usages ; techniquement précis, mais sans expliciter le moment de changement d'autorité.
- **C.** Ajouter un Requirement « New DB is source of truth » et ne pas représenter le cutover.
- **D.** Supprimer l'ancien Data Object du modèle dès le début de la migration pour éviter la duplication.

### Correction P2-05
- **A — 5.** Représente coexistence, qualité des données, gouvernance et changement d'autorité comme transformation.
- **B — 3.** Correct au niveau data-flow mais incomplet pour la gouvernance du source-of-truth.
- **C — 1.** Le Requirement décrit l'attendu, pas l'événement ni l'état architectural obtenu.
- **D — 0.** Le modèle doit refléter la réalité de coexistence tant qu'elle existe.

## P2-06 — Legacy Decommissioning
Après migration, le legacy reste allumé « au cas où ». Le sponsor veut s'assurer que coûts, risques, données archivées, licences et CMDB sont réellement traités.

Quelle réponse est la meilleure ?
- **A.** Work Package de decommissioning avec Deliverables d'archive/rétention, fermeture de dépendances, nettoyage licences/CMDB, Implementation Event d'arrêt, critères de rollback/exit et Plateau cible sans dépendance legacy.
- **B.** Ajouter une tâche « decommission legacy » à la roadmap ; utile mais insuffisante pour vérifier les résultats, dépendances et état final.
- **C.** Créer un Outcome « Legacy retired » sans modéliser les travaux nécessaires.
- **D.** Supprimer immédiatement le legacy de toutes les Views parce que la cible ne doit montrer que le futur.

### Correction P2-06
- **A — 5.** Rend la sortie mesurable et gouvernable ; le retrait devient une partie de l'architecture de transformation.
- **B — 3.** Bonne intention mais manque Deliverables, dépendances et preuve de l'état final.
- **C — 1.** Outcome décrit le résultat, pas comment il est atteint et vérifié.
- **D — 0.** Effacer le legacy trop tôt détruit la représentation de la réalité et des risques.

## P2-07 — Business ↔ Application Alignment
Le Responsable Paiements veut comprendre comment le Business Service Instant Payment est supporté par la plateforme applicative sans mélanger métier et technologie.

Quelle chaîne est la meilleure ?
- **A.** Business Process réalise Business Service ; Application Service sert/supporte le comportement métier ; Application Component réalise l'Application Service ; Artifact/Technology supportent ensuite le Component selon le concern.
- **B.** Relier directement Business Process → Application Service et montrer le Component ; la vue reste utile mais omet une partie de la sémantique métier du service.
- **C.** Relier Business Service directement au Node par Serving pour raccourcir la chaîne.
- **D.** Créer un Payment Orchestrator différent dans chaque View pour adapter son nom au stakeholder.

### Correction P2-07
- **A — 5.** Respecte les niveaux d'abstraction et conserve une traçabilité explicable.
- **B — 3.** Modèle souvent exploitable pour une Application Usage View, mais moins complet pour relier offre métier et réalisation.
- **C — 1.** Un lien direct peut masquer des dépendances essentielles ; Serving vers un Node n'exprime pas la bonne intention ici.
- **D — 0.** Les Views doivent réutiliser l'élément canonique.

## P2-08 — Relationship Repair
Une revue trouve : Realization utilisé pour « consomme », Flow utilisé pour « lit », Triggering utilisé pour « transfère », et Serving utilisé pour « exécute ».

Quelle méthode de correction est la meilleure ?
- **A.** Pour chaque lien : reformuler la question sémantique, choisir la relation, vérifier direction, puis légalité source/cible ; utiliser Serving/Access/Flow/Triggering/Assignment/Realization selon l'intention réelle.
- **B.** Utiliser temporairement Association uniquement pour les liens dont la sémantique reste réellement inconnue, avec une action de clarification ; raisonnable comme mesure provisoire mais pas comme état final.
- **C.** Choisir les flèches selon la disposition graphique gauche→droite afin d'améliorer la lecture.
- **D.** Retirer les directions et laisser chaque lecteur interpréter la relation.

### Correction P2-08
- **A — 5.** La validité combine sémantique, direction et source/cible.
- **B — 3.** Association peut servir de dernier recours provisoire, mais elle perd de la sémantique et doit être résolue.
- **C — 1.** La lisibilité graphique compte, mais elle ne détermine jamais la sémantique d'une relation.
- **D — 0.** La direction fait partie du sens de nombreuses relations.
