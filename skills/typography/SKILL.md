---
name: typography
description: Set and review how text looks and behaves: type scale and roles, line height, letter spacing, line length, font choice and loading, numbers, wrapping, truncation and punctuation, for web, SwiftUI and Expo/React Native. Use when building or reviewing any screen with text, defining a type scale, or when text feels cramped, flat, amateur or hard to read.
---

# Typography

Most interfaces are mostly text. Good typography is a small, consistent system applied without exceptions. Work through the steps in order.

## 0. Load the project's type system

If the project has `.design/system.md` (or `DESIGN.md`) with a **Typography** section, use its families, roles and sizes. Otherwise start from [references/scale.md](references/scale.md).

**Never propose a new typeface** unless the task is about changing type. Improve how the existing faces are used.

## 1. Define roles, not sizes

List the roles the screen needs (for example display, title, heading, body, label, caption, figure) and give each **one** combination of size, line height, weight and colour. A role is one decision, not three.

- Keep the scale small: 5–7 roles cover most products.
- Name roles by purpose (`text-body`, `text-label`), not by value (`text-14`).
- Hierarchy uses **size, weight and colour together**. If two adjacent roles differ by only 1–2px, merge them or separate them properly.
- Heading levels descend through the scale; a lower heading never outweighs its parent.
- Check hierarchy in greyscale: if it collapses without colour, it is too weak.

## 2. Line height by role

| Role | Line height |
|---|---|
| Display (≥ 40px) | 1.0–1.15, tighter as it grows |
| Titles and headings | 1.2–1.3 |
| Body and descriptions | 1.5–1.65 |
| Labels, buttons (single line) | 1.2–1.4 |

- Anything that can wrap to three or more lines needs **≥ 1.4**, even inside a tight card.
- Wider columns need more leading; light text on dark surfaces needs slightly more leading, tracking and weight.
- Use unitless values on the web so leading scales with size.

## 3. Letter spacing by size

| Text | Tracking |
|---|---|
| Body | 0 |
| Headings 24–40px | −0.01 to −0.02em |
| Display > 40px | −0.02 to −0.03em (condensed or very heavy faces: 0 to −0.015em) |
| Short uppercase labels | +0.02 to +0.06em |

Letters must never touch. Don't change weight on hover; the text reflows.

## 4. Line length

Long-form text: **45–75 characters per line**, aiming for about 65. Set a maximum width on every text block that can run long.

## 5. Weight and size floors

- Body: 16px on the web, iOS Body (17pt), Android Body Large/Medium in sp.
- Dense UI text (inputs, menus, tables): 14px on the web; never below 12px anywhere, 11pt on iOS.
- Weights 100–300 only at 28px and above. Small text is 400 or heavier.
- Emphasis inside a role is one weight step up, not a size change.

## 6. Families

- **One family by default.** A second only when it has a named job (mono for IDs and figures, a display face for marketing headlines). Three is the ceiling, and only for marketing.
- Pair for contrast (serif headline over sans body), never two near-identical sans faces.
- Load every weight and style you use; never let the browser fake bold or italic. Load only what you use.

## 7. Numbers

- **Tabular figures** for anything that changes or lines up: prices, balances, timers, counters, table columns.
- Right-align numeric columns; align decimals.
- Format with the user's locale (separators, currency symbol position, dates). Never build number strings by hand.
- Details, including money: [references/numbers-and-punctuation.md](references/numbers-and-punctuation.md).

## 8. Wrapping and overflow

- Balance short headings; avoid a single orphaned word at the end of a paragraph.
- Long words, URLs and IDs must not overflow their container.
- Labels and badges that break onto two lines look broken: keep them on one line or shorten them.
- Truncate only with a way to see the full text (tooltip, expand, detail view), and test with long real strings, not "Lorem".
- Interface text aligns to the start; no justified text in UI.

## 9. Respect the reader's settings

Text must survive **200% zoom / largest Dynamic Type / Android font scale 1.3+** without clipping or overlapping. Never lock text size to fixed pixels or points where the platform offers scalable units.

## 10. Punctuation and case

Store copy in natural case and apply case with styling. Use real typographic characters in rendered text: … – — “ ” ’. Sentence case for UI labels and buttons unless the brand system says otherwise.

## Platform implementation

- Web (CSS, Tailwind): [references/web.md](references/web.md)
- SwiftUI: [references/swiftui.md](references/swiftui.md)
- Expo / React Native: [references/expo.md](references/expo.md)

## Reviewing typography

Use [references/review.md](references/review.md). Report findings as a table ordered by severity:

| Severity | Where | Now | Change to | Why |
|---|---|---|---|---|

Say which checks you could not verify (for example, no browser or device to test zoom).
