# 120 exercices de relations — questions et corrections

## Série A — Foundation : reconnaître la bonne relation (1–60)

1. Une équipe exécute un processus. **Assignment.** Structure active → comportement.
2. Une fonction interne expose un service. **Realization.** Le comportement interne réalise le service.
3. Un service applicatif supporte un processus métier. **Serving.** Le fournisseur sert le consommateur.
4. Une fonction lit un Data Object. **Access(read).**
5. Une fonction écrit un Data Object. **Access(write).**
6. Une fonction lit puis met à jour un Data Object. **Access(read/write).**
7. Un événement lance un processus. **Triggering.**
8. Une information est transmise d’un processus à un autre. **Flow.**
9. Un sous-type Customer est Corporate Customer. **Specialization** de Corporate Customer vers Customer.
10. Une plateforme est constituée de sous-composants fortement intégrés. **Composition.**
11. Une offre regroupe plusieurs services réutilisables. **Aggregation.**
12. Une application implémente un service applicatif via son comportement. **Realization.**
13. Une API Service est consommée par un processus métier. **Serving.**
14. Une réglementation pousse un objectif de conformité. **Influence.**
15. Deux concepts sont liés sans sémantique plus précise requise. **Association.**
16. Un rôle métier porte un processus. **Assignment.**
17. Un composant applicatif porte une fonction applicative. **Assignment.**
18. Un Node exécute une fonction technologique. **Assignment.**
19. Un Data Object représente un Business Object dans le SI. **Realization.**
20. Un Artifact représente la réalisation technique d’un Data Object. **Realization.**
21. Payment Received précède Validate Payment. **Triggering.**
22. Validate Payment transmet Payment Context à Fraud Check. **Flow.**
23. Fraud Check consulte Fraud Rules. **Access(read).**
24. Event Streaming Service fournit une fonctionnalité au Payment Orchestrator. **Serving.**
25. Kafka Function expose Event Streaming Service. **Realization.**
26. Kafka Platform exécute Kafka Function. **Assignment.**
27. Payment Platform contient Payment Orchestrator comme partie constitutive. **Composition.**
28. Premium Product regroupe Card Service et Payment Service. **Aggregation.**
29. Retail Customer est une forme spécifique de Customer. **Specialization.**
30. Une nouvelle menace augmente la priorité d’un Goal sécurité. **Influence.**
31. Une fonction produit un service. **Realization.**
32. Un service dessert plusieurs processus. **Serving.**
33. Un processus accède à un Business Object. **Access.**
34. Un processus envoie un dossier à un autre processus. **Flow.**
35. Un événement métier entraîne un processus métier. **Triggering.**
36. Une contrainte réduit la faisabilité d’un objectif. **Influence négative.**
37. Un Actor joue un Role. **Assignment.**
38. Une Collaboration exécute une Interaction. **Assignment.**
39. Une Application Collaboration exécute une Application Interaction. **Assignment.**
40. Une Technology Collaboration exécute une Technology Interaction. **Assignment.**
41. Un service technique sert un composant applicatif. **Serving.**
42. Une application lit un Data Object, sans transfert vers une autre application. **Access.**
43. Une application transmet un message à une autre. **Flow.**
44. Un changement d’état déclenche un comportement. **Triggering.**
45. Un élément spécialisé conserve le sens général d’un parent. **Specialization.**
46. Plusieurs relations doivent toutes être vraies avant une suite. **AND Junction.**
47. Une alternative parmi plusieurs branches suffit. **OR Junction.**
48. Une relation tout/partie forte. **Composition.**
49. Une relation tout/partie faible. **Aggregation.**
50. Une structure active exécute un comportement. **Assignment.**
51. Une entité concrète implémente une abstraction. **Realization.**
52. Une fonctionnalité est fournie à un consommateur. **Serving.**
53. Un comportement utilise une donnée passive. **Access.**
54. Un élément de motivation affecte un autre. **Influence.**
55. Un lien générique est utile mais aucun sens plus précis n’est requis. **Association.**
56. Une activité entraîne temporellement une autre. **Triggering.**
57. Quelque chose circule entre deux éléments. **Flow.**
58. Un élément est un cas plus spécifique d’un autre. **Specialization.**
59. Plusieurs Triggering sont combinés par une logique commune. **Junction de Triggering.**
60. Une chaîne de relations permet une relation synthétique valide selon les règles du langage. **Derived relationship.**

---

## Série B — Practitioner : choisir entre relations proches (61–120)

