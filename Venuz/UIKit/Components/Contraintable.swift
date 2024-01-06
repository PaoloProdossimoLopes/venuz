import Foundation

public final class Contraintable {
    private let item: UIView
    
    init(_ item: UIView) {
        self.item = item
        item.enableViewCode()
    }
    
    @discardableResult
    public func centerX(on view: UIView) -> Self {
        active(item.centerXAnchor.constraint(equalTo: view.centerXAnchor))
    }
    
    @discardableResult
    public func centerY(on view: UIView) -> Self {
        active(item.centerYAnchor.constraint(equalTo: view.centerYAnchor))
    }
    
    @discardableResult
    public func anchorEqualTop(atTop view: UIView, padding: Spacing = .none) -> Self {
        active(item.topAnchor.constraint(equalTo: view.topAnchor, constant: padding.value))
    }
    
    @discardableResult
    public func anchorEqualTop(atBottom view: UIView, padding: Spacing = .none) -> Self {
        active(item.topAnchor.constraint(equalTo: view.topAnchor, constant: padding.value))
    }
    
    @discardableResult
    public func anchorEqualLeading(atLeading view: UIView, padding: Spacing = .none) -> Self {
        active(item.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding.value))
    }
    
    @discardableResult
    public func anchorEqualLeading(atTrailing view: UIView, padding: Spacing = .none) -> Self {
        active(item.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: padding.value))
    }
    
    @discardableResult
    public func anchorEqualTrailing(atTrailing view: UIView, padding: Spacing = .none) -> Self {
        active(item.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding.value))
    }
    
    @discardableResult
    public func anchorEqualTrailing(atLeading view: UIView, padding: Spacing = .none) -> Self {
        active(item.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -padding.value))
    }
    
    @discardableResult
    public func anchorEqualBottom(atBottom view: UIView, padding: Spacing = .none) -> Self {
        active(item.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding.value))
    }
    
    @discardableResult
    public func anchorEqualBottom(atTop view: UIView, padding: Spacing = .none) -> Self {
        active(item.bottomAnchor.constraint(equalTo: view.topAnchor, constant: -padding.value))
    }
    
    @discardableResult
    public func anchorEqualTop(atSafeTop view: UIView, padding: Spacing = .none) -> Self {
        active(item.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding.value))
    }
    
    @discardableResult
    public func anchorEqualTop(atSafeBottom view: UIView, padding: Spacing = .none) -> Self {
        active(item.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding.value))
    }
    
    @discardableResult
    public func anchorEqualLeading(atSafeLeading view: UIView, padding: Spacing = .none) -> Self {
        active(item.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding.value))
    }
    
    @discardableResult
    public func anchorEqualLeading(atSafeTrailing view: UIView, padding: Spacing = .none) -> Self {
        active(item.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: padding.value))
    }
    
    @discardableResult
    public func anchorEqualTrailing(atSafeTrailing view: UIView, padding: Spacing = .none) -> Self {
        active(item.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding.value))
    }
    
    @discardableResult
    public func anchorEqualTrailing(atSafeLeading view: UIView, padding: Spacing = .none) -> Self {
        active(item.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: -padding.value))
    }
    
    @discardableResult
    public func anchorEqualBottom(atSafeBottom view: UIView, padding: Spacing = .none) -> Self {
        active(item.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding.value))
    }
    
    @discardableResult
    public func anchorEqualBottom(atSafeTop view: UIView, padding: Spacing = .none) -> Self {
        active(item.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -padding.value))
    }
    
    @discardableResult
    public func minWidth(_ size: CGFloat) -> Contraintable {
        active(item.widthAnchor.constraint(greaterThanOrEqualToConstant: size))
    }
    
    @discardableResult
    public func minHeight(_ size: CGFloat) -> Contraintable {
        active(item.heightAnchor.constraint(greaterThanOrEqualToConstant: size))
    }
    
    @discardableResult
    public func maxWidth(_ size: CGFloat) -> Contraintable {
        active(item.widthAnchor.constraint(lessThanOrEqualToConstant: size))
    }
    
    @discardableResult
    public func height(_ size: CGFloat) -> Contraintable {
        active(item.heightAnchor.constraint(equalToConstant: size))
    }
    
    @discardableResult
    public func width(_ size: CGFloat) -> Contraintable {
        active(item.widthAnchor.constraint(equalToConstant: size))
    }
    
    @discardableResult
    public func equalSize(_ size: CGFloat) -> Contraintable {
        width(size).height(size)
    }
    
    @discardableResult
    public func maxHeight(_ size: CGFloat) -> Contraintable {
        active(item.heightAnchor.constraint(lessThanOrEqualToConstant: size))
    }
    
    @discardableResult
    public func fill(on view: UIView, edge: Edge = .none) -> Self {
        anchorEqualLeading(atLeading: view, padding: edge.leading)
            .anchorEqualTop(atTop: view, padding: edge.top)
            .anchorEqualTrailing(atTrailing: view, padding: edge.trailing)
            .anchorEqualBottom(atBottom: view, padding: edge.bottom)
    }
    
    @discardableResult
    public func fillSafe(on view: UIView, edge: Edge = .none) -> Self {
        anchorEqualLeading(atSafeLeading: view, padding: edge.leading)
            .anchorEqualTop(atSafeTop: view, padding: edge.top)
            .anchorEqualTrailing(atSafeTrailing: view, padding: edge.trailing)
            .anchorEqualBottom(atSafeBottom: view, padding: edge.bottom)
    }
    
    @discardableResult
    public func fillToParrent(edge: Edge = .none) -> Self {
        guard let view = item.superview else { return self }
        
        return fill(on: view, edge: edge)
    }
    
    @discardableResult
    public func fillToSafeParrent(edge: Edge = .none) -> Self {
        guard let view = item.superview else { return self }
        
        return fillSafe(on: view, edge: edge)
    }
    
    @discardableResult
    private func active(_ constaint: NSLayoutConstraint) -> Self {
        constaint.isActive = true
        
        return self
    }
}
