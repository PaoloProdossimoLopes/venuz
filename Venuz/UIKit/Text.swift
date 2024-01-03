import UIKit

open class Label: UILabel {
    
    private let theme = Theme.shared
    
    public convenience init(_ size: FontSize) {
        self.init(frame: .zero)
        setFontSize(size)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        isAccessibilityElement = true
        isUserInteractionEnabled = false

        unmutted()
        enableViewCode()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }
    
    public func setFontSize(_ size: FontSize) {
        font = size.uiFont
        accessibilityTraits = size.uiAccessibilityTrait
        adjustsFontForContentSizeCategory = true
    }
    
    public func mutted() {
        textColor = theme.token.color.muttedForeground.uiColor
    }
    
    public func unmutted() {
        textColor = theme.token.color.foreground.uiColor
    }
}
