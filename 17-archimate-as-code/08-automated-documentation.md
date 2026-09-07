# 8 — Documentation automatisée

## 8.1 Objectif

Le modèle as-code doit pouvoir alimenter la documentation sans duplication manuelle excessive.

Chaîne cible :

```text
.puml source
→ SVG
→ page Markdown
→ site de documentation
```

## 8.2 Markdown autour du modèle

Chaque vue importante peut avoir une page compagnon :

```text
APP-01-payment-orchestration.puml
APP-01-payment-orchestration.md
```

La page Markdown explique :

- stakeholder ;
- concern ;
- scope ;
- architecture state ;
- décisions ;
- hypothèses ;
- risques ;
- liens vers ADR / requirements.

## 8.3 Ne pas dupliquer le diagramme en prose

Mauvais :

> Payment Orchestrator est relié à Fraud Engine qui est relié à Kafka...

Meilleur :

> La décision principale est de séparer orchestration, fraude et propagation d’événements afin de réduire le couplage et de rendre la migration progressive.

Le diagramme montre la structure ; le texte explique les décisions.

## 8.4 Catalogue automatique

Un script peut parcourir :

```text
models/**/*.puml
```

et produire un index :

```markdown
- APP-01 Payment Orchestration
- TEC-01 Payment Runtime
- SEC-01 Payment Identity
- MIG-01 Payment Roadmap
```

## 8.5 Publication GitHub

Trois stratégies :

### A — Sources uniquement

Le lecteur ouvre `.puml`.

### B — Sources + SVG committés

Simple mais génère des diffs binaires/textuels SVG.

### C — Sources + artefacts CI

Recommandé pour un workflow propre.

## 8.6 Documentation de version

Pour chaque publication importante :

```text
Architecture Baseline v1
Architecture Target v1
Architecture Target v2
```

Git conserve l’historique ; les labels et tags peuvent matérialiser les jalons.

## 8.7 ADR et ArchiMate

Un ADR répond à :

```text
Pourquoi avons-nous choisi cette décision ?
```

Une vue ArchiMate répond plutôt à :

```text
Quelle structure/réalisation/dépendance résulte de cette décision ?
```

Les deux sont complémentaires.

Exemple :

```text
ADR-004: adopt event streaming for payment status propagation
↓
APP-02-payment-events.puml
TEC-02-kafka-runtime.puml
```

## 8.8 Requirements et architecture

On peut relier une page de requirement :

```text
REQ-RES-001 Multi-site recovery
```

aux vues :

```text
TEC-03-dr-topology.puml
MIG-03-dr-validation.puml
```

## 8.9 Génération d’un site

MkDocs, Docusaurus ou un autre générateur peuvent être utilisés, mais ils ne sont pas obligatoires dans ce masterbook.

L’architecture minimale reste :

```text
Git + Markdown + PlantUML + CI
```

## 8.10 Documentation durable

Une bonne documentation générée doit survivre à l’architecte qui l’a créée :

- noms explicites ;
- sources texte ;
- commandes reproductibles ;
- conventions documentées ;
- pas de dépendance à un poste local unique.
