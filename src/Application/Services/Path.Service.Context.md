# Purpose
Responsible for centralized LabSync path resolution and directory creation.

# Responsibilities
- Build LabSync local paths
- Resolve APPDATA-based directories
- Ensure directory existence
- Centralize filesystem path generation

# Must NOT
- Access UI
- Persist business data
- Execute commands
- Handle network transport
- Contain business logic

# Dependencies
- SysUtils
- Windows
- System.IOUtils

# Common Flow
Service → Path Resolution → Local Directory

# Path Rules
- All paths must use APPDATA as base
- Missing directories must be created automatically
- Path generation must remain centralized
- Returned paths must remain deterministic

# Notes for AI
- Preserve centralized path management
- Avoid hardcoded filesystem paths
- Keep path logic isolated
- Do not mix path resolution with persistence logic
- Preserve separation of concerns