# 80 exercices et corrections — TOGAF ↔ ArchiMate

Ces exercices entraînent à choisir la phase TOGAF, le concept ArchiMate ou la vue la plus adaptée.

## A. Preliminary et Phase A — 1 à 15

1. Qui porte la responsabilité d'architecture ? → **Business Role** dans un modèle d'organisation.
2. « Security by Design » comme règle durable ? → **Principle**.
3. « Réglementation Instant Payment » ? → **Driver**.
4. « Le legacy ne tient pas la latence cible » ? → **Assessment**.
5. « Réduire le délai de paiement » ? → **Goal**.
6. « 99,99 % de disponibilité » formulé comme résultat attendu ? → **Outcome**.
7. Aptitude « Real-Time Payment Processing » ? → **Capability**.
8. Vue la plus naturelle pour relier Driver→Goal→Requirement ? → **Motivation View**.
9. Vue pour prioriser des capacités ? → **Capability View**.
10. Dans quelle phase la vision haut niveau est-elle structurée ? → **Phase A**.
11. Preliminary sert-il principalement à concevoir les microservices ? → **Non**.
12. Un stakeholder est-il nécessairement un Business Actor ? → **Non**.
13. « EU Data Residency » comme restriction ? → **Constraint**.
14. Peut-on montrer OpenShift en Phase A ? → **Oui si le concern le justifie, mais généralement au niveau très abstrait**.
15. Le viewpoint doit-il être choisi avant le concern ? → **Non**.

## B. Phase B — 16 à 25

16. « Payments Department » ? → **Business Actor**.
17. « Payment Operator » ? → **Business Role**.
18. « Execute Instant Payment » séquencé ? → **Business Process**.
19. « Fraud Analysis » comme responsabilité métier stable ? → **Business Function**.
20. Service offert au client ? → **Business Service**.
21. « Payment Order » concept métier ? → **Business Object**.
22. Offre regroupant plusieurs services ? → **Product**.
23. Phase TOGAF de la Business Architecture ? → **B**.
24. Vue pour montrer qui fait quoi ? → **Organization / Business Process selon le concern**.
25. Une Capability remplace-t-elle un Process ? → **Non**.

## C. Phase C Data — 26 à 34

26. Concept métier « Payment Order » ? → **Business Object**.
27. Enregistrement applicatif correspondant ? → **Data Object**.
28. Schéma déployable d'un événement ? → peut être **Artifact** selon le concern.
29. Relation « fonction lit Payment Transaction » ? → **Access(read)**.
30. Relation « instruction transférée entre deux comportements » ? → **Flow**.
31. TOGAF Data Architecture correspond-elle à une Data Layer ArchiMate autonome ? → **Non**.
32. System of record est-il un type d'élément ArchiMate ? → **Non**, c'est un rôle/propriété architecturale du modèle.
33. Quelle relation peut relier Data Object et Business Object ? → **Realization**, lorsqu'elle exprime la réalisation du concept métier.
34. La Data Architecture doit-elle montrer uniquement les bases de données ? → **Non**.

## D. Phase C Application — 35 à 45

35. Logiciel métier modulaire ? → **Application Component**.
36. Fonctionnalité exposée ? → **Application Service**.
37. Point d'accès REST ? → **Application Interface**.
38. Comportement interne ? → **Application Function/Process** selon le concern.
39. « Payment Authorized » ? → **Application Event** si changement d'état applicatif.
40. Service applicatif utilisé par un Business Process ? → **Serving** vers le processus.
41. Fonction interne qui met en œuvre le service ? → **Realization** vers le service.
42. Composant qui exécute une fonction ? → **Assignment**.
43. Phase TOGAF correspondante ? → **C — Application Architecture**.
44. Vue pour montrer dépendances entre applications ? → **Application Cooperation**.
45. Vue pour montrer support du métier par applications ? → **Application Usage**.

## E. Phase D — 46 à 55

46. OpenShift en tant que produit/runtime ? → **System Software**.
47. Fonctionnalité de plateforme de conteneurs fournie ? → **Technology Service**.
48. Machine physique calculant ? → **Device**.
49. Nœud d'exécution logique ? → **Node**.
50. Image de conteneur ? → **Artifact**.
51. Réseau IP ? → **Communication Network**.
52. Phase de Technology Architecture ? → **D**.
53. Inventaire CMDB complet = bonne Technology Architecture ? → **Pas nécessairement**.
54. Vue pour montrer artifact→runtime→node ? → **Deployment / Technology view**.
55. Kafka comme produit logiciel de plateforme ? → **System Software**.

## F. Phases E/F — 56 à 66

56. Différence entre baseline et target ? → **Gap**.
57. Direction stratégique « Adopt Event-Driven Integration » ? → **Course of Action**.
58. Lot « Build Kafka Platform » ? → **Work Package**.
59. Résultat « Production Kafka Platform » ? → **Deliverable**.
60. État hybride relativement stable ? → **Plateau**.
61. « Cutover Wave 1 Completed » ? → **Implementation Event**.
62. Phase qui structure options et work packages ? → **E**.
63. Phase qui priorise et séquence la migration ? → **F**.
64. E et F sont-elles identiques ? → **Non**.
65. Dev/UAT/Prod sont-ils automatiquement des Plateaus ? → **Non**.
66. Work Package = Course of Action ? → **Non**.

## G. Phase G — 67 à 72

67. Phase de conformité d'implémentation ? → **G**.
68. ArchiMate remplace-t-il l'Architecture Contract ? → **Non**.
69. Requirement→solution→deliverable est-il utile ? → **Oui, pour la traçabilité**.
70. Une déviation de conformité est-elle un type d'élément ArchiMate dédié ? → **Non**.
71. Vue utile pour vérifier couverture d'exigences ? → **Motivation/cross-layer traceability view personnalisée**.
72. Le rôle de G est-il de coder la solution ? → **Non**.

## H. Phase H et Requirements — 73 à 80

73. Nouveau règlement après mise en production ? → **Driver**.
74. Analyse « l'architecture actuelle n'est plus conforme » ? → **Assessment**.
75. Propriété à satisfaire à la suite du changement ? → **Requirement**.
76. Différence entre architecture actuelle et nouvelle cible ? → **Gap**.
77. Phase qui gère l'évolution continue ? → **H**.
78. Requirements Management est-il transversal ? → **Oui**.
79. Une modification de Requirement doit-elle pouvoir être reliée aux éléments impactés ? → **Oui**.
80. Phrase finale : TOGAF donne quoi, ArchiMate donne quoi ? → **TOGAF : méthode/gouvernance ; ArchiMate : représentation/communication/analyse.**

## Méthode de correction Practitioner

Pour chaque erreur :

```text
1. Identifier le moment ADM.
2. Identifier le concern.
3. Identifier le type de concept ArchiMate.
4. Vérifier les relations.
5. Vérifier le niveau d'abstraction.
6. Expliquer pourquoi l'alternative est moins adaptée.
```

## À retenir

> **Le bon réflexe n'est pas d'apprendre une table par cœur ; il est de reconnaître la décision TOGAF puis de choisir la représentation ArchiMate qui la rend explicite.**