---
type: llm
weight: 1
---

Pass if the solution is gesture-driven on the UI thread and dismisses on a quick flick as well as on distance. EITHER a well-established sheet library configured for swipe-down dismissal (e.g. @gorhom/bottom-sheet, or a native formSheet presentation), OR a custom implementation with react-native-gesture-handler + Reanimated shared values and a spring that receives the gesture velocity. Fail if it uses PanResponder, core Animated driven by the gesture, or setState on every gesture frame.
