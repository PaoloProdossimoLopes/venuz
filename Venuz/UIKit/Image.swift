import UIKit

open class Image: UIImageView {
    
    private let theme = Theme.shared
    
    public init(_ icon: Icon = .bubbleRight) {
        super.init(frame: .zero)
        
        setIcon(icon)
        tintColor = theme.token.color.foreground.uiColor
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }
    
    @discardableResult
    public func setIcon(_ icon: Icon) -> Self {
        image = icon.img
        return self
    }
    
    
    @discardableResult
    public func setScaleAspecToFit() -> Self {
        contentMode = .scaleAspectFit
        return self
    }
    
    @discardableResult
    public func setScaleAspecToFill() -> Self {
        contentMode = .scaleAspectFill
        return self
    }
}
