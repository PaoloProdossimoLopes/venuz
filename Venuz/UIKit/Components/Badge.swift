open class Badge: View {
    
    private lazy var label = Label(.sm)
        .setMaxLines(0)
    
    public init(_ text: String) {
        super.init(frame: .zero)
        label.setText(text)
        setRadius(.md)
        
        addSubview(label)
        
        setBackground(theme.token.color.accent)
        label.constraintable.fill(on: self, edge: .axis(v: .sm, h: .md))
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
