open class Progressbar: UIProgressView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        progressViewStyle = .default
        
        setProgress(0)

        setToClip()
        
        progressTintColor = theme.token.color.foreground.uiColor
        trackTintColor = theme.token.color.highlightBackground.uiColor
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.height / 2
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }
    
    @discardableResult
    public func setProgress(_ value: Float) -> Self {
        setProgress(value, animated: true)
        return self
    }
    
    @discardableResult
    public func setPercentageProgress(_ value: Int) -> Self {
        setProgress(Float(value) / 100, animated: true)
        return self
    }
}
