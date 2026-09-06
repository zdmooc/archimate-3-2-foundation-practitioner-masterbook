# Practitioner Checklist — Use cases professionnels

Avant de considérer un use case comme correctement modélisé, vérifier les points suivants.

## 1. Concern et stakeholder

- [ ] Le stakeholder principal est identifié.
- [ ] Le concern est formulé comme une question décisionnelle.
- [ ] Le niveau de détail correspond à l'audience.
- [ ] La vue ne mélange pas plusieurs concerns sans nécessité.

## 2. Motivation

- [ ] Les drivers expliquent pourquoi le changement est nécessaire.
- [ ] Les assessments expriment les constats utiles.
- [ ] Les goals décrivent les états souhaités.
- [ ] Les requirements/constraints sont distincts des goals.
- [ ] Les principles sont utilisés comme règles durables, pas comme tâches.

## 3. Strategy

- [ ] Les capabilities sont des aptitudes, pas des produits.
- [ ] Les value streams décrivent la création de valeur, pas un workflow technique.
- [ ] Les courses of action sont distinctes des Work Packages.

## 4. Business

- [ ] Actor et Role sont distingués.
- [ ] Process et Function sont choisis selon le concern.
- [ ] Service et comportement interne sont séparés.
- [ ] Les Business Objects sont des concepts métier.

## 5. Application

- [ ] Component, Service et Interface sont distingués.
- [ ] Une API n'est pas typée automatiquement.
- [ ] Les événements ne sont pas confondus avec topics/payloads.
- [ ] Les Data Objects sont distincts des databases.
- [ ] Les consumers/providers sont explicites.

## 6. Technology

- [ ] Technology Service et System Software sont distingués.
- [ ] Node et Device sont distingués.
- [ ] Artifacts et composants logiques sont distingués.
- [ ] Cloud/OpenShift/Kafka/DB ne sont pas représentés comme un seul rectangle générique si le concern exige plus.

## 7. Security

- [ ] Authentication et authorization sont distinguées.
- [ ] Identity, secrets, certificates et PAM sont séparés.
- [ ] Les requirements sont tracés vers les services/contrôles.
- [ ] Les dépendances de sécurité critiques sont visibles.

## 8. Data

- [ ] Business Object, Data Object et Artifact sont distingués.
- [ ] Ownership et lineage sont modélisés si le concern le demande.
- [ ] Retention/lifecycle sont tracés aux services de stockage.
- [ ] Les copies inutiles et sources of truth sont identifiables.

## 9. Observability

- [ ] Metrics/logs/traces sont rattachés à des services pertinents.
- [ ] SLO/SLI ne sont pas inventés comme types ArchiMate.
- [ ] Une panne technique peut être tracée jusqu'au métier.
- [ ] Le service owner est identifiable si nécessaire.

## 10. Resilience

- [ ] HA et DR sont distingués.
- [ ] RTO/RPO sont explicités comme requirements/properties.
- [ ] Les dépendances réseau/IAM/DNS/secrets/backup sont prises en compte.
- [ ] La perte d'un site peut être analysée end-to-end.

## 11. Transformation

- [ ] Baseline et Target existent lorsque le use case implique un changement.
- [ ] Les Gaps sont explicités.
- [ ] Les Work Packages sont reliés au changement architectural.
- [ ] Les Transition Plateaus sont représentés si une coexistence existe.
- [ ] Les Implementation Events importants sont présents.
- [ ] Le decommissioning est explicite lorsque le legacy disparaît.

## 12. Green IT / FinOps

- [ ] Les valeurs coût/carbone/énergie sont des propriétés/mesures.
- [ ] Les gains annoncés sont reliés à des changements physiques ou de consommation réels.
- [ ] L'évitement et le decommissioning sont distingués d'un simple déplacement de workloads.
- [ ] La valeur métier est examinée avant l'optimisation technique d'un actif obsolète.

## 13. Relations

- [ ] Chaque flèche a une sémantique explicable.
- [ ] La direction est correcte.
- [ ] `Association` n'est pas utilisée pour éviter de réfléchir.
- [ ] `Serving`, `Realization`, `Assignment`, `Access`, `Flow` et `Triggering` ne sont pas confondus.
- [ ] Les relations dérivées importantes sont vérifiées avant d'être affirmées.

## 14. Qualité de la vue

- [ ] Une question principale est résolue.
- [ ] Les éléments inutiles sont masqués.
- [ ] Les niveaux d'abstraction ne sont pas mélangés sans raison.
- [ ] Les noms sont stables et réutilisés entre vues.
- [ ] Les légendes/propriétés sont compréhensibles.

## 15. Test final Practitioner

Pour chaque use case, être capable de répondre sans hésiter :

1. **Pourquoi cette architecture existe-t-elle ?**
2. **Quelle capability est en jeu ?**
3. **Quel business behavior est supporté ?**
4. **Quel Application Service est fourni ?**
5. **Quel composant le réalise ?**
6. **Quelles données/événements sont utilisés ?**
7. **Quels Technology Services sont consommés ?**
8. **Où sont les points de risque ?**
9. **Quelle vue choisir pour chaque stakeholder ?**
10. **Comment passer de la Baseline à la Target ?**

Si ces dix réponses sont traçables dans le modèle, le use case est au niveau attendu d'un **modèle d'architecture exploitable**, pas d'un simple diagramme technique.
