import UIKit

open class Stack: UIStackView {
    public static func Vertical(spacing: Spacing = .none, _ content: UIView...) -> Stack {
        let s = Stack(spacing)
        s.axis = .vertical
        content.forEach { s.attach($0) }
        return s
    }
    
    public static func Horizontal(spacing: Spacing = .none, _ content: UIView...) -> Stack {
        let s = Stack(spacing)
        s.axis = .horizontal
        content.forEach { s.attach($0) }
        return s
    }
    
    init(_ spacing: Spacing) {
        super.init(frame: .zero)
        self.spacing = spacing.value
    }
    
    @available(*, unavailable)
    required public init(coder: NSCoder) {
        fatalError("Initialization using `coder` is disabled")
    }
    
    @discardableResult
    public func attach(_ view: UIView) -> Self {
        addArrangedSubview(view)
        return self
    }
    
    @discardableResult
    public func setDistribution(_ dist: UIStackView.Distribution) -> Self {
        distribution = dist
        return self
    }
    
    @discardableResult
    public func setSpacing(_ spacing: Spacing) -> Self {
        self.spacing = spacing.value
        return self
    }
    
    @discardableResult
    public func setAxis(_ axis: NSLayoutConstraint.Axis) -> Self {
        self.axis = axis
        return self
    }
}
