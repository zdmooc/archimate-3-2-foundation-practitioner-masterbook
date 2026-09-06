# Practitioner Checklist — Implementation & Migration

Utilise cette checklist pour valider une vue de transformation avant de la présenter.

## 1. Baseline

- [ ] La Baseline est clairement identifiable.
- [ ] Elle contient uniquement les éléments utiles au concern.
- [ ] Les dépendances legacy critiques sont visibles.

## 2. Target

- [ ] Le Target Plateau est explicite.
- [ ] Les éléments obsolètes ont disparu de la cible.
- [ ] Les nouvelles responsabilités/sources de vérité sont compréhensibles.

## 3. Gaps

- [ ] Chaque différence structurante est explicitée.
- [ ] Les Gaps ne sont pas formulés comme des solutions.
- [ ] Les Gaps sont reliables à des Requirements/Goals/Assessments.

## 4. Work Packages

- [ ] Chaque Work Package traite un besoin architectural réel.
- [ ] Le niveau de granularité est cohérent.
- [ ] Les dépendances importantes sont visibles.
- [ ] Les travaux de décommissionnement sont inclus.

## 5. Deliverables

- [ ] Chaque Work Package majeur produit des résultats vérifiables.
- [ ] Les Deliverables ne sont pas confondus avec les Artifacts techniques.
- [ ] Security, operations, DR et observability sont inclus lorsque nécessaires.

## 6. Implementation Events

- [ ] Seuls les jalons qui changent réellement l’état sont modélisés.
- [ ] Les cutovers importants sont visibles.
- [ ] Les bascules de source of truth sont explicites.

## 7. Transition Plateaus

- [ ] Les états hybrides significatifs sont représentés.
- [ ] Chaque composant temporaire a un chemin de sortie.
- [ ] Le modèle évite un “eternal hybrid”.

## 8. Rollback

- [ ] Les Requirements de rollback sont explicites si nécessaires.
- [ ] Les Deliverables de rollback/reconciliation sont prévus.
- [ ] Le plateau de retour possible est compréhensible.

## 9. Data

- [ ] La source of truth est claire à chaque Plateau.
- [ ] Les étapes initial load / delta / cutover / archive sont cohérentes.
- [ ] La réconciliation est prévue.

## 10. Governance

- [ ] Requirements → Work Packages → Deliverables sont traçables.
- [ ] Les gates de conformité importants sont identifiables.
- [ ] Les écarts d’implémentation peuvent être analysés.

## 11. TOGAF

- [ ] Phase E : options, gaps, work packages et plateaus sont cohérents.
- [ ] Phase F : ordre, priorité et migration plan sont compréhensibles.
- [ ] Phase G : conformité et architecture governance sont possibles.

## 12. Lisibilité

- [ ] La vue répond au concern du stakeholder.
- [ ] Elle ne ressemble pas à un Gantt détaillé.
- [ ] Baseline → Transition → Target se comprend en moins de deux minutes.
- [ ] Le lecteur peut expliquer pourquoi chaque Work Package existe.

## Critère final

Une bonne vue doit permettre de répondre sans ambiguïté :

> **D’où partons-nous, qu’est-ce qui manque, que devons-nous faire, quel état atteignons-nous ensuite, et comment supprimons-nous la dette temporaire ou legacy ?**