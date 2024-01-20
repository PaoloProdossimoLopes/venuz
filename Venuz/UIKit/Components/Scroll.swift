import UIKit

open class Scroll: UIScrollView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        
        isScrollEnabled = true
        
        setBackgroundColor(theme.token.color.transparent)
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }
}
