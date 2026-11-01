# Choreography

How several things move together.

## Product UI

- **Stagger 30–60ms per item**, total ≤ 300ms. Beyond ~8 items, stagger the first few and bring the rest in together.
- **One direction of travel** for a group: items that enter from below all enter from below, and leave the way they came.
- **Lead with what matters.** The primary element moves first or most; supporting elements follow.
- **Keep most of the screen still.** When three or more elements are on screen, no more than about a third should be moving at once.
- **Never block interaction** while a stagger plays.
- **Opacity with height** (items entering or leaving a list) rarely works first time. Tune by eye, in slow motion.

## Expressive moments (marketing, onboarding, celebration)

These earn more motion, with the same discipline:

- **Layers:** a primary action the eye follows, secondary motion that supports it (a shadow settling, an icon shifting), and optionally an ambient layer (a slow gradient drift). Product UI uses the primary layer only.
- **Anticipation and follow-through:** a small move against the direction before the main action, and a soft settle after it, make motion feel physical. Keep overshoot to 5–10% for success moments and 0% for errors.
- **Long journeys need waypoints:** motion travelling more than about a third of the screen should change speed or direction along the way rather than glide in a straight line.
- **Stagger budgets** stretch to 500ms total.

## Signature

A product's motion feels coherent when it has:

1. **One signature curve** used for most animations.
2. **Three durations** (quick, standard, slow) and nothing in between.
3. **One entrance pattern** reused everywhere (for example, fade + 8px rise).

Write these into the project's `.design/system.md`.

## Debugging feel

- Slow the animation down 2–5× and watch: do properties stay in sync, is the origin right, does anything overlap awkwardly?
- Step frame by frame (browser DevTools Animations panel, or slow-animation mode in the iOS Simulator).
- Test gestures on a real device.
- Look again the next day; fresh eyes catch what familiarity hides.
