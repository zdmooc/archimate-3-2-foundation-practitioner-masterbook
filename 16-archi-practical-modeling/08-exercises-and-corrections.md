# Exercices pratiques Archi — 50 cas corrigés

## Série A — Référentiel et réutilisation

1. **Vous avez déjà `Payment Orchestrator` dans une vue. Que faire dans une seconde vue ?**
   - Réutiliser le même élément depuis le Models Tree.

2. **Deux éléments portent le même nom mais des IDs différents. Est-ce forcément correct ?**
   - Non. Vérifier s'il s'agit d'un doublon conceptuel.

3. **Peut-on utiliser des sous-dossiers dans Application ?**
   - Oui, pour l'organisation du référentiel.

4. **Un folder crée-t-il une nouvelle sémantique ArchiMate ?**
   - Non.

5. **Faut-il un modèle par diagramme ?**
   - Non. Un référentiel partagé avec plusieurs views est généralement préférable.

6. **Une image PNG est-elle la source de vérité ?**
   - Non. Le modèle l'est.

7. **Un changement de nom doit-il recréer l'élément ?**
   - Non si l'identité architecturale reste la même.

8. **Pourquoi ajouter un `canonical-id` métier ?**
   - Pour la traçabilité avec les autres référentiels et la gouvernance.

9. **Un même composant peut-il apparaître dans dix views ?**
   - Oui.

10. **Un même nom peut-il représenter deux concepts différents ?**
   - Oui, mais il faut rendre le contexte/type explicite.

## Série B — Views

11. **Le CIO veut comprendre la transformation globale. Vue ?**
   - Executive / Layered / Migration selon le concern exact.

12. **L'équipe plateforme veut voir le déploiement. Vue ?**
   - Technology / Deployment.

13. **Le RSSI veut voir IAM et exposition API.**
   - Vue Security cross-layer.

14. **Operations veut le blast radius d'une panne Kafka.**
   - Incident Impact View.

15. **Le Product Owner veut le parcours métier.**
   - Business Process / Product View.

16. **Une vue doit-elle contenir toutes les relations du modèle ?**
   - Non.

17. **Peut-on masquer une relation existante dans une view ?**
   - Oui si elle n'est pas utile au concern.

18. **Pourquoi nommer les views avec un préfixe ?**
   - Pour les classer et clarifier leur usage.

19. **Une couleur seule peut-elle porter la sémantique lifecycle ?**
   - À éviter ; ajouter propriété/légende.

20. **À quoi servent les Legends d'Archi 5.8 ?**
   - À rendre explicite la lecture visuelle de la view.

## Série C — Properties et documentation

21. **Où stocker l'owner ?**
   - Property.

22. **Où stocker la responsabilité longue d'un composant ?**
   - Documentation.

23. **RTO=15 min est-il toujours une simple property ?**
   - Non. S'il s'agit d'une exigence à tracer, modéliser aussi un Requirement.

24. **`criticality=critical` remplace-t-il un Requirement ?**
   - Non.

25. **Pourquoi un vocabulaire property contrôlé ?**
   - Pour éviter `prod`, `production`, `PRD`, etc.

26. **Une property peut-elle aider à filtrer Baseline/Target ?**
   - Oui.

27. **Documentation vide sur un composant critique : acceptable ?**
   - Faible qualité ; documenter au minimum responsabilité et frontière.

28. **Le nom `System A` suffit-il ?**
   - Non, trop ambigu.

29. **Peut-on ajouter l'URL d'un ADR en property ?**
   - Oui.

30. **Peut-on ajouter un ID CMDB ?**
   - Oui, si gouverné.

## Série D — Import/export et Git

31. **`.archimate` = Open Exchange XML ?**
   - Non.

32. **Pourquoi tester un import sur un petit modèle ?**
   - Pour contrôler pertes de concepts, relations, properties et styles.

33. **Après import, que vérifier en premier ?**
   - Comptes d'éléments/relations et ouverture des views critiques.

34. **Git remplace-t-il la gouvernance ?**
   - Non.

35. **Commit `update` est-il suffisant ?**
   - Non, il ne décrit pas la décision.

36. **Deux architectes créent le même service séparément : conflit Git ?**
   - Peut-être pas textuellement, mais c'est un conflit sémantique.

37. **Pourquoi coArchi ?**
   - Pour faciliter la collaboration Git autour de modèles Archi.

38. **Faut-il éditer le XML natif à la main au quotidien ?**
   - Non.

39. **Pourquoi sauvegarder avant upgrade ?**
   - Pour rollback et comparaison.

40. **Les images exportées doivent-elles toutes être versionnées ?**
   - Seulement si elles ont une valeur de publication réelle.

## Série E — MayaBank

41. **Kafka doit-il être recréé dans chaque use case ?**
   - Non s'il s'agit du même System Software canonique.

42. **OpenShift cluster : Component ou Node ?**
   - Node dans le concern runtime/infrastructure.

43. **Payment API : service ou interface ?**
   - Séparer les deux si le concern nécessite la distinction.

44. **Comment montrer le passage legacy→target ?**
   - Plateaus, Gaps, Work Packages, Implementation Events.

45. **Comment montrer la dépendance d'un Business Service à Kafka ?**
   - Vue cross-layer via Application/Technology.

46. **Comment montrer l'impact d'un datacenter ?**
   - Facility→Device/Node→Technology Service→Application→Business.

47. **Une réduction CO2e est-elle un élément ArchiMate ?**
   - Non, plutôt mesure/property/assessment selon le concern.

48. **La décommission legacy doit-elle apparaître ?**
   - Oui si elle est importante pour migration, coûts ou Green IT.

49. **Pourquoi une vue Green IT distincte ?**
   - Pour traiter un concern spécifique sans surcharger les autres views.

50. **Le modèle pratique est-il terminé quand il s'ouvre ?**
   - Non. Il doit être cohérent, traçable, documenté et exploitable.
