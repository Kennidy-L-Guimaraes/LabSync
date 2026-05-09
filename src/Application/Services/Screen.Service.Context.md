# Purpose
Responsible for screen capture, frame differencing, and delta image encoding.

# Responsibilities
- Capture screen frames
- Generate frame deltas
- Encode JPEG streams
- Detect tile changes
- Manage capture and encoding threads
- Queue capture packets safely

# Must NOT
- Access UI logic
- Persist screenshots to disk
- Handle network transport
- Execute business logic
- Parse commands

# Dependencies
- Windows
- Vcl.Graphics
- Winapi.GDIPAPI
- System.Classes
- System.SyncObjs
- System.Generics.Collections

# Common Flow
Screen Capture → Tile Diff → JPEG Encode → Delta Packet

# Capture Rules
- Screen capture must remain asynchronous
- Capture and encoding must remain separated
- Frame processing must use thread-safe queues
- Memory streams must remain explicitly owned

# Delta Rules
- Only changed tiles should trigger delta packets
- Tile checksums must remain deterministic
- Frame comparison must remain lightweight
- JPEG encoding must remain centralized

# Thread Rules
- Capture thread handles screen acquisition only
- Diff thread handles checksum and encoding only
- Queue access must remain synchronized
- Threads must terminate safely

# Notes for AI
- Preserve producer-consumer architecture
- Keep capture and encoding isolated
- Avoid blocking operations
- Preserve explicit memory ownership
- Do not mix transport logic with capture logic
- Preserve separation of concerns