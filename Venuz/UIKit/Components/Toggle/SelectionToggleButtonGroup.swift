import UIKit

open class ToggleButtonGroup: View {
    public private(set) var toggleButtons = [ToggleButton]()
    private var container = Stack.Vertical(spacing: .md)
    
    public init(axis: NSLayoutConstraint.Axis = .horizontal) {
        super.init(frame: .zero)
        
        container.axis = axis
        addSubview(container)
        
        container.constraintable.fillToParrent(edge: .equal(.md))
    }
    
    @discardableResult
    public func selectToggleButton(_ toggleButton: ToggleButton) -> Self {
        self
    }
    
    @discardableResult
    func selectToggleButton(at index: Int) -> Self {
        guard toggleButtons.indices.contains(index) else {
            return self
        }
        
        let chosedToggleButton = toggleButtons[index]
        return selectToggleButton(chosedToggleButton)
    }
    
    @discardableResult
    public func addToggleButton(_ toggleButton: ToggleButton) -> Self {
        toggleButtons.append(toggleButton)
        updateContainerStack()
        return self
    }
    
    @discardableResult
    public func removeToggleButton(_ toggleButton: ToggleButton) -> Self {
        toggleButtons.removeAll(where: { $0 === toggleButton })
        updateContainerStack()
        return self
    }
    
    @discardableResult
    public func removeToggleButton(at index: Int) -> Self {
        toggleButtons.remove(at: index)
        updateContainerStack()
        return self
    }
    
    private func updateContainerStack() {
        container.arrangedSubviews.forEach(container.removeArrangedSubview)
        toggleButtons.forEach(container.addArrangedSubview)
        
        container.addArrangedSubview(UIView())
    }
    
    private func toggleButtonActionHandler(_ toggleButton: ToggleButton) {
        selectToggleButton(toggleButton)
    }
}
