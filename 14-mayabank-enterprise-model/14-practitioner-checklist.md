# MayaBank — Practitioner Checklist

Utiliser cette checklist avant de considérer le modèle d’entreprise MayaBank comme cohérent pour une revue Practitioner ou professionnelle.

## Motivation & Strategy

- [ ] Les Drivers sont distincts des Goals.
- [ ] Les Assessments expriment des constats, pas des solutions.
- [ ] Les Goals ont des Outcomes ou critères observables lorsque pertinent.
- [ ] Les Requirements sont reliés à leur motivation lorsque connue.
- [ ] Les Capabilities expriment des aptitudes, pas des produits techniques.
- [ ] Les Courses of Action restent stratégiques et distinctes des Work Packages.

## Business

- [ ] Actor vs Role est correct.
- [ ] Process vs Function est choisi selon le concern.
- [ ] Les Services sont réalisés par des behaviors pertinents.
- [ ] Les Business Objects restent au niveau métier.
- [ ] Les Products ne sont pas confondus avec des applications.

## Application

- [ ] Chaque Application Service important possède un provider.
- [ ] Les Interfaces sont distinctes des Services.
- [ ] Les composants ont des responsabilités explicites.
- [ ] Les Data Objects critiques ont un owner/source of truth.
- [ ] Les readers/writers sont identifiés.
- [ ] Les Application Events sont distincts des payloads et de Kafka.
- [ ] Les interactions synchrones/asynchrones sont explicites.

## Technology

- [ ] OpenShift/Kafka/PostgreSQL/etc. sont modélisés au bon niveau.
- [ ] Les Technology Services ont des consumers.
- [ ] Les Artifacts sont distincts des Application Components.
- [ ] Les Nodes sont distincts des Devices physiques.
- [ ] Les Communication Networks sont distincts des Distribution Networks.

## Security

- [ ] Authentication est couverte.
- [ ] Authorization est couverte.
- [ ] Secrets/keys sont couverts.
- [ ] Encryption/trust boundaries sont visibles lorsque nécessaires.
- [ ] Les Requirements sécurité sont traçables vers les solutions.

## Observability

- [ ] Correlation end-to-end existe pour les parcours critiques.
- [ ] Metrics/logs/traces ont des Technology Services correspondants.
- [ ] Les consumers opérationnels sont identifiés.
- [ ] Les SLO/Requirements sont reliés aux Business Services critiques.

## HA / DR

- [ ] RTO/RPO sont reliés aux services critiques.
- [ ] Les dépendances de données sont présentes.
- [ ] Les réplications et chemins inter-site sont visibles.
- [ ] Les SPOF technologiques et physiques sont analysés.
- [ ] Le DR inclut application + data + platform + network.

## Physical / Green IT

- [ ] Device vs Equipment est correct.
- [ ] Facility est utilisé pour les sites/environnements physiques.
- [ ] Les dépendances énergie/refroidissement sont visibles si le concern l’exige.
- [ ] Les gains Green IT sont reliés à des effets physiques/mesurables.
- [ ] La coexistence temporaire est prise en compte.

## Implementation & Migration

- [ ] Baseline est explicite.
- [ ] Target est explicite.
- [ ] Les Gaps sont identifiés.
- [ ] Chaque Work Package traite un Gap ou une cible.
- [ ] Les Deliverables sont distincts des Artifacts.
- [ ] Les Implementation Events marquent des changements significatifs.
- [ ] Les Transition Plateaus représentent de vrais états stables.
- [ ] Source of truth par Plateau est connue.
- [ ] Cutover et rollback sont modélisés.
- [ ] Decommissioning possède des exit criteria.

## Relations

- [ ] Assignment, Realization et Serving ne sont pas confondus.
- [ ] Access et Flow ne sont pas confondus.
- [ ] Triggering et Flow ne sont pas confondus.
- [ ] Les directions des relations sont vérifiées.
- [ ] Association n’est pas utilisée par défaut lorsqu’une relation plus précise existe.
- [ ] Les relations dérivées sont justifiées.

## Views & Viewpoints

- [ ] Chaque View a un stakeholder principal.
- [ ] Chaque View répond à un concern.
- [ ] Le niveau d’abstraction est cohérent.
- [ ] Les exclusions sont volontaires.
- [ ] La vue permet une décision ou une analyse identifiable.

## Repository/model governance

- [ ] Les éléments canoniques sont réutilisés plutôt que dupliqués.
- [ ] Les noms sont stables.
- [ ] Les identifiants locaux sont uniques lorsque utilisés.
- [ ] Les composants temporaires ont un lifecycle.
- [ ] Les éléments orphelins ont été recherchés.

## Reverse traceability tests

Être capable de partir de :

- [ ] Kafka et expliquer pourquoi il existe.
- [ ] Payment Orchestrator et retrouver les Business Services supportés.
- [ ] Payment Transaction et retrouver readers/writers/source of truth.
- [ ] Site A et identifier les services métier potentiellement impactés.
- [ ] un Work Package et retrouver Goal/Gap/Plateau.
- [ ] un Requirement et retrouver les éléments qui le satisfont.

## Final Practitioner test

Pour un scénario inconnu, être capable de :

1. identifier le concern ;
2. sélectionner le bon niveau ;
3. choisir les bons concepts ;
4. choisir les relations ;
5. construire une trace cross-layer ;
6. choisir la bonne View ;
7. détecter les informations manquantes ;
8. éviter d’inventer une relation ou un fait.

> **Si le modèle permet ces huit opérations de manière cohérente, il devient un véritable outil d’architecture et pas seulement une collection de diagrammes.**