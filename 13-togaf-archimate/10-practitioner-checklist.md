# Practitioner Checklist — TOGAF ↔ ArchiMate

Avant de valider un modèle utilisé dans un contexte TOGAF :

## Purpose
- [ ] le moment ADM est identifié ;
- [ ] la décision attendue est claire ;
- [ ] les stakeholders sont connus ;
- [ ] les concerns sont explicites.

## Semantics
- [ ] les éléments ArchiMate correspondent au rôle architectural réel ;
- [ ] aucune Capability n'est utilisée comme simple nom d'application ;
- [ ] Business Object / Data Object / Artifact sont distingués ;
- [ ] Course of Action / Work Package sont distingués ;
- [ ] Plateau / Environment sont distingués ;
- [ ] Gap / Requirement / Assessment sont distingués.

## Relations
- [ ] Assignment, Realization et Serving sont utilisés correctement ;
- [ ] Access et Flow ne sont pas confondus ;
- [ ] Triggering et Flow ne sont pas confondus ;
- [ ] les relations cross-layer sont justifiées ;
- [ ] les relations dérivées ne sont pas inventées.

## ADM traceability
- [ ] Phase A permet de remonter aux Drivers/Goals ;
- [ ] B–D restent reliées entre elles ;
- [ ] les Gaps viennent d'une comparaison Baseline/Target ;
- [ ] les Work Packages correspondent aux écarts à traiter ;
- [ ] les Plateaus expriment des états d'architecture significatifs ;
- [ ] les Requirements restent traçables vers les éléments réalisés ;
- [ ] Phase H peut analyser l'impact des changements.

## Views
- [ ] une View répond à un concern ;
- [ ] le niveau de détail correspond à l'audience ;
- [ ] une phase TOGAF n'est pas artificiellement réduite à un diagramme unique ;
- [ ] les vues réutilisent un modèle cohérent plutôt que des dessins déconnectés.

## Governance
- [ ] le modèle n'est pas présenté comme remplacement de l'ADM ;
- [ ] le modèle n'est pas présenté comme remplacement de l'Architecture Contract ;
- [ ] les termes TOGAF et ArchiMate identiques ou proches sont distingués par contexte ;
- [ ] les exemples technologiques restent des exemples, pas des prescriptions TOGAF/ArchiMate.

## Test final

Peux-tu expliquer en moins de 60 secondes :

```text
Pourquoi ?
→ quoi changer ?
→ quelle cible ?
→ quels gaps ?
→ quels work packages ?
→ quels plateaus ?
→ comment vérifier l'implémentation ?
→ comment gérer le prochain changement ?
```

Si oui, le modèle TOGAF ↔ ArchiMate est probablement exploitable.