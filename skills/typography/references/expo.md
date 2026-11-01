# Typography in Expo and React Native

## Roles as a single source

```ts
export const type = {
  display: { fontFamily: 'Brand-Semibold', fontSize: 34, lineHeight: 40, letterSpacing: -0.5 },
  title:   { fontFamily: 'Brand-Semibold', fontSize: 24, lineHeight: 30, letterSpacing: -0.2 },
  heading: { fontFamily: 'Brand-Semibold', fontSize: 18, lineHeight: 24 },
  body:    { fontFamily: 'Brand-Regular',  fontSize: 16, lineHeight: 24 },
  bodySm:  { fontFamily: 'Brand-Regular',  fontSize: 14, lineHeight: 20 },
  label:   { fontFamily: 'Brand-Medium',   fontSize: 14, lineHeight: 18 },
  caption: { fontFamily: 'Brand-Regular',  fontSize: 13, lineHeight: 18 },
} as const;
```

React Native line height and letter spacing are in **points, not ratios or em**. Convert: `lineHeight = fontSize × ratio`, `letterSpacing = fontSize × em` (for example −0.02em at 24 ≈ −0.5).

Use a `Text` wrapper component that takes a `role` prop rather than styling `Text` inline.

## Loading fonts

- Load with `expo-font` (the config plugin embeds fonts at build time; `useFonts` loads at runtime). Keep the splash screen up until fonts are ready to avoid a flash of the fallback.
- Register each weight as its own family name (`Brand-Regular`, `Brand-Medium`) and reference them directly. Android does not reliably synthesise weights from `fontWeight` on custom fonts.
- Load only the weights you use.

## Respect font scaling

- Leave `allowFontScaling` on (the default). Users rely on it.
- If a specific layout truly can't grow (a tab bar label), cap growth with `maxFontSizeMultiplier` (for example 1.3–1.5) rather than disabling scaling.
- Never animate to or lock a measured text height; measure with `onLayout` at runtime.

## Numbers

- `fontVariant: ['tabular-nums']` for prices, balances, timers and numeric columns (needs a font that includes tabular figures).
- Format with `Intl.NumberFormat` / `Intl.DateTimeFormat` using the user's locale.

## Wrapping and truncation

- `numberOfLines` with `ellipsizeMode="tail"`, plus a way to reach the full text.
- On Android, set `textBreakStrategy="balanced"` for short headings if needed, and `includeFontPadding: false` when vertical centring in buttons looks off.

## Verify

Test at the largest system font size on both iOS and Android (Android: Settings → Display → Font size, or `adb shell settings put system font_scale 1.3`), in a release build.
