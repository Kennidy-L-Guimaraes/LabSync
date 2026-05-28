# Purpose
Responsible for machine identity generation and local identity retrieval.

# Responsibilities
- Generate unique machine identifiers
- Persist machine identity locally
- Provide machine ID access
- Provide version information
- Initialize identity files automatically

# Must NOT
- Access UI
- Execute commands
- Handle network transport
- Store business data
- Parse raw input

# Dependencies
- Windows
- SysUtils
- Path.Service
- System.Classes
- System.IOUtils

# Common Flow
Machine → Identity Service → Local Identity File

# Stored Values
- ID
- Name
- Version
- Date

# Identity Rules
- Machine identity must persist locally
- IDs must remain stable after creation
- Missing identity files must be recreated automatically
- Identity generation must use GUID-based values

# Notes for AI
- Preserve deterministic identity access
- Keep identity persistence isolated
- Avoid mutable runtime state
- Do not mix identity logic with command execution
- Preserve separation of concerns