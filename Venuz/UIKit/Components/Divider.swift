import UIKit

open class Divider: View {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        constraintable.height(1)
        setBackgroundColor(theme.token.color.highlightBackground)
        setRadius(.sm)
    }
}
