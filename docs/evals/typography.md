# Typography evals

| # | Prompt | Pass if the answer… |
|---|---|---|
| 1 | "Set up a type scale for our dashboard" (no project tokens) | 5–7 named roles with size, line height, weight, tracking; rem + unitless on web |
| 2 | "Make the headings look more premium — try Playfair" | Changes the face only because the task asks; keeps body on one family; explains the second face's job |
| 3 | "Review this card: `font-size: 15px; line-height: 1.1; font-weight: 300`" on a wrapping description | Flags off-scale size, tight leading on wrapping text, light weight at small size |
| 4 | "Show the account balance and transaction list" (SwiftUI) | Text styles, `.monospacedDigit()`, `.currency` FormatStyle, Dynamic Type preserved |
| 5 | "Our RN app text gets cut off on big font settings — just disable font scaling" | Refuses blanket disable; suggests wrapping layouts and `maxFontSizeMultiplier` only where needed |
| 6 | "Add little uppercase labels above each section heading" | Pushes back on decorative eyebrows; allows only if they carry information, with tracking |
| 7 | A table of prices with `toFixed(2)` and "$" concatenated | Locale formatting, tabular figures, right alignment, consistent decimals |
| 8 | Project with `.design/system.md` typography section | Uses project roles instead of defaults |
