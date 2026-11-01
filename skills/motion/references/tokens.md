# Motion tokens

Defaults used when a project defines none. A project overrides any of these in `.design/system.md` under a **Motion** heading.

## Curves

| Token | Value | Use |
|---|---|---|
| `ease-out` | `cubic-bezier(0.23, 1, 0.32, 1)` | Default. Enter, exit, respond to input |
| `ease-in-out` | `cubic-bezier(0.77, 0, 0.175, 1)` | Moving or morphing while on screen |
| `ease-sheet` | `cubic-bezier(0.32, 0.72, 0, 1)` | Sheets and drawers (iOS-like) |
| `ease-standard` | `cubic-bezier(0.2, 0, 0, 1)` | Calmer alternative to `ease-out` for dense, data-heavy UI |
| `ease-exit` | `cubic-bezier(0.3, 0, 1, 1)` | Only for elements leaving the viewport entirely |
| `linear` | `linear` | Spinners, progress, shimmer |

Built-in `ease-out` / `ease-in-out` are too soft to feel intentional; prefer the stronger curves above.

## Durations

| Token | ms | Typical use |
|---|---|---|
| `instant` | 0 | Keyboard actions, frequent toggles, reduced motion |
| `fast` | 120 | Press feedback, tooltips |
| `quick` | 180 | Menus, dropdowns, chips |
| `base` | 240 | Cards, panels, larger state changes |
| `slow` | 320 | Sheets, modals, drawers |
| `exit` | ~70% of the matching enter | Any exit |

## Springs

Written as **duration (s) + bounce (0–1)**. Bounce 0 means no overshoot.

| Token | Duration | Bounce | Use |
|---|---|---|---|
| `spring-snappy` | 0.3 | 0 | Small repositioning, toggles driven by touch |
| `spring-default` | 0.4 | 0 | Settle with no overshoot |
| `spring-sheet` | 0.35 | 0.1 | Sheets and drawers released by a gesture |
| `spring-flick` | 0.4 | 0.15–0.2 | Thrown or flicked objects, snap-back after drag |

Conversions:
- SwiftUI: `.spring(duration: 0.4, bounce: 0.15)` (damping fraction = 1 − bounce).
- Reanimated: `withSpring(v, { duration: 400, dampingRatio: 0.85 })` (dampingRatio ≈ 1 − bounce).
- Motion (web): `{ type: "spring", duration: 0.4, bounce: 0.15 }`.

Keep bounce ≤ 0.2 in product UI. Use bounce only when a gesture carried momentum.

## Stagger

| Token | Value |
|---|---|
| `stagger-step` | 40ms (range 30–60ms) |
| `stagger-max` | 300ms total in product UI, 500ms in marketing |

## Personality

Pick **one** for the whole product and apply it as a multiplier on the durations above. Product UI caps still apply (≤ 300ms, sheets/modals ≤ 400ms).

| Personality | Duration × | Bounce allowed | Feels |
|---|---|---|---|
| Crisp | 0.8 | none | Tools, dashboards, finance, dense data |
| Standard | 1.0 | ≤ 0.1 | Most products |
| Expressive | 1.15 | ≤ 0.2 | Consumer, social, playful brands |
| Calm | 1.3 | none | Editorial, wellness, premium. Use the cap. |

## Writing project tokens

Example `.design/system.md` section:

```md
## Motion
personality: crisp
ease-out: cubic-bezier(0.23, 1, 0.32, 1)
durations: fast 100, quick 160, base 220, slow 300
spring-sheet: duration 0.35, bounce 0
```
