import UIKit

open class Label: UILabel {
    
    @frozen public enum Variant {
        case mutted
        case standard
    }
    
    private let theme = Theme.shared
    
    public convenience init(_ size: FontSize) {
        self.init(frame: .zero)
        setFontSize(size)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        isAccessibilityElement = true
        isUserInteractionEnabled = false

        setText(String())
        setVariant()
        enableViewCode()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }
    
    @discardableResult
    public func setFontSize(_ size: FontSize) -> Self {
        font = size.uiFont
        accessibilityTraits = size.uiAccessibilityTrait
        adjustsFontForContentSizeCategory = true
        
        return self
    }
    
    @discardableResult
    public func setText(_ text: String) -> Self {
        self.text = text
        
        return self
    }
    
    @discardableResult
    public func setAlignment(_ alignment: NSTextAlignment) -> Self {
        textAlignment = alignment
        
        return self
    }
    
    @discardableResult
    public func setVariant(_ variant: Variant = .standard) -> Self {
        switch variant {
        case .mutted:
            textColor = theme.token.color.muttedForeground.uiColor
        case .standard:
            textColor = theme.token.color.foreground.uiColor
        }
        
        return self
    }
}
