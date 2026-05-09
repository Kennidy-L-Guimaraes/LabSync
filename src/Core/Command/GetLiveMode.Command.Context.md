# Purpose
Responsible for continuous screen capture loop control and live streaming activation.

# Responsibilities
- Start live capture loops
- Stop live capture loops
- Control adaptive capture quality
- Queue live screenshot streams
- Return command execution results

# Must NOT
- Access UI
- Persist screenshots directly
- Handle network transport
- Execute unrelated commands
- Implement low-level capture logic

# Dependencies
- Command.Parser
- Loop.Service
- Screen.Service
- Screenshot.Queue
- Transporter.Dto

# Common Flow
Command → Live Capture Loop → Screenshot Queue

# Command Rules
- Command must remain stateless
- Live mode must remain loop-driven
- Capture logic must remain delegated
- Queue pressure must control capture quality
- Errors must return structured transport results

# Adaptive Rules
- Queue pressure must reduce capture cost
- Capture quality must adapt dynamically
- Queue overload must prevent excessive captures
- Streams must be released safely

# Notes for AI
- Preserve single-command responsibility
- Keep loop orchestration lightweight
- Delegate capture and buffering to services
- Avoid hidden side effects
- Preserve explicit memory ownership
- Preserve separation of concerns