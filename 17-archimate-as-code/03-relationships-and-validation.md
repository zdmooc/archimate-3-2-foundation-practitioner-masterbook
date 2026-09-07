# 3 — Relations, direction et validation sémantique

## 3.1 Le code rend la direction explicite

Dans PlantUML, les relations sont écrites avec source puis cible :

```plantuml
Rel_Realization(AC_PaymentOrchestrator, AS_PaymentOrchestration)
```

Cela force à se poser la bonne question :

> Quelle entité réalise quelle entité ?

## 3.2 Exemples MayaBank

### Realization

```plantuml
Application_Component(AC_PaymentOrchestrator, "Payment Orchestrator")
Application_Service(AS_PaymentOrchestration, "Payment Orchestration Service")
Rel_Realization(AC_PaymentOrchestrator, AS_PaymentOrchestration)
```

### Serving

```plantuml
Application_Service(AS_PaymentOrchestration, "Payment Orchestration Service")
Business_Process(BP_ExecutePayment, "Execute Instant Payment")
Rel_Serving(AS_PaymentOrchestration, BP_ExecutePayment)
```

### Access

```plantuml
Application_Component(AC_PaymentOrchestrator, "Payment Orchestrator")
Application_DataObject(DO_PaymentInstruction, "Payment Instruction")
Rel_Access(AC_PaymentOrchestrator, DO_PaymentInstruction)
```

### Triggering

```plantuml
Application_Event(AE_OrderReceived, "Payment Order Received")
Application_Process(AP_Validate, "Validate Payment")
Rel_Triggering(AE_OrderReceived, AP_Validate)
```

### Flow

```plantuml
Application_Component(AC_Orchestrator, "Payment Orchestrator")
Application_Component(AC_Fraud, "Fraud Engine")
Rel_Flow(AC_Orchestrator, AC_Fraud, "Payment risk context")
```

## 3.3 Orientation graphique ≠ direction sémantique

Les variantes `_Up`, `_Down`, `_Left`, `_Right` peuvent guider le rendu.

Exemple :

```plantuml
Rel_Realization_Up(AC_PaymentOrchestrator, AS_PaymentOrchestration)
```

`Up` est un indice de layout. La sémantique reste `AC_PaymentOrchestrator realizes AS_PaymentOrchestration`.

Ne jamais inverser source/cible juste pour obtenir une flèche visuellement plus agréable.

## 3.4 Validation en trois questions

Avant chaque relation :

1. **Sémantique** — quel sens veux-je exprimer ?
2. **Source/cible** — la direction est-elle correcte ?
3. **Métamodèle** — cette relation est-elle autorisée entre ces types ?

## 3.5 PlantUML ne remplace pas la relation matrix

La compilation syntaxique ne doit pas être assimilée à une validation exhaustive du métamodèle ArchiMate.

Une CI doit donc distinguer :

```text
syntax validation
≠
semantic validation
```

## 3.6 Règles de revue recommandées

Toute PR architecture doit contrôler au minimum :

- Realization vs Serving ;
- Assignment vs Realization ;
- Access vs Flow ;
- Triggering vs Flow ;
- Composition vs Aggregation ;
- Event vs Service ;
- Interface vs Service ;
- Application Component vs System Software ;
- Work Package vs Course of Action.

## 3.7 Relationships as Code

Une modification de relation devient visible dans Git.

Avant :

```plantuml
Rel_Serving(AS_FraudDecision, BP_ExecutePayment)
```

Après :

```plantuml
Rel_Serving(AS_FraudDecision, BP_CheckFraud)
```

Le diff documente un changement de dépendance architectural précis.

## 3.8 Anti-pattern

```plantuml
Rel_Association(A, B)
```

utilisé parce que l’architecte ne sait pas choisir.

Association reste possible lorsqu’une relation plus spécifique n’est pas justifiée, mais ne doit pas devenir une échappatoire à la réflexion sémantique.

## 3.9 Quality Gate relationnel

Une vue importante n’est approuvée que si chaque relation structurante peut être lue sous forme de phrase :

```text
A realizes B
A serves B
A accesses B
A triggers B
A flows to B
A is assigned to B
```

Si la phrase n’a pas de sens, la relation doit être revue.
