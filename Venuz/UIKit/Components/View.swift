import UIKit

open class View: UIControl {
    let theme = Theme.shared
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setBackgroundColor(theme.token.color.transparent)        
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }
}
