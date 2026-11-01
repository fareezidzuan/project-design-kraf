# Motion: where sources disagree and what we chose

Sources: Emil Kowalski (`emil-design-eng`, `review-animations`, `animate-expo`), LottieFiles (`motion-design`), Vercel Web Interface Guidelines, Skullet. Commits pinned in NOTICE.md.

| # | Topic | Emil Kowalski | LottieFiles | Our rule | Why |
|---|---|---|---|---|---|
| 1 | Exit easing | Never ease-in on UI; exits use ease-out | Exits use ease-in (accelerate) | **Ease-out by default for exits.** A sharp accelerate curve is allowed only when the element leaves the viewport entirely (a sheet swiped away, a toast sent off-screen). | The user watches the start of an exit; ease-in delays that moment. Accelerate reads correctly only when the element is "flying away". |
| 2 | Product UI duration cap | Under 300ms; modals/drawers 200–500ms | Modals 300–400ms, page transitions 400–600ms | **Product UI ≤ 300ms. Sheets and modals ≤ 400ms (or a spring). Screen navigation uses the platform default. Marketing and onboarding may go longer.** | Keeps everyday UI fast while giving larger surfaces room to travel. |
| 3 | How many layers of motion | Restraint; one or two properties | "Always three motion layers" (primary, secondary, ambient) | **Product UI: one or two properties, no ambient motion. Three layers only for illustration, marketing and celebration moments.** | Ambient motion in working UI competes with content and costs battery. |
| 4 | Personality | Crisp for dashboards; match motion to mood | Four archetypes; "Premium" runs 350–600ms | **Personality is a multiplier on the token durations (see tokens.md), still capped by rule 2.** | Keeps brand character without slow product UI. |
| 5 | Spring parameters | Duration + bounce (Apple style) | Stiffness + damping tables | **Duration + bounce is the primary form.** Stiffness/damping listed only as a conversion aid. | Maps 1:1 to SwiftUI `spring(duration:bounce:)` and Reanimated `dampingRatio`. Easier to reason about. |
| 6 | Enter vs exit length | Exit faster than enter | Exit = 65–75% of entrance | **Exit ≈ 70% of enter.** | Both sources agree in direction; LottieFiles gives the number. |
| 7 | Stagger | 30–80ms between items | Budgets by pattern; total < 500ms | **30–60ms between items, total stagger ≤ 300ms in product UI (≤ 500ms in marketing).** Never block input while staggering. | Combines both; tighter cap for UI. |
| 8 | Skeleton shimmer | — | Sweep 1.5–2s; base 10–20%, peak 30–40% opacity | **Sweep 1.2–2s, all skeletons share one phase, subtle contrast.** | Skullet's shared-phase idea plus LottieFiles timing. |
| 9 | Loader flicker | — | — | **Show-delay ~150–300ms, minimum visible ~300–500ms** (Vercel). | Avoids flashes on fast responses. |
