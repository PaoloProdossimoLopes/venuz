import UIKit

extension Edge {
    var insets: UIEdgeInsets {
        UIEdgeInsets(
            top: top.value,
            left: leading.value,
            bottom: bottom.value,
            right: trailing.value
        )
    }
}