61. Payment Orchestrator « utilise » Payment Orchestration Service qu’il expose. **Ne pas choisir Serving par réflexe :** si le composant met en œuvre le service, raisonner via comportement/Realization ou relation autorisée appropriée.
62. Payment Orchestration Service fournit une fonctionnalité à Execute Payment. **Serving.** Le consommateur est le processus.
63. Payment Orchestrator effectue Orchestrate Payment Function. **Assignment.**
64. Orchestrate Payment Function expose Payment Orchestration Service. **Realization.**
65. Fraud Function consulte Fraud Rules. **Access**, pas Flow.
66. Payment Validation transmet Payment Context à Fraud Function. **Flow**, pas Access.
67. Payment Authorized démarre Clearing Submission. **Triggering**, pas Flow si aucun transfert n’est l’objet du modèle.
68. Payment Authorized Payload est transmis au Notification Service. **Flow.**
69. Payment Authorized Event entraîne Send Notification. **Triggering.**
70. Notification Service fournit une fonctionnalité à Notify Customer Process. **Serving.**
71. Payment Transaction Record représente Payment Order. **Realization.**
72. Payment Order est lu par Execute Payment. **Access.**
73. Premium Banking contient des services réutilisables par d’autres offres. **Aggregation** plutôt que Composition.
74. Payment Platform contient un module interne conçu comme partie constitutive. **Composition.**
75. Corporate Customer est un type de Customer. **Specialization**, jamais Aggregation.
76. Fraud Team assume Fraud Analyst Role. **Assignment.**
77. Fraud Analyst Role exécute Investigate Fraud Process. **Assignment.**
78. Investigate Fraud Process réalise Fraud Investigation Service. **Realization.**
79. Fraud Investigation Service sert Customer Protection Process. **Serving.**
80. Driver “Regulation” augmente l’importance d’un Goal conformité. **Influence.**
81. Goal et Requirement ont un lien précis défini par le métamodèle ; ne pas mettre **Association** simplement par ignorance. Vérifier la relation permise et son sens.
82. Deux concepts de documentation sont simplement rapprochés pour navigation. **Association** peut être acceptable si aucun lien sémantique plus précis n’est voulu.
83. Une équipe est dessinée dans un département mais reste organisationnellement indépendante. **Aggregation** peut être plus juste que Composition selon le sens voulu.
84. Une équipe n’existe que comme sous-unité constitutive du département dans ce modèle. **Composition**.
85. API Gateway fournit API Access Service à Payment Application. **Serving.**
86. API Gateway exécute Routing Function. **Assignment.**
87. Routing Function réalise API Routing Service. **Realization.**
88. Routing Function lit Routing Rules. **Access.**
89. Routing Function transmet Request au Backend. **Flow.**
90. Request Received déclenche Routing Function. **Triggering.**
91. Kafka Platform exécute Event Distribution Function. **Assignment.**
92. Event Distribution Function réalise Event Streaming Service. **Realization.**
93. Event Streaming Service sert Payment Orchestrator. **Serving.**
94. Payment Orchestrator publie PaymentAuthorized Payload vers Notification Service. **Flow.**
95. PaymentAuthorized Event déclenche Notification Process. **Triggering.**
96. OpenShift Container Service sert Payment Orchestrator. **Serving.**
97. OpenShift System Software exécute Container Scheduling Function. **Assignment.**
98. Container Scheduling Function réalise Container Platform Service. **Realization.**
99. Un Artifact réalise un Data Object. **Realization**, si l’Artifact constitue sa réalisation technique dans le modèle.
100. Une image de conteneur réalise un Application Component. **Realization** dans une vue de déploiement appropriée.
101. Un serveur physique est une partie d’un datacenter dans une vue patrimoniale. **Aggregation/Composition selon la dépendance d’identité**, pas Association par défaut.
102. Un réseau IP transporte des messages. Le transfert de messages entre comportements peut être **Flow** ; le réseau lui-même est un élément de connectivité, pas une Flow relation à lui seul.
103. Deux événements doivent tous deux survenir avant un traitement. **AND Junction + Triggering.**
104. L’un de deux événements peut déclencher un traitement. **OR Junction + Triggering.**
105. Une Junction mélange Triggering et Flow. **Incorrect :** une Junction combine des relations de même type.
106. Un processus A précède B et transmet aussi un dossier. **Triggering + Flow** peuvent coexister si les deux sémantiques sont utiles.
107. Un processus lit un dossier puis l’envoie. **Access + Flow** peuvent coexister : accès et transfert ne signifient pas la même chose.
108. Une application dépend d’un service technique. **Serving** du service technique vers l’application, si l’on modélise la fonctionnalité fournie.
109. Une application est déployée dans une plateforme. Ne pas utiliser **Serving** pour dire « hébergé » ; choisir les relations structurelles/déploiement autorisées appropriées.
110. Un Work Package produit un Deliverable. Ne pas remplacer le sens de transformation par une simple **Association** si une relation spécifique autorisée exprime mieux le cas.
111. Une app réalise un service qui sert un processus. Peut-on dire que l’app réalise le processus ? **Non.** Cela change la sémantique.
112. Un Device héberge indirectement une application qui sert un service métier. Peut-on analyser l’impact Device→Business Service ? **Oui via le chemin**, mais la relation synthétique doit respecter les règles de dérivation.
113. A Association B et B Association C. Peut-on déduire une relation forte A→C ? **Non.**
114. Un chemin détaillé supporte une vue simplifiée. **Derived relationship** seulement si les règles de dérivation l’autorisent.
115. La flèche Serving est inversée du consommateur vers le fournisseur. **Incorrect.** Le fournisseur sert le consommateur.
116. La flèche Realization va de l’abstraction vers son implémentation. **Incorrect.** Le concret réalise l’abstrait.
117. La flèche Assignment va du comportement vers la structure active. **Incorrect** dans le pattern standard : la structure active est assignée au comportement.
118. La flèche Access part de la donnée vers la fonction qui la lit. **Incorrect** dans le pattern standard : l’élément accédant pointe vers l’élément passif.
119. La flèche Flow part du destinataire vers l’émetteur. **Incorrect.** Elle suit le sens du transfert.
120. Un modèle utilise 70 % d’Association alors que les dépendances sont connues. **Anti-pattern.** Requalifier les liens en relations sémantiquement précises.

---

## Grille de correction

Pour chaque erreur, écrire quatre choses :

```text
1. éléments source/cible
2. relation choisie
3. direction
4. phrase justificative
```

Exemple :

```text
Source : Payment Orchestration Service
Cible  : Execute Payment Process
Relation : Serving
Phrase : Payment Orchestration Service sert Execute Payment Process.
```

Le but n’est pas seulement de reconnaître un symbole, mais de **défendre le sens du modèle**.
