# Purpose
Responsible for local configuration persistence and option state management.

# Responsibilities
- Store feature options
- Load configuration values
- Persist startup state
- Manage option serialization
- Initialize default configuration file

# Must NOT
- Access UI
- Execute commands
- Handle network transport
- Contain business logic
- Parse raw commands

# Dependencies
- System.Classes
- System.SysUtils
- System.IOUtils
- Winapi.ShlObj
- Path.Service

# Common Flow
Service → Config → Local File

# Stored Values
- Started
- Feature option states

# Persistence Rules
- Configuration must remain file-based
- Missing configuration files must be initialized automatically
- Option values must remain deterministic

# Notes for AI
- Preserve centralized configuration access
- Keep persistence isolated
- Avoid static mutable state
- Do not mix config with orchestration logic
- Preserve separation of concerns