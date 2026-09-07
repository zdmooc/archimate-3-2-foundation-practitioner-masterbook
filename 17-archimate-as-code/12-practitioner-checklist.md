# 12 — Practitioner Checklist — ArchiMate as Code

## Concern

- [ ] Je sais quel stakeholder lira cette vue.
- [ ] Je peux formuler le concern en une phrase.
- [ ] Le fichier ne contient que les éléments nécessaires.

## Élément

- [ ] Chaque concept est correctement typé.
- [ ] Je ne choisis pas le type à partir du nom d’un produit.
- [ ] Les identifiants sont stables et explicites.

## Relations

- [ ] La sémantique de chaque relation structurante est justifiée.
- [ ] La source et la cible sont correctes.
- [ ] Je distingue Realization / Serving.
- [ ] Je distingue Access / Flow.
- [ ] Je distingue Triggering / Flow.
- [ ] Les variantes de layout n’inversent pas le sens logique.

## Architecture state

- [ ] Baseline, Transition et Target ne sont pas mélangés sans indication.
- [ ] Les composants temporaires sont identifiés.
- [ ] Les dépendances legacy résiduelles sont visibles si nécessaires.

## Repository

- [ ] Le nom du fichier suit la convention.
- [ ] Le dossier correspond au concern dominant.
- [ ] Je n’ai pas dupliqué un concept canonique sans raison.
- [ ] Le commentaire explique les décisions importantes.

## Compilation

- [ ] Tous les `.puml` compilent.
- [ ] La version PlantUML est maîtrisée.
- [ ] Le rendu SVG est lisible.
- [ ] Les artefacts générés sont séparés des sources.

## CI/CD

- [ ] Les modifications `.puml` déclenchent le pipeline.
- [ ] Le pipeline échoue sur erreur syntaxique.
- [ ] Les sorties sont publiées ou accessibles.
- [ ] La CI ne prétend pas remplacer la revue sémantique.

## Documentation

- [ ] Le contexte est documenté en Markdown lorsque nécessaire.
- [ ] Les ADR expliquent les décisions.
- [ ] Les vues montrent les conséquences architecturales.
- [ ] Les requirements importants sont traçables.

## MayaBank

Je sais construire et expliquer :

- [ ] EXEC-01 — Target Traceability
- [ ] APP-01 — Payment Orchestration
- [ ] TEC-01 — Payment Runtime
- [ ] SEC-01 — Payment Identity
- [ ] MIG-01 — Payment Roadmap

## Entretien

Je sais répondre clairement à :

- [ ] Qu’est-ce qu’Architecture as Code ?
- [ ] Pourquoi PlantUML avec ArchiMate ?
- [ ] Pourquoi ne pas utiliser seulement Archi ?
- [ ] Que valide réellement la CI ?
- [ ] Comment gérez-vous la source de vérité ?
- [ ] Comment empêchez-vous les incohérences sémantiques ?
- [ ] Comment versionnez-vous Baseline/Target ?
- [ ] Comment reliez-vous architecture et delivery ?

## Critère Practitioner

Je suis prêt lorsque je peux partir d’un concern réel, sélectionner les concepts et relations corrects, produire une vue as-code lisible, la versionner, la faire compiler et **défendre les choix sémantiques indépendamment de l’outil**.
