# Practitioner Checklist — Modeling Patterns

Avant de considérer un modèle prêt pour revue, vérifier les points suivants.

## 1. Intention

- [ ] Stakeholder identifié.
- [ ] Concern explicite.
- [ ] Question à laquelle la vue répond clairement formulée.
- [ ] Scope défini.
- [ ] Niveau d’abstraction cohérent.

## 2. Éléments

- [ ] Actor et Role ne sont pas confondus.
- [ ] Capability n’est pas utilisée à la place d’un Process ou d’une Application.
- [ ] Function / Process / Interaction sont choisis selon leur sémantique.
- [ ] Service et Interface sont distincts.
- [ ] Business Object, Data Object et Artifact sont distingués.
- [ ] Application Component et System Software sont distingués.
- [ ] Node, Device et Equipment sont distingués.
- [ ] Events métier, applicatifs, techniques et de migration sont correctement classés.
- [ ] Course of Action et Work Package sont distincts.
- [ ] Goal, Outcome, Requirement et Constraint sont correctement séparés.

## 3. Relations

- [ ] Chaque relation exprime un sens réel.
- [ ] La direction est correcte.
- [ ] Source et cible sont compatibles.
- [ ] Assignment n’est pas utilisé comme Serving.
- [ ] Serving n’est pas utilisé comme Realization.
- [ ] Access n’est pas utilisé comme Flow.
- [ ] Triggering n’est pas utilisé comme Flow.
- [ ] Association n’est pas utilisée par défaut.
- [ ] Les Junctions sont homogènes et justifiées.
- [ ] Les Derived Relationships ont été vérifiées avant simplification.

## 4. Cross-layer

- [ ] La chaîne Business → Application est compréhensible.
- [ ] La chaîne Application → Technology est compréhensible.
- [ ] Les données sont traçables du concept métier à leur réalisation.
- [ ] Les requirements peuvent être reliés à ce qui les satisfait.
- [ ] La transformation relie gaps, work packages, deliverables et plateaus.
- [ ] Les vues d’impact ne sautent pas arbitrairement plusieurs couches.

## 5. Architecture moderne

- [ ] Une API n’est pas réduite à un seul concept générique.
- [ ] Event, payload, topic et broker sont distingués.
- [ ] OpenShift/Kubernetes sont modélisés au niveau utile, sans reproduire tout Kubernetes.
- [ ] Database engine et Data Object sont distincts.
- [ ] IAM distingue service, interface, plateforme et requirements.
- [ ] HA/DR sont soutenus par des dépendances visibles, pas simplement par un label.
- [ ] Observability est reliée aux composants et aux outcomes/SLO utiles.
- [ ] Green IT sépare architecture et métriques environnementales.

## 6. Communication

- [ ] La vue peut être comprise sans explication de 20 minutes.
- [ ] Les relations importantes sont lisibles.
- [ ] Les éléments inutiles ont été retirés.
- [ ] Les noms utilisent un vocabulaire stable.
- [ ] Une légende existe si des conventions locales sont utilisées.
- [ ] La vue répond réellement au concern initial.

## 7. Test final Practitioner

Être capable d’expliquer oralement :

1. pourquoi chaque type d’élément a été choisi ;
2. pourquoi chaque relation majeure a été choisie ;
3. quelles alternatives ont été rejetées ;
4. comment le modèle traverse les couches ;
5. comment une autre vue serait produite pour un autre stakeholder.

> Si ces cinq explications sont solides, le modèle est généralement beaucoup plus proche d’un niveau Practitioner que d’un simple dessin d’architecture.
