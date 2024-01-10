import UIKit

open class ToggleButton: Card {
    public typealias ToggleButtonActionHandler = (ToggleButton) -> Void
    
    private var tapAction: ToggleButtonActionHandler?
    
    open override var isSelected: Bool {
        get { super.isSelected }
        set {
            changeToggleButton(isSelected: newValue)
            super.isSelected = newValue
        }
    }
    
    public init(_ item: UIView) {
        super.init()
        
        
        setContentEdge(.equal(.md))
        
        addTapAction(
            target: self,
            action: #selector(tapFeatureToggleButtonActionHandler)
        )
        
        addSubview(item)
        item.constraintable.fillToParrent(edge: .equal(.md))
        
        constraintable
            .width(50)
            .height(50)
    }
    
    @discardableResult
    public func setAction(_ action: @escaping ToggleButtonActionHandler) -> Self {
        tapAction = action
        return self
    }
    
    private func changeToggleButton(isSelected: Bool) {
        UIView.animate(withDuration: 0.1) {
            if isSelected {
                self.setBackgroundColor(self.theme.token.color.highlightBackground)
            } else {
                self.setBackgroundColor(self.theme.token.color.background)
            }
        }
    }
    
    @objc private func tapFeatureToggleButtonActionHandler() {
        isSelected.toggle()
        tapAction?(self)
    }
}
