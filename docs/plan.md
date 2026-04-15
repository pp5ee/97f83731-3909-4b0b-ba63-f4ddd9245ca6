# Employee Management System with Task Board

## Goal Description

Build a full-stack employee management system with the following components:

1. **Backend**: Java Spring Boot application with Swagger API documentation
2. **Frontend**: React SPA served from the same port as the backend (port 8080)
3. **Database**: MySQL for persistent storage
4. **Core Features**:
   - Employee management for enterprises
   - Email-based user registration and login with verification codes
   - Role-based access control with organizational hierarchy (CEO, CTO, Developer, etc.)
   - Administrator capability to remove users
   - Task board: superiors can assign tasks to subordinates, users can view own tasks and tasks they assigned to others

## Acceptance Criteria

- AC-1: Email Registration and Login
  - Positive Tests (expected to PASS):
    - User can register with valid email address
    - User receives verification code via email
    - User can login with email and verification code
    - Invalid email format is rejected during registration
  - Negative Tests (expected to FAIL):
    - Registration with duplicate email should fail
    - Login with incorrect verification code should fail
    - Login with non-existent email should fail

- AC-2: Role-Based Access Control with Organizational Hierarchy
  - Positive Tests (expected to PASS):
    - Users can be assigned roles (CEO, CTO, Developer, etc.)
    - Organizational hierarchy is maintained (superior/subordinate relationships)
    - Higher-level users can view and manage lower-level users
    - Administrator can remove users from the system
  - Negative Tests (expected to FAIL):
    - Lower-level user cannot access higher-level management functions
    - User cannot assign tasks to their superiors
    - Unauthorized user cannot remove other users

- AC-3: Task Board Functionality
  - Positive Tests (expected to PASS):
    - Superior users can create and assign tasks to subordinates
    - Users can view tasks assigned to them
    - Users can view tasks they have assigned to others
    - Task status can be updated (todo, in-progress, done)
  - Negative Tests (expected to FAIL):
    - User cannot view tasks assigned to users outside their hierarchy
    - Subordinate cannot assign tasks to superior

- AC-4: Swagger API Documentation
  - Positive Tests (expected to PASS):
    - Swagger UI is accessible at /swagger-ui.html
    - All API endpoints are documented
    - API documentation includes request/response schemas
  - Negative Tests (expected to FAIL):
    - Missing endpoints in Swagger documentation
    - Incomplete API parameter documentation

- AC-5: Frontend-Backend Integration
  - Positive Tests (expected to PASS):
    - React frontend is served from port 8080
    - Frontend can communicate with backend APIs
    - User authentication state persists across sessions
  - Negative Tests (expected to FAIL):
    - Frontend fails to load due to port conflict
    - API calls fail due to CORS issues

- AC-6: MySQL Database Integration
  - Positive Tests (expected to PASS):
    - Application connects to MySQL database successfully
    - Data is persisted across application restarts
    - Database schema supports all required entities (users, roles, tasks)
  - Negative Tests (expected to FAIL):
    - Application fails to start without MySQL connection
    - Data loss occurs when database is unavailable

- AC-7: Standard Deliverables
  - Positive Tests (expected to PASS):
    - README.md exists at project root with complete documentation
    - All commits use conventional `feat:` prefix
  - Negative Tests (expected to FAIL):
    - Missing README.md at project root
    - Commits without proper prefix

## Path Boundaries

### Upper Bound (Maximum Acceptable Scope)
The implementation includes:
- Complete Spring Boot backend with Spring Security for authentication
- React frontend with modern state management (Context API or Redux)
- MySQL database with proper entity relationships
- Swagger OpenAPI 3.0 documentation for all REST endpoints
- Role-based access control with hierarchical organization structure
- Task board with standard Kanban columns (To Do, In Progress, Done)
- Email integration using Spring Boot email starters with configurable SMTP
- Single-port deployment (8080) serving both frontend and backend

### Lower Bound (Minimum Acceptable Scope)
The implementation includes at minimum:
- Spring Boot backend with basic authentication
- React frontend with functional components
- MySQL database with essential tables (users, tasks)
- Swagger documentation for core endpoints
- Basic role assignment (admin/user)
- Task creation and assignment functionality

### Allowed Choices
- Can use: Spring Boot 3.x, React 18+, MySQL 8.x, Spring Security, Spring Data JPA, Swagger/OpenAPI
- Cannot use: Different backend frameworks (not Spring Boot), Different frontend frameworks (not React), Different databases (not MySQL)

