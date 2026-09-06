# Cloud, Security, Observability, HA & DR — patterns technologiques transverses

Une Technology Architecture de qualité ne se limite pas au compute. Elle doit rendre visibles les services transverses qui rendent la plateforme **sécurisée, observable, résiliente et exploitable**.

---

## 1. Cloud : modéliser le service, pas seulement le logo

Écrire simplement :

```text
Azure
AWS
```

est peu informatif.

Il faut demander :

> Quel rôle technologique ce service joue-t-il ?

### Exemples

```text
Technology Service: Managed Kubernetes Service
Technology Service: Managed Database Service
Technology Service: Object Storage Service
Technology Service: Key Management Service
Technology Service: Load Balancing Service
```

Puis le fournisseur réel peut être indiqué dans le nom ou comme propriété.

---

## 2. IaaS

Pattern :

```text
Node: Cloud Virtual Machine
System Software: Linux
Technology Service: Virtual Compute Service
```

Le matériel physique du fournisseur n’a généralement pas besoin d’être représenté.

---

## 3. PaaS

Pattern :

```text
Technology Service: Managed PostgreSQL Service
Technology Interface: PostgreSQL Private Endpoint
```

Le consommateur peut ne jamais voir le Node ni le System Software sous-jacent.

---

## 4. SaaS

Un SaaS peut souvent être modélisé côté Application comme Application Service/Component consommé, tandis que sa plateforme interne reste hors scope.

Le niveau dépend du concern.

---

## 5. Network segmentation

```text
Communication Network: Payment Zone
Communication Network: Shared Services Zone
Communication Network: Data Zone
Technology Service: Network Segmentation Service
```

Un firewall ou SDN peut réaliser ce service.

---

## 6. IAM

```text
System Software: Identity Provider
Technology Service: Authentication Service
Technology Service: Authorization Service
Technology Interface: OIDC/OAuth Endpoint
```

Côté Motivation :

```text
Requirement: strong authentication for privileged access
```

Le requirement est satisfait par la solution technique.

---

## 7. Secrets management

```text
System Software: Secrets Platform
Technology Function: Secret Storage
Technology Function: Secret Rotation
Technology Service: Secrets Management Service
Technology Interface: Secrets API
```

---

## 8. Key management

```text
Technology Service: Cryptographic Key Management Service
Device: HSM
Technology Process: Key Rotation
```

Dans le cloud, le HSM physique peut rester abstrait.

---

## 9. Certificate management

```text
Technology Service: Certificate Management Service
Technology Process: Certificate Renewal
Technology Event: Certificate Expiring
```

---

## 10. Policy enforcement

```text
Technology Function: Policy Enforcement
Technology Service: Platform Policy Service
System Software: Policy Engine
Artifact: Policy Bundle
```

Exemple Kubernetes : Kyverno / OPA Gatekeeper peut être représenté comme System Software.

---

## 11. Observability : le triptyque

### Metrics

```text
Technology Function: Metrics Collection
```

### Logs

```text
Technology Function: Log Aggregation
```

### Traces

```text
Technology Function: Distributed Trace Processing
```

Ces functions contribuent à :

```text
Technology Service: Observability Service
```

---

## 12. Monitoring vs Observability

Le monitoring répond souvent à :

> Est-ce que le système respecte des seuils connus ?

L’observability vise plus largement la capacité à comprendre l’état interne du système à partir des signaux produits.

Dans ArchiMate, le Technology Service peut rester `Observability Service`, tandis que metrics/logs/traces sont des functions ou sous-services.

---

## 13. Alerting

```text
Technology Event: Error Rate Threshold Exceeded
        ↓
Technology Process: Trigger Alert
        ↓
Technology Service: Alerting Service
```

---

## 14. SLO/SLA

Un SLA n’est pas un Technology Service.

Il peut être représenté par :

- Requirement ;
- Constraint ;
- Contract, selon le contexte métier ;
- propriété du service dans l’outil.

Exemple :

```text
Requirement: Payment Platform Availability ≥ 99.99%
```

---

## 15. High Availability

HA vise à continuer le service malgré certaines défaillances.

Pattern :

```text
Technology Collaboration: HA Runtime Platform
Technology Function: Replication
Technology Function: Health Checking
Technology Process: Automatic Failover
Technology Service: High Availability Runtime Service
```

---

## 16. Resilience vs HA

HA n’est qu’un moyen.

La résilience peut inclure :

- redondance ;
- retries ;
- circuit breakers ;
- isolation ;
- autoscaling ;
- failover ;
- degraded mode ;
- recovery.

