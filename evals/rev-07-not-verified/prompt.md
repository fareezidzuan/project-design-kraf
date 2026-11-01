---
max_turns: 12
allowed_tools: [Read, Glob, Grep, Skill]
---

Review the accessibility of our checkout page. Here's the JSX for the main form:

```jsx
<form onSubmit={pay}>
  <label htmlFor="card">Card number</label>
  <input id="card" inputMode="numeric" autoComplete="cc-number" />
  <button type="submit">Pay RM 120.00</button>
</form>
```
You can't run the app.
