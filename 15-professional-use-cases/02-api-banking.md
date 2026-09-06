# Use case 2 — API Banking

## 1. Contexte

MayaBank veut exposer des services bancaires via APIs de manière cohérente, sécurisée, gouvernée et réutilisable par les canaux internes, partenaires et fintechs.

## 2. Motivation

Drivers :

- ecosystem integration ;
- faster partner onboarding ;
- omnichannel consistency ;
- API security ;
- reduction of point-to-point integrations.

Goals :

- reusable banking services ;
- controlled external exposure ;
- shorter integration lead time ;
- consistent authentication and authorization.

Requirements :

- API versioning ;
- authentication ;
- authorization ;
- rate limiting ;
- auditability ;
- contract-first design ;
- backward compatibility policy.

## 3. Capabilities

- API Product Management
- Partner Integration
- API Security
- API Lifecycle Management
- Developer Experience
- Banking Service Exposure

## 4. Business

Business services potentially exposed :

- Account Information Service
- Payment Initiation Service
- Beneficiary Management Service
- Payment Status Service

Business actors :

- Retail Customer
- Corporate Customer
- Partner Fintech
- MayaBank

## 5. Application pattern

```text
Consumer Application
       ↓
Application Interface: Banking REST API
       ↓ exposes
Application Service: Account Information Application Service
       ↓ realized by
Application Function: Retrieve Account Information
       ↓ assigned to
Application Component: Account API Service
```

The interface is **where the consumer connects**.
The service is **what functionality is provided**.
The component is **what implements it**.

## 6. API Gateway

Depending on the concern, an API Gateway can be represented as :

- Application Component when modeling application-level mediation/orchestration responsibilities ;
- System Software / Technology when modeling the runtime platform product ;
- Technology Service when modeling gateway capability consumed by applications.

Never decide the type from the product name alone.

## 7. API management chain

```text
API Consumer
→ API Interface
→ Application Service
→ Application Component
→ Technology Service: API Management Service
→ System Software: API Gateway Platform
```

## 8. Data

Business Object :

- Customer Account
- Payment Order
- Beneficiary

Data Object :

- Account API Response
- Payment Initiation Request
- Beneficiary Record

Artifact examples :

- OpenAPI specification
- API policy configuration
- container image

## 9. Security

Key concerns :

- identity provider ;
- OAuth/OIDC ;
- client credentials ;
- token validation ;
- scopes ;
- mTLS ;
- secrets ;
- audit ;
- API threat protection.

Possible chain :

```text
Requirement: Strong API Authentication
→ Technology Service: Identity Service
→ System Software: Identity Provider
→ Application Interface: Banking REST API
```

## 10. Baseline vs Target

Baseline :

- SOAP and proprietary interfaces ;
- point-to-point links ;
- inconsistent authentication ;
- weak lifecycle governance.

Target :

- API catalog ;
- standardized REST/event APIs ;
- centralized identity ;
- API gateway ;
- contract-first design ;
- lifecycle controls ;
- observability.

## 11. Gaps

- no canonical API taxonomy ;
- duplicate interfaces ;
- no standard auth pattern ;
- unclear ownership ;
- no versioning policy ;
- incomplete telemetry.

## 12. Work Packages

1. Define API governance
2. Establish API management platform
3. Establish IAM integration
4. Build developer portal
5. Expose priority banking services
6. Migrate consumers
7. Retire legacy interfaces

## 13. Useful views

- Product View
- Application Cooperation View
- Application Usage View
- Technology Usage View
- Security View
- Layered View
- Migration View

## 14. Anti-patterns

### API = Service

Incomplete. The service and interface should be separated when the concern needs that distinction.

### API Gateway = business capability

Usually false. `API Management` can be a capability ; a gateway product is not itself the capability.

### OpenAPI specification = Data Object

If the concern is deployment/configuration, it is more naturally an **Artifact**.

## 15. Interview questions

1. How do you distinguish API Interface and Application Service?
2. How would you model OAuth/OIDC dependencies?
3. What is the ArchiMate type of an API Gateway?
4. How do you represent an API product exposed to a partner?
5. How do you show legacy API retirement in a migration roadmap?

## 16. Practitioner case

A partner uses the Payment Initiation API. The architect must show the business service offered, the API endpoint, the component implementing it, and the IAM/runtime services on which it depends.

Recommended view : **Layered View** with Business + Application + Technology.
