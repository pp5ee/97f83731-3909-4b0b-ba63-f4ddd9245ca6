# Goal Tracker

<!--
This file tracks the ultimate goal, acceptance criteria, and plan evolution.
It prevents goal drift by maintaining a persistent anchor across all rounds.

RULES:
- IMMUTABLE SECTION: Do not modify after initialization
- MUTABLE SECTION: Update each round, but document all changes
- Every task must be in one of: Active, Completed, or Deferred
- Deferred items require explicit justification
-->

## IMMUTABLE SECTION
<!-- Do not modify after initialization -->

### Ultimate Goal

Build a full-stack employee management system with the following components:

1. **Backend**: Java Spring Boot application with Swagger API documentation
2. **Frontend**: React SPA served from the same port as the backend (port 8080)
3. **Database**: MySQL for persistent storage
4. **Core Features**:
   - Employee management for enterprises
   - Email-based user registration and login with verification codes
   - Role-based access control with organizational hierarchy (CEO, CTO, Developer, etc.)

### Acceptance Criteria
<!-- Each criterion must be independently verifiable -->
<!-- Claude must extract or define these in Round 0 -->


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

---

## MUTABLE SECTION
<!-- Update each round with justification for changes -->

### Plan Version: 1 (Updated: Round 0)

#### Plan Evolution Log
<!-- Document any changes to the plan with justification -->
| Round | Change | Reason | Impact on AC |
|-------|--------|--------|--------------|
| 0 | Initial plan | - | - |

#### Active Tasks
<!-- Map each task to its target Acceptance Criterion and routing tag -->
| Task | Target AC | Status | Tag | Owner | Notes |
|------|-----------|--------|-----|-------|-------|
| [To be populated by Claude based on plan] | - | pending | coding or analyze | claude or codex | - |

### Completed and Verified
<!-- Only move tasks here after Codex verification -->
| AC | Task | Completed Round | Verified Round | Evidence |
|----|------|-----------------|----------------|----------|

### Explicitly Deferred
<!-- Items here require strong justification -->
| Task | Original AC | Deferred Since | Justification | When to Reconsider |
|------|-------------|----------------|---------------|-------------------|

### Open Issues
<!-- Issues discovered during implementation -->
| Issue | Discovered Round | Blocking AC | Resolution Path |
|-------|-----------------|-------------|-----------------|
