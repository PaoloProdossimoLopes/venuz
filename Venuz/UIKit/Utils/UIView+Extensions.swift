import UIKit

extension UIView {
    func enableViewCode() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    var constraintable: Contraintable {
        Contraintable(self)
    }
}
