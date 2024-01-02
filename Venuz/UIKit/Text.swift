import UIKit

open class Label: UILabel {
    
    private let theme = Theme.shared
    
    public convenience init(_ size: FontSize) {
        self.init(frame: .zero)
        setFontSize(size)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textColor = theme.token.color.foreground.uiColor
        backgroundColor = theme.token.color.background.uiColor
        isAccessibilityElement = true

        enableViewCode()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }
    
    public func setFontSize(_ size: FontSize) {
        font = size.uiFont
        accessibilityTraits = size.uiAccessibilityTrait
        adjustsFontForContentSizeCategory = true
    }
}
