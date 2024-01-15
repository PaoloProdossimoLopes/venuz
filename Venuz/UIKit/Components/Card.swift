open class Card: View {
    
    private lazy var container = Stack.Vertical(spacing: .md)
    
    public init(_ items: UIView...) {
        super.init(frame: .zero)
        
        setRadius(.md)
        setAxis(.vertical)
        setBoader(theme.token.color.highlightBackground)
        
        items.forEach {
            container.addArrangedSubview($0)
        }
        
        addSubview(container)
        setBackgroundColor(theme.token.color.background)
        
        setContentEdge(.axis(v: .lg, h: .md))
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }
    
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
    public func setContentEdge(_ edge: Edge) -> Self {
        container
            .constraintable
            .fill(on: self, edge: edge)
        
        return self
    }
    
    @discardableResult
    public func setSpacing(spacing: Spacing = .xs) -> Self {
        container.setSpacing(spacing)
        return self
    }
}
