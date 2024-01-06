import UIKit

open class View: UIControl {
    let theme = Theme.shared
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setBackground(theme.token.color.transparent)
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }
    
    @discardableResult
    func setToClip() -> Self {
        clipsToBounds = true
        return self
    }
    
    @discardableResult
    func setBackground(_ rgb: RGBA) -> Self {
        backgroundColor = rgb.uiColor
        return self
    }
    
    @discardableResult
    public func setRadius(_ radius: Radius) -> Self {
        layer.cornerRadius = radius.value
        
        return self
    }
    
    @discardableResult
    public func setBoader(_ rgba: RGBA) -> Self {
        layer.borderColor = rgba.uiColor.cgColor
        layer.borderWidth = 1
        
        return self
    }
    
    @discardableResult
    public func removeBoader() -> Self {
        layer.borderColor = nil
        layer.borderWidth = 0
        
        return self
    }
}
