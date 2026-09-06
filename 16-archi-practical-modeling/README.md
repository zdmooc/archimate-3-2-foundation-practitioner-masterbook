# Partie XVI — Archi et modélisation pratique

Cette partie transforme les concepts ArchiMate du masterbook en un **référentiel réellement manipulable dans Archi 5.8**.

## Chapitres

1. [Vue d'ensemble](00-overview.md)
2. [Installation et Workbench](01-installation-and-workbench.md)
3. [Organiser un grand modèle](02-organizing-large-models.md)
4. [Views et workflow de diagrammes](03-views-and-diagram-workflow.md)
5. [Properties, documentation et analyse](04-properties-documentation-analysis.md)
6. [Import, export et formats d'échange](05-import-export-and-exchange.md)
7. [Collaboration coArchi + Git](06-collaboration-coarchi-git.md)
8. [LAB MayaBank](07-mayabank-hands-on-lab.md)
9. [50 exercices corrigés](08-exercises-and-corrections.md)
10. [Quick Reference](09-quick-reference.md)
11. [Practitioner Checklist](10-practitioner-checklist.md)

## Modèle natif

- [`models/mayabank-enterprise.archimate`](models/mayabank-enterprise.archimate)

Le modèle contient une baseline de concepts MayaBank, des relations et trois views de départ :

- `EXEC-01 Payment Target Traceability`
- `TEC-01 Payment Runtime`
- `MIG-01 Payment Transformation Roadmap`

## Version cible

**Archi 5.8 GA**.

Le fichier natif utilise le format XML `.archimate` d'Archi et est destiné à être ouvert, enrichi puis versionné avec Git/coArchi.

## Principe central

> **Le référentiel porte les éléments et relations canoniques ; les Views ne sont que des projections adaptées aux concerns.**