## Feasibility Hints and Suggestions

> **Note**: This section is for reference and understanding only. These are conceptual suggestions, not prescriptive requirements.

### Conceptual Approach

**Backend Architecture (Spring Boot)**:
```
src/main/java/com/employee/
├── config/          # Security, Swagger, Email configuration
├── controller/      # REST API controllers
├── service/         # Business logic
├── repository/      # Data access layer
├── entity/          # JPA entities (User, Role, Task)
├── dto/             # Data transfer objects
└── security/        # JWT or session-based authentication
```

**Frontend Architecture (React)**:
```
src/
├── components/      # Reusable UI components
├── pages/           # Page-level components
├── services/        # API client services
├── context/         # React context for auth/state
└── App.jsx          # Main application with routing
```

**Single-Port Deployment**:
- Configure Spring Boot to serve static React build files
- Use Spring Web MVC to serve React entry point (index.html)
- Configure proxy or CORS for API calls

### Relevant References
- Spring Boot: `spring-boot-starter-web`, `spring-boot-starter-data-jpa`, `spring-boot-starter-security`
- Swagger: `springdoc-openapi-starter-webmvc-ui`
- Email: `spring-boot-starter-mail`
- React: `create-react-app` or `vite`
- MySQL: `mysql-connector-java` or Spring Boot MySQL starter

## Dependencies and Sequence

### Milestones
1. **Milestone 1**: Project Setup and Backend Foundation
   - Phase A: Create Spring Boot project structure with Maven/Gradle
   - Phase B: Configure MySQL connection, JPA entities, and Swagger

2. **Milestone 2**: Authentication System
   - Phase A: Implement email registration with verification codes
   - Phase B: Implement email login functionality
   - Phase C: Configure email service with SMTP

3. **Milestone 3**: Role-Based Access Control
   - Phase A: Define role hierarchy (CEO > CTO > Manager > Developer)
   - Phase B: Implement organizational structure (superior/subordinate)
   - Phase C: Add admin user removal capability

4. **Milestone 4**: Task Board
   - Phase A: Create task entity with status (TODO, IN_PROGRESS, DONE)
   - Phase B: Implement task assignment (superior to subordinate)
   - Phase C: Build task view (own tasks, assigned tasks)

5. **Milestone 5**: Frontend Integration
   - Phase A: Create React application
   - Phase B: Implement frontend pages (login, dashboard, task board)
   - Phase C: Configure single-port serving

6. **Milestone 6**: Documentation and Deliverables
   - Phase A: Complete Swagger API documentation
   - Phase B: Write README.md with installation and usage
   - Phase C: Verify all commits use feat: prefix

## Task Breakdown

| Task ID | Description | Target AC | Tag (`coding`/`analyze`) | Depends On |
|---------|-------------|-----------|----------------------------|------------|
| task1 | Setup Spring Boot project with dependencies | AC-6, AC-7 | coding | - |
| task2 | Configure MySQL database and JPA entities | AC-6 | coding | task1 |
| task3 | Implement Swagger API documentation | AC-4 | coding | task1 |
| task4 | Build email registration with verification | AC-1 | coding | task2 |
| task5 | Build email login functionality | AC-1 | coding | task4 |
| task6 | Configure SMTP email service | AC-1 | coding | task4 |
| task7 | Implement role hierarchy and organizational structure | AC-2 | coding | task2 |
| task8 | Add admin user removal capability | AC-2 | coding | task7 |
| task9 | Create task board with status management | AC-3 | coding | task7 |
| task10 | Implement task assignment from superior to subordinate | AC-3 | coding | task9 |
| task11 | Build task views (own tasks, assigned tasks) | AC-3 | coding | task10 |
| task12 | Setup React frontend project | AC-5 | coding | - |
| task13 | Implement frontend authentication pages | AC-1, AC-5 | coding | task12 |
| task14 | Implement frontend task board UI | AC-3, AC-5 | coding | task13 |
| task15 | Configure single-port deployment | AC-5 | coding | task12, task2 |
| task16 | Write README.md documentation | AC-7 | coding | - |
| task17 | Verify commit convention (feat: prefix) | AC-7 | analyze | - |

## Claude-Codex Deliberation

