---
max_turns: 12
allowed_tools: [Read, Glob, Grep, Skill]
---

Review this PR. It changes one line in our shared tokens file:

```diff
- --text-secondary: #5F6368;
+ --text-secondary: #A0A4A8;
```
The token is used for helper text under form fields, table metadata and timestamps across ~40 components, on a white background.
