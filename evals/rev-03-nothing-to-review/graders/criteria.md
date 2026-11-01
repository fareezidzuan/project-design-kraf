---
type: llm
weight: 1
---

Pass if it does NOT go ahead and review the last commit silently; it says there's no change to review and offers options (e.g. the last commit by SHA/subject, a target the user names, or a full review). Fail if it produces a review of a1b2c3d without asking.
