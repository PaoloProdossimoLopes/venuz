open class Progressbar: UIProgressView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setProgress(0)
        
        progressTintColor = theme.token.color.foreground.uiColor
        trackTintColor = theme.token.color.highlightBackground.uiColor
        
        constraintable.minHeight(6)
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }
    
    @discardableResult
    public func setProgress(_ value: Float) -> Self {
        setProgress(value, animated: true)
        return self
    }
    
    @discardableResult
    public func setProgress(_ value: Int) -> Self {
        setProgress(Float(value) / 100, animated: true)
        return self
    }
}