Le modèle doit représenter les mécanismes réellement importants.

---

## 17. RPO et RTO

### RPO

Quantité de données maximale que l’on accepte de perdre.

### RTO

Durée maximale visée pour restaurer le service.

Ils peuvent être modélisés comme Requirements associés aux services critiques.

```text
Requirement: RPO ≤ 30 seconds
Requirement: RTO ≤ 15 minutes
```

---

## 18. Disaster Recovery

```text
Node: Primary Site Platform
Node: Secondary Site Platform
Technology Collaboration: Dual-Site DR Platform
Communication Network: Inter-site WAN
Technology Service: Disaster Recovery Service
Technology Process: Activate Secondary Site
Technology Event: Primary Site Unavailable
```

---

## 19. Active/Passive

```text
Node: Primary Cluster
Node: Standby Cluster
Technology Interaction: State Replication
Technology Process: Failover
```

---

## 20. Active/Active

```text
Node: Site A Cluster
Node: Site B Cluster
Technology Collaboration: Active-Active Platform
Technology Service: Global Traffic Distribution
Technology Interaction: Cross-Site Coordination
```

---

## 21. Backup ≠ DR

### Backup

Protège principalement les données et permet une restauration.

### DR

Restaure la capacité opérationnelle après perte significative d’un environnement/site.

Un modèle peut montrer les deux séparément :

```text
Technology Service: Backup Service
Technology Service: Disaster Recovery Service
```

---

## 22. Failure domain

Le modèle peut représenter les domaines de panne par Node/Grouping :

```text
Availability Zone A
Availability Zone B
```

Les workloads répartis sur plusieurs domaines rendent le mécanisme de résilience visible.

---

## 23. Multi-region cloud

```text
Node: Region France
Node: Region Europe West
Technology Collaboration: Multi-Region Platform
Communication Network: Provider Backbone
Technology Service: Geo-Redundant Runtime
```

---

## 24. Security zones MayaBank

```text
Communication Network: External Zone
Communication Network: API Zone
Communication Network: Payment Processing Zone
Communication Network: Data Zone
```

Des Technology Services peuvent contrôler :

```text
Network Filtering
WAF
DDoS Protection
mTLS
Identity
Secrets
```

---

## 25. Zero Trust

ArchiMate peut exprimer les building blocks d’une approche Zero Trust :

```text
Principle: Never trust, always verify
Requirement: workload identity required
Technology Service: Identity Service
Technology Service: Policy Enforcement Service
Technology Service: mTLS Service
Technology Service: Audit Service
```

---

## 26. FinOps

Le coût n’est pas un Technology Service, mais la plateforme peut exposer :

```text
Technology Service: Cost Observability Service
Technology Function: Usage Metering
```

Des Outcomes ou Assessments peuvent mesurer les gains.

---

## 27. Green IT

```text
Goal: reduce infrastructure footprint
Assessment: average utilization is low
Requirement: platform must support consolidation and autoscaling
Technology Function: Autoscaling
Technology Service: Elastic Runtime Service
```

ArchiMate permet ainsi de relier objectif de sobriété et mécanismes techniques.

---

## 28. MayaBank target transverse

```text
OpenShift
 ├─ Container Execution Service
 ├─ Ingress Service
 ├─ Network Isolation Service
 └─ GitOps Deployment Service

Shared Platform
 ├─ Identity Service
 ├─ Secrets Management Service
 ├─ Observability Service
 ├─ Event Streaming Service
 ├─ Database Service
 └─ Backup/DR Service
```

Les applications se branchent sur des services standardisés plutôt que d’implémenter ces fonctions individuellement.

---

## 29. Questions de contrôle

### Q1
OIDC endpoint ?

**Réponse : Technology Interface.**

### Q2
Authentication offerte par la plateforme ?

**Réponse : Technology Service.**

### Q3
Prometheus ?

**Réponse : System Software**, dans une vue technique.

### Q4
Metrics Collection ?

**Réponse : Technology Function.**

### Q5
RPO ?

**Réponse : Requirement/contrainte de service, pas Technology Service.**

### Q6
Failover automatique ?

**Réponse : Technology Process** ou Interaction selon le focus.

### Q7
Deux sites travaillant comme une plateforme commune ?

**Réponse : Technology Collaboration** peut être approprié.

---

## À retenir

> **Une bonne Technology Architecture montre non seulement où l’application tourne, mais aussi comment elle est connectée, protégée, observée, sauvegardée et restaurée.**

Les services transverses doivent apparaître comme des dépendances architecturales explicites.