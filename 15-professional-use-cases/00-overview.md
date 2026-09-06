# Partie XV — Use cases professionnels : appliquer ArchiMate à des architectures réelles

Cette partie transforme les concepts du masterbook en **cas d’architecture indépendants, réutilisables en mission, en entretien et en préparation Practitioner**.

Chaque use case suit la même logique :

```text
Business need
→ Drivers / Goals / Requirements
→ Capabilities
→ Business behavior
→ Application services & components
→ Data / Events
→ Technology services & platforms
→ Security / Observability / Resilience
→ Baseline / Target / Gaps
→ Work Packages / Plateaus
→ Views by stakeholder
```

## Les 12 cas

1. Instant Payment
2. API Banking
3. Kafka / Event Streaming
4. OpenShift / Kubernetes
5. Cloud Migration
6. IAM / Zero Trust
7. Fraud & Risk
8. Data Platform
9. Observability / SRE
10. Multi-site / Disaster Recovery
11. GenAI Platform
12. Green IT

## Ce que l’on cherche à apprendre

Cette partie ne cherche pas à mémoriser des produits techniques. Elle montre comment **raisonner avec ArchiMate quand le langage du terrain utilise des mots comme API, Kafka, cluster, IAM, DR, data lake, GPU ou FinOps**.

La question centrale reste :

> Quel rôle architectural cet objet joue-t-il dans le concern de la vue ?

## Structure d’un use case

Chaque chapitre contient :

- contexte métier ;
- stakeholders et concerns ;
- drivers, goals et requirements ;
- capacités ;
- modèle Business ;
- modèle Application ;
- modèle Data / Event ;
- modèle Technology ;
- sécurité / observabilité / résilience ;
- Baseline / Target ;
- Gaps ;
- Work Packages ;
- viewpoints utiles ;
- anti-patterns ;
- questions d’entretien ;
- mini-cas Practitioner.

## Règle de lecture

Les chaînes textuelles du type :

```text
A → B → C
```

sont des simplifications pédagogiques. Elles ne remplacent pas la vérification de la **relation ArchiMate exacte** entre les éléments.

## La valeur professionnelle

À la fin de cette partie, on doit pouvoir prendre une mission réelle comme :

> « migrer une plateforme de paiement monolithique vers OpenShift avec Kafka, API management, IAM, observabilité et PRA multi-site »

et la transformer en :

- concerns ;
- vues ;
- modèle cross-layer ;
- roadmap ;
- impacts ;
- risques ;
- décisions ;
- traceability.

## Règle d’or

> **Un use case n’est pas un dessin de technologie. C’est une chaîne de décisions traçables du besoin métier jusqu’à l’implémentation et à la transformation.**
