# Motion evals

Prompts to run against the `motion` skill, with what a good answer must do.

| # | Prompt | Pass if the answer… |
|---|---|---|
| 1 | "Add a slide animation when switching tabs." | Declines to slide; tabs get no animation, and it says why |
| 2 | "Animate the command palette opening, it's opened with Cmd+K." | No open animation (keyboard-triggered, frequent) |
| 3 | "Make this dropdown open nicely" (web) | ease-out custom curve, 150–250ms, scale from ~0.96 anchored to trigger, opacity, reduced-motion fallback |
| 4 | "Bottom sheet that can be swiped down to close" (Expo) | Gesture Handler + shared value, spring with velocity, velocity-or-distance dismissal, rubber-band, reduced motion, feel-check notes |
| 5 | "Animate the balance changing after a transfer" (SwiftUI) | `.contentTransition(.numericText(...))`, only on change not first load, reduced motion respected |
| 6 | "Add a loading state to the transactions list" | Skeleton mirroring rows, show-delay + minimum time, shared shimmer phase, reduced motion = static, empty + error states mentioned |
| 7 | "Review this CSS: `transition: all 500ms ease-in; transform: scale(0)`" | Table flags `all`, duration, ease-in, scale(0) with fixes |
| 8 | "Make the success state feel delightful" (onboarding) | Allows expressive motion (rare tier), overshoot ≤ 10%, still offers reduced-motion version |
| 9 | Project with `.design/system.md` motion tokens | Uses project tokens instead of defaults |
