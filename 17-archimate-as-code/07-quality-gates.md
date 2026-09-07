# 7 — Quality Gates et validation

## 7.1 Trois niveaux de validation

### Niveau A — syntaxe

Le fichier compile-t-il ?

### Niveau B — conventions

Respecte-t-il les conventions du repository ?

### Niveau C — sémantique

Le modèle exprime-t-il une architecture ArchiMate correcte et utile ?

Un pipeline sérieux ne doit jamais confondre ces trois niveaux.

## 7.2 Quality Gate A — syntaxe

Contrôles automatisables :

- `@startuml` ;
- `@enduml` ;
- include présent ;
- macros reconnues ;
- IDs uniques dans le fichier ;
- rendu PlantUML réussi.

## 7.3 Quality Gate B — conventions MayaBank

### Nom du fichier

Pattern recommandé :

```text
^(EXEC|BUS|APP|TEC|SEC|OPS|MIG|GREEN)-[0-9]{2}-.*\.puml$
```

### Préfixes d’éléments

```text
DRV_ Driver
GOAL_ Goal
REQ_ Requirement
CAP_ Capability
BP_ Business Process
BS_ Business Service
AC_ Application Component
AS_ Application Service
AI_ Application Interface
DO_ Data Object
TS_ Technology Service
SS_ System Software
N_ Node
FAC_ Facility
WP_ Work Package
PL_ Plateau
GAP_ Gap
```

## 7.4 Quality Gate C — sémantique

Checklist humaine :

- le stakeholder et le concern sont-ils identifiables ?
- le viewpoint est-il approprié ?
- les éléments répondent-ils à la question ?
- les types sont-ils corrects ?
- les relations sont-elles justifiées ?
- les directions sont-elles correctes ?
- la vue mélange-t-elle Baseline et Target sans l’indiquer ?
- le niveau de détail est-il cohérent ?

## 7.5 Détection de mauvaises habitudes

Exemples de règles internes :

```text
FAIL: label contains "Kafka" and macro is Application_Event
WARN: filename starts TEC but contains no Technology_* element
WARN: more than 40 modeled elements in one view
WARN: more than 60 relations in one view
WARN: Association used > N times
```

Les seuils sont locaux et doivent être ajustés au contexte.

## 7.6 Validation des relations critiques

Lors de la revue :

```text
Component realizes Service
Service serves Consumer
Behavior accesses Data Object
Event triggers Behavior
Flow transports information/value between behaviors/structures
Work Package realizes Deliverable/outcomes as modeled
```

Toujours revenir à la sémantique du langage plutôt qu’à l’apparence de la flèche.

## 7.7 Traceability gate

Pour une vue Target structurante, demander au minimum une trace vers :

```text
Requirement
or
Capability / Goal
```

Pour une vue Migration :

```text
Gap
→ Work Package
→ Deliverable / Implementation Event
→ Plateau
```

## 7.8 Green IT gate

Une affirmation de gain environnemental doit distinguer :

- mesure externe ;
- hypothèse ;
- Assessment ;
- Goal/Requirement ;
- changement architectural ;
- mécanisme réel de réduction.

Exemple : migrer vers OpenShift n’est pas en soi une preuve de baisse CO2e.

## 7.9 Security gate

Une vue sécurité doit éviter de réduire IAM à un produit.

On cherche les chaînes :

```text
Requirement
→ Identity / Authorization Service
→ System Software
→ Interface / Application / Workload
```

## 7.10 Definition of Done

```text
[ ] compile
[ ] naming
[ ] scope
[ ] semantics
[ ] relationships
[ ] traceability
[ ] readability
[ ] review
[ ] generated artifact
```
