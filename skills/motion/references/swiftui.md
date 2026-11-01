# Motion in SwiftUI

SwiftUI's animation model already follows most of these rules. The job is mostly choosing the right preset, keeping values consistent, and respecting Reduce Motion.

## Tokens

```swift
import SwiftUI

enum Motion {
    static let easeOut     = Animation.timingCurve(0.23, 1, 0.32, 1, duration: 0.18)
    static let easeInOut   = Animation.timingCurve(0.77, 0, 0.175, 1, duration: 0.24)
    static let press       = Animation.timingCurve(0.23, 1, 0.32, 1, duration: 0.12)
    static let springSnappy  = Animation.spring(duration: 0.3, bounce: 0)
    static let springDefault = Animation.spring(duration: 0.4, bounce: 0)
    static let springFlick   = Animation.spring(duration: 0.4, bounce: 0.15)
}
```

Built-in presets map closely: `.snappy` ≈ quick settle with no bounce, `.smooth` ≈ no-bounce default, `.bouncy` ≈ expressive. Prefer one set of tokens over mixing presets ad hoc.

## Press feedback

```swift
struct PressableStyle: ButtonStyle {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed && !reduceMotion ? 0.97 : 1)
            .opacity(configuration.isPressed && reduceMotion ? 0.8 : 1)
            .animation(Motion.press, value: configuration.isPressed)
    }
}
```

## Enter and exit

```swift
.transition(.opacity.combined(with: .scale(scale: 0.96, anchor: .top)))
```

Never scale from 0. Anchor the scale to where the element came from (a menu from its button).

## Gestures

Use springs for anything a finger releases, so velocity carries through. Rubber-band past edges rather than clamping hard. For sheets, prefer the system `.sheet` with `.presentationDetents`; it is already correct.

## Numbers and state

- `.contentTransition(.numericText(value: amount))` animates digits changing in place, and is good for balances and counters that update while visible. Don't use it on first load.
- `.sensoryFeedback(.success, trigger: didSave)` pairs a haptic with a state change (iOS 17+). One per user action, never the only feedback.

## Reduced motion

```swift
@Environment(\.accessibilityReduceMotion) private var reduceMotion

withAnimation(reduceMotion ? .easeOut(duration: 0.15) : Motion.springDefault) { isOpen.toggle() }
```

Swap travel and scale for a short fade; drop bounce, parallax and looping motion.

## Skeletons

```swift
ProfileCard(profile: .sample)
    .redacted(reason: isLoading ? .placeholder : [])
    .overlay { if isLoading && !reduceMotion { Shimmer() } }
```

`.redacted(reason: .placeholder)` draws placeholders in the real layout, so nothing shifts when data arrives. Use `.unredacted()` on chrome that should stay visible (titles, labels). Drive all shimmer overlays on a screen from one shared phase (for example a single `TimelineView` or one animated state value passed down).

## Navigation

Use `NavigationStack`'s own push/pop transitions and the system tab bar. Don't animate between tabs.
