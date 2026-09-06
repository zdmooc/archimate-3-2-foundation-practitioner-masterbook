# MayaBank — histoire d’entreprise, scope et architecture questions

Cette fiche décrit le contexte d’entreprise du cas MayaBank avant de détailler les couches. Elle sert de point d’entrée commun aux vues métier, applicatives, techniques et de transformation.

## 1. Contexte

MayaBank exploite une plateforme de paiements historique conçue par accumulation de composants successifs. La plateforme reste critique mais devient difficile à faire évoluer.

Les symptômes observés sont :

- mise sur le marché lente ;
- intégrations point-à-point ;
- forte centralisation autour d’un noyau historique ;
- procédures de déploiement largement manuelles ;
- difficulté à corréler un paiement de bout en bout ;
- dépendances techniques peu visibles ;
- capacité limitée à isoler les pannes ;
- montée en charge coûteuse ;
- coexistence de plusieurs modèles de données ;
- décommissionnement difficile.

## 2. Déclencheurs

Les principaux Drivers du programme sont :

- croissance des paiements instantanés ;
- attentes de disponibilité 24/7 ;
- réduction du time-to-market ;
- besoin d’observabilité de bout en bout ;
- exigences cyber croissantes ;
- réduction du risque opérationnel ;
- rationalisation du patrimoine ;
- réduction de l’empreinte physique et énergétique du legacy.

## 3. Assessments

Exemples d’Assessments :

- l’architecture actuelle ne scale pas de façon suffisamment élastique ;
- le MTTR est dégradé par l’absence de corrélation distribuée ;
- certaines intégrations sont trop couplées ;
- des secrets sont encore gérés de manière statique ;
- plusieurs fonctions dépendent du même socle legacy ;
- le coût de coexistence augmente si le décommissionnement est retardé.

## 4. Goals

- fournir des paiements temps réel résilients ;
- améliorer l’observabilité ;
- réduire le risque cyber ;
- réduire le temps de déploiement ;
- découpler progressivement le legacy ;
- accélérer le changement fonctionnel ;
- améliorer l’efficience de l’infrastructure.

## 5. Outcomes

Exemples d’Outcomes mesurables :

- réduction du MTTR ;
- augmentation du taux de succès des paiements ;
- diminution du nombre de secrets statiques ;
- augmentation de la fréquence de déploiement ;
- réduction du nombre d’intégrations point-à-point ;
- extinction de serveurs legacy après migration ;
- réduction de la capacité inutilisée.

## 6. Principes

### Observable by Default
Toute transaction critique doit être corrélable de bout en bout.

### Security by Design
Authentification, autorisation, chiffrement et gestion des secrets sont intégrés dans l’architecture cible.

### API First
Les capacités synchrones exposées doivent être contractualisées et gouvernées.

### Event-Driven Where Appropriate
L’asynchronisme est utilisé lorsqu’il améliore découplage, résilience ou extensibilité ; pas par dogme.

### Automate the Platform
Déploiements, configuration et contrôles de plateforme doivent être automatisés autant que possible.

### Decommission is Part of Migration
Une migration n’est pas terminée tant que le legacy inutile n’est pas retiré.

## 7. Contraintes

- coexistence avec le legacy pendant la transition ;
- continuité de service pendant les migrations ;
- conservation des obligations de traçabilité ;
- contraintes de localisation de données selon le domaine ;
- fenêtres de cutover limitées ;
- compatibilité temporaire avec certains protocoles historiques.

## 8. Questions d’architecture

Le référentiel MayaBank doit répondre à au moins ces questions :

### Stratégie
- quelles capabilities sont prioritaires ?
- quels gaps sont les plus critiques ?

### Métier
- quels processus sont directement touchés ?
- quels rôles et services métier sont concernés ?

### Données
- quelle donnée est source of truth ?
- qui lit, écrit, transforme et réplique cette donnée ?

### Application
- quelles applications coopèrent ?
- quelles interfaces sont synchrones ?
- quels événements sont asynchrones ?

### Technologie
- quels services technologiques supportent quelles applications ?
- quels composants sont partagés et donc à fort blast radius ?

### Résilience
- quels éléments doivent être actifs sur deux sites ?
- quelles dépendances empêchent un RTO/RPO cible ?

### Sécurité
- où sont les frontières de confiance ?
- qui authentifie qui ?
- où vivent les secrets ?

### Migration
- quel flux migre en premier ?
- à quel moment le nouveau système devient source of truth ?
- quel rollback reste possible ?

### Green IT
- quels assets physiques disparaissent réellement après migration ?
- le gain vient-il d’une vraie extinction ou seulement d’un déplacement de charge ?

## 9. Scope fonctionnel

Le scope principal est le parcours :

```text
Initiate
→ Validate
→ Assess Risk
→ Execute
→ Confirm
→ Resolve Exception
→ Reconcile
```

Les autres domaines bancaires sont hors scope sauf lorsqu’ils constituent une dépendance nécessaire.

## 10. Scope technique

La cible de référence comprend :

- OpenShift ;
- APIs ;
- Kafka ;
- services applicatifs découplés ;
- PostgreSQL et intégration Oracle ;
- IAM/OIDC ;
- observabilité distribuée ;
- GitOps ;
- multi-site / DR ;
- stockage objet ;
- secrets externalisés.

## 11. Hors scope volontaire

Cette partie ne cherche pas à :

- reproduire un core banking complet ;
- détailler chaque écran ;
- modéliser chaque table ;
- lister tous les pods ;
- remplacer une CMDB ;
- remplacer Jira ou un planning projet.

Le niveau de détail reste architectural.

## 12. Règle de cadrage

> **Chaque élément doit exister parce qu’il aide à répondre à une question d’architecture.**

Un élément qui n’aide aucune décision, analyse, traçabilité ou communication n’a probablement pas sa place dans la vue considérée.