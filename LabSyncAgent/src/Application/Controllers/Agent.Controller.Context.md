# Purpose
Responsible for agent-level orchestration, configuration initialization,
command execution routing, and controlled feature state management.

# Responsibilities
- Initialize agent configuration safely
- Coordinate command execution through dispatcher
- Manage feature toggle states
- Retrieve system information commands
- Expose configuration values for upper layers
- Read audit logs through logging service
- Preserve execution boundaries between services

# Must NOT
- Access UI components directly
- Render visual elements
- Parse raw network packets or transport streams
- Execute commands without dispatcher mediation
- Persist configuration manually outside Config.Service
- Contain business logic unrelated to orchestration
- Store global mutable state
- Communicate directly with databases or filesystem except through services

# Dependencies
- Config.Service
- Command.Dispatcher
- Command.Logs
- ID.Service
- Transporter.Dto

# Exposed Features
- Screenshot
- LiveMode
- Messages
- Downloads
- Shutdown
- Registry
- Folders
- Commands
- Information

# Internal Components
- TConfig
  Responsible for persistent option state and initialization control.

- TCommandDispatcher
  Responsible for controlled command execution flow.

- TLog
  Responsible for reading audit log content.

- TID
  Responsible for unique agent identification.

# Common Flow
Caller
  → TAgentController
    → Validate initialization state
      → Build command
        → Dispatch command through TCommandDispatcher
          → Receive TCommandResult
            → Return transporter result

# Initialization Flow
Create Controller
  → Instantiate services
    → Initialize configuration
      → Verify startup state
        → Register default feature options
          → Persist startup flag

# Configuration Rules
- All feature states must be managed through TConfig
- Feature toggles must remain centralized
- Display formatting must come from Config.Service
- Initialization must be idempotent
- Default values must only be applied once

# Command Execution Rules
- Commands must be routed exclusively through TCommandDispatcher
- Controller must not execute shell instructions directly
- Command strings should remain isolated from presentation layers
- Transport results must use DTO structures

# Logging Rules
- Logs must be accessed through TLog abstraction
- Audit.log is treated as read-only operational history
- Empty log responses should terminate safely

# State Management
- Prefer immutable transport structures
- Avoid static/shared mutable state
- Keep controller lifecycle deterministic
- Release owned services during destruction

# Architectural Notes for AI
- This unit acts as an orchestration layer, not a business layer
- Preserve strict separation of concerns
- Avoid embedding execution logic inside UI or transport layers
- New commands should follow dispatcher-based execution
- New options should be managed through Config.Service only
- Keep initialization isolated from operational execution
- Do not bypass service abstractions for convenience
- Favor service composition over inheritance

# Security Notes
- Command construction must remain controlled
- Avoid exposing raw internal identifiers externally
- Feature toggles represent operational permissions
- Dispatcher execution context must remain explicit

# Expected Design Pattern
Facade + Service Orchestration

# Related Concepts
- Command Dispatcher Pattern
- DTO Transport Layer
- Feature Toggle Management
- Dependency Isolation
- Controlled Execution Pipeline
- Service-Based Architecture

# AI Refactoring Guidance
- Preserve constructor/destructor ownership symmetry
- Keep command execution centralized
- Do not collapse services into controller
- Avoid coupling controller with infrastructure details
- Maintain lightweight orchestration behavior
- Preserve explicit execution flow visibility

# Anti-Patterns
- Direct filesystem manipulation inside controller
- UI rendering responsibilities
- Static singleton state
- Inline command execution
- Hardcoded infrastructure dependencies
- Mixed persistence and orchestration logic

# File Classification
Application Layer / Agent Orchestration Controller