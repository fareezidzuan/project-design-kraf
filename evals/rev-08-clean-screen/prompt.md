---
max_turns: 12
allowed_tools: [Read, Glob, Grep, Skill]
---

Review this settings row component:

```jsx
<div className="row">
  <label htmlFor={id} className="row-label">Email notifications</label>
  <Switch id={id} checked={on} onCheckedChange={setOn} aria-describedby={hintId} />
  <p id={hintId} className="row-hint">Weekly summary of activity</p>
</div>
```
`id` and `hintId` come from `useId()`. The Switch is Radix's accessible switch, styled with our tokens; the focus ring uses our focus token (measured 3.4:1), and `.row-hint` text measures 5.1:1 on the row background.
