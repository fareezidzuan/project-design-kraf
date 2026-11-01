# Review checklist

Grouped by area, in review order. Typography and motion have their own checklists in those skills; don't duplicate them here.

## 1. Usability and accessibility

**Keyboard and focus**
- Everything usable by pointer is usable by keyboard, in a logical order, following standard patterns for menus, dialogs, tabs and comboboxes.
- Focus is always visible (a clear ring, at least 3:1 against what's behind it), appears instantly, and is never hidden under sticky headers.
- Dialogs trap focus and return it to the trigger on close.
- No focus outline removed without a replacement.

**Names and semantics**
- Every control has an accessible name; icon-only buttons have a label.
- Native elements first: buttons are buttons, links are links (and navigate), labels are tied to inputs, tables are tables. No clickable `div`s.
- Decorative images and icons are hidden from assistive tech; meaningful ones have text alternatives.
- Headings form a logical outline; the page or screen title matches the context.
- Status messages and validation are announced (polite live regions).

**Targets and input**
- Touch targets at least 44×44 (24×24 minimum on pointer-only web); hit areas extend beyond small visuals; no overlapping targets.
- Zoom is never disabled. Layout survives 320px width, 200% zoom and the largest system text size.
- Gestures (drag, swipe, pinch) have a tap or keyboard alternative.
- If it looks clickable, it is clickable; if it's clickable, it looks it.

**Flow**
- The URL reflects state (filters, tabs, pagination) on the web; back and forward restore position.
- Destructive or irreversible actions confirm or offer undo.
- No dead ends: every screen offers a next step or a way back.
- Unsaved changes are protected before navigation.

## 2. Hierarchy and layout

- **One focal point per view**, and it's the thing the user came for.
- **Squint and greyscale tests pass**: hierarchy reads without colour or detail.
- Hierarchy uses size, weight and colour together; only the most important element gets all three.
- Labels and metadata are quieter than the values they describe.
- **Spacing on a scale**; space between groups clearly larger than within them; more space above a heading than below it.
- Widths constrained: prose 45–75 characters, forms roughly 300–500px wide.
- Deliberate alignment to a grid or shared edges; optical adjustments where geometry looks wrong (icons, play triangles, text in pills).
- Left-aligned by default; centred only for short, single moments.
- Not everything in identical cards; nested cards avoided.
- Concentric radii: inner radius + padding = outer radius.
- Composition works at phone, laptop and very wide screens (content capped and centred); safe areas respected; no unwanted horizontal scrolling.

## 3. Content and states

**Copy**
- The user's language, not the system's. Specific beats clever.
- Buttons say what happens ("Save changes", "Pay RM 120"), and the same action keeps its name through the flow (Publish → "Published").
- Errors say what went wrong and how to fix it, without blame or vague apologies.
- Empty states explain what will appear and offer the first action.
- No placeholder names or filler clichés in shipped copy.

**Forms**
- Visible labels (placeholders are not labels); helpful input types, `autocomplete` and keyboard types.
- Typing is never blocked; validate after, show errors inline next to the field, and focus the first error on submit.
- Paste allowed everywhere (including codes and passwords); password managers work.
- Submit stays enabled until the request starts; then shows progress while keeping its label.
- Requirements (password rules, file limits) are visible before the user fails them.

**States**
- Every interactive element: default, hover (pointer), focus, active/pressed, disabled, and loading or selected where relevant.
- Every data view: loading, empty, partial, error, and very long or very many items.
- Disabled is shown by more than opacity alone, and the reason is discoverable.
- Success is shown where the effect is visible; toasts are for invisible effects and failures.
- Content handles short, average and very long real strings; flex children can shrink so truncation works.

**Honesty**
- No invented customers, testimonials, logos, metrics or press.
- No fake success states for forms or actions that don't actually do anything.
- Sample data is realistic and internally consistent (totals add up; a value shown twice matches).

## 4. Typography

Use the `typography` skill's `references/review.md`.

## 5. Colour and depth

- Text contrast at least 4.5:1 (3:1 for large text); icons, control edges and focus rings at least 3:1.
- **Meaning never by colour alone**: add an icon, label, sign or pattern.
- Semantic colours used for their meaning only (danger for destructive, success for completed).
- Change indicators coloured by good or bad, not by direction; zero change is neutral.
- One accent, used for actions and selection; colour isn't decoration.
- Neutrals slightly tinted toward the palette rather than flat grey (Polish).
- Secondary text on coloured surfaces is tinted from that surface, not grey.
- **One depth strategy** (borders, shadows, or tone steps), applied consistently; floating elements (menus, dialogs) clearly above their parent.
- Shadows look physical (offset and soft), not glows; borders quiet until they need to be noticed.
- Dark mode: designed, not inverted; elevation by lightness; `color-scheme` set on the web; form controls readable.
- Images keep their aspect ratio and crop deliberately; text over images has a scrim.

## 6. Motion

Use the `motion` skill's `references/review.md`.

## 7. Craft and specificity

- Does the screen feel made for this product? Run the swap test: would anything change with a generic font or template layout?
- Default patterns without a stated reason (see [ai-slop-patterns.md](ai-slop-patterns.md)).
- Browser and system surfaces themed: text selection, focus rings, caret, scrollbars, underline offset.
- Tabular figures in data; real typographic punctuation.
- One icon set, one stroke weight; no emoji standing in for icons.
- Values come from tokens, not one-off literals.

## Platform and performance (web)

- Images sized to prevent layout shift; above-the-fold images prioritised, the rest lazy-loaded.
- Fonts preloaded where critical, with swap behaviour and metric-matched fallbacks.
- Long lists (50+ items) virtualised.
- Interactions respond quickly; mutations aim for under ~500ms or show optimistic UI.
- Tested on a real phone, Safari and a throttled CPU/network.

## Platform (native apps)

- Platform conventions: system navigation, sheets, back gestures, tab bars.
- Dynamic Type (iOS) and font scale (Android) supported; dark mode checked.
- Haptics paired with visuals, used sparingly.
- Verified on a real device for gestures and performance, not only a simulator.
