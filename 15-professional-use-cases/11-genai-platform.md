# Use case 11 — GenAI Platform

## 1. Contexte

MayaBank veut industrialiser des usages GenAI internes et métiers sans multiplier les POC isolés, tout en maîtrisant données, sécurité, coûts, qualité, modèles et exploitation.

## 2. Motivation

Drivers :

- productivity ;
- knowledge access ;
- conversational services ;
- code/document assistance ;
- competitive pressure ;
- model/data risk.

Goals :

- reusable enterprise AI platform ;
- governed access to models ;
- secure enterprise data usage ;
- measurable quality and cost ;
- controlled deployment lifecycle.

Requirements :

- data classification ;
- model access control ;
- prompt/response logging policy ;
- PII handling ;
- content safety ;
- model evaluation ;
- cost allocation ;
- observability ;
- human-in-the-loop for selected decisions ;
- fallback / model portability where required.

## 3. Capabilities

- AI Platform Engineering
- Model Access Management
- Prompt/Application Engineering
- RAG
- Model Evaluation
- AI Governance
- AI Observability
- GPU/Compute Management

## 4. Business use cases

Business processes may include :

- Assist Fraud Analyst
- Search Internal Knowledge
- Draft Customer Response
- Summarize Incident
- Assist Software Delivery

The GenAI model itself is not a Business Capability.

## 5. Application architecture

Application Components :

- GenAI Gateway
- RAG Orchestrator
- Prompt Service
- Retrieval Service
- Evaluation Service
- Guardrail Service
- Vector Search Application
- AI Workbench

Application Services :

- Enterprise LLM Access Service
- Retrieval-Augmented Generation Service
- Prompt Management Service
- Model Evaluation Service

## 6. Data

Business Objects : internal knowledge, customer interaction, policy, incident record.

Data Objects : chunks, embeddings, prompt templates, evaluation datasets, model response records.

Artifacts : model files when hosted, deployment manifests, prompt/config packages, model adapters.

## 7. Technology

Technology Services :

- Model Serving Service
- GPU Compute Service
- Vector Storage Service
- Object Storage Service
- Secrets Service
- Identity Service
- Observability Service

System Software : model serving runtime, OpenShift AI/Kubernetes platform, vector DB engine, object storage, GPU drivers/runtimes.

## 8. Hosted model vs external API

External model provider :

- external Business Actor / provider in commercial concern ;
- external Technology/Application Service in consumption concern ;
- API Interface for access.

Self-hosted model :

- model Artifact ;
- model serving Technology Service/System Software ;
- GPU Nodes/Devices.

## 9. RAG pattern

```text
Business Knowledge
→ Data Objects / Documents
→ Ingestion / Chunking
→ Embedding / Index
→ Retrieval Service
→ RAG Orchestrator
→ LLM Service
→ Business/Application Service
```

## 10. Security and governance

Trace :

```text
Driver: AI Risk
→ Goal: Controlled AI Adoption
→ Principle: Human Oversight for High-Risk Decisions
→ Requirements
→ Guardrail / Evaluation / Identity Services
→ GenAI applications
```

## 11. Cost / FinOps

Properties and measures :

- tokens ;
- GPU hours ;
- model cost ;
- storage ;
- latency ;
- throughput.

Capability : AI Cost Management if the organization needs a stable ability to govern it.

## 12. Baseline / Target

Baseline : isolated POCs, direct SaaS calls, duplicated prompts, unmanaged data, no evaluation standard.

Target : governed model gateway, shared RAG services, secure data access, observability, evaluation, reusable deployment patterns.

## 13. Gaps / Work Packages

Gaps : no AI governance, no shared model access, no evaluation framework, no cost model, weak data controls.

Work Packages :

1. Define AI governance
2. Establish AI platform
3. Establish model gateway
4. Establish RAG foundation
5. Establish evaluation/guardrails
6. Establish AI observability
7. Deliver pilot use cases
8. Industrialize model/application lifecycle

## 14. Views

- Motivation
- Capability
- Application Cooperation
- Information Structure
- Technology
- Layered
- Security/Governance
- Cost custom view
- Migration

## 15. Anti-patterns

- LLM = Capability.
- Prompt = Business Process.
- Vector database = Data Object.
- RAG = one generic Application Component without showing data/retrieval/model concerns.
- AI platform topology with no business use case or governance trace.

## 16. Interview questions

1. How do you model an LLM in ArchiMate?
2. How do you distinguish RAG application services from model-serving technology?
3. Where do prompt templates and model files belong?
4. How do you model external model providers?
5. How do you trace AI governance requirements to technical controls?

## 17. Practitioner case

The CISO wants to know which GenAI business use cases can access customer data and through which services. Build a data/security cross-layer view from Business Processes to Application Services, Data Objects, IAM/Secrets and model services.
