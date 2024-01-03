open class FillButton: UIControl {
    
    private let theme = Theme.shared

    private lazy var label: Label = {
        let l = Label(.lg)
        l.textAlignment = .center
        return l
    }()
    
    public var text: String {
        get { label.text ?? String() }
        set { label.text = newValue.lowercased() }
    }
    
    open override var isEnabled: Bool {
        get { super.isEnabled }
        set {
            newValue ? enable() : disable()
            super.isEnabled = newValue
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = theme.token.color.accent.uiColor
        layer.cornerRadius = Radius.sm.value
        
        enableViewCode()
        
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: Spacing.sm.value),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacing.md.value),

            trailingAnchor.constraint(equalTo: label.trailingAnchor, constant: Spacing.md.value),
            bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: Spacing.sm.value),
            
            widthAnchor.constraint(greaterThanOrEqualToConstant: 120),
            heightAnchor.constraint(greaterThanOrEqualToConstant: 40)
        ])
        
        addTarget(self, action: #selector(tapButtonActionHandler), for: .touchUpInside)
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }
    
    public func enable() {
        label.unmutted()
        backgroundColor = theme.token.color.accent.uiColor
        
        enableInteraction()
    }
    
    public func disable() {
        label.mutted()
        backgroundColor = theme.token.color.muttedAccent.uiColor
        
        disableInteraction()
    }
    
    @objc private func tapButtonActionHandler() {
        UIView.animate(withDuration: 0.1, delay: 0, options: .transitionCrossDissolve) {
            self.backgroundColor = self.theme.token.color.highlightAccent.uiColor
        }
        
        UIView.animate(withDuration: 0.1, delay: 0.1, options: .transitionCrossDissolve) {
            self.backgroundColor = self.theme.token.color.accent.uiColor
        }
    }
}
