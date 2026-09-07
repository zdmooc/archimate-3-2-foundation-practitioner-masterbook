# Partie XXII — English for Enterprise Architects

Cette partie prépare l’anglais réellement utile à un architecte d’entreprise / architecte solution : **présenter, expliquer, challenger, défendre et négocier une architecture**.

L’objectif n’est pas l’anglais général. Le contenu part des situations professionnelles réelles : architecture review, design authority, entretien, incident, migration, paiement, API, Kafka, OpenShift, sécurité, DR, Data/AI et Green IT.

## Contenu

1. [Core Architecture English](01-core-architecture-english.md)
2. [Presenting an Architecture](02-presenting-an-architecture.md)
3. [Explaining ArchiMate Models](03-explaining-archimate-models.md)
4. [Challenging and Defending Decisions](04-challenging-and-defending-decisions.md)
5. [Architecture Interview Q&A](05-architecture-interview-q-and-a.md)
6. [Banking, Payments, API, Kafka & OpenShift](06-banking-payments-api-kafka-openshift.md)
7. [Cloud, Security, Resilience, Data, AI & Green IT](07-cloud-security-resilience-data-ai-greenit.md)
8. [Architecture Meetings — FR/EN Dialogues](08-architecture-meetings-dialogues.md)
9. [MayaBank Architecture Defense](09-mayabank-architecture-defense.md)
10. [Listening, Pronunciation & Fluency for Architects](10-listening-pronunciation-fluency.md)
11. [200 Architecture Sentence Drills](11-200-architecture-sentence-drills.md)
12. [English Quick Reference](12-english-quick-reference.md)

## La structure mentale à mémoriser

Quand on présente une architecture en anglais :

```text
CONTEXT
→ BUSINESS DRIVER
→ CURRENT PROBLEM
→ REQUIREMENTS / CONSTRAINTS
→ TARGET ARCHITECTURE
→ KEY DECISIONS
→ TRADE-OFFS
→ RISKS
→ MIGRATION
→ OPERATIONS
→ EXPECTED OUTCOME
```

## Les 10 phrases les plus utiles

- **The purpose of this architecture is to...** — L’objectif de cette architecture est de...
- **The main business driver is...** — Le principal moteur métier est...
- **The current limitation is...** — La limite actuelle est...
- **The target architecture introduces...** — L’architecture cible introduit...
- **This component is responsible for...** — Ce composant est responsable de...
- **This service is consumed by...** — Ce service est consommé par...
- **The main trade-off is between... and...** — Le principal compromis est entre... et...
- **The main risk is... and we mitigate it by...** — Le risque principal est... et nous le réduisons en...
- **From a resilience perspective...** — Du point de vue de la résilience...
- **The migration is split into three stages...** — La migration est découpée en trois étapes...

## Règle de communication

Un architecte n’a pas besoin de phrases compliquées. Une présentation claire repose sur des phrases courtes :

```text
Subject + verb + architecture fact + reason / impact.
```

Exemple :

> The Payment Orchestrator validates the request before it sends the payment to the clearing rail. This keeps the channel layer independent from the payment execution logic.

## Niveau de maîtrise visé

À la fin de cette partie, le lecteur doit pouvoir :

- présenter un diagramme pendant 10 à 20 minutes en anglais ;
- répondre à une question d’architecture sans traduire mot à mot depuis le français ;
- expliquer un choix et son trade-off ;
- signaler un risque avec diplomatie ;
- challenger un design sans conflit ;
- expliquer une architecture banque/paiements moderne ;
- décrire un incident et son impact cross-layer ;
- défendre la trajectoire Baseline → Transition → Target de MayaBank ;
- répondre aux questions classiques d’entretien d’architecte solution.

Le vocabulaire ArchiMate reste celui du standard en anglais ; la traduction française est fournie pour accélérer la compréhension, mais les formulations professionnelles sont volontairement conservées en anglais.