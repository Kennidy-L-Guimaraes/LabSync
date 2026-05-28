# Purpose
Responsible for command parsing and parameter extraction.

# Responsibilities
- Normalize command input
- Extract command names
- Extract targets and values
- Parse quality parameters

# Must NOT
- Execute commands
- Validate permissions
- Persist data
- Access UI
- Contain business logic

# Dependencies
- System.SysUtils

# Common Flow
Raw Command → Parser → Structured Values

# Supported Parameters
- target=
- value=
- quality=

# Notes for AI
- Keep parser stateless
- Preserve deterministic parsing
- Avoid regex-heavy implementations
- Do not mix parsing with validation