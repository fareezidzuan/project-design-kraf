# Numbers and punctuation

## Figures

| Situation | Figures |
|---|---|
| Values that change (timers, counters, live prices, balances) | Tabular (fixed width) so digits don't jitter |
| Columns of numbers | Tabular, right-aligned, decimals aligned |
| Numbers inside running prose | Proportional (the font default) |
| Large headline numbers | Tabular if they update; otherwise either |

## Money and quantities

- **Format with the locale**, never by string concatenation: grouping separators, decimal mark, currency symbol and its position all vary (`RM 1,234.50`, `1.234,50 €`, `¥1,235`).
- Show the **currency** whenever more than one is possible. Use the ISO code (MYR, USD) where symbols are ambiguous.
- Keep the **same number of decimals** within a list or table.
- **Negative values**: a true minus sign (−) or the locale's accounting format, plus a non-colour cue (sign, label, icon). Never rely on red alone.
- Make the amount the most prominent element in a money row; the currency and secondary details step down in size or colour, not the digits.
- Large numbers in tight spaces may abbreviate (1.2K, 3.4M) only where precision doesn't matter; never abbreviate a balance or amount the user acts on.
- While loading, use a neutral placeholder block, never fake digits (`0.00`, `--`).

## Dates and times

Format with the locale (`Intl.DateTimeFormat`, SwiftUI `.dateTime`, Android `DateFormat`). Use relative times ("2 min ago") for recent activity with the absolute time available on demand.

## Punctuation in rendered text

| Type | Use | Not |
|---|---|---|
| Ellipsis | … | ... |
| Range | 9–5, Mon–Fri (en dash) | 9-5 |
| Break in a sentence | — (em dash) or a spaced en dash, per house style | -- |
| Quotes | “ ” ‘ ’ | " ' |
| Apostrophe | ’ | ' |
| Multiplication, dimensions | 1920 × 1080 | 1920 x 1080 |
| Minus | − | - (in figures) |
| Keep together | Non-breaking space between number and unit (10 km), and in short names (Mr Lee) | Normal space |

Code, inputs users type into, and identifiers keep straight quotes and hyphens.

## Interface conventions

- An ellipsis on a menu item or button means it opens something that needs more input ("Rename…").
- Loading text ends with an ellipsis ("Saving…").
- Placeholders show an example of the expected format and are never the only label.
