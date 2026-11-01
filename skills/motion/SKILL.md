---
name: motion
description: Decide whether and how UI should move, then build it. Easing, durations, springs, press feedback, gestures, enter/exit, stagger and loading states for CSS/web, Expo/React Native and SwiftUI. Use when adding, tuning or reviewing any animation or transition, or when motion feels slow, cheap or janky.
---

# Motion

Good motion is mostly invisible. It confirms what the user did, explains where things went, and gets out of the way. Work through the steps below **in order**: the first two often end with "don't animate this", and that is a good outcome.

## 0. Load the project's tokens

If the project has `.design/system.md` (or `DESIGN.md`) with a **Motion** section, use those curves, durations and springs. Otherwise use the defaults in [references/tokens.md](references/tokens.md). Never invent values.

## 1. Should it animate at all?

| How often the user sees it | Decision |
|---|---|
| Constantly (keyboard shortcuts, tab switches, command palette, typing) | **No animation.** |
| Many times a session (hover, row selection, list navigation, toggles) | Barely perceptible (≤ 150ms) or none |
| Occasionally (sheets, modals, menus, toasts) | Standard motion |
| Rarely (onboarding, success, celebration, empty states) | Room for expression |

Anything triggered from the keyboard should not animate. Tabs are peers: never slide between them.

## 2. Name the purpose in one word

**Feedback** · **Orientation** (where did it come from or go?) · **State** (what changed?) · **Continuity** (avoid a jarring jump) · **Explanation** · **Delight** (rare moments only).

No purpose, no animation.

## 3. Choose easing or spring

- **A finger or pointer is driving it** (drag, swipe, flick, anything interruptible): **spring**. Springs keep velocity when interrupted; timed curves restart.
- **Everything else: a timed curve.**
  - Entering, exiting, responding to input: **ease-out** (strong custom curve, not the built-in).
  - Moving or morphing while on screen: **ease-in-out**.
  - Colour and opacity-only hover changes: **ease**.
  - Continuous (spinners, progress, marquees): **linear**.
- **Never ease-in on UI** — it delays the exact moment the user is watching. The only exception: an element leaving the viewport entirely may use the accelerate curve.
- Bounce only when the user's gesture carried momentum (a flicked card), never on a menu that simply appears.

## 4. Choose duration

| Element | Duration |
|---|---|
| Press feedback | 100–150ms |
| Tooltip, small popover | 120–180ms |
| Dropdown, menu, toggle, chip | 150–250ms |
| Sheet, modal, drawer | 250–400ms, or a spring |
| Screen navigation | Platform default — don't override |
| Marketing, onboarding, illustration | Longer is fine |

- **Product UI stays ≤ 300ms**; larger surfaces ≤ 400ms.
- **Exits run at ~70% of the entrance.** Slow where the user is deciding (hold-to-confirm), fast where the system responds.
- Longer travel distance earns slightly more time; a full-screen move is not the same as a 20px nudge.

## 5. Choose properties

- Animate **`transform` and `opacity`** only. Width, height, margin, padding, top/left trigger layout every frame.
- **Never scale from 0.** Start from 0.95–0.97 with opacity 0.
- **Anchor to the trigger.** Popovers and menus scale from where they were opened; modals stay centred.
- Press feedback: **scale 0.97** on press-in, released quickly. Show feedback on press-in, commit on press-out.
- Use one or two properties. Three or more usually reads as noise in product UI.

## 6. Make it interruptible

Rapidly repeated actions (adding toasts, toggling, opening/closing) must retarget mid-flight: CSS transitions or springs, not keyframes that restart from zero. Never block input while something animates.

## 7. Choreography

- Stagger groups by **30–60ms per item**, total ≤ 300ms in product UI.
- Lead with the most important element; keep a consistent direction of travel.
- Details: [references/choreography.md](references/choreography.md).

## 8. Reduced motion ships with the animation

Reduced motion means **fewer and gentler, not zero**: keep opacity and colour changes that explain state; remove travel, scale, parallax, bounce and shimmer. Reveals become instant or a short fade. Build this in the same change, not as a follow-up.

## 9. Loading states

Skeletons, spinners, progress and the reveal of real content follow their own rules — see [references/loading-states.md](references/loading-states.md).

## Platform implementation

Load the one reference that matches the stack:

- Web (CSS, Motion/Framer Motion, WAAPI): [references/css.md](references/css.md)
- Expo / React Native (Reanimated, Gesture Handler, haptics): [references/expo.md](references/expo.md)
- SwiftUI: [references/swiftui.md](references/swiftui.md)

## Reviewing motion

When asked to review existing animation, use [references/review.md](references/review.md) and report findings as a table:

| Where | Now | Change to | Why |
|---|---|---|---|

## Output

Write the code. Then, in a few lines at most:

- **Gate:** frequency tier and purpose (and anything you chose *not* to animate, with the reason).
- **Recipe:** property, curve or spring, duration, reduced-motion behaviour.
- **Feel-check:** what to try by hand — interrupt it, reverse it, flick it, run it on the slowest device you support. Motion cannot be fully judged from code.
