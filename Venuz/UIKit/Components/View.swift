import UIKit

open class View: UIControl {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setBackgroundColor(theme.token.color.transparent)        
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }
}
