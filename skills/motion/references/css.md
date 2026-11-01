# Motion on the web

## Tokens as CSS variables

```css
:root {
  --ease-out: cubic-bezier(0.23, 1, 0.32, 1);
  --ease-in-out: cubic-bezier(0.77, 0, 0.175, 1);
  --ease-sheet: cubic-bezier(0.32, 0.72, 0, 1);
  --ease-exit: cubic-bezier(0.3, 0, 1, 1);
  --dur-fast: 120ms;
  --dur-quick: 180ms;
  --dur-base: 240ms;
  --dur-slow: 320ms;
}
```

## Press feedback

```css
.pressable { transition: transform var(--dur-fast) var(--ease-out); }
.pressable:active { transform: scale(0.97); }
```

## Enter without JavaScript

```css
.popover {
  transform-origin: var(--transform-origin, top center); /* scale from the trigger */
  transition: opacity var(--dur-quick) var(--ease-out),
              transform var(--dur-quick) var(--ease-out),
              display var(--dur-quick) allow-discrete;
  @starting-style { opacity: 0; transform: scale(0.96); }
}
```

Fallback where `@starting-style` isn't supported: set a `data-mounted` attribute one frame after mount and transition from the unmounted state.

## Rules

- **Name the properties.** `transition: transform 180ms ...`, never `transition: all`.
- **Transitions over keyframes** for anything that can be retriggered; transitions retarget, keyframes restart.
- **Gate hover motion** to real pointers so taps don't trigger it:
  ```css
  @media (hover: hover) and (pointer: fine) { .card:hover { transform: translateY(-2px); } }
  ```
- **Percent translates** move by the element's own size: `translateY(100%)` hides a sheet of any height.
- **Don't drive many children through a CSS variable on the parent** during a gesture; it recalculates every child. Set `transform` on the moving element.
- **Under heavy main-thread load**, CSS animations and the Web Animations API stay smooth; requestAnimationFrame-driven JS animation drops frames. In Motion (Framer Motion), the `x`/`y`/`scale` shorthands run on the main thread; animate a full `transform` string when smoothness under load matters.
- **Mask an awkward crossfade** with a brief `filter: blur(2px)` on the outgoing/incoming content. Keep blur small; it is expensive, especially in Safari.
- **`clip-path: inset()`** animates reveals, hold-to-confirm fills and tab highlights cheaply.

## Springs

With Motion: `transition={{ type: "spring", duration: 0.4, bounce: 0.15 }}`. Use for drag, flick and anything interruptible. Plain CSS has no real spring; use `ease-out` for non-gesture motion.

## Gestures

- Dismiss on **distance or velocity**: a quick flick (≈ 0.1 px/ms or faster) should dismiss even if it travelled a short way.
- **Rubber-band** past boundaries: movement shrinks the further the user drags, rather than hitting a wall.
- **Capture the pointer** once a drag starts; ignore extra touch points mid-drag.

## Reduced motion

```css
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 1ms !important;
    animation-iteration-count: 1 !important;
    scroll-behavior: auto !important;
  }
  .pressable:active { transform: none; }
  .popover { transition: opacity var(--dur-quick) ease; } /* keep the fade, drop the scale */
}
```

The global reset is a safety net; still design an intentional reduced version (fades instead of travel) for important transitions.

## Skeleton shimmer in phase

```css
.skeleton {
  background: linear-gradient(90deg, var(--sk-base) 0%, var(--sk-highlight) 50%, var(--sk-base) 100%)
              0 0 / 200vw 100% fixed;  /* fixed attachment keeps every block in one phase */
  animation: sk-sweep 1.6s linear infinite;
  border-radius: 4px;
}
@keyframes sk-sweep { to { background-position-x: 200vw; } }
@media (prefers-reduced-motion: reduce) { .skeleton { animation: none; } }
```

For measured skeletons and reveal modes, consider [Skullet](https://skullet.lochie.me).
