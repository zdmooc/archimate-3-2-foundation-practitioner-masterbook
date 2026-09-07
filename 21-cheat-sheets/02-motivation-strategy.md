# Cheat Sheet 02 — Motivation & Strategy

## Motivation

| Élément | Question | Exemple MayaBank | À ne pas confondre avec |
|---|---|---|---|
| Stakeholder | Qui a un intérêt / concern ? | CIO, CISO, Head of Payments | Business Actor |
| Driver | Qu’est-ce qui pousse au changement ? | Instant Payment Regulation | Goal |
| Assessment | Que constatons-nous ? | Legacy latency too high | Gap |
| Goal | Quel état souhaité ? | Resilient Real-Time Payments | Outcome |
| Outcome | Quel résultat observable ? | 99.99% availability | Goal |
| Principle | Quelle règle durable guide les choix ? | Security by Design | Requirement |
| Requirement | Que doit satisfaire la solution ? | RTO ≤ 15 min | Goal |
| Constraint | Qu’est-ce qui limite les choix ? | Data residency in EU | Requirement |
| Meaning | Quelle interprétation porte l’information ? | Meaning of fraud score | Value |
| Value | Quelle valeur apporte un résultat/service ? | Faster settlement | Outcome |

## Strategy

| Élément | Question | Exemple MayaBank |
|---|---|---|
| Resource | Quelle ressource est mobilisable ? | Payments expertise |
| Capability | Que sait faire l’organisation ? | Real-Time Payment Processing |
| Value Stream | Comment la valeur se construit-elle ? | Receive → Validate → Execute → Confirm |
| Course of Action | Quelle orientation stratégique est choisie ? | Adopt Event-Driven Integration |

## Chaîne Motivation complète

```text
Stakeholder
→ Driver
→ Assessment
→ Goal
→ Outcome
→ Requirement / Constraint
```

Exemple :

```text
CISO
→ Operational Resilience Regulation
→ Current DR automation insufficient
→ Resilient Payment Platform
→ Recovery demonstrable under 15 min
→ RTO ≤ 15 min
```

## Chaîne Strategy complète

```text
Goal
→ Capability
→ Value Stream
→ Course of Action
→ Work Package
```

Exemple :

```text
Resilient Real-Time Payments
→ Real-Time Payment Processing
→ Receive / Validate / Execute / Confirm
→ Adopt Event-Driven Integration
→ Build Event Streaming Platform
```

## Distinctions à connaître par cœur

### Driver vs Assessment
- Driver = force/pression/condition.
- Assessment = analyse de cette situation.

### Goal vs Outcome
- Goal = état souhaité, souvent qualitatif.
- Outcome = résultat concret ou mesurable.

### Goal vs Requirement
- Goal = ce que l’on veut atteindre.
- Requirement = ce que la solution doit satisfaire.

### Requirement vs Constraint
- Requirement = obligation à satisfaire.
- Constraint = restriction qui réduit les solutions possibles.

### Capability vs Process
- Capability = aptitude relativement stable.
- Process = comportement structuré dans le temps.

### Course of Action vs Work Package
- Course of Action = orientation stratégique.
- Work Package = travail concret de transformation.

## Relations fréquentes

- Driver **influence** Assessment/Goal.
- Assessment **influence** Goal.
- Requirement peut **realize** un Goal selon le modèle retenu.
- Course of Action peut **realize** une stratégie/capability cible.
- Capability peut être **realized** par des structures/comportements plus concrets.

Toujours vérifier la matrice de relations avant d’affirmer une relation légale.

## Réflexe Practitioner

Quand plusieurs réponses semblent correctes, préférer celle qui :

1. garde Motivation et Strategy distinctes ;
2. montre la chaîne causalité → objectif → exigence ;
3. relie le besoin stratégique à la réalisation métier/application/technology ;
4. ne transforme pas un produit ou projet en Capability ;
5. conserve Course of Action au niveau stratégie et Work Package au niveau transformation.