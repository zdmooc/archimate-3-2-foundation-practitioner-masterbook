# Exercices et corrections — Views & Viewpoints

Cette banque entraîne à choisir **la bonne vue pour le bon stakeholder et le bon concern**.

---

## Partie A — Reconnaissance rapide

### 1
Le CIO veut comprendre la logique globale de transformation.

**Réponse :** une vue exécutive de type Strategy/Layered, focalisée sur drivers, goals, capabilities, plateformes stratégiques et target plateau.

### 2
Le Head of Payments veut comprendre qui exécute les étapes du paiement.

**Réponse :** Business Process / Organization View.

### 3
L’architecte solution veut voir les dépendances entre applications.

**Réponse :** Application Cooperation Viewpoint.

### 4
L’architecte métier veut comprendre comment les applications supportent un processus.

**Réponse :** Application Usage Viewpoint.

### 5
L’architecte plateforme veut savoir où les applications s’exécutent.

**Réponse :** Technology / Deployment-oriented View.

### 6
Le Program Director veut comprendre les vagues et plateaus.

**Réponse :** Implementation & Migration / Migration Viewpoint.

### 7
Le CISO veut visualiser les exigences et contrôles.

**Réponse :** vue personnalisée Motivation + Application + Technology.

### 8
Le Green IT Lead veut relier migration et retrait de serveurs.

**Réponse :** vue cross-layer Strategy/Migration/Technology/Physical.

### 9
Le Data Architect veut tracer Payment Order jusqu’à la table physique.

**Réponse :** Information Structure + cross-layer data lineage.

### 10
Le SRE veut connaître les dépendances critiques d’exploitation.

**Réponse :** Application Cooperation + Technology / Deployment.

---

## Partie B — View vs Viewpoint

### 11
`Application Usage` décrit une manière de construire une représentation.

**Réponse : Viewpoint.**

### 12
`MayaBank Instant Payment Application Usage` est le diagramme concret.

**Réponse : View.**

### 13
Une vue est-elle indépendante du modèle ?

**Réponse : Non.** Elle sélectionne et présente une partie du modèle.

### 14
Peut-on produire plusieurs vues à partir des mêmes éléments ?

**Réponse : Oui.**

### 15
Le même élément peut-il apparaître dans plusieurs vues ?

**Réponse : Oui**, avec la même identité conceptuelle.

---

## Partie C — Stakeholder / Concern

### 16
Le CISO est inquiet du chiffrement. `CISO` est quoi ?

**Réponse : Stakeholder.**

### 17
`Exposition des données sensibles` est quoi ?

**Réponse : Concern.**

### 18
`Encryption in Transit` avec une valeur normative est quoi ?

**Réponse : Requirement**, pas Concern.

### 19
Pourquoi écrire le concern avant de dessiner ?

**Réponse :** pour sélectionner le contenu pertinent et éviter le diagramme générique.

### 20
Un Business Actor est-il automatiquement un Stakeholder ?

**Réponse : Non.** Les concepts répondent à des intentions différentes.

---

## Partie D — Choix du bon viewpoint

### 21
Comparer les capacités actuelles et cibles.

**Réponse : Capability View.**

### 22
Montrer la création de valeur de bout en bout.

**Réponse : Value Stream View.**

### 23
Montrer une offre et ses services.

**Réponse : Product View.**

### 24
Montrer quels composants applicatifs coopèrent.

**Réponse : Application Cooperation.**

### 25
Montrer quels processus utilisent quelles applications.

**Réponse : Application Usage.**

### 26
Montrer les plateformes et services techniques.

**Réponse : Technology View.**

### 27
Montrer comment l’application consomme des services de plateforme.

**Réponse : Technology Usage.**

### 28
Montrer les objets métier, données et artifacts.

**Réponse : Information Structure / data lineage view.**

### 29
Montrer les plateaus et gaps.

**Réponse : Migration View.**

### 30
Montrer work packages et deliverables.

**Réponse : Implementation & Migration / Project-oriented View.**

---

## Partie E — Practitioner discrimination

### 31
Un directeur demande “où sont nos 150 microservices ?”. Faut-il tout mettre dans sa vue ?

**Réponse : Non.** Grouper à un niveau de plateforme/domaine pertinent.

### 32
Une vue a 80 relations croisées mais toutes sont sémantiquement correctes. Est-elle de qualité ?

**Réponse : Pas nécessairement.** La lisibilité et le concern comptent aussi.

### 33
Une vue exécutive montre les noms de pods OpenShift.

**Réponse : Niveau de détail probablement inadapté.**

### 34
Une vue déploiement montre seulement Goal et Capability.

**Réponse : Insuffisant pour un concern de déploiement.**

### 35
Le même Payment Orchestrator est nommé `Payment Engine` dans une autre vue sans justification.

**Réponse : Incohérence à corriger.**

