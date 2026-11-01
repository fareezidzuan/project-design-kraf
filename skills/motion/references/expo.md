# Motion in Expo and React Native

Mobile changes three things: there is no hover, the user's finger is on the element, and animation must stay on the UI thread or it stutters the moment JavaScript is busy.

## Pick the cheapest tool that works

| Need | Use |
|---|---|
| Two-state change, no gesture (press, toggle, colour) | Reanimated timing (`withTiming`) or Reanimated CSS-style transitions |
| Element mounting/unmounting, list reflow | Layout animations (`entering`, `exiting`, `itemLayoutAnimation`) |
| Anything a finger drives, or anything derived from scroll | `useSharedValue` + Gesture Handler + `useAnimatedStyle` |
| Screen to screen | The native stack's own transition (Expo Router). Don't rebuild it in JS |
| A sheet that is its own screen | `presentation: 'formSheet'` |
| Illustration, celebration, empty state | Lottie (never for UI state) |

Use Reanimated, not React Native's core `Animated`, for anything gesture-driven.

## Curves and springs

```js
import { Easing, withTiming, withSpring } from 'react-native-reanimated';

export const EASE_OUT = Easing.bezier(0.23, 1, 0.32, 1);
export const EASE_IN_OUT = Easing.bezier(0.77, 0, 0.175, 1);
export const EASE_SHEET = Easing.bezier(0.32, 0.72, 0, 1);

withTiming(1, { duration: 180, easing: EASE_OUT });
withSpring(0, { duration: 350, dampingRatio: 0.9, velocity });   // sheet release
withSpring(0, { duration: 400, dampingRatio: 0.85, velocity });  // snap back after a drag
```

If a finger was involved, use a spring and pass the gesture's velocity. Add `overshootClamping: true` when the element must not pass an edge.

## Rules

- **Never `setState` from a gesture or scroll handler.** Shared value → `useAnimatedStyle`; React doesn't re-render.
- **Don't call back to JavaScript every frame.** Schedule JS work in `onEnd`, or when a value crosses a threshold (`useAnimatedReaction`).
- **Animate `transform` and `opacity`.** Width, height, margin, padding and flex re-run layout for the node and its siblings. Exception: an absolutely positioned, childless element (a progress fill, a tab pill).
- **Don't animate Android `elevation` or blur intensity.** Crossfade a pre-rendered layer instead.
- **Transform order matters**: `[{ translateY }, { scale }]`.
- **Tabs don't slide.** Tab switches use no animation.

## Press, not hover

- Feedback on **press-in** (`scale: 0.97`, 100–150ms), commit on press-out.
- Touch targets at least **44×44pt** (48dp on Android); extend with `hitSlop` rather than enlarging the visual.
- Use the same press scale on both platforms in a custom-designed app; Android ripple belongs in Material-styled apps.

## Haptics (expo-haptics)

| Moment | Call |
|---|---|
| A value steps (picker, slider detent, segmented control) | `Haptics.selectionAsync()` |
| Something snaps into place, a drag commits | `Haptics.impactAsync(ImpactFeedbackStyle.Light)` |
| Success or failure of an operation | `Haptics.notificationAsync(NotificationFeedbackType.Success / Error)` |

Fire on the same frame as the visual, once per user action, and never as the only feedback.

## Reduced motion

```js
import { useReducedMotion, ReduceMotion } from 'react-native-reanimated';
const reduce = useReducedMotion();
withSpring(0, { duration: 350, dampingRatio: 0.9, reduceMotion: ReduceMotion.System });
```

Keep fades, drop travel, scale and bounce. Screen transitions become a fade.

## Skeletons

Drive every shimmer on a screen from **one shared value** so they stay in phase; translate a gradient layer rather than animating width; skip the shimmer when `useReducedMotion()` is true.

## Verify on device

Judge feel in a **release build on the slowest device you support**. Expo Go and dev builds hide jank. On ProMotion iPhones, confirm `CADisableMinimumFrameDurationOnPhone` is set so animations can run at 120fps.

If the Expo plugin's `expo-animation` skill is installed, it has detailed recipes (sheets, swipe-to-delete, collapsing headers); these rules still set the values.
