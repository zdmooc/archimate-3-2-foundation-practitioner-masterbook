# Exercices Physical Layer — questions et corrections

Ces exercices entraînent à choisir le bon concept et le bon niveau d’abstraction.

---

## Série A — Choisir le bon élément

### Q1
Un datacenter bancaire.

**Réponse : Facility.**

### Q2
Une salle informatique sécurisée à l’intérieur du datacenter.

**Réponse : Facility**, si cette granularité est utile.

### Q3
Un serveur bare metal exécutant OpenShift.

**Réponse : Device.**

### Q4
Un switch réseau.

**Réponse : Device.**

### Q5
Un système UPS.

**Réponse : Equipment.**

### Q6
Un groupe électrogène.

**Réponse : Equipment.**

### Q7
Un chiller.

**Réponse : Equipment.**

### Q8
Un backbone Ethernet.

**Réponse : Communication Network.**

### Q9
Une liaison WAN inter-datacenter.

**Réponse : Communication Network.**

### Q10
Le réseau de distribution électrique A.

**Réponse : Distribution Network.**

### Q11
Le réseau d’eau glacée.

**Réponse : Distribution Network.**

### Q12
L’électricité utilisée dans un concern énergétique.

**Réponse : Material.**

### Q13
La valeur “374 W” mesurée sur un serveur.

**Réponse : propriété ou donnée de mesure, pas Equipment/Material.**

### Q14
Un fichier CSV contenant la consommation électrique.

**Réponse : Data Object ou Artifact selon le niveau de modélisation, pas Material.**

### Q15
Une image OCI de l’application paiement.

**Réponse : Artifact.**

---

## Série B — Device ou Equipment ?

### Q16
Serveur Oracle.

**Device.** Il joue un rôle de ressource IT.

### Q17
Appliance de stockage.

**Device.**

### Q18
HSM matériel.

**Device** lorsqu’il est modélisé comme ressource technologique de sécurité.

### Q19
PDU électrique.

**Equipment**, si l’on modélise sa fonction dans l’infrastructure physique d’alimentation.

### Q20
Pompe de refroidissement.

**Equipment.**

### Q21
Robot industriel de manutention.

**Equipment.**

### Q22
Laptop utilisateur.

**Device**, si pertinent pour la Technology Architecture.

### Q23
Téléphone mobile client.

**Device**, si la vue doit représenter le terminal technologique.

---

## Série C — Communication ou Distribution ?

### Q24
Fibre transportant des données entre deux DC.

**Communication Network.**

### Q25
Fibre optique physique : doit-elle devenir Distribution Network parce qu’elle est physique ?

**Non.** Ce qu’elle transporte dans le concern est de l’information ; on reste dans Communication Network/Path selon le niveau.

### Q26
Câble électrique alimentant une salle.

**Distribution Network** à un niveau architectural pertinent.

### Q27
Circuit d’eau de refroidissement.

**Distribution Network.**

### Q28
Topic Kafka.

**Ni Communication Network ni Distribution Network.** Il appartient à la modélisation applicative/technologique du messaging selon le concern.

---

## Série D — Facility ou Node ?

### Q29
Datacenter Paris.

**Facility.**

### Q30
Cluster Kubernetes.

**Node** ou ensemble de Nodes/System Software selon le concern, pas Facility.

### Q31
Région cloud France.

**Facility peut être utilisée comme abstraction physique** si la localisation est pertinente et connue à ce niveau ; ne pas inventer des détails du fournisseur.

### Q32
Salle de marché.

**Facility**, si le lieu physique fait partie du concern.

### Q33
Machine virtuelle.

**Node**, pas Facility.

---

## Série E — Green IT

### Q34
“1 500 kgCO2e/an” doit-il être un Material ?

**Non.** C’est une mesure environnementale.

### Q35
Où stocker cette valeur ?

**Propriété, Data Object de métrique ou résultat d’Assessment**, selon le modèle.

### Q36
“Plateforme actuelle sous-utilisée à 12 %”.

**Assessment**, alimenté par des données de mesure.

### Q37
“Réduire l’empreinte IT”.

**Goal.**

### Q38
“La cible doit permettre la consolidation des workloads”.

**Requirement.**

