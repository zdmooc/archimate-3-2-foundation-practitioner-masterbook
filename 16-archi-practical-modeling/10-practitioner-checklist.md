# Practitioner Checklist — Archi pratique

Avant de considérer un modèle prêt pour une revue Practitioner ou une utilisation professionnelle :

## Référentiel
- [ ] éléments canoniques uniques
- [ ] noms explicites
- [ ] dossiers cohérents
- [ ] doublons recherchés
- [ ] owners définis
- [ ] lifecycle renseigné

## Sémantique
- [ ] type correct pour chaque élément
- [ ] relation correcte
- [ ] direction correcte
- [ ] source/cible compatibles
- [ ] service ≠ interface
- [ ] event ≠ payload
- [ ] application ≠ technology
- [ ] node ≠ device ≠ equipment

## Views
- [ ] stakeholder identifié
- [ ] concern explicite
- [ ] viewpoint adapté
- [ ] niveau d'abstraction cohérent
- [ ] densité maîtrisée
- [ ] légende si une convention visuelle est utilisée
- [ ] pas de diagramme « tout-en-un »

## Documentation
- [ ] responsabilité documentée
- [ ] scope documenté
- [ ] properties contrôlées
- [ ] canonical-id si nécessaire
- [ ] ADR/source liés si utile

## Transformation
- [ ] Baseline explicite
- [ ] Target explicite
- [ ] Transition Plateau si coexistence
- [ ] Gaps identifiés
- [ ] Work Packages reliés
- [ ] decommissioning représenté

## Analyse
- [ ] impact analysis possible
- [ ] reverse traceability possible
- [ ] dépendances critiques visibles
- [ ] sécurité/observabilité/résilience analysables

## Collaboration
- [ ] sauvegarde valide
- [ ] modèle ouvre sans erreur
- [ ] Git/coArchi workflow défini
- [ ] message de commit explicite
- [ ] review sémantique avant merge

## Test final

Prenez un élément comme `Payment Orchestrator` et vérifiez que vous pouvez répondre rapidement :

1. Pourquoi existe-t-il ?
2. Quel métier supporte-t-il ?
3. Quels services fournit-il ?
4. Quelles données utilise-t-il ?
5. Où s'exécute-t-il ?
6. De quelles technologies dépend-il ?
7. Quel est son lifecycle ?
8. Quel work package l'introduit ?
9. Quelles views l'utilisent ?
10. Quel impact s'il tombe ?

Si ces réponses sont difficiles, le référentiel n'est pas encore suffisamment structuré.
