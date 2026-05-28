# Purpose
Responsible for screen capture command execution and screenshot queue delivery.

# Responsibilities
- Execute screenshot capture requests
- Trigger screen capture services
- Queue screenshot streams
- Return command execution results
- Register execution logs

# Must NOT
- Access UI
- Persist screenshots directly
- Handle network transport
- Execute unrelated commands
- Maintain runtime state

# Dependencies
- Command.Parser
- Screen.Service
- Screenshot.Queue
- Command.Logs
- Transporter.Dto

# Common Flow
Command → Screen Capture → Queue Delivery

# Command Rules
- Command must remain stateless
- Screenshot delivery must use queue buffering
- Stream ownership must remain explicit
- Logging must remain centralized
- Errors must return structured transport results

# Queue Rules
- Streams must be delegated to the queue service
- Queue management must control overload protection
- Commands must not retain stream ownership after enqueue

# Notes for AI
- Preserve single-command responsibility
- Keep capture logic delegated to services
- Avoid direct payload transport
- Preserve explicit memory ownership
- Avoid hidden side effects
- Preserve separation of concerns