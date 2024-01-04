import UIKit

extension Img {
    var value: UIImage {
        UIImage(named: rawValue, in: .venuz, compatibleWith: nil)!
    }
}
