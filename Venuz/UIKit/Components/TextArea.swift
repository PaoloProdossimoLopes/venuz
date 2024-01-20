import UIKit

open class TextArea: UITextView {
    
    public override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        delegate = self
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        setTintColor(theme.token.color.foreground)
        textColor = theme.token.color.foreground.uiColor
        font = Label().font
        
        setRadius(.md)
        setBackgroundColor(theme.token.color.background)
        setBoader(theme.token.color.highlightBackground)
        
        constraintable.minHeight(100)
    }
}

extension TextArea: UITextViewDelegate {
    
}
