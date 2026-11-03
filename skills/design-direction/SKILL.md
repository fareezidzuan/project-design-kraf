---
name: design-direction
description: Decide what a product or page should look and feel like before building it: the brief, the subject's world, a signature, palette, type, density, depth and layout, written down as a short plan and saved to the project. Use when starting a new screen, page, app or redesign, when there is no clear visual direction, or when a design looks generic, templated or "AI-made".
---

# Design direction

Generated UI tends to look like the average of everything the model has seen. The fix is not more decoration; it is **decisions made for this product**, written down before any code. Work through the steps in order.

## 0. Check what's already decided

- If the project has `.design/system.md` (or `DESIGN.md`) with a direction, **apply it**. Don't re-propose. Only revisit it if the user asks for a redesign.
- If there is an existing brand (logo, colours, fonts), keep it **with its own names and values**. Direction then covers composition, density, depth and the signature, not the brand itself. You may add roles the brand lacks (semantic colours, neutral surfaces); label them clearly as additions.
- If the brief or brand asks for a look that appears in [references/defaults.md](references/defaults.md), use it **without commentary**. That list is only for choices the brief leaves open.
- If neither exists, continue below and save the result at the end.

## 1. Page or app screen?

- **A page** is read and scrolled: landing, marketing, product, portfolio, event. → [references/pages.md](references/pages.md)
- **An app screen** is worked in: dashboard, list, detail, settings, wallet, inbox, editor. → [references/app-screens.md](references/app-screens.md)

A marketing site that shows the product is a page; the product fragments inside it follow app-screen rules.

## 2. Write the brief in four lines

- **Who:** the actual person and their situation (a finance lead checking cash at 8am, a student between classes on a phone).
- **Job:** the verb they came to do (approve, pay, compare, book, find out).
- **Feel:** concrete words, not "clean and modern". Dense like a trading floor? Calm like a reading app? Warm like a notebook? Quiet and trustworthy like a bank statement?
- **Context:** device, how often, how long (a glance once a day vs an eight-hour session).

If the request is vague, write your best reading and **state it**. Ask one question only when the answer would change the direction substantially.

## 3. Explore the subject before any visuals

Write these down:

- **Inventory:** 8–12 things that belong to this product and no competitor: its name and what it means, its objects and data, its place, materials, rituals, numbers, the printed artefacts of its world (receipt, ticket, statement, label).
- **Colour world:** 5+ colours that exist naturally in that world (not "blue for trust").
- **Signature:** one element only this product could have. A visual device, a structural choice or an interaction, taken from the inventory.
- **Defaults to reject:** name 3 obvious choices for this kind of product (visual and structural) and what you'll do instead. See [references/defaults.md](references/defaults.md).

**Competitor test:** put the nearest competitor's name into your signature sentence. If it still works, the idea belongs to the category, not the product. Dig further.

## 4. Write the direction

A compact plan, short enough to read in a minute:

| Part | Decide |
|---|---|
| **Palette** | 4–6 named colours with roles: ground, ink, one accent, semantic (positive, negative, warning). Roughly 60% neutral surface, 30% secondary tone, 10% accent. Token names from the product's world beat `gray-700`. |
| **Type** | Families and their jobs; roles and scale (use the `typography` skill). One family is normal; two need a reason. |
| **Density** | Spacing base (4 or 8) and how tight: workbench-tight or brochure-airy. Same numbers everywhere. |
| **Depth** | One strategy: borders only, subtle shadows, or tone steps between surfaces. |
| **Shape** | A radius scale (small for controls, larger for containers), or square throughout. Nested corners: outer = inner + padding. |
| **Motion** | Personality and the one signature moment (use the `motion` skill). |
| **Layout** | One-sentence concept plus a rough ASCII wireframe; alignment (left by default); what is biggest and why. |
| **Signature** | Where it appears: point to specific elements. |

Use [references/system-template.md](references/system-template.md) for the format.

## 5. Review the plan before building

- **Generic check:** imagine the same prompt for a similar product. Where your plan would come out the same, revise that part and say what changed.
- **Spend boldness once.** One memorable element; everything around it quiet and disciplined. Remove one accessory before you leave the house.
- **Intent is systemic:** if the feel is "warm", surfaces, text, borders, accents and type are all warm. Check every token against it.

## 6. Confirm when it matters

For new products, major redesigns, or directions that are costly to undo, show the plan (and, if you can render, a small specimen: swatches, type scale, the signature element) and ask: "Does this direction feel right?" For small screens inside an existing direction, just build.

## 7. Build

1. **Tokens first.** Colour, type, spacing, radius, depth and motion as variables; everything references them.
2. **Use what exists.** Native elements first, then the project's components or a trusted accessible primitive, and hand-build only as a last resort (with full keyboard, focus and ARIA behaviour).
3. **The biggest thing first**, at desktop and phone widths.
4. **Real content.** Realistic names, amounts and lengths. Never invented proof (customers, quotes, logos, statistics).
5. **Every state:** hover, focus, active, disabled; loading, empty, error.
6. **The quality floor, without announcing it:** responsive to phone, visible focus, reduced motion, contrast, 44px hit areas.

## 8. Check before showing

- **Squint test:** blur your eyes. Hierarchy still reads; nothing harsh jumps out.
- **Swap test:** swap your typeface or layout for the usual one. Where nothing would change, you defaulted.
- **Signature test:** point to the specific elements where the signature appears.
- **Token test:** read the token names aloud. Do they belong to this product?
- **Screenshots** at desktop, tablet and phone widths if you can render; judge what you see, not the code.

## 9. Save the direction

Write (or offer to write) the result to `.design/system.md` so every later screen, and the `motion`, `typography` and `ui-review` skills, use the same decisions.

- **Where:** the project root. That is the repo root, or the project folder's root when there is no repo (a `CLAUDE.md` with `Git: none`). If the project already has a `DESIGN.md`, add a **Direction** section there instead of creating a second file. With no repo, prefer `DESIGN.md`: folders starting with a dot, like `.design/`, are hidden in Finder and File Explorer.
- **No folder access** (for example the web app with no connected folder): give the file as a download and say "save this as `DESIGN.md` in your project folder". Never claim it was saved.
- With `Explain: plain` in `CLAUDE.md`, summarise the direction in design words first (palette, type, density, signature), then the file.
