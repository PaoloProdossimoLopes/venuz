open class Switch: UISwitch {
    
    public init(isOn: Bool = false) {
        super.init(frame: .zero)
        
        thumbTintColor = theme.token.color.foreground.uiColor
        onTintColor = theme.token.color.accent.uiColor
        tintColor = theme.token.color.highlightBackground.uiColor
        
        setToClip()
        
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }
}
