# Use case 6 — IAM / Zero Trust

## 1. Contexte

MayaBank veut unifier l'identité, l'authentification, l'autorisation et la traçabilité des accès pour les clients, collaborateurs, applications, APIs et plateformes.

## 2. Motivation

Drivers : cyber risk, regulatory compliance, cloud adoption, API exposure, privileged-access risk.

Goals : least privilege, strong authentication, centralized identity, auditable access, reduced credential sprawl.

Principles :

- verify explicitly ;
- least privilege ;
- assume breach ;
- separate identity from application logic ;
- centralize policy where appropriate.

Requirements : MFA, OIDC/OAuth2, mTLS for selected flows, privileged access controls, secrets rotation, audit logging, segregation of duties.

## 3. Capabilities

- Identity Lifecycle Management
- Authentication
- Authorization
- Privileged Access Management
- Machine Identity Management
- Access Governance
- Security Monitoring

## 4. Business and application

Business roles : Customer, Payment Operator, Fraud Analyst, Platform Administrator.

Application interfaces : Login Interface, Token Endpoint, Authorization API.

Application/technology services : Authentication Service, Authorization Service, Token Service, Secrets Service, Certificate Service.

## 5. Technology

```text
Technology Service: Identity Service
System Software: Identity Provider

Technology Service: Secrets Management Service
System Software: Vault / Secrets Platform

Technology Service: Certificate Service
System Software: PKI / HSM platform
```

A product name does not dictate the ArchiMate type. Model the service when the concern is consumption; model the software when the concern is implementation/runtime.

## 6. Zero Trust chain

```text
Driver: Increased Cyber Threat
→ Goal: Reduce Unauthorized Access
→ Principle: Least Privilege
→ Requirement: Strong Authentication
→ Technology Service: Identity Service
→ Application Interfaces / Components
→ Business Processes protected
```

## 7. Human vs workload identity

Separate :

- customer identity ;
- workforce identity ;
- privileged identity ;
- application/service identity ;
- certificate/key identity.

They may share platforms but have different concerns and controls.

## 8. Baseline

- local application accounts ;
- multiple directories ;
- static secrets ;
- inconsistent authorization ;
- weak privileged-access traceability.

## 9. Target

- federated identity ;
- centralized authentication ;
- policy-based authorization ;
- workload identity ;
- centralized secrets ;
- privileged access controls ;
- unified audit.

## 10. Gaps and work packages

Gaps : duplicate identity stores, static credentials, weak role model, missing service identities, incomplete audit.

Work Packages :

1. Define IAM target model
2. Consolidate identity providers
3. Establish federation/OIDC
4. Implement PAM
5. Implement workload identity
6. Centralize secrets
7. Migrate applications
8. Retire legacy stores

## 11. Views

- Motivation View
- Organization View
- Application Usage View
- Technology Usage View
- Security cross-layer view
- Migration View

## 12. Anti-patterns

- `IAM` as one generic box with no services or consumers.
- `User` modeled only as Business Actor when the concern is identity lifecycle and role assignment.
- Authorization modeled as authentication.
- Secrets store considered equivalent to identity provider.

## 13. Interview questions

1. How do you distinguish authentication and authorization in an ArchiMate model?
2. How do you model human and machine identities?
3. Where do IAM requirements belong?
4. How do you show which business processes depend on one identity provider?
5. How do you model PAM and secrets management?

## 14. Practitioner case

A security architect wants to identify the blast radius if the central Identity Service fails. Use a cross-layer impact view from Technology Service to Application Interfaces/Components, then to Business Services and Processes.
