# Application Layer — Quick Reference

| Question | Élément |
|---|---|
| Quelle structure logicielle ? | Application Component |
| Quel collectif de composants ? | Application Collaboration |
| Quel point d’accès ? | Application Interface |
| Quelle responsabilité interne ? | Application Function |
| Quelle séquence automatisée ? | Application Process |
| Quel comportement collectif ? | Application Interaction |
| Quel changement d’état ? | Application Event |
| Quel comportement exposé ? | Application Service |
| Quelle donnée logique ? | Data Object |

## Confusions essentielles

- **Component ≠ Service** : structure logicielle vs comportement exposé.
- **Service ≠ Interface** : ce qui est fourni vs point d’accès.
- **Function ≠ Process** : responsabilité vs séquence.
- **Process ≠ Interaction** : comportement orienté résultat vs comportement collectif.
- **Event ≠ Payload** : fait/changement d’état vs donnée structurée.
- **Business Object ≠ Data Object** : concept métier vs représentation logique applicative.
- **Data Object ≠ Artifact** : logique vs réalisation physique/technologique.
- **Application Component ≠ System Software** : logiciel métier/applicatif vs plateforme/runtime.

## Chaîne MayaBank

```text
Business Process
Execute Instant Payment
   ↓ uses
Application Service
Payment Orchestration Service
   ↓ realized by
Application Component
Payment Orchestrator
   ↓ accesses
Data Object
Payment Transaction
   ↓ produces
Application Event
Payment Authorized
```

## API

```text
Component → Service → Interface
```

Exemple :

```text
Payment Orchestrator
→ Payment Initiation Service
→ Payment REST API
```

## Event-driven

```text
Application Event = fait
Data Object = payload logique
Technology Service = transport
System Software = Kafka
```

## Réflexe d’examen et de modélisation

Avant de choisir un élément, demander :

1. structure ou comportement ?
2. interne ou exposé ?
3. responsabilité, séquence ou coopération ?
4. changement d’état ou donnée ?
5. niveau métier, applicatif ou technologique ?
