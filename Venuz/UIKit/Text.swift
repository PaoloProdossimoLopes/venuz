import UIKit

open class Label: UILabel {
    private let theme = Theme.shared
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        textColor = theme.token.color.foreground.uiColor
        backgroundColor = theme.token.color.background.uiColor
        
        setFontSize(.md)
        enableViewCode()
        
        isAccessibilityElement = true
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }
    
    public func setFontSize(_ size: FontSizeToken) {
        switch size {
        case .xs:
            font = UIFontMetrics(forTextStyle: .body).scaledFont(for: .systemFont(ofSize: 12))
            accessibilityTraits = .staticText
        case .sm:
            font = UIFontMetrics(forTextStyle: .body).scaledFont(for: .systemFont(ofSize: 14))
            accessibilityTraits = .staticText
        case .md:
            font = UIFontMetrics(forTextStyle: .subheadline).scaledFont(for: .systemFont(ofSize: 16))
            accessibilityTraits = .staticText
        case .lg:
            font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: .systemFont(ofSize: 18, weight: .bold))
            accessibilityTraits = .header
        case .xl:
            font = UIFontMetrics(forTextStyle: .title3).scaledFont(for: .systemFont(ofSize: 22, weight: .bold))
            accessibilityTraits = .header
        case .xxl:
            font = UIFontMetrics(forTextStyle: .title2).scaledFont(for: .systemFont(ofSize: 28, weight: .bold))
            accessibilityTraits = .header
        case .xxxl:
            font = UIFontMetrics(forTextStyle: .title1).scaledFont(for: .systemFont(ofSize: 32, weight: .bold))
            accessibilityTraits = .header
        }
        
        adjustsFontForContentSizeCategory = true
    }
}
extension RGBA {
    private var maxRGBValue: CGFloat { 255.0 }
    
    var uiColor: UIColor {
        UIColor(
            red: CGFloat(r) / maxRGBValue, 
            green: CGFloat(g) / maxRGBValue,
            blue: CGFloat(b) / maxRGBValue,
            alpha: 1
        )
    }
}

extension UIView {
    func enableViewCode() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
