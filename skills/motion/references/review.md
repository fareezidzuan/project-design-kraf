# Motion review checklist

Report each finding as a row: **Where · Now · Change to · Why**, ordered by severity.

## Blockers

| Check | Fix |
|---|---|
| Animation on a keyboard action or a constantly repeated interaction | Remove it |
| Layout shifts when content or a loader appears | Reserve space; skeleton must mirror the final layout |
| Input blocked while something animates | Make it interruptible; never gate input on motion |
| No reduced-motion behaviour | Add it: fades only, no travel, scale, bounce or shimmer |
| Animating width/height/margin/top on a moving element | Animate `transform` and `opacity` |
| Gesture handled by setting React state every frame (React Native) | Shared values on the UI thread |

## Should fix

| Check | Fix |
|---|---|
| `ease-in` on UI, or built-in weak curves | Strong `ease-out` (or `ease-in-out` for on-screen moves) |
| Product UI animation > 300ms (sheets/modals > 400ms) | Shorten to the token range |
| Exit as slow as or slower than the entrance | Exit ≈ 70% of enter |
| Entrance from `scale(0)` | Start at 0.95–0.97 with opacity 0 |
| Popover/menu scaling from centre | Anchor to the trigger (modals stay centred) |
| Keyframes on something re-triggered quickly | Transitions or springs |
| Timed animation after a drag/flick | Spring with the gesture's velocity |
| Bounce on something the user didn't throw | Remove bounce |
| `transition: all` | Name the properties |
| Hover motion that fires on touch | Gate behind `(hover: hover) and (pointer: fine)` |
| Pressables with no press feedback | Scale 0.97 on press-in |
| Skeletons shimmering out of sync | One shared phase |
| Loader flashes on fast responses | Show-delay plus a minimum visible time |
| Stagger total > 300ms | Shorter steps, or stagger only the first few items |

## Polish

| Check | Fix |
|---|---|
| Durations and curves inconsistent across the product | Consolidate into tokens |
| Crossfade shows two overlapping states | Brief small blur during the swap |
| Haptic out of sync with the visual, or used alone | Same frame, paired with a visual |
| Placeholder digits (`0.00`, `--`) while a number loads | A neutral block sized to the value |
| Missing empty and error states | Design them alongside loading |
