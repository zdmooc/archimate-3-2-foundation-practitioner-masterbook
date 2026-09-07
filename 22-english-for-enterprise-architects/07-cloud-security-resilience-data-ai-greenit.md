# 07 — Cloud, Security, Resilience, Data, AI & Green IT English

## 1. Cloud architecture vocabulary

| English | Français |
|---|---|
| landing zone | landing zone |
| subscription / account | abonnement / compte cloud |
| resource group | groupe de ressources |
| virtual network | réseau virtuel |
| peering | peering |
| private endpoint | endpoint privé |
| managed service | service managé |
| shared service | service partagé |
| tenant | tenant / locataire |
| workload | charge de travail |
| autoscaling | mise à l’échelle automatique |
| elasticity | élasticité |
| region | région |
| availability zone | zone de disponibilité |
| egress | trafic sortant |
| ingress | trafic entrant |
| reserved capacity | capacité réservée |
| pay-as-you-go | paiement à l’usage |
| cloud exit | stratégie de sortie cloud |
| vendor lock-in | dépendance fournisseur |

## 2. Explaining a cloud landing zone

**The landing zone establishes the governance baseline for cloud workloads. It defines identity integration, network topology, logging, security controls, naming, policy, resource hierarchy and cost-management boundaries before application teams deploy workloads.**

Useful phrases:

- **The landing zone provides guardrails rather than application-specific logic.**
- **Shared services are separated from workload subscriptions.**
- **Network connectivity is centralized through...**
- **Policies are enforced at organizational scope.**
- **Private connectivity is used for sensitive platform services.**

## 3. Cloud migration strategies

- **rehost** — move with minimal application change
- **replatform** — move and adapt the runtime/platform
- **refactor** — redesign application structure
- **repurchase** — replace with a packaged/SaaS solution
- **retain** — keep where it is
- **retire** — remove it

Professional explanation:

**I do not apply one migration strategy to the whole portfolio. Each application is assessed against business value, technical debt, dependencies, latency, data constraints and target operating model.**

## 4. Cloud trade-offs

- **Managed services reduce operational burden but can increase provider dependency.**
- **Multi-region deployment improves resilience but increases cost and data-consistency complexity.**
- **Private networking improves isolation but adds routing and DNS complexity.**
- **Autoscaling improves elasticity but does not remove the need for capacity planning on shared stateful services.**
- **Container portability reduces some platform dependency, but surrounding managed services may still create lock-in.**

## 5. Security vocabulary

| English | Français |
|---|---|
| identity provider | fournisseur d’identité |
| authentication | authentification |
| authorization | autorisation |
| entitlement | droit / habilitation |
| least privilege | moindre privilège |
| workload identity | identité de workload |
| service account | compte de service |
| privileged access | accès privilégié |
| secret rotation | rotation des secrets |
| key management | gestion des clés |
| certificate authority | autorité de certification |
| trust boundary | frontière de confiance |
| attack surface | surface d’attaque |
| threat model | modèle de menace |
| lateral movement | mouvement latéral |
| security posture | posture de sécurité |
| audit trail | piste d’audit |
| segregation of duties | séparation des responsabilités |

## 6. Explaining identity architecture

**Human users authenticate through the enterprise identity provider. Workloads use machine identities rather than shared static credentials. Authorization is enforced according to least privilege, and privileged administration is separated from standard operational access.**

## 7. Explaining OAuth/OIDC in simple English

**OIDC provides an identity layer on top of OAuth 2.0. The client obtains a token from the identity provider and presents it to the protected service. The service validates the token and applies authorization rules. The architecture must define token audience, lifetime, scopes or claims, key rotation and service-to-service trust.**

## 8. mTLS vocabulary

- **client certificate** — certificat client
- **server certificate** — certificat serveur
- **certificate rotation** — rotation des certificats
- **mutual authentication** — authentification mutuelle
- **certificate chain** — chaîne de certificats
- **revocation** — révocation

Phrase:

**mTLS provides mutual authentication between workloads, but it does not by itself define business authorization.**

## 9. Resilience vocabulary

| English | Français |
|---|---|
| failure domain | domaine de défaillance |
| fault isolation | isolation de panne |
| failover | bascule |
| fallback | repli |
| degradation | fonctionnement dégradé |
| recovery point objective | objectif de perte de données |
| recovery time objective | objectif de temps de reprise |
| active-active | actif-actif |
| active-passive | actif-passif |
| quorum | quorum |
| split brain | split brain |
| replication lag | retard de réplication |
| recovery runbook | procédure de reprise |
| chaos testing | test de chaos |
| resilience test | test de résilience |

## 10. Explaining RPO and RTO

**RPO defines how much data loss the business can tolerate after a failure. RTO defines how long the service can remain unavailable before recovery must be completed. These are business-driven requirements that influence replication, backup and failover architecture.**

Example:

**An RPO of zero may require synchronous replication or an equivalent consistency mechanism. That can increase latency and coupling, so the requirement must be justified by the business impact of data loss.**

## 11. HA vs DR

**High availability protects service continuity during local failures. Disaster recovery addresses larger failure scenarios such as complete site loss. HA and DR may share mechanisms, but they answer different failure scopes.**

