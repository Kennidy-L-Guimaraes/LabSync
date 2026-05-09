# Purpose
Responsible for approximate command matching and typo suggestion generation.

# Responsibilities
- Compare command similarity
- Calculate Levenshtein distance
- Suggest closest valid commands
- Improve invalid command feedback

# Must NOT
- Execute commands
- Validate permissions
- Parse command parameters
- Access UI
- Persist data

# Dependencies
- Windows
- Math

# Common Flow
Invalid Command → Similarity Check → Suggested Command

# Suggestion Rules
- Suggestions must use Levenshtein distance
- Only close matches should be returned
- Suggestions must remain deterministic
- Empty suggestions are valid results

# Threshold Rules
- Suggestions are valid only when distance <= 3
- Unknown commands should return empty string

# Notes for AI
- Preserve lightweight behavior
- Avoid fuzzy AI-based matching
- Keep matching deterministic
- Do not couple suggestions with dispatcher logic
- Preserve typo-correction purpose only