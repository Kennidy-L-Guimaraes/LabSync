# Purpose
Responsible for centralized audit logging, execution trace persistence,
and standardized operational event recording.

# Responsibilities
- Persist audit logs to local storage
- Read stored log files
- Standardize success and failure log formatting
- Ensure log directory creation
- Provide lightweight logging abstraction for application services
- Record execution timing and command metadata

# Must NOT
- Execute business logic
- Parse commands
- Access UI components
- Dispatch commands
- Handle network transport
- Store application configuration
- Perform analytics or log interpretation
- Maintain mutable runtime state

# Dependencies
- Windows
- System.IOUtils
- SysUtils

# Core Components

## TLog
Static logging service responsible for:
- Audit persistence
- Log retrieval
- Success event recording
- Failure event recording

# Log Storage Rules
- Logs must be stored under:
  APPDATA\LabSync\Logs

- Log directory must be created automatically if missing
- UTF-8 encoding must be preserved
- Logging operations should remain append-only

# Supported Log Operations

## SaveLog
Persists raw formatted log entries into target log files.

Responsibilities:
- Append content safely
- Preserve line separation
- Raise explicit persistence exceptions

## ReadLogs
Retrieves full log file content.

Behavior:
- Returns UTF-8 text content
- Returns fallback informational message when logs do not exist

## Success
Records successful command execution entries.

Format:
SUCCESS | Timestamp | ID | Command | Params | ElapsedTime

## Fail
Records failed command execution entries.

Format:
FAIL | Timestamp | ID | Command | Params | ElapsedTime | Error

# Common Flow
Application Service
  → TLog.Success / TLog.Fail
    → Build standardized log line
      → Resolve log path
        → Append to Audit.log

# Logging Rules
- Logging format must remain deterministic
- Success and failure events should remain standardized
- Logging must remain append-only
- Exceptions during persistence should remain explicit
- Audit entries should remain human-readable

# File System Rules
- Log path resolution must remain centralized
- APPDATA should remain the base persistence location
- Log directory creation must be automatic
- File encoding must remain UTF-8

# Error Handling Rules
- Persistence failures must raise exceptions
- Missing logs should not generate failures
- Read operations should fail gracefully
- Logging should never silently discard errors

# Architectural Notes for AI
- This unit is infrastructure-oriented
- Preserve logging isolation from business logic
- Keep formatting centralized
- Avoid embedding analytics or filtering logic
- Maintain lightweight static service behavior
- Logging should remain operationally transparent

# Design Characteristics
- Centralized Logging Service
- Append-Only Audit Trail
- Static Utility Pattern
- Infrastructure Layer Logging

# Security Notes
- Logs may contain operational metadata
- Avoid storing sensitive credentials or secrets
- Audit trails should remain immutable after persistence
- Log formatting should avoid injection-prone structures
- Command parameters may require sanitization in future revisions

# Expected Usage Pattern
- Operational services generate log events
- Dispatcher or command handlers record execution outcomes
- Infrastructure layers persist audit history
- Upper layers consume logs through abstraction only

# Refactoring Guidance for AI
- Preserve append-only behavior
- Maintain centralized formatting rules
- Avoid coupling logs to UI presentation
- Keep filesystem access encapsulated
- Prefer asynchronous logging only if execution guarantees remain intact
- Do not transform logging service into event orchestration layer

# Anti-Patterns
- Inline file persistence outside TLog
- UI notification logic inside logging service
- Direct console rendering
- Runtime mutable static caches
- Business analytics inside logger
- Log formatting duplication across application

# Internal Limitations
- Logging currently depends on local filesystem access
- No log rotation mechanism exists
- No concurrent write synchronization exists
- No structured JSON logging support
- No remote log transport mechanism implemented

# File Classification
Infrastructure Layer / Audit Logging Service