## 12. Resilience review questions

- **What is the failure domain?**
- **Which failures are automatically tolerated?**
- **Which failures require operator action?**
- **How is failure detected?**
- **What state can be lost?**
- **How is duplicate processing prevented after recovery?**
- **When was the recovery process last tested?**
- **Does the secondary site depend on the primary site for identity, DNS or network control?**
- **Can we operate in degraded mode?**
- **What is the business impact during failover?**

## 13. Data architecture vocabulary

| English | Français |
|---|---|
| system of record | système de référence |
| source of truth | source de vérité |
| data owner | propriétaire des données |
| data steward | data steward |
| lineage | lignage |
| retention | rétention |
| residency | localisation / résidence des données |
| classification | classification |
| schema evolution | évolution de schéma |
| data quality | qualité de données |
| master data | données de référence / master data |
| analytical data | données analytiques |
| operational data | données opérationnelles |
| data product | produit de données |
| data contract | contrat de données |

## 14. Explaining data ownership

**The application that stores data is not automatically the business owner of that data. The architecture should distinguish business ownership, logical data responsibility and physical storage responsibility.**

## 15. Data platform explanation

**The data platform provides ingestion, storage, processing, governance and access services. Data lineage tracks how information moves and transforms from source systems to analytical products. Retention, classification and residency requirements apply across the whole lifecycle.**

## 16. Data platform challenge questions

- **Who owns the data semantics?**
- **Where is the authoritative source?**
- **How is schema evolution governed?**
- **How is lineage captured?**
- **What is the retention policy?**
- **Can sensitive data leave the region?**
- **How are deleted source records handled downstream?**
- **How is data quality measured?**

## 17. GenAI vocabulary

| English | Français |
|---|---|
| foundation model | modèle de fondation |
| large language model | grand modèle de langage |
| inference | inférence |
| prompt | prompt |
| system prompt | prompt système |
| retrieval | récupération d’information |
| retrieval-augmented generation | RAG |
| embedding | embedding / représentation vectorielle |
| vector store | base vectorielle |
| guardrail | garde-fou |
| hallucination | hallucination |
| evaluation | évaluation |
| grounding | ancrage dans des sources |
| prompt injection | injection de prompt |
| model endpoint | endpoint modèle |
| token consumption | consommation de tokens |
| model routing | routage de modèles |

## 18. Explaining a GenAI platform

**The GenAI platform separates application use cases from model providers. Applications call an AI gateway or orchestration layer, which applies authentication, policy, model routing, prompt controls and observability. Retrieval components provide enterprise context when needed. Evaluation and guardrails are part of the platform because model quality and safety cannot be assumed from the model endpoint alone.**

## 19. GenAI architecture risks

- **Sensitive data leakage**
- **Prompt injection**
- **Hallucinated output**
- **Uncontrolled model cost**
- **Provider dependency**
- **Untraceable prompts and responses**
- **Weak evaluation**
- **Model or embedding drift**
- **Data residency issues**

Professional sentence:

**The model is one dependency in the solution, not the whole AI architecture. The platform must control data access, identity, evaluation, observability, cost and provider abstraction.**

## 20. Green IT vocabulary

| English | Français |
|---|---|
| carbon footprint | empreinte carbone |
| embodied carbon | carbone incorporé / fabrication |
| operational emissions | émissions d’usage |
| utilization rate | taux d’utilisation |
| right-sizing | dimensionnement juste |
| over-provisioning | surprovisionnement |
| consolidation | consolidation |
| decommissioning | décommissionnement |
| hardware lifecycle | cycle de vie matériel |
| power consumption | consommation électrique |
| cooling | refroidissement |
| data retention | rétention de données |
| workload scheduling | planification des workloads |

## 21. Explaining Green IT architecture

**Green IT architecture focuses on design decisions that change real resource consumption. Right-sizing reduces unused capacity. Consolidation improves utilization. Data-retention policies reduce unnecessary storage growth. Decommissioning is critical: moving a workload does not create a physical benefit if the legacy infrastructure remains powered and allocated.**

## 22. Explaining carbon carefully

Avoid:

*Moving to containers reduces carbon by 50%.*

Prefer:

**The container platform may improve utilization and reduce the amount of infrastructure required. The actual carbon benefit depends on measured resource consumption, hardware allocation, energy source and whether legacy capacity is truly removed or repurposed.**

## 23. FinOps + GreenOps language

- **unit cost per transaction**
- **cost allocation**
- **resource utilization**
- **idle capacity**
- **reserved capacity**
- **workload efficiency**
- **cost and carbon trade-off**
- **capacity avoidance**

Example:

**A cheaper architecture is not automatically a lower-carbon architecture, and a lower-carbon architecture is not automatically cheaper. We need to measure both cost and resource impact at the relevant unit of work.**

## 24. Cross-domain architecture answer

**For a critical cloud-native payment platform, I would connect security, resilience, data and sustainability rather than treating them as separate workstreams. Identity and secrets define trust. Multi-site design and controlled replication define recovery. Data ownership and residency define where information can move. Observability proves runtime behavior. Right-sizing and decommissioning determine whether the platform improves resource efficiency. These concerns should be traceable to the same architecture components and requirements.**