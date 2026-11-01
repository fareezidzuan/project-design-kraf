# Typography in SwiftUI

## Use text styles so Dynamic Type works

```swift
Text("Balance").font(.headline)
Text(description).font(.body)
```

Never hard-code point sizes with `.font(.system(size: 15))` for interface text; it ignores the user's reading size.

## Brand faces that still scale

```swift
extension Font {
    static let brandTitle = Font.custom("BrandSans-Semibold", size: 28, relativeTo: .title)
    static let brandBody  = Font.custom("BrandSans-Regular",  size: 17, relativeTo: .body)
}
```

`relativeTo:` keeps custom fonts scaling with Dynamic Type. Keep body, labels and controls on San Francisco unless the brand truly requires otherwise; brand faces fit best in titles and display moments.

## Roles in one place

```swift
enum TextRole { case display, title, heading, body, label, caption }

extension View {
    @ViewBuilder
    func textRole(_ role: TextRole) -> some View {
        switch role {
        case .display: font(.largeTitle.weight(.semibold))
        case .title:   font(.title2.weight(.semibold))
        case .heading: font(.headline)
        case .body:    font(.body)
        case .label:   font(.subheadline.weight(.medium))
        case .caption: font(.footnote).foregroundStyle(.secondary)
        }
    }
}
```

## Numbers

```swift
Text(amount, format: .currency(code: currencyCode))
    .monospacedDigit()                                   // tabular figures
    .contentTransition(.numericText(value: amount))      // animate changes in place
```

Use `FormatStyle` (`.currency`, `.number`, `.percent`, `.dateTime`) so locale rules apply.

## Spacing and wrapping

- `.tracking()` for letter spacing (prefer the font's defaults for body).
- `.lineSpacing()` adds leading between lines for multi-line descriptions.
- `.lineLimit(2)` plus a way to see the full text; avoid `.minimumScaleFactor` except for short, single-line values where wrapping is impossible.
- Let text wrap at large sizes: avoid fixed-height containers; use `ViewThatFits` or switch `HStack` to `VStack` at accessibility sizes (`dynamicTypeSize.isAccessibilitySize`).

## Floors

Body is 17pt at the default size; nothing below 11pt (`.caption2`).

## Verify

Preview at the largest accessibility size and in dark mode:

```swift
#Preview { ContentView().environment(\.dynamicTypeSize, .accessibility3) }
```
