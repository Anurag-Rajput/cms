# Complaint Management System Project

## Project Overview
This project is a legacy Java-based complaint management web application built using the Spring MVC framework, Spring Security, JSP/Tiles, and PostgreSQL. It was designed around complaint intake, case processing, officer workflows, and management reporting. In its current form, it appears to be a cleaned or partially stripped-down codebase: the web framework, security model, and deployment layout remain, while the original business-specific complaint logic may have been removed or needs to be reimplemented for a new target domain.

## Business Purpose
The application domain is a complaint/case-management system for internal governance or vigilance operations. It supports flow from citizen complaint submission through staff handling and reporting. The business model is role-driven and includes multiple operational personas such as:

- Citizen
- Diary / intake user
- Dealing Hand
- Section Officer
- Branch Officer
- CVO / oversight officer
- CLR / clearance role
- Admin

The code and cleanup documentation indicate that the system was meant to serve a vigilance / complaint-processing workflow rather than a generic CMS or e-commerce app.

## Functional Modules

### 1. Authentication and User Access
- Login and registration flow
- Password recovery and first-profile setup
- Role-based access via Spring Security
- Custom success and failure handlers
- Logout and session invalidation

### 2. Complaint Registration / Diary Module
- Complaint intake
- Complaint numbering / diary creation
- Validation and edit checks
- Citizen-facing complaint submission
- Acknowledgment and email/SMS workflow hooks

### 3. Citizen Portal
- User profile management
- Complaint listing
- Complaint detail retrieval
- Password change and self-service updates

### 4. Officer Processing Modules
- Dealing Hand workflow
- Section Officer workflow
- Branch Officer workflow
- Case review and action processing
- Complaint state changes such as close/open and routing

### 5. Oversight and Reporting
- Monthly report generation
- Complaint summary reports
- Delay reports
- Interim reports
- Officer and branch dashboard operations

### 6. Administrative Functions
- Role restrictions and access control
- User-level workflow routing
- Coordination and admin screens
- File and document access integration

## Technical Architecture

### Stack
- Java (legacy enterprise app)
- Maven WAR packaging
- Spring Framework 4.x
- Spring MVC
- Spring Security 4.x
- JSP + Apache Tiles
- PostgreSQL
- JDBC / JdbcTemplate-based DAO layer
- Servlet container (Tomcat-like deployment)

### Runtime Structure
The application follows a classic Spring MVC pattern:

- `web.xml` initializes the servlet container and security filters
- `applicationContext.xml` loads shared beans
- `spring-data.xml` configures the datasource and transactions
- `spring-security.xml` defines URL authorization and authentication flow
- `servlet-context.xml` configures MVC, view resolvers, resources, and Tiles

### Key Configuration Files
- `WEB-INF/web.xml`
- `WEB-INF/applicationContext.xml`
- `WEB-INF/spring-data.xml`
- `WEB-INF/spring-security.xml`
- `WEB-INF/spring/appServlet/servlet-context.xml`
- `WEB-INF/tiles.xml`

## Code Organization
The project organizes classes by role and workflow rather than by a modern modular microservice layout. The important package groups include:

- `com.cvc.user.controller` — web controllers
- `com.cvc.user.service` and `com.cvc.user.service.impl` — service logic
- `com.cvc.user.daoImpl` — raw DAO implementations
- `com.cvc.dto` — data transfer objects
- `com.cvc.util` — utility/helper classes
- `com.cvc.cases.controller` — supporting case-related controller

## Security Model
The security configuration is XML-based and uses form login with role-based URL access. The application restricts sections of the app by role, e.g.:

- Diary area for diary user
- DH area for dealing hand
- SO area for section officer
- BO area for branch officer
- CVO area for chief vigilance officer
- Admin area for administrative privileges

The custom login process uses the usual Spring Security 4 pattern with:

- `j_spring_security_check`
- `j_username`
- `j_password`
- custom login handlers

## Data Layer and Persistence
The project does not follow a modern JPA-first design. Instead, it uses:

- PostgreSQL as the persistence layer
- JDBC datasource configuration
- `JdbcTemplate`-style access patterns
- direct SQL in service/DAO classes

This is common in legacy Spring applications, but it is harder to maintain, test, and scale than a Spring Data JPA or repository-based design.

## Front-End and UI
The UI is based on:

- JSP pages
- Tiles templates
- Role-specific layouts such as admin, BO, CLR, and coordination views
- Static resource folders for CSS, JavaScript, and uploaded documents

This makes the app visually and technically more like a classic enterprise web app than a modern SPA or headless API system.

## Current State and Risks
The project appears to be an application skeleton or cleaned template rather than a complete final business implementation. Cleanup documents mention that the original CVC-specific logic was stripped or removed and the framework remained. Therefore:

- Some core business logic may be incomplete
- Features need custom implementation or restoration
- Security and DB configuration require environment-specific setup
- The application depends on legacy Java and framework versions
- It is comparatively difficult to maintain and modernize without a full replatforming

## Modernization Recommendations
A phased modernization plan is recommended:

### Recommended target stack
- Java 17 or 21 LTS
- Spring Boot 3
- Spring Security 6
- JWT / OAuth2 / OIDC for authentication
- React, Angular, or Next.js for the UI
- JPA/Hibernate or Spring Data Repository for persistence
- PostgreSQL with connection pooling and migration management
- Redis for cache/queues if needed
- Docker / Kubernetes for deployment
- CI/CD with automated tests and security scanning

### Suggested path
1. Document all role workflows and business rules
2. Create a target database schema and migration plan
3. Move to Spring Boot and Java LTS
4. Replace XML config with annotation-based Boot configuration
5. Replace JSP/Tiles UI with modern frontend framework
6. Move to REST APIs and role-based access tokens
7. Add monitoring, health checks, and automated deployment

## Conclusion
This is a classic pre-Boot Spring MVC complaint management system with a strong role-based workflow model and a clean enterprise-application structure. It is useful as a business blueprint, but it is dated by modern standards because of XML configuration, older Java, JSP/Tiles, direct JDBC access, and a monolithic deployment style. The best long-term plan is a controlled modernization to a Spring Boot + modern frontend + API-first architecture.

## References
This README was derived from the project configuration, controller inventory, and cleanup documentation found in the project tree, including:

- `README_CLEANUP.md`
- `cvproject_050320_CLEANUP_REPORT.md`
- `CLEANUP_QUICK_REFERENCE.txt`
- `cvproject_050320/WEB-INF/web.xml`
- `cvproject_050320/WEB-INF/applicationContext.xml`
- `cvproject_050320/WEB-INF/spring-data.xml`
- `cvproject_050320/WEB-INF/spring-security.xml`
- `cvproject_050320/WEB-INF/spring/appServlet/servlet-context.xml`
- `cvproject_050320/META-INF/maven/com.cvc/cvproject/pom.xml`
