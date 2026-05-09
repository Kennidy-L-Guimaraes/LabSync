# Purpose
Responsible for temporary screenshot stream buffering and pressure control.

# Responsibilities
- Queue screenshot streams
- Provide thread-safe enqueue/dequeue operations
- Limit memory pressure
- Release discarded streams safely
- Track queue pressure state

# Must NOT
- Capture screenshots
- Access UI
- Persist streams to disk
- Handle network transport
- Execute business logic

# Dependencies
- System.SyncObjs
- System.Generics.Collections
- System.SysUtils
- System.Classes

# Common Flow
Producer → Queue → Consumer

# Queue Rules
- Queue must remain thread-safe
- Old streams must be discarded under pressure
- Queue size must never exceed MaxItems
- Discarded streams must be freed immediately

# Pressure Rules
- High pressure starts when Count >= MaxItems
- Pressure state must remain synchronized
- Queue trimming must occur automatically

# Notes for AI
- Preserve memory ownership rules
- Keep locking minimal and deterministic
- Avoid blocking operations
- Do not convert queue into persistence storage
- Preserve FIFO behavior