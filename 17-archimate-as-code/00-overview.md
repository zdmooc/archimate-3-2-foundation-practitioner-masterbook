# Partie XVII — ArchiMate as Code

Cette partie transforme ArchiMate en **artefact versionnable, reproductible et automatisable**.

L’objectif n’est pas de remplacer Archi. L’objectif est de disposer d’un deuxième mode de travail adapté à Git, à la revue de code, à la génération documentaire et à la CI/CD.

## Chaîne de travail

```text
Architecture concern
→ View as code (.puml)
→ Git commit
→ validation syntaxique
→ rendu SVG/PNG
→ publication documentaire
→ revue
→ évolution
```

## Pourquoi ArchiMate as Code ?

- diff Git lisible ;
- historique précis ;
- revue par pull request ;
- génération répétable ;
- documentation automatisable ;
- partage simple dans un dépôt ;
- intégration CI ;
- cohérence entre architecture et ingénierie.

## Ce que cela ne fait pas automatiquement

Un diagramme qui compile n’est pas nécessairement un bon modèle ArchiMate.

PlantUML valide surtout la syntaxe du diagramme. La qualité sémantique reste à contrôler :

- bon type d’élément ;
- bonne relation ;
- bonne direction ;
- bon niveau d’abstraction ;
- bon concern ;
- bonne lisibilité.

## Standard retenu

Les modèles utilisent :

```text
!include <archimate/Archimate>
```

La bibliothèque `Archimate-PlantUML` fournit les macros ArchiMate, les relations, le layout, les groupings et les thèmes.

## Structure de la partie

1. Foundations et architecture-as-code
2. Syntaxe ArchiMate-PlantUML
3. Relations et direction
4. Structure de dépôt
5. Catalogue de modèles MayaBank
6. Génération locale
7. CI/CD GitHub Actions
8. Validation et quality gates
9. Documentation automatisée
10. Archi ↔ PlantUML
11. Exercices
12. Quick Reference
13. Practitioner Checklist

## Règle d’or

> **Le code ne dispense jamais de comprendre le métamodèle. Il rend la modélisation traçable et automatisable.**
