open class Card: UIView {
    let theme = Theme.shared
    
    lazy var container = Stack.Vertical(spacing: .md)
    
    public init(_ items: UIView...) {
        super.init(frame: .zero)
        
        setAxis(.vertical)
        backgroundColor = theme.token.color.background.uiColor
        layer.borderColor = theme.token.color.highlightBackground.uiColor.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = Radius.md.value
        
        items.forEach {
            container.addArrangedSubview($0)
        }
        
        addSubview(container)
        container.constraintable.fill(on: self, edge: .axis(v: .md, h: .sm))
    }
    
    @discardableResult
    public func attach(_ view: UIView) -> Self {
        container.addArrangedSubview(view)
        
        return self
    }
    
    @discardableResult
    public func setAxis(_ axis: NSLayoutConstraint.Axis) -> Self {
        container.axis = axis
        
        return self
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }
}