### 36
Une relation est ajoutée dans une vue pour “rendre le dessin plus clair”, mais elle n’existe pas dans le modèle.

**Réponse : À éviter.** Une vue doit rester fidèle au modèle.

### 37
Un stakeholder a deux concerns distincts et la vue devient illisible.

**Réponse : Créer deux vues ciblées.**

### 38
Aucun viewpoint standard ne correspond exactement au besoin.

**Réponse : Adapter ou créer une vue personnalisée cohérente.**

### 39
Un architecte veut une vue cross-layer avec Business, Application et Technology uniquement.

**Réponse : Valide.** Une Layered View n’a pas besoin de toutes les couches.

### 40
Une vue montre Baseline et Target sans gaps.

**Réponse : Elle peut être lisible mais insuffisante pour comprendre la transformation.**

---

## Partie F — MayaBank scenarios

### 41
Question : “Si Kafka tombe, quels services métier sont impactés ?”

**Réponse :** Risk/Impact cross-layer View.

### 42
Question : “Quelles applications soutiennent Fraud Control ?”

**Réponse :** Application Usage View.

### 43
Question : “Quels systèmes produisent et consomment Payment Authorized ?”

**Réponse :** Event-Driven/Application Cooperation View.

### 44
Question : “Quand les serveurs legacy pourront-ils être éteints ?”

**Réponse :** Migration + Technology/Physical View.

### 45
Question : “Quel work package ferme le gap No Event Backbone ?”

**Réponse :** Implementation & Migration View.

### 46
Question : “Quelle capacité justifie le Payment Orchestrator ?”

**Réponse :** Strategy/Application cross-layer View.

### 47
Question : “Comment Payment Order devient-il une donnée technique ?”

**Réponse :** Information Structure/data lineage View.

### 48
Question : “Quels rôles interviennent dans les exceptions ?”

**Réponse :** Organization + Business Process View.

### 49
Question : “Quels contrôles répondent au requirement Strong Authentication ?”

**Réponse :** Motivation/Security cross-layer View.

### 50
Question : “Quel est l’état cible après retrait du legacy ?”

**Réponse :** Target Plateau / Migration View.

---

## Partie G — 20 mini-cas rapides

### 51
Direction : portefeuille applicatif stratégique.

**Réponse :** Application Landscape / portfolio-oriented view.

### 52
Métier : produits et contrats.

**Réponse :** Product View.

### 53
Architecture : APIs consommées par processus métier.

**Réponse :** Application Usage.

### 54
Architecture : relations entre microservices.

**Réponse :** Application Cooperation.

### 55
Plateforme : OpenShift, Kafka, DB.

**Réponse :** Technology View.

### 56
Ops : artifact vers node.

**Réponse :** Deployment-oriented View.

### 57
Programme : waves.

**Réponse :** Migration/Roadmap View.

### 58
Data : business object vers data object.

**Réponse :** Information Structure.

### 59
CISO : requirement vers service de sécurité.

**Réponse :** Motivation + Technology View.

### 60
Green IT : legacy application vers physical servers.

**Réponse :** cross-layer Technology/Physical/Migration.

### 61
EA : capability gaps.

**Réponse :** Capability View.

### 62
Business Architect : étapes de valeur.

**Réponse :** Value Stream.

### 63
Ops : dépendance réseau.

**Réponse :** Technology View.

### 64
Program : deliverables produits par work packages.

**Réponse :** Implementation & Migration.

### 65
CIO : drivers vers target.

**Réponse :** Strategy/Layered executive view.

### 66
Support : incident technique vers service métier.

**Réponse :** Impact cross-layer view.

### 67
Security : identities et interfaces.

**Réponse :** custom security view.

### 68
Product Owner : services de l’offre Premium.

**Réponse :** Product View.

### 69
Architecte infra : site A vs site B.

**Réponse :** Technology + Physical View.

### 70
Architecte solution : service applicatif vers composant.

**Réponse :** Application Structure/Usage View.

---

## Partie H — 10 pièges de synthèse

### 71
View = modèle complet.

**Faux.**

### 72
Viewpoint = diagramme final.

**Faux.**

### 73
Une vue peut être personnalisée.

**Vrai.**

### 74
Un stakeholder peut avoir plusieurs concerns.

**Vrai.**

### 75
Un concern est un requirement.

**Faux.**

### 76
Cross-layer implique toutes les couches.

**Faux.**

### 77
La lisibilité fait partie de la qualité d’une vue.

**Vrai.**

### 78
Toute relation du modèle doit apparaître dans chaque vue.

**Faux.**

### 79
Une vue peut cacher des détails sans altérer le modèle.

**Vrai.**

### 80
Le choix du viewpoint doit être guidé par le stakeholder et le concern.

**Vrai.**

---

## À retenir

> **Le bon réflexe Practitioner : stakeholder → concern → question → viewpoint → sélection → validation.**
