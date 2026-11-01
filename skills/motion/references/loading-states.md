# Loading states

How to show that something is on its way, and how to hand over to the real content without a jolt.

## 1. Pick the indicator

| Situation | Show |
|---|---|
| Likely to finish in under ~300ms | **Nothing.** Wait before showing any indicator. |
| Content with a known shape is loading (lists, cards, profiles, tables) | **Skeleton** that matches the final layout |
| A user action is running and the result's shape is unknown (submit, save, pay) | **Inline spinner** on the control that started it; keep the label |
| Long operation with measurable progress (upload, export, import) | **Determinate progress bar** with a clear label |
| Long operation, progress unknown | **Indeterminate bar** plus a sentence on what is happening |

Timing guards against flicker:
- **Show-delay:** wait ~150–300ms before showing any loader.
- **Minimum visible time:** once shown, keep it ~300–500ms so it doesn't flash.

## 2. Build the skeleton to match reality

- **Mirror the final layout exactly**: same boxes, gaps, radii and number of lines. Nothing should move when content arrives. The most reliable way is to render sample content invisibly and draw the skeleton from its measured shapes.
- **Trim text lines to the letter height** (roughly cap height to baseline), not the full line height. Full-height bars look blocky and heavier than the text they stand for.
- **Vary line lengths.** The last line of a paragraph is shorter. Names and titles get realistic widths, not 100%.
- **Match radius**: text lines get a small radius; avatars stay circles; cards keep their corner radius.
- **Keep chrome real.** Headers, navigation, labels and buttons that don't depend on data render normally. Only the data is a skeleton.
- **Placeholders for numbers** (balances, prices, counts) should be a block sized to a typical value, never fake digits like `0.00` or `--` that could be read as real data.

## 3. Animate it quietly

| Style | When |
|---|---|
| `shimmer` | Default. A soft highlight sweeps across, 1.2–2s, linear, repeating |
| `group-shimmer` | One sweep across the whole region rather than each block, which looks calmer on busy screens |
| `pulse` | Gentle opacity breathing (≈ 1.5–2s, ease-in-out). Calmer; good for small areas |
| `none` | Reduced motion, or very short waits |

- **One phase for the whole screen.** Every skeleton shimmers in sync, including ones that mount later. Independent shimmers look chaotic.
- **Low contrast.** The base is a faint tint of the foreground colour; the highlight is only slightly lighter. Define both for light and dark mode.
- **Slow and steady.** A frantic shimmer makes the wait feel longer.
- **Reduced motion:** skeletons hold still; no shimmer, no pulse.

## 4. Reveal the real content

| Reveal | When |
|---|---|
| Crossfade (150–250ms) | Default |
| Together | Everything arrives at once; good for small regions |
| Sequence | Top-to-bottom with 30–50ms steps, total ≤ 300ms; good for lists |
| Instant | Reduced motion, or content that arrives within the show-delay |

- A reveal **must never shift layout**. If anything jumps, the skeleton was wrong.
- Don't animate content in that the user has already started reading or interacting with.
- Numbers can tick or roll into place only when the change itself is meaningful (a balance updating), not on first load.

## 5. Design the other outcomes too

Loading has three possible endings; design all of them at the same time:

- **Loaded**, including partial data (some fields missing).
- **Empty**: explain what would be here and the next action.
- **Error**: plain-language message, what to do next, and a retry. Never a raw error string.

## Platform notes

- **Web:** CSS `background` gradient sweep with `background-attachment: fixed` (or one shared animation clock) keeps every skeleton in phase. The [Skullet](https://skullet.lochie.me) library implements measured skeletons, shared phase, letter-height text trimming and reveal modes for React, Vue, Svelte and vanilla JS.
- **SwiftUI:** `.redacted(reason: .placeholder)` turns real views into skeletons with the correct shapes. Add a shimmer overlay only when `accessibilityReduceMotion` is off. See [swiftui.md](swiftui.md).
- **Expo / React Native:** drive every shimmer from a single shared value (one clock for the screen), use `transform` on a gradient layer rather than animating width, and check `useReducedMotion()`. See [expo.md](expo.md).
