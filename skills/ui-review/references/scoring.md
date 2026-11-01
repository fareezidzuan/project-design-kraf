# Scoring

Seven areas, each 0–4. Be honest: 4 is genuinely excellent, not "fine". Most real interfaces land between 16 and 22 out of 28.

| Score | Meaning |
|---|---|
| 0 | Broken: people can't use it or are excluded |
| 1 | Poor: frequent problems, little system |
| 2 | Mixed: the main path works, clear gaps elsewhere |
| 3 | Good: consistent, minor gaps |
| 4 | Excellent: considered everywhere, nothing to add |

Mark an area **n/a** when it genuinely doesn't apply (for example, Motion on a static email template) and rescale: report the total out of 4 × the number of scored areas (e.g. 18/24).

## 1. Usability and accessibility

Use Nielsen's heuristics as the lens:

| Heuristic | Ask |
|---|---|
| Visibility of system status | Does every action give feedback? Is progress and location always clear? |
| Match with the real world | Is the language the user's, not the system's? Is order logical? |
| User control and freedom | Can people cancel, undo, go back, clear filters, escape? |
| Consistency and standards | Same words, same actions, same results; platform conventions followed? |
| Error prevention | Are mistakes hard to make (constraints, confirmations, good defaults)? |
| Recognition over recall | Are options visible rather than remembered? |
| Flexibility and efficiency | Are there shortcuts for frequent users without burdening new ones? |
| Aesthetic and minimal design | Does every element earn its place? |
| Error recovery | Do errors say what happened and how to fix it? |
| Help | Is help available in context when needed? |

Plus access: keyboard and screen-reader paths, focus, hit targets, zoom and text scaling, reduced motion.

- **4:** every heuristic solid; fully operable by keyboard and assistive tech.
- **2:** main task works; gaps in feedback, recovery or access.
- **0:** people get stuck, or some can't use it at all.

## 2. Hierarchy and layout

Squint test, greyscale test, one focal point per view, spacing on a scale, groups separated more than items within them, constrained widths, alignment to a grid, responsive composition.

- **4:** the eye goes exactly where it should at every width.
- **2:** readable, but several elements compete or spacing is arbitrary.
- **0:** no clear focus; layout breaks at common widths.

## 3. Content and states

Plain, specific copy; actions named for what they do; forms that help; loading, empty, error, partial and success states designed; realistic content lengths handled.

- **4:** every state designed; copy is clear and consistent.
- **2:** happy path only; some states missing or generic.
- **0:** dead ends, raw errors, broken layouts with real data.

## 4. Typography

Use the `typography` skill's checklist. Roles, scale, leading, measure, floors, numbers, wrapping, scaling.

## 5. Colour and depth

Contrast pairs pass; colour carries meaning consistently; one accent used with intent; one depth strategy; dark mode equal in quality if supported.

- **4:** systematic palette, meaning always backed by a second cue, quiet consistent depth.
- **2:** passes contrast mostly; colour used decoratively; mixed depth.
- **0:** contrast failures on text or controls; colour-only meaning.

## 6. Motion

Use the `motion` skill's checklist. Purposeful, fast, interruptible, reduced-motion aware, no layout shift.

## 7. Craft and specificity

Does it feel designed for this product, or could it be any product in the category? Are the details right (concentric radii, optical alignment, tabular figures, browser surfaces like selection, focus and scrollbars themed)? See [ai-slop-patterns.md](ai-slop-patterns.md).

- **4:** a clear signature; details correct throughout.
- **2:** competent but generic; several default patterns without a reason.
- **0:** template output, decoration with no meaning.
