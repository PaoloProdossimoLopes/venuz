import Foundation

final class Contraintable {
    private let item: UIView
    
    init(_ item: UIView) {
        self.item = item
        item.enableViewCode()
    }
    
    @discardableResult
    func centerX(on view: UIView) -> Self {
        active(item.centerXAnchor.constraint(equalTo: view.centerXAnchor))
    }
    
    @discardableResult
    func centerY(on view: UIView) -> Self {
        active(item.centerYAnchor.constraint(equalTo: view.centerYAnchor))
    }
    
    @discardableResult
    func anchorEqualTop(on view: UIView, padding: Spacing = .none) -> Self {
        active(item.topAnchor.constraint(equalTo: view.topAnchor, constant: padding.value))
    }
    
    @discardableResult
    func anchorEqualLeading(atLeading view: UIView, padding: Spacing = .none) -> Self {
        active(item.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding.value))
    }
    
    @discardableResult
    func anchorEqualLeading(atTrailing view: UIView, padding: Spacing = .none) -> Self {
        active(item.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: padding.value))
    }
    
    @discardableResult
    func anchorEqualTrailing(atTrailing view: UIView, padding: Spacing = .none) -> Self {
        active(item.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding.value))
    }
    
    @discardableResult
    func anchorEqualTrailing(atLeading view: UIView, padding: Spacing = .none) -> Self {
        active(item.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -padding.value))
    }
    
    @discardableResult
    func anchorEqualBottom(on view: UIView, padding: Spacing = .none) -> Self {
        active(item.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding.value))
    }
    
    @discardableResult
    func minWidth(_ size: CGFloat) -> Contraintable {
        active(item.widthAnchor.constraint(greaterThanOrEqualToConstant: size))
    }
    
    @discardableResult
    func minHeight(_ size: CGFloat) -> Contraintable {
        active(item.heightAnchor.constraint(greaterThanOrEqualToConstant: size))
    }
    
    @discardableResult
    func maxWidth(_ size: CGFloat) -> Contraintable {
        active(item.widthAnchor.constraint(lessThanOrEqualToConstant: size))
    }
    
    @discardableResult
    func height(_ size: CGFloat) -> Contraintable {
        active(item.heightAnchor.constraint(equalToConstant: size))
    }
    
    @discardableResult
    func width(_ size: CGFloat) -> Contraintable {
        active(item.widthAnchor.constraint(equalToConstant: size))
    }
    
    @discardableResult
    func equalSize(_ size: CGFloat) -> Contraintable {
        width(size).height(size)
    }
    
    @discardableResult
    func maxHeight(_ size: CGFloat) -> Contraintable {
        active(item.heightAnchor.constraint(lessThanOrEqualToConstant: size))
    }
    
    @discardableResult
    func fill(on view: UIView, edge: Edge = .none) -> Self {
        anchorEqualLeading(atLeading: view, padding: edge.leading)
            .anchorEqualTop(on: view, padding: edge.top)
            .anchorEqualTrailing(atTrailing: view, padding: edge.trailing)
            .anchorEqualBottom(on: view, padding: edge.bottom)
    }
    
    @discardableResult
    func fillToParrent(edge: Edge = .none) -> Self {
        guard let view = item.superview else { return self }
        
        return anchorEqualLeading(atLeading: view, padding: edge.leading)
            .anchorEqualTop(on: view, padding: edge.top)
            .anchorEqualTrailing(atTrailing: view, padding: edge.trailing)
            .anchorEqualBottom(on: view, padding: edge.bottom)
    }
    
    @discardableResult
    private func active(_ constaint: NSLayoutConstraint) -> Self {
        constaint.isActive = true
        
        return self
    }
}
