# Purpose
Responsible for lightweight timer-based loop execution.

# Responsibilities
- Execute repeated procedures
- Manage timer lifecycle
- Start timed loops
- Stop active loops
- Centralize timer callbacks

# Must NOT
- Execute business logic directly
- Persist data
- Handle network transport
- Parse commands
- Access application state directly

# Dependencies
- Vcl.ExtCtrls
- Command.Logs

# Common Flow
Procedure → Timer Loop → Repeated Execution

# Loop Rules
- Only assigned procedures should execute
- Timer lifecycle must remain centralized
- Loops must remain lightweight
- Stop must disable active execution safely

# Notes for AI
- Preserve timer-based execution
- Keep loop service generic
- Avoid blocking operations inside loops
- Do not couple loop logic with UI behavior
- Preserve separation of concerns