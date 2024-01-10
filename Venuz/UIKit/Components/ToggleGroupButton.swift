import UIKit

open class ToggleGroupButton: View {
    private var toggleButtons = [ToggleButton]()
    private var container = Stack.Vertical(spacing: .md)
    
    public init(axis: NSLayoutConstraint.Axis = .horizontal) {
        super.init(frame: .zero)
        
        container.axis = axis
        addSubview(container)
        
        container.constraintable.fillToParrent(edge: .equal(.md))
    }
    
    public func getSelectedToggleButton() -> ToggleButton? {
        toggleButtons.first { $0.isSelected }
    }
    
    @discardableResult
    public func selectToggleButton(at index: Int) -> Self {
        guard toggleButtons.indices.contains(index) else {
            return self
        }
        
        let chosedToggleButton = toggleButtons[index]
        return selectToggleButton(chosedToggleButton)
    }
    
    @discardableResult
    public func selectToggleButton(_ toggleButton: ToggleButton) -> Self {
        toggleButtons
            .filter { $0 !== toggleButton }
            .forEach { $0.isSelected = false }
        
        return self
    }
    
    @discardableResult
    public func addToggleButton(_ toggleButton: ToggleButton) -> Self {
        toggleButtons.append(toggleButton)
        toggleButton.setAction(toggleButtonActionHandler)
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
