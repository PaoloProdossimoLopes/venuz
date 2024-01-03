import UIKit

extension UIView {
    func enableInteraction() {
        isUserInteractionEnabled = true
    }
    
    func disableInteraction() {
        isUserInteractionEnabled = false
    }
    
    func enableViewCode() {
        if translatesAutoresizingMaskIntoConstraints {
            translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    var constraintable: Contraintable {
        Contraintable(self)
    }
}
