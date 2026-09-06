# Application Layer — Practitioner Checklist

Avant de considérer une vue applicative comme correcte, vérifier :

- [ ] le métier supporté est identifiable ;
- [ ] les Application Components représentent bien des structures logicielles ;
- [ ] les Application Services représentent des comportements exposés ;
- [ ] les Application Interfaces représentent des points d’accès ;
- [ ] Function / Process / Interaction sont utilisés selon le bon sens ;
- [ ] les Application Events représentent des changements d’état ;
- [ ] les payloads sont séparés des événements ;
- [ ] les Data Objects sont logiques et séparés des Artifacts ;
- [ ] Kafka/OpenShift/DBMS ne sont pas confondus avec les applications métier ;
- [ ] les intégrations synchrones et asynchrones sont distinguées ;
- [ ] les providers et consumers de services sont explicites ;
- [ ] les principaux readers/writers de données sont visibles ;
- [ ] les sources of truth sont documentées ;
- [ ] les Requirements critiques sont traçables ;
- [ ] Baseline et Target utilisent une granularité comparable ;
- [ ] les gaps sont explicites ;
- [ ] les vues restent adaptées à leur audience ;
- [ ] aucun diagramme ne dépend uniquement de flèches génériques ;
- [ ] le niveau de détail ArchiMate reste architectural et ne remplace pas OpenAPI, BPMN ou UML détaillé.

## Test oral de 60 secondes

Être capable d’expliquer une architecture avec la chaîne :

```text
Business need
→ Application Service
→ Application Component
→ Interface / Event
→ Data Object
→ Technology dependency
```

Si cette chaîne est claire, la vue est généralement exploitable en revue d’architecture.
