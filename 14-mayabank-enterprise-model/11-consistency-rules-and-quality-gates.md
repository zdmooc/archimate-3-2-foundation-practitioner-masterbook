# MayaBank — Consistency Rules & Quality Gates

Cette fiche définit les règles de cohérence minimales du modèle d’entreprise MayaBank. Elles servent à la revue manuelle aujourd’hui et pourront être automatisées plus tard dans les parties Archi / ArchiMate-as-Code.

## 1. Naming

Un même élément ne doit pas changer arbitrairement de nom entre deux vues.

Mauvais : `Payment Orchestrator`, `New Payment Core`, `Target Payment Engine` si les trois désignent exactement le même objet.

Des alias historiques peuvent être documentés, mais l’identité canonique reste stable.

## 2. Unique identity

Un élément majeur doit posséder une identité stable dans le référentiel, par exemple :

```text
MB-APP-002 Payment Orchestrator
```

La convention d’identifiant est locale, pas ArchiMate.

## 3. No orphan Requirement

Tout Requirement important doit être relié :

- à sa motivation lorsque connue ;
- aux éléments d’architecture qui le satisfont ;
- éventuellement aux Work Packages qui l’implémentent.

## 4. No orphan Work Package

Tout Work Package doit :

- réduire au moins un Gap ;
- produire un Deliverable ;
- contribuer à un Plateau ou changement cible.

## 5. No unexplained Technology

Un composant technologique majeur doit avoir un consumer ou une justification explicite.

```text
Kafka
→ Event Streaming Service
→ Consumers
```

Une plateforme installée sans consumer identifié est à challenger.

## 6. Application business relevance

Toute Application Component métier doit supporter :

- un Application Service ;
- un Business Process/Service ;
- ou une fonction transverse explicitement identifiée.

## 7. Data ownership

Chaque Data Object critique doit avoir :

- un owner/source of truth ;
- des readers/writers identifiés ;
- une règle de réplication ou projection lorsque nécessaire.

## 8. Event semantics

Chaque Application Event doit répondre :

- quel fait s’est produit ?
- qui le produit ?
- qui le consomme ?
- quel payload est associé ?
- quel comportement est déclenché ?

## 9. API semantics

Pour chaque API importante :

```text
Interface
→ exposes Service
→ provided by Component
→ consumed by Actor/Application
```

Éviter les rectangles `API` sans rôle sémantique.

## 10. Relationship precision

Préférer une relation précise lorsque la sémantique est connue :

- Serving plutôt qu’Association ;
- Access plutôt qu’une ligne générique vers une donnée ;
- Realization pour concrétiser ;
- Triggering pour la causalité ;
- Flow pour le transfert.

## 11. Relationship direction

Chaque relation directionnelle doit être lisible comme une phrase correcte.

```text
Payment Orchestration Service SERVES Execute Payment Process
```

Si la phrase inverse le fournisseur et le consommateur, la direction est probablement fausse.

## 12. Layer correctness

Exemples :

- Payment Orchestrator → Application ;
- OpenShift → Technology ;
- UPS → Physical ;
- Payment Order → Business passive structure ;
- Payment Transaction → Application passive structure.

Le type dépend du rôle architectural dans le concern.

## 13. View scope

Une vue doit documenter ce qu’elle exclut volontairement.

Exemple : une Executive View exclut généralement : topics, pods, DB tables, PVCs, routes internes.

## 14. Abstraction consistency

Éviter dans une même vue :

```text
Capability: Real-Time Payments
next to
Pod: payment-orchestrator-7d8f9
```

sans raison explicite. Les niveaux d’abstraction sont trop éloignés pour la plupart des concerns.

## 15. Baseline / Target lifecycle

Les éléments doivent être distinguables par :

- Plateau ;
- propriété lifecycle ;
- vues dédiées ;
- éventuellement naming contrôlé.

Éviter `Payment App OLD`, `Payment App NEW`, `Payment App NEW2` sans identité maîtrisée.

## 16. Temporary element lifecycle

Tout composant temporaire doit posséder :

- une raison d’existence ;
- un Work Package créateur ;
- le Plateau où il existe ;
- une condition de retrait.

Exemple : Legacy Adapter de coexistence.

## 17. Critical service resilience

Tout Business Service classé critique doit avoir :

- dépendances applicatives identifiées ;
- dépendances technologiques identifiées ;
- RTO/RPO si applicable ;
- site/DR dependencies ;
- observability coverage.

## 18. Security coverage

Toute interface exposée critique doit être reliée à des concerns/requirements couvrant :

- authentication ;
- authorization ;
- encryption ;
- secrets/keys ;
- audit.

## 19. Observability coverage

Toute chaîne critique doit répondre :

- où naît le correlation ID ?
- où est-il propagé ?
- quelles métriques indiquent un incident ?
- qui reçoit l’alerte ?

## 20. Migration integrity

Pour chaque migration wave :

- scope ;
- source of truth ;
- routing ;
- reconciliation ;
- rollback ;
- exit criteria ;
- decommission dependency.

## 21. Green IT evidence

Tout gain annoncé doit être traçable à au moins un changement réel :

- asset retired ;
- asset avoided ;
- capacity consolidated ;
- utilization improved ;
- energy usage reduced ;
- lifecycle extended.

## 22. No dangling Gap

Un Gap doit relier deux états ou exprimer une différence d’architecture pertinente. Un Gap sans Work Package ou décision de traitement reste une dette non pilotée.

## 23. No fake capability

Interdits comme réflexe :

```text
Capability: Kafka
Capability: OpenShift
Capability: Oracle
```

Préférer l’aptitude : Event Streaming Platform Engineering, Cloud-Native Delivery, Database Operations, etc.

## 24. No fake service

Ne pas créer un Service simplement parce qu’un composant possède une fonction interne. Un Service représente un comportement explicitement exposé à son environnement.

## 25. Viewpoint fitness

Chaque vue doit répondre :

- qui regarde ?
- quelle question ?
- quelle décision ?
- quel niveau de détail ?

## 26. Relationship matrix check

Avant de publier un modèle formel, vérifier les relations source/cible dans la matrice ArchiMate 3.2 lorsque le cas n’est pas évident.

## 27. Derived relationship caution

Une relation dérivée ne doit pas être inventée intuitivement. Elle doit être supportée par un chemin valide selon les règles du langage.

## 28. Model review gate

Une vue critique est `READY` seulement si :

- objectif explicite ;
- stakeholder identifié ;
- éléments canoniques réutilisés ;
- relations lisibles ;
- niveaux d’abstraction cohérents ;
- aucune dépendance critique non expliquée ;
- source of truth claire lorsque la donnée est concernée ;
- Baseline/Target/Plateau clair lorsque la transformation est concernée.

## 29. Enterprise model gate

Le modèle MayaBank global est cohérent si l’on peut partir :

- d’un Goal et descendre vers la solution ;
- d’une technologie et remonter vers sa justification ;
- d’un incident et remonter vers le Business Service impacté ;
- d’un Work Package et retrouver le Gap traité ;
- d’un Data Object et retrouver owner/readers/writers.

## 30. Règle finale

> **Un modèle de qualité n’est pas seulement syntaxiquement valide : il doit être traçable, non ambigu et utile à une décision.**