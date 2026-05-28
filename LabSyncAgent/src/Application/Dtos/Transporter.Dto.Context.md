# Purpose
Responsible for transport-safe data exchange structures used during
command execution, result delivery, and execution context definition.

# Responsibilities
- Define execution context types
- Standardize command result transport
- Encapsulate textual and stream-based responses
- Provide lightweight DTO structures for inter-layer communication
- Manage stream ownership lifecycle safely

# Must NOT
- Execute commands
- Perform business logic
- Access UI components
- Parse command input
- Persist data
- Handle network transport directly
- Contain orchestration logic
- Allocate infrastructure dependencies internally

# Dependencies
- Classes

# Core Structures
- None
## TExecutionContext
Defines the execution origin and trust boundary.

Values:
- ecLocal
  Trusted local execution.

- ecRemote
  Restricted remote execution requiring permission validation.

# TResultTypes
Defines the payload type returned by command execution.

Values:
- crtNone
  No result payload.

- crtText
  Textual response payload.

- crtStream
  Binary or stream-based payload.

# TCommandResult
Primary transport structure for command execution results.

Fields:
- Success
  Indicates execution success state.

- DataType
  Defines which payload type is present.

- Text
  Textual response content.

- Stream
  Binary stream payload.

- Error
  Structured error description.

# TStreamResult
Lightweight ownership wrapper for stream lifecycle management.

Responsibilities:
- Own stream instance
- Release stream memory during destruction
- Prevent stream ownership leaks

# Common Flow
Command Handler
  → Generate execution result
    → Populate TCommandResult
      → Return through dispatcher
        → Deliver to upper layers

# DTO Rules
- DTOs must remain lightweight
- DTOs must not contain operational behavior
- Transport structures should remain serialization-friendly
- Result structures should remain deterministic
- Avoid embedding infrastructure dependencies

# Stream Ownership Rules
- TStreamResult owns the stream lifecycle
- Destroy must always release owned streams
- Avoid shared ownership ambiguity
- Stream references should never leak unmanaged

# Error Handling Rules
- Execution failures must populate Error field
- Success state should remain explicit
- DataType must accurately reflect payload content
- Empty payloads should use crtNone

# Architectural Notes for AI
- This unit is part of the transport contract layer
- Preserve strict DTO purity
- Avoid adding orchestration or execution logic
- Keep structures serialization-safe
- Favor immutable transport usage patterns where possible
- Stream ownership must remain explicit

# Design Characteristics
- DTO-Oriented Architecture
- Transport Layer Isolation
- Lightweight Data Contracts
- Explicit Ownership Model

# Security Notes
- Execution context represents trust boundaries
- Remote execution should always be treated as restricted
- Stream payloads should be validated before external consumption
- Transport objects should not expose internal implementation state

# Refactoring Guidance for AI
- Preserve backward compatibility of transport contracts
- Avoid adding helper logic into DTO records
- Keep transport structures framework-agnostic
- Prefer explicit payload typing over dynamic casting
- Maintain separation between transport and execution layers

# Anti-Patterns
- Embedding execution logic inside DTOs
- UI formatting responsibilities
- Shared stream ownership without lifecycle control
- Dynamic variant payload abuse
- Hidden transport side effects
- Mutable global transport state

# File Classification
Core Layer / Transport DTO Contracts