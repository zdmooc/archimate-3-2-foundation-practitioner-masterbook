# Cheat Sheet 07 — Views & Viewpoints

## Chaîne mentale

```text
Stakeholder
→ Concern
→ Viewpoint
→ View
→ Architecture Model
```

### Viewpoint
Le **cadre/convention** qui indique comment construire une vue pour répondre à certains concerns.

### View
La **représentation concrète** issue du modèle, sélectionnée pour un stakeholder/concern.

Mémo :

```text
Viewpoint = HOW TO BUILD
View      = WHAT YOU SEE
```

## Règle principale

Un diagramme n’est pas bon parce qu’il contient beaucoup d’éléments. Il est bon s’il répond à une **question de décision explicite**.

## Viewpoints utiles

| Viewpoint / type de vue | Question typique |
|---|---|
| Motivation | Pourquoi transformer ? Quels goals/requirements ? |
| Strategy | Quelles capabilities/value streams ? |
| Capability | Quelles aptitudes renforcer ? |
| Organization | Qui porte quelles responsabilités ? |
| Business Process Cooperation | Comment les processus coopèrent-ils ? |
| Product | Quelle offre/service/contract produit de la valeur ? |
| Application Cooperation | Comment les applications collaborent-elles ? |
| Application Usage | Quelles applications servent quels comportements métier ? |
| Information Structure | Comment les objets d’information sont-ils structurés ? |
| Technology | Quelle plateforme/runtime/réseau ? |
| Technology Usage | Comment les applications utilisent-elles la technologie ? |
| Layered | Quelle traçabilité cross-layer ? |
| Implementation & Migration | Comment passe-t-on baseline → target ? |

## Méthode de conception en 7 étapes

1. Identifier le **stakeholder**.
2. Écrire son **concern sous forme de question**.
3. Choisir le **viewpoint** ou une vue adaptée.
4. Réutiliser les **éléments canoniques existants**.
5. Garder seulement les éléments nécessaires à la décision.
6. Vérifier les relations et directions.
7. Vérifier que le lecteur peut répondre à la question sans explication orale excessive.

## Exemples MayaBank

### CIO — Executive Transformation View
Concern : où en est la transformation et quelles capacités/business outcomes sont impactés ?

Afficher : Goals, Capabilities, Plateaus, major Gaps, Work Packages.

### Head of Payments — Payment Service View
Concern : comment le paiement temps réel est-il fourni de bout en bout ?

Afficher : Business Service, Process, Application Services/Components, dépendances technologiques critiques.

### CISO — Security View
Concern : où sont les exigences d’authentification, secrets et trust boundaries ?

Afficher : Requirements, IAM/Identity services, API interfaces, components, technology services, secrets dependencies.

### Platform Architect — OpenShift Runtime View
Concern : quels workloads dépendent de quels services de plateforme ?

Afficher : Application Components, Artifacts, Nodes, System Software, Technology Services, Networks.

### Operations — Incident Impact View
Concern : si Kafka/cluster/site tombe, quels services métier sont touchés ?

Afficher : Facility/Node/System Software → Technology Service → Application Component/Service → Business Process/Service.

### Program Director — Migration Roadmap
Concern : quels gaps et travaux mènent à quel Plateau ?

Afficher : Gaps, Work Packages, Deliverables, Implementation Events, Plateaus.

### Green IT — Sustainability Impact View
Concern : quels changements techniques provoquent réellement une baisse de ressources/empreinte ?

Afficher : Drivers/Goals, Work Packages, Technology/Physical assets, decommissioning events, Outcomes/measure properties.

## Anti-patterns de vue

### Le diagramme unique géant
Symptôme : 100+ éléments, tous les layers, aucune question précise.
Correction : découper par stakeholder/concern.

### La vue dupliquée
Symptôme : recréer les mêmes composants dans chaque diagramme.
Correction : réutiliser les mêmes éléments du référentiel.

### La vue “inventory only”
Symptôme : boîtes sans relations.
Correction : ajouter seulement les relations nécessaires pour répondre au concern.

### La vue pilotée par l’outil
Symptôme : utiliser un viewpoint parce qu’il existe dans la palette.
Correction : partir du concern, pas du menu.

### La vue qui mélange abstraction
Symptôme : Goal, serveur physique, API et sprint au même niveau visuel sans hiérarchie.
Correction : organiser par layer, aspect ou parcours de décision.

## Tailored View
Une vue personnalisée est acceptable si elle reste sémantiquement cohérente. Un stakeholder n’a pas besoin qu’un nom officiel de viewpoint couvre exactement son besoin.

## Practitioner : choisir la meilleure vue

Préférer la réponse qui :
- répond exactement au concern ;
- évite le bruit ;
- réutilise le modèle canonique ;
- garde la traçabilité nécessaire ;
- ne sacrifie pas la sémantique pour la présentation ;
- choisit une vue cross-layer seulement si la question est cross-layer.

## Quality Gate d’une vue

Une vue est prête si :
- stakeholder identifié ;
- concern formulé ;
- titre orienté question/décision ;
- 5–30 éléments typiquement, sauf justification ;
- aucune copie sémantique d’un élément existant ;
- relations compréhensibles ;
- légende/propriétés si nécessaire ;
- niveau d’abstraction homogène ou explicitement structuré ;
- conclusion/decision support lisible.