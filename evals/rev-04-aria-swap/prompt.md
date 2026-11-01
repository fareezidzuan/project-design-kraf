---
max_turns: 12
allowed_tools: [Read, Glob, Grep, Skill]
---

Review this change for interface regressions:

```diff
-<button aria-label="Close dialog" class="close"><XIcon/></button>
+<h2 id="dlg-title">Edit profile</h2>
+<button aria-labelledby="close-txt" class="close"><XIcon/><span id="close-txt" class="sr-only">Close dialog</span></button>
```
