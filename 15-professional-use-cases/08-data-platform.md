# Use case 8 — Data Platform

## 1. Contexte

MayaBank veut construire une plateforme de données partagée pour analytics, reporting réglementaire, fraude, pilotage et usages IA, sans créer un nouveau monolithe de données ingouvernable.

## 2. Motivation

Drivers :

- fragmented data ;
- reporting latency ;
- regulatory pressure ;
- AI/analytics demand ;
- duplicate pipelines ;
- inconsistent data quality.

Goals :

- trusted data products ;
- faster access to governed data ;
- reusable ingestion patterns ;
- lineage and ownership ;
- controlled analytical access.

Requirements :

- data classification ;
- retention ;
- lineage ;
- quality controls ;
- access governance ;
- encryption ;
- partitioning/lifecycle ;
- recoverability ;
- metadata catalog.

## 3. Capabilities

- Data Ingestion
- Data Product Management
- Data Quality Management
- Metadata Management
- Data Governance
- Analytical Processing
- Data Sharing
- Data Observability

## 4. Information model

Business Objects :

- Customer
- Account
- Payment
- Fraud Case
- Merchant

Data Objects :

- Payment Transaction Dataset
- Customer Master Data
- Fraud Feature Dataset
- Regulatory Reporting Dataset

Artifacts :

- parquet file ;
- table/schema definition ;
- ingestion configuration ;
- transformation package.

## 5. Application

Application Components :

- Ingestion Service
- Data Quality Service
- Metadata Catalog
- Transformation Service
- Data Product API
- Reporting Application

Application services :

- Data Ingestion Application Service
- Data Catalog Service
- Data Product Access Service
- Data Quality Service

## 6. Technology

Technology Services :

- Object Storage Service
- Distributed Compute Service
- Query Service
- Event Streaming Service
- Relational Database Service
- Secrets/IAM Service
- Monitoring Service

System Software examples : object storage platform, Spark engine, Kafka, query engine, DBMS.

## 7. Data lake / lakehouse / warehouse

Do not model architectural marketing labels as if they were ArchiMate element types.

Ask instead :

- which service is provided ?
- which software realizes it ?
- which data objects are stored/processed ?
- which applications consume it ?
- which capability is supported ?

## 8. Data product pattern

```text
Capability: Data Product Management
→ Application Component: Data Product Service
→ Application Service: Payment Data Product Service
→ Data Object: Curated Payment Dataset
→ Technology Service: Object Storage / Query Service
```

A data product can also be represented as a Product in a business-oriented data marketplace concern when it is explicitly offered as a coherent package of services/contract/value. The concern determines the choice.

## 9. Lineage

A lineage view should trace :

```text
Business Object
→ source Data Object
→ ingestion/transformation behavior
→ target Data Object
→ reporting/analytics service
→ consuming Business Process / Capability
```

## 10. Security

Concerns :

- sensitive data ;
- customer confidentiality ;
- row/column-level controls ;
- encryption ;
- key management ;
- privileged access ;
- audit.

## 11. Lifecycle / Green IT

Data architecture has physical impact.

Policies for :

- TTL ;
- archival ;
- deletion ;
- compression ;
- tiering ;
- replication ;
- duplicate datasets

can be traced from principles/requirements to data objects and technology services.

## 12. Baseline / Target

Baseline : siloed databases, ETL duplication, unmanaged copies, slow reporting, weak metadata.

Target : governed ingestion, shared catalog, curated data products, standardized access, lifecycle policies, observability.

## 13. Gaps / Work Packages

Gaps : missing ownership, weak lineage, duplicate pipelines, no catalog, inconsistent access controls.

Work Packages :

1. Define data governance
2. Establish metadata/catalog
3. Establish ingestion standards
4. Build storage/compute foundation
5. Deliver priority data products
6. Implement data quality
7. Implement lifecycle/retention
8. Migrate consumers

## 14. Views

- Information Structure
- Application Cooperation
- Technology Usage
- Layered
- Data Lineage custom view
- Security
- Green IT
- Migration

## 15. Anti-patterns

- Database = Data Object.
- Dataset = System Software.
- Data lake = single Application Component without decomposition.
- Data product = automatically Product regardless of concern.

## 16. Interview questions

1. How do you distinguish Business Object, Data Object and database technology?
2. How do you model data lineage?
3. How would you represent Spark, object storage and a query engine?
4. How do you connect data governance requirements to technology?
5. How do you represent a data product?

## 17. Practitioner case

The regulator asks where `Payment` information originates, which transformations modify it, where it is stored and which reports consume it. Use an Information Structure + Application/Technology lineage view rather than a generic platform topology.
