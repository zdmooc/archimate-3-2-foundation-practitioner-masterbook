# MayaBank ArchiMate as Code — model catalog

Les cinq vues de départ sont volontairement focalisées.

| View | Concern principal |
|---|---|
| EXEC-01 | traçabilité Goal→Capability→Business→Application→Technology |
| APP-01 | orchestration du paiement et dépendances applicatives |
| TEC-01 | runtime OpenShift/Kafka/DB et sites |
| SEC-01 | identité, autorisation et secrets |
| MIG-01 | Baseline→Transition→Target |

## Règle

Ces fichiers sont des **views-as-code**. Ils ne prétendent pas remplacer le modèle natif complet de la Partie XVI.

## Commandes

```bash
bash 17-archimate-as-code/scripts/check.sh
bash 17-archimate-as-code/scripts/render.sh
```
