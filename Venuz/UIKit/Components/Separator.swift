open class Separator: View {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setBackgroundColor(theme.token.color.highlightBackground)
        disableInteraction()
        constraintable.height(1)
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }
}
