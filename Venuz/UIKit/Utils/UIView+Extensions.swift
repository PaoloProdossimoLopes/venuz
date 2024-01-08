import UIKit

extension UIView {
    
    var theme: Theme {
        Theme.shared
    }
    
    public var constraintable: Contraintable {
        Contraintable(self)
    }
    
    @discardableResult
    public func enableInteraction() -> Self  {
        isUserInteractionEnabled = true
        
        return self
    }
    
    @discardableResult
    public func disableInteraction() -> Self  {
        isUserInteractionEnabled = false
        
        return self
    }
    
    @discardableResult
    public func enableViewCode() -> Self  {
        if translatesAutoresizingMaskIntoConstraints {
            translatesAutoresizingMaskIntoConstraints = false
        }
        
        return self
    }
    
    @discardableResult
    public func setToClip() -> Self {
        clipsToBounds = true
        return self
    }
    
    @discardableResult
    public func setBackgroundColor(_ rgb: RGBA) -> Self {
        backgroundColor = rgb.uiColor
        return self
    }
    
    @discardableResult
    public func setTintColor(_ rgb: RGBA) -> Self {
        tintColor = rgb.uiColor
        return self
    }
    
    @discardableResult
    public func setRadius(_ radius: Radius) -> Self {
        layer.cornerRadius = radius.value
        
        return self
    }
    
    @discardableResult
    public func setBoader(_ rgba: RGBA, lineWidth width: LineWidth = .xs) -> Self {
        layer.borderColor = rgba.uiColor.cgColor
        layer.borderWidth = width.value
        
        return self
    }
    
    @discardableResult
    public func removeBoader() -> Self {
        layer.borderColor = nil
        layer.borderWidth = 0
        
        return self
    }
    
    @discardableResult
    public func setVisible() -> Self {
        isHidden = false
        alpha = 1
        
        return self
    }
    
    @discardableResult
    public func setInvisible() -> Self {
        isHidden = true
        alpha = 0
        
        return self
    }
}
