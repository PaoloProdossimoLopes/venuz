import UIKit

open class SingleSelectionToggleButtonGroup: ToggleButtonGroup {
    public func getSelectedToggleButton() -> ToggleButton? {
        toggleButtons.first { $0.isSelected }
    }
    
    public override func selectToggleButton(_ toggleButton: ToggleButton) -> Self {
        toggleButtons
            .filter { $0 !== toggleButton }
            .forEach { $0.isSelected = false }
        
        return self
    }
}
