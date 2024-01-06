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
        return self
    }
    
    @discardableResult
    func centerY(on view: UIView) -> Self {
        active(item.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        return self
    }
    
    @discardableResult
    func anchorEqualTop(on view: UIView, padding: Spacing = .none) -> Self {
        active(item.topAnchor.constraint(equalTo: view.topAnchor, constant: padding.value))
        return self
    }
    
    @discardableResult
    func anchorEqualLeading(on view: UIView, padding: Spacing = .none) -> Self {
        active(item.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding.value))
        return self
    }
    
    @discardableResult
    func anchorEqualTrailing(on view: UIView, padding: Spacing = .none) -> Self {
        active(item.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding.value))
        return self
    }
    
    @discardableResult
    func anchorEqualBottom(on view: UIView, padding: Spacing = .none) -> Self {
        active(item.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding.value))
        return self
    }
    
    @discardableResult
    func minWidth(_ size: CGFloat) -> Contraintable {
        active(item.widthAnchor.constraint(greaterThanOrEqualToConstant: size))
        return self
    }
    
    @discardableResult
    func minHeight(_ size: CGFloat) -> Contraintable {
        active(item.heightAnchor.constraint(greaterThanOrEqualToConstant: size))
        return self
    }
    
    @discardableResult
    func maxWidth(_ size: CGFloat) -> Contraintable {
        active(item.widthAnchor.constraint(lessThanOrEqualToConstant: size))
        return self
    }
    
    @discardableResult
    func height(_ size: CGFloat) -> Contraintable {
        active(item.heightAnchor.constraint(equalToConstant: size))
        return self
    }
    
    @discardableResult
    func width(_ size: CGFloat) -> Contraintable {
        active(item.widthAnchor.constraint(equalToConstant: size))
        return self
    }
    
    @discardableResult
    func maxHeight(_ size: CGFloat) -> Contraintable {
        active(item.heightAnchor.constraint(lessThanOrEqualToConstant: size))
        return self
    }
    
    @discardableResult
    func fill(on view: UIView, edge: Edge = .none) -> Self {
        anchorEqualLeading(on: view, padding: edge.leading)
            .anchorEqualTop(on: view, padding: edge.top)
            .anchorEqualTrailing(on: view, padding: edge.trailing)
            .anchorEqualBottom(on: view, padding: edge.bottom)
    }
    
    private func active(_ constaint: NSLayoutConstraint) {
        constaint.isActive = true
    }
}
