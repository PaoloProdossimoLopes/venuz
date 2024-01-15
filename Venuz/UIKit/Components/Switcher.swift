open class Switch: UISwitch {
    private var color: ColorToken {
        theme.token.color
    }
    
    public init(isOn: Bool = false) {
        super.init(frame: .zero)
        
        thumbTintColor = color.foreground.uiColor
        onTintColor = color.accent.uiColor
        tintColor = color.highlightBackground.uiColor
        
        setToClip()
        
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }
}
