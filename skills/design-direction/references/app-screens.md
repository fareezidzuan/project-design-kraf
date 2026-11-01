# App screens

Screens people work in: dashboards, lists, detail views, settings, wallets, inboxes, editors.

## Start from the data and the job

Before layout, write down:

- **Objects and fields** the screen shows, with units.
- **Realistic sizes:** how many items, a typical amount, the range, and how small things are for a new account. Design for those, not for a perfect demo.
- **Who opens it, how often, on what device.**
- **The jobs from here**, and which one happens most.

## The screen's one question

Every screen answers one question first: "Did today's payments go through?", "Who is waiting for a reply?", "How much of this month's budget is left?". Write it down. It decides:

- **What is biggest.** The largest block and the largest figure answer that question. No other figure outranks it.
- **What comes first** in reading order.
- **What is left out.** A few numbers often beat a chart. A block that answers no question is removed.

Then name **the finding**: the one fact in today's data that most needs attention, and put it where it is read first, next to the action it drives.

## Layout rules

- **The most frequent job is one click away**, placed where its answer appears.
- **Everything the brief names is visible on the first screen** at a common laptop size: headers and first rows or figures. Cap long lists (4–6 rows plus "View all").
- **Time-sensitive blocks** (due, failed, overdue) come before long tables.
- **Show evidence beside the answer**: one line explaining the spike beats a second chart.
- **Vary the rhythm.** Not every block is the same card at the same size with the same gap. Group tightly, separate groups clearly.
- **Proportions say something:** a narrow sidebar serves the content; equal columns say peers.

## Figures

- **The answer figure leads:** roughly 1.3× or more the size of sibling figures. Labels sit above values, in sentence case, a step quieter.
- **Tabular figures**, consistent decimals, locale formatting (see the `typography` skill).
- **Units** as a smaller, quieter suffix.
- **KPIs don't need a tile each.** One container split into columns, or each number placed in the card it explains, usually reads better than a row of identical boxes with icons.
- **Deltas name their baseline** ("vs last 30 days"). **Colour means good or bad, not up or down:** a rising error rate or cost is negative. Zero or undefined change is neutral grey, never a green "+0%". From zero, say "new".

## Data must agree with itself

- A value shown twice comes from one source and reads identically.
- Totals are computed from the rows as displayed (rounded values add up to the shown total).
- Small accounts are shown at their real size; don't inflate sample data.

## Surfaces and structure

- **One depth strategy** (borders, subtle shadows, or tone steps). Don't mix.
- **Elevation is quiet:** each surface level only a few percent lighter or darker than the one below. Menus and popovers sit one level above their parent.
- **Sidebars share the canvas background**, separated by a quiet border, not a different colour.
- **Inputs read as inset**: slightly darker fill or a clear border, with dedicated control tokens.
- **Borders disappear until needed**: low-contrast, semi-transparent, stronger only for focus and emphasis.
- **Text has four levels:** primary, secondary, tertiary, disabled.
- **Dark mode:** lean on borders and tone steps rather than shadows; desaturate status colours slightly; keep one hue family across surfaces.

## States

Every screen has loading, empty, error and partial-data versions; every control has hover, focus, active and disabled. Design them with the main state, not after. See the `motion` skill's loading-states reference.
