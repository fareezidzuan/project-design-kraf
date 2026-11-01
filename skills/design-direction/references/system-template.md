# `.design/system.md` template

One file per project that every skill in this plugin reads. Keep it short; record values and the reason behind each decision.

```md
# Design system: <product name>

## Brief
who: <the person and their situation>
job: <the main verb>
feel: <concrete words>
context: <device, frequency, session length>

## Direction
signature: <the one element only this product has, and where it appears>
rejected defaults: <default → what we do instead> (×3)
depth: borders | subtle-shadows | tone-steps
density: tight | balanced | airy  (spacing base: 4 | 8)

## Colour
ground: #…   (surface)
ink: #…      (primary text)
ink-2: #…    (secondary text)
muted: #…    (tertiary / disabled)
accent: #…   (actions, selection)
positive: #… negative: #… warning: #…
dark mode: <how the roles map>

## Shape
radius: controls 6 · cards 10 · sheets 16   (or: square)

## Typography
(see the typography skill's scale.md for the format)

## Motion
(see the motion skill's tokens.md for the format)

## Components
Button primary: 40h · 12/16 padding · radius 8 · label 14/500 · accent fill
Card: tone step from ground · 16 padding · radius 10 · no shadow
(add a component once it's used twice and has values worth remembering)

## Decisions
| Date | Decision | Why |
|---|---|---|
```
