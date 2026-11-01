# Typography on the web

## Scale as custom properties

```css
:root {
  --text-display: 2.25rem; --lh-display: 1.1;  --tr-display: -0.02em;
  --text-title:   1.5rem;  --lh-title:   1.2;  --tr-title:   -0.01em;
  --text-heading: 1.125rem;--lh-heading: 1.3;
  --text-body:    1rem;    --lh-body:    1.55;
  --text-body-sm: 0.875rem;--lh-body-sm: 1.45;
  --text-caption: 0.8125rem;--lh-caption: 1.4;
  --measure: 65ch;
}
html { -webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale; }
```

- Sizes in **`rem`** so the reader's browser setting applies. Line height **unitless**. Tracking in **`em`**.
- Set font smoothing once on the root, never per component.
- In Tailwind, define these roles in the theme and use them everywhere; avoid one-off `text-[15px]` values.

## Properties, not raw feature tags

| Want | Use | Not |
|---|---|---|
| Weight 650 on a variable font | `font-weight: 650` | `font-variation-settings: "wght" 650` |
| Tabular figures | `font-variant-numeric: tabular-nums` | `font-feature-settings: "tnum"` |
| Slashed zero | `font-variant-numeric: slashed-zero` | `"zero"` |
| Optical sizing | leave `font-optical-sizing: auto` | hard-coded `"opsz"` |

Raw tags are for things with no property (stylistic sets like `"ss01"`, custom axes).

## Loading fonts

- Ship **WOFF2**. Load only the weights and styles in use.
- Preload the one or two critical faces; use `font-display: swap` (or `optional` for non-essential faces).
- Give the fallback similar metrics (`size-adjust`, `ascent-override`) so the swap doesn't shift layout.
- Don't disable font synthesis globally; if you must, disable only the specific longhand after checking the fallback.

## Wrapping

```css
h1, h2, h3, .short-text { text-wrap: balance; }   /* headings, short centred blocks */
p, li { text-wrap: pretty; }                        /* avoids a lone last word */
.prose { max-width: var(--measure); }
.user-content { overflow-wrap: break-word; }        /* long URLs, IDs */
.badge, .tag { white-space: nowrap; }
```

`balance` is for short text only; browsers ignore it on long paragraphs.

## Truncation

```css
.one-line { overflow: hidden; text-overflow: ellipsis; white-space: nowrap; }
.three-lines { display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 3; overflow: hidden; }
```

Always provide the full text somewhere (title attribute is not enough on touch; prefer an expand or detail view).

## Inputs on iOS

Safari zooms the page when an input's text is under 16px. Either size inputs at 16px on small screens (`text-base sm:text-sm`), or keep `font-size: 16px` and scale the input visually. Pick one approach for the whole product.

## Tight containers

`text-box: trim-both cap alphabetic` removes the font's built-in space above and below letters so text centres properly in buttons and badges. Progressive enhancement: unsupported browsers keep default spacing.

## Links and underlines

```css
a { text-underline-offset: 0.2em; text-decoration-thickness: from-font; }
```

Don't turn off `text-decoration-skip-ink`. Animate only the underline colour.

## Language and direction

Set `lang` on `<html>` (quotes, hyphenation, screen readers) and `dir` where direction changes. Wrap user-supplied names, numbers or URLs inside opposite-direction text in `<bdi>`.

## Keep text selectable

Don't apply `user-select: none` to text containers; reserve it for drag and gesture surfaces.
