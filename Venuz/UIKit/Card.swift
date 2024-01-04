open class Card: UIControl {
    let theme = Theme.shared
    
    lazy var container = Stack.Vertical(spacing: .md)
    
    public init(_ items: UIView...) {
        super.init(frame: .zero)
        
        setBoader()
        setRadius(.md)
        setAxis(.vertical)
        
        items.forEach {
            container.addArrangedSubview($0)
        }
        
        addSubview(container)
        backgroundColor = theme.token.color.background.uiColor
        
        container
            .constraintable
            .fill(on: self, edge: .axis(v: .lg, h: .md))
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }
    
    @discardableResult
    public func setBoader() -> Self {
        layer.borderColor = theme.token.color.highlightBackground.uiColor.cgColor
        layer.borderWidth = 1
        
        return self
    }
    
    @discardableResult
    public func removeBoader() -> Self {
        layer.borderColor = nil
        layer.borderWidth = 0
        
        return self
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
    
    @discardableResult
    public func setRadius(_ radius: Radius) -> Self {
        layer.cornerRadius = radius.value
        
        return self
    }
}