### Agreements
- Architecture supports role inheritance and hierarchical delegation (Codex)
- Email verification with configurable providers is required (Codex)
- Task assignment respects organizational hierarchy (Codex)
- Admin capabilities for user management are essential (Codex)
- MySQL integration with proper connection pooling needed (Codex)
- React SPA with proper state management (Codex)
- Swagger documentation for all API endpoints (Codex)
- Single deployment port (8080) serving both frontend and backend (Codex)

### Resolved Disagreements
- **Single-port vs separate ports**: Codex suggested reverse proxy with separate ports, but draft explicitly requires single port 8080. Resolution: Follow draft requirement for single-port deployment.
- **JWT vs session-based auth**: Codex suggested evaluating JWT vs sessions. Resolution: Use session-based auth for simplicity given the email verification flow, or JWT if more scalable. Either is acceptable.

### Convergence Status
- Final Status: `partially_converged`

**Note**: Since `GEN_PLAN_MODE=direct`, the iterative convergence loop was skipped. The plan proceeds without Claude-Codex iterative refinement. Human review is recommended before implementation.

## Pending User Decisions

- DEC-1: Email Service Provider
  - Claude Position: Use Spring Boot mail starter with configurable SMTP - any email provider can be configured in application.properties
  - Codex Position: Ask user to specify email provider (Gmail, SMTP, etc.)
  - Tradeoff Summary: The draft states "configure in config file and it works" - using a configurable SMTP approach allows any provider
  - Decision Status: PENDING - Acceptable as configured SMTP in properties

- DEC-2: Organizational Hierarchy Structure
  - Claude Position: Implement tree-based hierarchy (CEO -> CTO -> Manager -> Developer)
  - Codex Position: Ask if hierarchy should be tree or graph
  - Tradeoff Summary: Draft mentions CEO, CTO, programmers - implies tree structure
  - Decision Status: PENDING - Acceptable as tree structure

- DEC-3: React UI Framework Preference
  - Claude Position: Use standard React with CSS modules or styled-components
  - Codex Position: Ask user to specify (Material-UI, Ant Design, etc.)
  - Tradeoff Summary: Not specified in draft, use common choices
  - Decision Status: PENDING - Use plain React with basic styling

## Implementation Notes

### Code Style Requirements
- Implementation code and comments must NOT contain plan-specific terminology such as "AC-", "Milestone", "Step", "Phase", or similar workflow markers
- These terms are for plan documentation only, not for the resulting codebase
- Use descriptive, domain-appropriate naming in code instead

## Output File Convention

This template is used to produce the main output file (e.g., `plan.md`).

### Translated Language Variant

When `alternative_plan_language` resolves to a supported language name through merged config loading, a translated variant of the output file is also written after the main file. Humanize loads config from merged layers in this order: default config, optional user config, then optional project config; `alternative_plan_language` may be set at any of those layers. The variant filename is constructed by inserting `_<code>` (the ISO 639-1 code from the built-in mapping table) immediately before the file extension:

- `plan.md` becomes `plan_<code>.md` (e.g. `plan_zh.md` for Chinese, `plan_ko.md` for Korean)
- `docs/my-plan.md` becomes `docs/my-plan_<code>.md`
- `output` (no extension) becomes `output_<code>`

The translated variant file contains a full translation of the main plan file's current content in the configured language. All identifiers (`AC-*`, task IDs, file paths, API names, command flags) remain unchanged, as they are language-neutral.

When `alternative_plan_language` is empty, absent, set to `"English"`, or set to an unsupported language, no translated variant is written. Humanize does not auto-create `.humanize/config.json` when no project config file is present.

--- Original Design Draft Start ---

# Requirement

现在我想写一个java基于springboot的后端应用，需要有swagger文档；带有前端页面，启动后都从统一端口暴露服务；项目的主要需求是：1.用于企业员工管理 2.支持员工邮箱注册账号，邮箱登录，邮箱服务于留在配置文件配置后运行代码就可以发送验证码 3.用户分角色，如 ceo，cto，程序员等有组织结构；管理员可以剔除用户 4.任务看板，高一级的用户可以给下级安排任务，并且有看板，自己的任务，自己给别人分配的任务 4.数据库使用mysql，前端使用react

数据库信息保留着，后面我到配置文件添加，钝口使用8080，角色可以配置，任务看板按照常见的任务看板设计就行

---

## Standard Deliverables (mandatory for every project)

- **README.md** — must be included at the project root with: project title & description, prerequisites, installation steps, usage examples with code snippets, configuration options, and project structure overview.
- **Git commits** — use conventional commit prefix `feat:` for all commits.

--- Original Design Draft End ---
