---
name: fintech-review
description: Review banking, payments, cards and wallet screens for money-specific problems: how balances and amounts are shown, sensitive data and masking, step-up authentication, money movement and confirmation, receipts, statements and transactions, errors with money at stake, and the project's own banking and compliance rules. Use alongside ui-review whenever a screen shows or moves money, or when designing or reviewing card, transfer, payment, statement or account screens.
---

# Fintech review

Money screens carry extra risk: a misread number, a leaked card number or an unclear transfer costs people real money and trust. This skill adds those checks on top of `ui-review`. Use `ui-review`'s severities, evidence rules and report format, and add a **Money** area to its scorecard.

## 0. Load the project's banking rules

Read the project's `DESIGN.md` (or `.design/system.md`), section **Banking rules**. It holds the bank's terminology, disclosures, masking, step-up, limits, receipts and session policies.

- Apply every rule it provides.
- For a rule marked TODO or missing, **don't invent one**. List it under "Not checked: rule not provided".
- Never guess regulatory, Shariah or legal wording. Flag anything that looks like it needs compliance review instead.

## 1. Amounts and balances

- **One figure leads.** Each money screen answers one question ("How much can I spend?"); that figure is the largest on screen. If two figures could be "the balance" (available balance vs available credit limit, ledger vs available), the screen labels both plainly and the project's decision says which leads. An open decision is reported, not decided by you.
- **Every amount is unambiguous:** currency shown (MYR / RM per project rule), consistent decimals, locale formatting, tabular figures, right-aligned in lists.
- **Direction is never colour alone.** Money in and money out carry a sign (+/−) or label as well as colour. Spending is not an error: don't use the error colour for normal outgoing transactions.
- **Pending vs posted** is visually distinct and labelled, and pending items say what they're waiting for.
- **No fake numbers while loading.** Use a neutral skeleton block, never `0.00` or `RM --` that could be read as a real balance.
- **Changes in place** (a balance after a transfer) may animate digits; first load never does.

## 2. Sensitive data

- **Card numbers masked by default** (last four visible). Full details only after step-up, with a clear way to hide them again and a timeout per project rule.
- Sensitive values are **hidden in the app switcher** and excluded from screenshots where the project requires it.
- Copy actions on card numbers or account numbers confirm what was copied and, where required, clear the clipboard.
- Personal data in notifications, receipts and share sheets follows the masking rule too.

## 3. Step-up authentication

- Actions that move money, reveal card details, change limits, block cards, or change security settings ask for Face ID / passcode as the project specifies.
- The prompt says **why** in plain words ("We need to verify it's you before showing your card details").
- Cancel returns the user to exactly where they were, with nothing changed and nothing lost.
- Failure explains what happened and what to do next; repeated failure says when they can try again or how to get help.

## 4. Moving money

- **Review before commit:** amount, recipient (name and masked account), source account, fees, total, reference and timing (now vs scheduled) on one screen before the final action.
- The final button names the action and the amount ("Transfer RM 120.00"), not "Confirm" or "Submit".
- **Double-submit protection:** the button disables with a spinner once tapped and keeps its label.
- **Outcome is explicit:** success, failure, or **pending/unknown** (network dropped mid-request), each with its own screen. Unknown never shows success; it tells the user how to check.
- Limits are visible before the user hits them, and limit errors give the limit and the next step.
- Irreversible actions (block card permanently, close account) confirm with consequences stated; reversible ones (freeze card) prefer a quick toggle with undo.

## 5. Receipts, statements and history

- Receipts show what the bank requires (project rule) plus date, time, reference, amount, fees, sender, recipient and status; they can be shared or saved, with sensitive fields masked.
- Statement and transaction order follows the project's decision; dates group clearly; search and filters keep their state on return.
- Empty history explains why and what to do; failed loads offer retry without losing scroll position.

## 6. Errors where money is at stake

- Say what happened to the money ("You haven't been charged", "The transfer is still processing").
- Never a raw error code alone; include a reference the user can quote to support.
- Network and timeout errors on payment never invite a blind retry that could pay twice.

## 7. Islamic banking and terminology

Use only the terms in the project's **Banking rules → terminology**. If that section is empty, flag any wording around profit, fees, charges, rates or financing as **needs compliance review** rather than correcting it yourself.

## Severity

Automatic **Blockers** in addition to `ui-review`'s list:

- An unmasked card or account number by default.
- A money-moving action with no review step, or a final button that doesn't name the action.
- A success state shown when the outcome is unknown.
- An amount without currency or with ambiguous direction.
- A placeholder digit that could be read as a real balance.
- Double-submission possible on a payment.

## Report

Add to the `ui-review` report:

```md
### Money
Score: 0–4 · Rules applied: <list> · Not checked (rule not provided): <list>
Open decisions affecting this screen: <list>
```
