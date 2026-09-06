# Practitioner Checklist — Physical Layer

Avant de valider une vue Physical, vérifier :

## Sémantique

- [ ] les serveurs IT sont modélisés comme Devices lorsqu’ils jouent un rôle de ressource informatique ;
- [ ] Equipment est réservé aux machines/outils physiques pertinents ;
- [ ] Facility représente bien un lieu ou environnement physique ;
- [ ] Communication Network et Distribution Network ne sont pas confondus ;
- [ ] Material représente une ressource physique, pas une donnée ou un fichier.

## Granularité

- [ ] la vue répond à un concern précis ;
- [ ] elle ne descend pas inutilement au niveau câble/prise/rack ;
- [ ] elle montre uniquement les dépendances qui influencent une décision.

## Cross-layer

- [ ] les Devices sont reliés à la Technology Architecture ;
- [ ] la localisation physique est compréhensible ;
- [ ] l’impact sur les services applicatifs/métier peut être tracé.

## Résilience

- [ ] les Facilities redondées sont réellement distinctes ;
- [ ] les dépendances électriques communes sont identifiées ;
- [ ] les dépendances de refroidissement communes sont identifiées ;
- [ ] les réseaux inter-site et autres SPOF sont visibles ;
- [ ] les sauvegardes ne partagent pas un risque physique non maîtrisé.

## Green IT

- [ ] les métriques environnementales restent des propriétés/données mesurées ;
- [ ] les hypothèses de gain sont séparées des résultats mesurés ;
- [ ] la fabrication et l’usage peuvent être distingués si le concern l’exige ;
- [ ] l’impact de consolidation est démontré par des données, pas seulement par le diagramme.

> **Practitioner = choisir le bon concept, au bon niveau, pour répondre à une vraie question d’architecture.**