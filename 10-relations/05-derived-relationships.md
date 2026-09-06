# Relations dérivées — raisonner sur les chemins sans inventer des dépendances

Les **derived relationships** permettent de déduire une relation entre deux éléments qui ne sont pas directement reliés, à partir d’un chemin de relations compatible avec les règles du langage.

C’est un sujet important au niveau Practitioner parce qu’il permet :

- d’abstraire un modèle détaillé ;
- de créer des vues de synthèse ;
- d’analyser des dépendances indirectes ;
- d’éviter de dupliquer manuellement toutes les relations possibles.

---

## 1. Idée générale

Supposons :

```text
Application Component
  Assignment → Application Function

Application Function
  Realization → Application Service

Application Service
  Serving → Business Process
```

Le modèle contient un chemin qui relie indirectement le composant applicatif au processus métier.

Une vue de synthèse peut vouloir montrer une dépendance plus abstraite entre ces deux extrémités, **si les règles de dérivation de la spécification permettent cette conclusion**.

Le point essentiel est le suivant :

> Une relation dérivée n’est pas une intuition libre de l’architecte ; elle repose sur des règles de dérivation.

---

## 2. Pourquoi les relations dérivées existent

Un modèle d’entreprise complet peut contenir plusieurs milliers d’éléments.

Une vue exécutive ne doit pas forcément montrer :

```text
Business Process
→ Application Service
→ Application Function
→ Application Component
→ Artifact
→ System Software
→ Node
→ Facility
```

Elle peut vouloir montrer seulement :

```text
Business Process
→ Technology Platform
```

La dérivation aide à justifier ce type d’abstraction lorsque la chaîne sous-jacente le permet.

---

## 3. Relation explicite vs dérivée

### Explicite

L’architecte a réellement modélisé :

```text
A ── Serving → B
```

### Dérivée

Le lien entre A et C provient d’un chemin :

```text
A → B → C
```

et les règles du langage permettent d’en déduire une relation entre A et C.

Une relation dérivée ne doit donc pas être interprétée comme une relation explicitement validée par un propriétaire métier ou technique si ce n’est pas le cas.

---

## 4. La force relative des relations

Les règles de dérivation tiennent compte de la nature des relations rencontrées dans le chemin.

Intuition utile :

- les relations structurelles portent une sémantique forte ;
- les relations de dépendance portent une dépendance fonctionnelle ou informationnelle ;
- les relations dynamiques expriment séquence/transfert ;
- `Association` est très faible et ne doit pas être utilisée pour fabriquer artificiellement des déductions fortes.

La table exacte de dérivation de la spécification ArchiMate 3.2 doit rester la référence lorsqu’un cas est ambigu.

---

## 5. Exemple MayaBank — Business vers Application

Modèle détaillé :

```text
Business Process: Execute Instant Payment
    served by
Application Service: Payment Orchestration Service
    realized by
Application Function: Orchestrate Payment
    assigned to
Application Component: Payment Orchestrator
```

Une vue de portefeuille peut vouloir répondre à :

> Quelle application supporte ce processus métier ?

La réponse peut être obtenue par analyse du chemin sous-jacent, plutôt que par duplication de relations vagues entre chaque Business Process et chaque Application Component.

---

## 6. Exemple MayaBank — Application vers Technology

```text
Application Component: Payment Orchestrator
    realized by
Artifact: payment-orchestrator image
    deployed on
System Software / Node: OpenShift Platform
```

Une analyse d’impact peut ensuite répondre à :

> Quelles applications dépendent de cette plateforme ?

Le modèle détaillé porte la preuve de la dépendance.

---

## 7. Derived relationship ≠ raccourci graphique arbitraire

Mauvais raisonnement :

```text
Payment Process est quelque part relié à OpenShift
→ je dessine Association
```

Meilleur raisonnement :

```text
Payment Process
← served by Application Service
← realized by Application Function
← assigned to Application Component
← realized by Artifact
→ deployed on OpenShift
```

Puis on détermine, selon les règles ArchiMate, quelle relation synthétique peut être utilisée dans la vue d’abstraction.

---

## 8. Dérivation et analyse d’impact

Les relations dérivées sont particulièrement utiles pour :

- application impact analysis ;
- technology obsolescence analysis ;
- capability impact ;
- business continuity ;
- security dependencies ;
- Green IT ;
- migration planning.

### Exemple

Si un Device doit être retiré :

```text
Device
→ Node
→ System Software
→ Artifact
→ Application Component
→ Application Service
→ Business Process
→ Business Service
```

le modèle peut permettre d’identifier les impacts métier sans créer manuellement une relation directe Device→Business Service.

---

## 9. Dérivation et vues

Une relation dérivée peut être utile dans une **vue**, tandis que le modèle de base conserve les relations explicites détaillées.

C’est une distinction importante :

```text
MODEL
= source de vérité détaillée

VIEW
= représentation adaptée à un stakeholder
```

La vue peut simplifier sans casser la traçabilité.

---

## 10. Quand ne pas dériver

Ne pas dériver lorsque :

- le chemin contient une ambiguïté métier ;
- la relation résultante changerait le sens ;
- le modèle sous-jacent n’est pas suffisamment fiable ;
- la conclusion nécessite une hypothèse non modélisée ;
- la relation directe ferait croire à une dépendance plus forte que la réalité.

---

## 11. Practitioner method

Pour une question de dérivation :

```text
1. Identifier le chemin complet.
2. Nommer chaque relation.
3. Vérifier son orientation.
4. Identifier la relation la plus restrictive/faible du chemin.
5. Vérifier la règle de dérivation officielle.
6. Ne pas inventer une relation si la règle ne la permet pas.
```

---

## 12. Cas de contrôle

### Cas A

Une application réalise un service qui sert un processus métier.

Peut-on affirmer que l’application « réalise » le processus métier ?

**Non.** Ce serait changer la sémantique. L’application réalise le service applicatif ; ce service sert le processus métier.

### Cas B

Une plateforme héberge les artifacts d’une application dont le service sert un processus métier.

Peut-on analyser l’impact de la plateforme sur le processus ?

**Oui**, via le chemin de dépendance, mais la relation synthétique utilisée dans une vue doit respecter les règles de dérivation.

### Cas C

A est associé à B et B est associé à C.

Peut-on automatiquement conclure une relation forte entre A et C ?

**Non.** Association est volontairement faible et ne justifie pas une conclusion forte arbitraire.

---

## À retenir

> **Dériver, c’est simplifier une chaîne valide ; ce n’est jamais inventer un lien qui n’existe pas dans le modèle.**

Pour Practitioner, il faut savoir raisonner sur le chemin, pas seulement reconnaître le dessin d’une flèche.
