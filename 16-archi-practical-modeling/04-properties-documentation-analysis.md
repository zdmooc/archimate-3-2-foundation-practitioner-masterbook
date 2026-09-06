# Propriétés, documentation, recherche et analyse

## 1. Le dessin n'est pas le référentiel

Une architecture maintenable a besoin de métadonnées.

Pour les éléments importants, renseigner :

- documentation ;
- owner ;
- canonical-id ;
- lifecycle ;
- criticality ;
- domain ;
- source of truth ;
- review date si nécessaire.

## 2. Exemple

`Application Component: Payment Orchestrator`

```text
canonical-id = MB-APP-002
owner = Payments Domain
lifecycle = target
criticality = critical
domain = payments
```

Documentation :

> Orchestre le cycle de traitement d'un paiement temps réel et coordonne validation, fraude, statut et clearing.

## 3. Documentation utile

Bonne documentation :

- responsabilité ;
- frontière ;
- hypothèses ;
- exclusions ;
- ownership.

Mauvaise documentation :

> Composant de paiement.

## 4. Propriétés vs concepts ArchiMate

Une propriété n'est pas un nouvel élément.

Exemple :

```text
RTO = 15 min
RPO = 0
```

peut être stocké comme propriété d'analyse, mais si le RTO/RPO est une exigence architecturale traçable, créer aussi un `Requirement` approprié.

## 5. Recherche

Avant de créer un élément :

- rechercher son nom ;
- vérifier les variantes ;
- vérifier le type ;
- vérifier le canonical-id.

La recherche est aussi utile pour :

- trouver toutes les vues utilisant un élément ;
- retrouver les dépendances ;
- détecter les doublons.

## 6. Analyse d'impact

Question : que se passe-t-il si `Event Streaming Service` est indisponible ?

Explorer :

```text
Technology Service
→ Application Components
→ Application Services
→ Business Processes
→ Business Services
```

Puis créer une vue d'impact dédiée au lieu de modifier une vue générale.

## 7. Analyse inverse

Question : pourquoi avons-nous besoin d'OpenShift ?

Remonter :

```text
OpenShift Platform
→ Technology Services
→ Application Components
→ Business Services
→ Capabilities
→ Goals
```

## 8. Properties pour la gouvernance

Exemples :

```text
status = approved | proposed | deprecated
lifecycle = baseline | transition | target | retired
confidentiality = public | internal | restricted
criticality = low | medium | high | critical
```

Ne pas multiplier les vocabulaires locaux sans dictionnaire.

## 9. Traceability

Le modèle doit permettre de répondre :

- quelle requirement justifie ce composant ?
- quel business service dépend de cette plateforme ?
- quel work package ferme ce gap ?
- quel plateau contient cet élément ?
- quelles vues exposent cette dépendance ?

## 10. Validation sémantique

Une vue lisible peut être fausse.

Contrôles :

1. bon type d'élément ;
2. bonne relation ;
3. bonne direction ;
4. source/cible compatibles ;
5. niveau d'abstraction cohérent ;
6. concept canonique réutilisé.

## 11. Validation métier

Demander :

- le nom correspond-il au vocabulaire métier ?
- l'owner est-il correct ?
- la dépendance est-elle réelle ?
- l'état Baseline/Target est-il exact ?

## 12. Definition of Done

Un élément critique n'est pas terminé tant qu'il n'est pas :

- correctement typé ;
- nommé ;
- documenté ;
- possédé ;
- relié ;
- réutilisé ;
- analysable.
