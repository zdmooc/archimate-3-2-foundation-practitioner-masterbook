# 4 — Structure Git d’un référentiel ArchiMate as Code

## 4.1 Arborescence recommandée

```text
17-archimate-as-code/
├── README.md
├── 00-overview.md
├── 01-architecture-as-code-principles.md
├── 02-archimate-plantuml-syntax.md
├── 03-relationships-and-validation.md
├── 04-repository-structure.md
├── 05-local-generation.md
├── 06-ci-cd.md
├── 07-quality-gates.md
├── 08-automated-documentation.md
├── 09-archi-vs-code.md
├── 10-exercises-and-corrections.md
├── 11-quick-reference.md
├── 12-practitioner-checklist.md
├── models/
│   ├── executive/
│   ├── application/
│   ├── technology/
│   ├── security/
│   └── migration/
├── scripts/
│   ├── render.sh
│   └── check.sh
└── generated/
    └── README.md
```

## 4.2 Fichiers source vs générés

Les sources `.puml` sont la vérité versionnée.

Les SVG/PNG peuvent :

- être générés à la demande ;
- être publiés comme artefacts CI ;
- être committés seulement si le projet en a réellement besoin.

Éviter les diffs binaires inutiles.

## 4.3 Convention de nommage

```text
EXEC-01-payment-target-traceability.puml
APP-01-payment-orchestration.puml
TEC-01-payment-runtime.puml
SEC-01-payment-identity.puml
MIG-01-payment-roadmap.puml
```

Le préfixe indique le concern dominant.

## 4.4 Identifiants stables

Les identifiants PlantUML doivent rester stables tant que le concept reste le même.

Exemple :

```plantuml
Application_Component(AC_PaymentOrchestrator, "Payment Orchestrator")
```

Un renommage métier du label ne nécessite pas forcément de changer `AC_PaymentOrchestrator`.

## 4.5 Duplication contrôlée

PlantUML ne constitue pas automatiquement un repository sémantique partagé entre tous les fichiers.

Pour éviter la dérive :

- conventions communes ;
- snippets/includes locaux si utiles ;
- registre canonique Markdown ou YAML ;
- revue des noms ;
- scripts de lint personnalisés.

## 4.6 Includes internes

On peut factoriser les définitions répétées :

```text
includes/
├── common-elements.puml
├── common-style.puml
└── common-layout.puml
```

Mais il faut éviter un include gigantesque contenant toute l’entreprise : chaque vue deviendrait difficile à comprendre et à maintenir.

## 4.7 Branching

Pour un référentiel d’architecture :

```text
main
↑
feature/payment-target
feature/dr-redesign
feature/iam-modernization
```

Chaque branche doit correspondre à une évolution compréhensible.

## 4.8 Commit messages

Exemples :

```text
arch: add payment orchestration target view
arch: model Kafka runtime dependency
arch: update DR transition plateau
arch: remove legacy payment interface
```

## 4.9 Pull Request checklist

- concern identifié ;
- vue lisible ;
- éléments correctement typés ;
- relations relues ;
- pas de duplication involontaire ;
- compilation réussie ;
- impact migration analysé ;
- décision/documentation mise à jour.

## 4.10 Ownership

Un `CODEOWNERS` peut imposer une revue d’architecture sur certains chemins, par exemple :

```text
17-archimate-as-code/models/technology/  @platform-architecture
17-archimate-as-code/models/security/    @security-architecture
```

Dans un dépôt personnel, la même logique sert de modèle de gouvernance à expliquer en entretien.
