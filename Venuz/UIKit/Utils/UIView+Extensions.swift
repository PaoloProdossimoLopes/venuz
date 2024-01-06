import UIKit

extension UIView {
    
    var theme: Theme {
        Theme.shared
    }
    
    var constraintable: Contraintable {
        Contraintable(self)
    }
    
    @discardableResult
    func enableInteraction() -> Self  {
        isUserInteractionEnabled = true
        
        return self
    }
    
    @discardableResult
    func disableInteraction() -> Self  {
        isUserInteractionEnabled = false
        
        return self
    }
    
    @discardableResult
    func enableViewCode() -> Self  {
        if translatesAutoresizingMaskIntoConstraints {
            translatesAutoresizingMaskIntoConstraints = false
        }
        
        return self
    }
    
    @discardableResult
    func setToClip() -> Self {
        clipsToBounds = true
        return self
    }
    
    @discardableResult
    func setBackgroundColor(_ rgb: RGBA) -> Self {
        backgroundColor = rgb.uiColor
        return self
    }
    
    @discardableResult
    func setTintColor(_ rgb: RGBA) -> Self {
        tintColor = rgb.uiColor
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