### Q39
“Serveurs physiques actuels”.

**Devices.**

### Q40
“Datacenter à PUE 1,3”.

**Facility avec propriété PUE=1,3**, si la donnée est fiable et utile.

---

## Série F — Résilience

### Q41
Deux clusters dans la même salle suffisent-ils à garantir une résilience de site ?

**Non.** Ils peuvent partager Facility, énergie, refroidissement et réseau.

### Q42
Pourquoi modéliser Power Feed A et B ?

Pour vérifier l’indépendance physique de l’alimentation.

### Q43
Deux sites utilisant le même service DNS externe sont-ils totalement indépendants ?

**Non nécessairement.** Cette dépendance est plutôt Technology/External Service, mais elle doit être visible dans l’analyse globale.

### Q44
Perte du chiller East : quel type de risque ?

**Risque physique de Facility/Equipment** pouvant avoir un impact transversal sur plusieurs Devices et services.

### Q45
Le PRA doit-il montrer uniquement la réplication DB ?

**Non.** Il doit considérer application, messaging, IAM, DNS, réseau, Facilities et dépendances physiques pertinentes.

---

## Série G — Corriger le modèle

### Q46
`Equipment: OpenShift`

**Incorrect.** OpenShift est `System Software`.

### Q47
`Equipment: Server-01`

Dans une architecture IT, préférer **Device**.

### Q48
`Distribution Network: MPLS WAN`

**Incorrect dans ce sens.** Le WAN transporte de l’information : `Communication Network`.

### Q49
`Material: PAYMENT_TX table`

**Incorrect.** Cette table peut être modélisée comme Artifact/Data Object selon le niveau.

### Q50
`Facility: PostgreSQL Cluster`

**Incorrect.** Il s’agit de technologie, pas d’un lieu physique.

---

## Série H — Mini-cas MayaBank

### Q51
MayaBank veut savoir quelles applications s’arrêtent si DC East est indisponible. Par où commencer ?

**Réponse : relier Application Components/Services à leurs Technology Nodes/Devices puis à Facility DC East.**

### Q52
MayaBank veut savoir si ses deux clusters partagent une même arrivée électrique.

**Réponse : modéliser les Distribution Networks et Equipment d’alimentation pertinents.**

### Q53
MayaBank veut comparer l’empreinte de fabrication de l’ancien et du nouveau parc.

**Réponse : les parcs sont des Devices ; les valeurs d’empreinte sont des propriétés/données issues d’une méthode de mesure.**

### Q54
MayaBank migre 18 serveurs dédiés vers 8 workers mutualisés. ArchiMate prouve-t-il automatiquement un gain carbone ?

**Non.** Il montre le changement d’architecture ; la preuve nécessite des mesures de fabrication, puissance, utilisation, stockage et autres facteurs.

### Q55
Un circuit de refroidissement commun aux deux salles est découvert. Que révèle le modèle ?

**Un risque de dépendance physique commune** qui peut invalider l’hypothèse d’indépendance.

### Q56
Les sauvegardes sont stockées dans la même Facility que la production. Quel problème ?

**Risque de perte corrélée lors d’un sinistre de site.**

### Q57
Les deux DC sont séparés mais utilisent la même liaison physique opérateur. Quel concept principal ?

**Communication Network**, avec risque de dépendance commune.

### Q58
Le fuel des groupes électrogènes doit-il toujours être modélisé ?

**Non.** Seulement si cette dépendance physique est pertinente pour le concern.

### Q59
Pourquoi ne pas modéliser chaque rack et chaque câble ?

Parce que la granularité doit répondre à une décision d’architecture, pas reproduire un plan d’installation complet.

### Q60
Quelle chaîne synthétique permet d’expliquer l’impact d’une panne physique sur le métier ?

```text
Facility / Equipment failure
→ Device impact
→ Technology Service impact
→ Application Service impact
→ Business Process / Service impact
```

---

## Score indicatif

- 0–35 : revoir Technology vs Physical ;
- 36–45 : base solide ;
- 46–54 : bon niveau Foundation ;
- 55–60 : bonne capacité de discrimination Practitioner.

Le score est pédagogique et ne correspond pas au barème officiel de l’examen.