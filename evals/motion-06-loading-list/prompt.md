---
max_turns: 12
allowed_tools: [Read, Glob, Grep, Skill]
---

Write the loading state for our transactions list (web, React, plain CSS). Here's the current component; write the code from scratch around it.

```jsx
export function TransactionList({ items }) {
  return (
    <ul className="tx-list">
      {items.map(t => (
        <li key={t.id} className="tx-row">
          <span className="tx-merchant">{t.merchant}</span>
          <span className="tx-date">{t.date}</span>
          <span className="tx-amount">{t.amount}</span>
        </li>
      ))}
    </ul>
  );
}
```
