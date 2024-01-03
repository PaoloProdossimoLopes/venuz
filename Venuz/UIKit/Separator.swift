open class Separator: UIView {
    private let theme = Theme.shared
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = theme.token.color.highlightBackground.uiColor
        
        constraintable.height(1)
        
        disableInteraction()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }
}
