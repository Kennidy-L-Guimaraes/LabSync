# Purpose
Responsible for centralized command dispatching, validation,
permission enforcement, target filtering, and controlled command execution.

# Responsibilities
- Parse incoming command strings
- Normalize command identifiers
- Validate command targets
- Enforce execution permissions
- Route commands to specialized command handlers
- Generate standardized execution errors
- Provide command suggestions for invalid instructions
- Isolate command execution flow from upper layers

# Must NOT
- Access UI components directly
- Persist configuration or state
- Execute commands outside registered handlers
- Perform network transport delivery
- Implement business logic unrelated to dispatching
- Bypass permission validation
- Manipulate filesystem data directly
- Maintain shared mutable global state

# Dependencies
- Command.Parser
- Command.Logs
- CommandSuggestion.Service
- GetPrint.Command
- GetLiveMode.Command
- GetSysInfo.Command
- Transporter.Dto
- Config.Service
- ID.Service

# Core Components
- TCommandParser
  Responsible for extracting and normalizing command metadata.

- TCommandSuggestionService
  Responsible for approximate command matching and suggestions.

- TGetPrintCommand
  Responsible for screenshot capture execution.

- TGetLiveModeCommand
  Responsible for live monitoring execution.

- TGetSysInfoCommand
  Responsible for system information retrieval.

# Supported Commands
- $get_print
- $get_livemode
- $get_sysinfo
- $exec_shutdown

# Execution Flow
Raw Command
  → Parse command name
    → Parse target identifier
      → Validate configuration
        → Validate target machine
          → Validate permissions
            → Route to command handler
              → Return TCommandResult

# Permission Validation Flow
Command Request
  → Execution Context Check
    → Read feature permission from TConfig
      → Allow or deny execution

# Target Filtering Rules
- Commands targeting another machine must terminate immediately
- Local execution is only allowed when:
  - Target = current machine ID
  - Target = all
- Target validation must occur before execution

# Command Routing Rules
- Every command must be routed through explicit conditional dispatch
- Command handlers must remain isolated units
- Dispatcher must not contain operational execution logic
- Unsupported commands must return structured errors

# Error Handling Rules
- Invalid commands should provide suggestion assistance
- Permission denial should remain explicit
- Missing configuration must raise hard exceptions
- Errors must use TCommandResult transport structures

# Security Rules
- Remote execution must always validate permissions
- Execution context must remain explicit
- Command normalization must occur before comparisons
- Unknown commands must never execute partially
- Dispatcher must act as execution gatekeeper

# Execution Contexts
- ecLocal
  Trusted local execution context.

- ecRemote
  Restricted remote execution context requiring permission checks.

# Architectural Notes for AI
- This unit represents the command gateway layer
- Keep dispatcher lightweight and deterministic
- Preserve explicit execution flow visibility
- New commands must follow the same validation pipeline
- Avoid embedding transport or UI logic into dispatcher
- Permission logic must remain centralized
- Dispatcher should coordinate, not execute internally

# Design Characteristics
- Centralized Dispatch Pattern
- Permission-Gated Execution
- Command Routing Architecture
- Handler-Based Execution Model

# Expected Extension Pattern
New commands should:
1. Be implemented in isolated command units
2. Define independent Run methods
3. Pass through dispatcher validation
4. Respect execution context permissions
5. Return TCommandResult structures

# Anti-Patterns
- Inline command execution logic
- Hardcoded machine identifiers
- Permission bypasses
- UI interaction inside dispatcher
- Transport delivery coupling
- Direct filesystem or registry manipulation
- Silent execution failures

# Refactoring Guidance for AI
- Prefer command registry abstractions if scaling increases
- Preserve explicit permission boundaries
- Maintain deterministic routing behavior
- Keep parsing isolated from execution handlers
- Avoid collapsing handlers into dispatcher
- Preserve command isolation for maintainability

# Internal Limitations
- Current routing uses chained conditional dispatch
- Error transport delivery is partially unimplemented
- Permission feedback mechanism is incomplete
- Unsupported commands currently terminate silently in some branches

# File Classification
Application Layer / Command Dispatch Gateway