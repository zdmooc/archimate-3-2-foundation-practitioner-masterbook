# Construire une Technology Architecture de qualité

Une bonne Technology Architecture n’est ni un inventaire CMDB ni un schéma réseau exhaustif. Elle doit expliquer **comment les besoins applicatifs et non fonctionnels sont réalisés par des services de plateforme cohérents**.

---

## 1. Commencer par les besoins

Avant de dessiner des serveurs, identifier :

- disponibilité ;
- performance ;
- latence ;
- capacité ;
- sécurité ;
- conformité ;
- RPO/RTO ;
- observabilité ;
- déploiement ;
- localisation des données ;
- coût ;
- sobriété.

Exemple :

```text
Requirement: survive one worker failure
Requirement: payment traceability end-to-end
Requirement: deployment fully reproducible
```

---

## 2. Identifier les services technologiques

Traduire les besoins en services techniques.

```text
Resilient Container Execution Service
Observability Service
GitOps Deployment Service
Secrets Management Service
Database Service
Event Streaming Service
```

Cette étape évite de choisir trop tôt un produit.

---

## 3. Choisir les réalisations

Ensuite seulement :

```text
Container Service → OpenShift
Event Streaming → Kafka
Database Service → PostgreSQL / Oracle
GitOps → Argo CD
Secrets → Vault
```

La technologie devient une réponse à un besoin explicite.

---

## 4. Identifier les Nodes

Pour chaque service, déterminer les environnements d’exécution significatifs :

- clusters ;
- VMs ;
- database clusters ;
- event clusters ;
- sites ;
- cloud regions ;
- worker pools.

Ne pas descendre au niveau hôte si le concern ne l’exige pas.

---

## 5. Identifier les Artifacts

Relier les applications aux artifacts réellement déployés :

- images ;
- JAR/EAR ;
- schemas ;
- manifests ;
- IaC ;
- configurations critiques.

---

## 6. Modéliser la connectivité

Questions :

- quels Nodes doivent communiquer ?
- quels réseaux les relient ?
- quelles zones de sécurité ?
- quels endpoints techniques ?
- quels flux traversent les sites ?

Concepts :

```text
Communication Network
Path
Technology Interface
```

---

## 7. Modéliser la sécurité

Ne pas écrire seulement « sécurisé ».

Identifier :

- Identity Service ;
- Secrets Service ;
- Key Management ;
- Network Isolation ;
- Certificate Management ;
- Policy Enforcement ;
- Audit.

Puis les relier aux Requirements.

---

## 8. Modéliser l’observabilité

Pour chaque service critique :

- metrics ;
- logs ;
- traces ;
- alerting ;
- correlation.

Le modèle doit montrer qui fournit l’Observability Service et quelles applications en dépendent.

---

## 9. Modéliser HA

Identifier les pannes prises en charge :

- process ;
- pod ;
- worker ;
- broker ;
- DB primary ;
- zone ;
- site.

Puis représenter les Technology Events et Processes appropriés.

---

## 10. Modéliser DR

Pour chaque service critique :

- RPO ;
- RTO ;
- site de secours ;
- réplication ;
- activation ;
- dépendances externes ;
- DNS/routing ;
- données.

Une architecture DR qui ne traite que le compute est incomplète.

---

## 11. Construire plusieurs vues

Ne pas chercher un diagramme universel.

### Technology Landscape

Plateformes principales.

### Deployment View

Applications, artifacts, Nodes.

### Network View

Zones, networks, paths, interfaces.

### Security View

IAM, secrets, mTLS, policy.

### Observability View

Metrics/logs/traces.

### HA/DR View

Failures, replication, failover.

### Data Platform View

Databases, storage, backup.

### Integration Platform View

Kafka/API management.

---

## 12. Baseline vs Target

Ne pas représenter uniquement la cible.

Comparer :

| Sujet | Baseline | Target |
|---|---|---|
| Runtime | VM/WebSphere | OpenShift |
| Deployment | scripts manuels | GitOps |
| Messaging | point-to-point | Kafka |
| Secrets | fichiers | centralized secrets |
| Observability | outils séparés | unified OTel platform |
| HA | application-specific | platform standard |
| DR | manuel | orchestrated/tested |

---

## 13. Identifier les Gaps

Exemples :

- pas de service de secrets commun ;
- pas de tracing distribué ;
- pas de GitOps ;
- plateforme Kafka non multi-site ;
- RTO non testé ;
- faible segmentation réseau.

Ces gaps alimenteront ensuite Implementation & Migration.

---

## 14. Analyser les dépendances

Pour chaque Technology Service :

> Quelles applications en dépendent ?

Pour chaque application :

> Quels services techniques sont nécessaires ?

Cette analyse révèle les points de concentration.

---

## 15. Analyser le blast radius

Si `Identity Service` tombe : quelles applications ?

Si `Kafka` tombe : quels business processes ?

Si `Site A` tombe : quelles capabilities ?

ArchiMate permet de remonter la chaîne cross-layer.

---

## 16. Évaluer la standardisation

Un bon target model cherche souvent à remplacer des services techniques locaux par des services de plateforme communs.

Baseline :

```text
App A → own logging
App B → own logging
App C → own logging
```

Target :

```text
A/B/C → Observability Service
```

---

## 17. Éviter le modèle produit-centric

Mauvais :

```text
OpenShift
Kafka
Vault
Prometheus
PostgreSQL
```

Meilleur :

```text
Requirement
 → Technology Service
 → Technology Function
 → System Software
 → Node
```

Le modèle explique la justification.

---

## 18. Niveau de détail

### Trop haut

```text
Cloud
Database
Network
```

Impossible d’analyser les dépendances.

### Trop bas

Tous les pods, ports, routes, tables, firewall rules.

Impossible à lire.

### Niveau architecture

Services techniques stables, plateformes, clusters, dépendances, zones, artifacts critiques.

---

## 19. Checklist de qualité

Une Technology Architecture solide permet de répondre :

1. Quels services techniques sont fournis ?
2. Pourquoi sont-ils nécessaires ?
3. Quels produits les réalisent ?
4. Où s’exécutent-ils ?
5. Comment sont-ils connectés ?
6. Comment sont-ils sécurisés ?
7. Comment sont-ils observés ?
8. Comment survivent-ils aux pannes ?
9. Comment sont-ils restaurés ?
10. Quelles applications en dépendent ?
11. Quels artifacts sont déployés ?
12. Quels gaps séparent baseline et target ?

---

## 20. Anti-patterns

### Inventaire sans relations

Liste de technologies sans dépendances.

### Produit avant besoin

« Nous utilisons Kafka donc dessinons Kafka ».

### Mélange des couches

Process métier connecté directement à un serveur.

### CMDB visuelle

Des centaines de machines sans concern.

### Diagramme de réseau déguisé

Ports/IP/règles détaillées sans vision d’architecture.

### HA déclaré mais non modélisé

Le diagramme dit « HA » sans montrer redondance, failover ou service associé.

---

## 21. Pattern final

```text
Driver / Goal
   ↓
Requirement
   ↓
Application Service / Component
   ↓
Technology Service
   ↓
System Software
   ↓
Node / Communication Network
   ↓
Artifact / Deployment
   ↓
HA / DR / Observability / Security
```

---

## À retenir

> **Une Technology Architecture 10/10 explique la réalisation technique des besoins, pas seulement les produits installés.**

Elle doit permettre l’analyse d’impact, la comparaison baseline/target et la préparation de la transformation.