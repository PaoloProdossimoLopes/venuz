extension FontSize {
    var uiFont: UIFont {
        switch self {
        case .xs:
            return buildFont(.body, size: 12, weight: .regular)
        case .sm:
            return buildFont(.body, size: 14, weight: .regular)
        case .md:
            return buildFont(.subheadline, size: 16, weight: .regular)
        case .lg:
            return buildFont(.subheadline, size: 18, weight: .semibold)
        case .xl:
            return buildFont(.title3, size: 22, weight: .semibold)
        case .xxl:
            return buildFont(.title2, size: 28, weight: .bold)
        case .xxxl:
            return buildFont(.title1, size: 32, weight: .bold)
        }
    }
    
    private func buildFont(_ style: UIFont.TextStyle, size: CGFloat, weight: UIFont.Weight) -> UIFont {
        UIFontMetrics(forTextStyle: style).scaledFont(for: .systemFont(ofSize: size, weight: weight))
    }
    
    var uiAccessibilityTrait: UIAccessibilityTraits {
        switch self {
        case .xs, .sm, .md:
            return  .staticText
        case .lg, .xl:
            return .header
        case .xxl, .xxxl:
            return .header
        }
    }
}
