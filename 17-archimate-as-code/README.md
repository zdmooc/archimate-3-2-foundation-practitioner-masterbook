# Partie XVII — ArchiMate as Code

Cette partie montre comment versionner et automatiser des vues ArchiMate avec PlantUML, Git et CI/CD.

## Chapitres

1. [Vue d’ensemble](00-overview.md)
2. [Architecture as Code — principes](01-architecture-as-code-principles.md)
3. [Syntaxe ArchiMate-PlantUML](02-archimate-plantuml-syntax.md)
4. [Relations et validation](03-relationships-and-validation.md)
5. [Structure Git du référentiel](04-repository-structure.md)
6. [Génération locale](05-local-generation.md)
7. [CI/CD](06-ci-cd.md)
8. [Quality Gates](07-quality-gates.md)
9. [Documentation automatisée](08-automated-documentation.md)
10. [Archi vs PlantUML](09-archi-vs-code.md)
11. [50 exercices et corrections](10-exercises-and-corrections.md)
12. [Quick Reference](11-quick-reference.md)
13. [Practitioner Checklist](12-practitioner-checklist.md)
14. [Sources techniques vérifiées](13-technical-sources.md)

## Modèles MayaBank as-code

- `models/executive/EXEC-01-payment-target-traceability.puml`
- `models/application/APP-01-payment-orchestration.puml`
- `models/technology/TEC-01-payment-runtime.puml`
- `models/security/SEC-01-payment-identity.puml`
- `models/migration/MIG-01-payment-roadmap.puml`

## Automatisation

```bash
bash 17-archimate-as-code/scripts/check.sh
bash 17-archimate-as-code/scripts/render.sh
```

Workflow :

```text
.github/workflows/archimate-as-code.yml
```

## Résultat attendu

À la fin de cette partie, on doit pouvoir :

- écrire une vue ArchiMate en PlantUML ;
- choisir les bonnes macros ;
- contrôler direction et sémantique des relations ;
- versionner les vues dans Git ;
- compiler localement ;
- automatiser la validation et le rendu ;
- comparer Archi et PlantUML sans les opposer ;
- défendre un workflow Architecture as Code en entretien ou en mission.
