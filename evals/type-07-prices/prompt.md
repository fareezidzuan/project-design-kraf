---
max_turns: 12
allowed_tools: [Read, Glob, Grep, Skill]
---

Here's how we render prices in our product table (React):

```jsx
<td>${'$' + price.toFixed(2)}</td>
```
Some rows are in EUR and JPY too. Improve it.
