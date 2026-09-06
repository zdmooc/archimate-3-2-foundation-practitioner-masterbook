# Quick Reference — TOGAF ↔ ArchiMate

## Le principe

```text
TOGAF = METHOD + GOVERNANCE
ArchiMate = MODEL + VISUALIZATION + ANALYSIS
```

## ADM → ArchiMate

| ADM | Réflexe ArchiMate |
|---|---|
| Preliminary | Stakeholders, Roles, Capability, Principles |
| A | Driver → Assessment → Goal/Outcome → Capability |
| B | Actor/Role → Process/Function → Service → Business Object |
| C Data | Business Object → Data Object + Access/Flow |
| C Application | Component → Function → Service → Interface |
| D | Technology Service → System Software → Node/Device/Artifact |
| E | Gap → Course of Action / Work Package → Plateau |
| F | Work Package → Deliverable/Event → Transition Plateaus |
| G | Requirement → target → implementation traceability |
| H | new Driver → Assessment → impact → change |
| Requirements | Requirement/Constraint transversalement tracés |

## Les confusions à connaître

```text
Capability ≠ Application
Business Object ≠ Data Object
Application Component ≠ System Software
Course of Action ≠ Work Package
Deliverable TOGAF ≠ automatiquement Deliverable ArchiMate
Plateau ≠ Environment
Gap ≠ Requirement
Phase E ≠ Phase F
Phase G ≠ project delivery
```

## Chaîne de traçabilité

```text
Driver
→ Goal
→ Requirement
→ Capability
→ Business
→ Application
→ Technology
→ Gap
→ Work Package
→ Deliverable
→ Plateau
```

## Vues recommandées

```text
Phase A → Motivation / Strategy / Capability
Phase B → Organization / Business Process / Product
Phase C → Information Structure / Application Usage / Cooperation
Phase D → Technology / Deployment
Phase E-F → Implementation & Migration
Phase G → Requirements + Implementation traceability
Phase H → Motivation + Impact analysis
```

## Trois phrases examen

**TOGAF tells you what architecture work to do and govern.**

**ArchiMate helps you model, communicate, and analyze the architecture.**

**Use the concern to choose the view; do not map phases mechanically to diagrams.**