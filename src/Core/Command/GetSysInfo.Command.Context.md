# Purpose
Responsible for collecting and returning local machine system information.

# Responsibilities
- Retrieve machine information
- Collect hardware and user data
- Build system information responses
- Return command transport results
- Register execution logs

# Must NOT
- Access UI
- Persist unrelated data
- Handle command dispatching
- Execute unrelated commands
- Maintain runtime state

# Dependencies
- Command.Parser
- Transporter.Dto
- Command.Logs
- ID.Service
- Windows APIs

# Common Flow
Command → System Information Collection → TCommandResult

# Returned Data
- Machine Name
- Machine ID
- CPU Information
- RAM Information
- Local IP
- User Name
- Software Version

# Command Rules
- Command must remain stateless
- Result generation must remain deterministic
- Logging must remain centralized
- Errors must return structured transport results

# Notes for AI
- Preserve single-command responsibility
- Keep infrastructure access isolated
- Delegate logging to services
- Avoid hidden side effects
- Preserve separation of concerns