# Default type scale

Used when a project defines none. Override in `.design/system.md` under **Typography**.

## Product UI (web)

| Role | Size | Line height | Weight | Tracking | Use |
|---|---|---|---|---|---|
| `display` | 2.25rem (36px) | 1.1 | 600 | −0.02em | Page hero, key number |
| `title` | 1.5rem (24px) | 1.2 | 600 | −0.01em | Page title |
| `heading` | 1.125rem (18px) | 1.3 | 600 | 0 | Section and card titles |
| `body` | 1rem (16px) | 1.55 | 400 | 0 | Paragraphs, descriptions |
| `body-sm` | 0.875rem (14px) | 1.45 | 400 | 0 | Dense UI: tables, inputs, menus |
| `label` | 0.875rem (14px) | 1.3 | 500 | 0 | Buttons, form labels, tabs |
| `caption` | 0.8125rem (13px) | 1.4 | 400 | 0 | Metadata, helper text |

Secondary information steps down in **colour** (muted text) before it steps down in size.

## Marketing and editorial

Add larger display steps (48, 64, 80px+) with tighter leading (1.0–1.1) and tracking (−0.02 to −0.03em). Body may rise to 18–20px with leading 1.6–1.65 and a 60–70 character measure. Fluid sizing (`clamp()`) is fine here; keep product screens on fixed steps.

## iOS (SwiftUI)

Map roles to system text styles so Dynamic Type works:

| Role | Text style |
|---|---|
| display | `.largeTitle` |
| title | `.title` / `.title2` |
| heading | `.headline` / `.title3` |
| body | `.body` (17pt) |
| body-sm | `.callout` / `.subheadline` |
| label | `.subheadline` weight `.medium` |
| caption | `.footnote` / `.caption` (floor 11pt) |

## Android (Material 3)

Display, Headline, Title, Body, Label roles (Large/Medium/Small each), in **sp**. Map product roles to these rather than choosing sizes per screen.

## Writing project type tokens

```md
## Typography
families: Inter (UI), JetBrains Mono (figures, IDs)
display: 36/1.1/600/-0.02em
title: 24/1.2/600/-0.01em
heading: 18/1.3/600
body: 16/1.55/400
body-sm: 14/1.45/400
label: 14/1.3/500
caption: 13/1.4/400
figures: tabular
```
