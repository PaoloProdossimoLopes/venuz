import UIKit

open class MultipleSelectionToggleButtonGroup: ToggleButtonGroup {
    public func getSelectedToggleButtons() -> [ToggleButton] {
        toggleButtons.filter { $0.isSelected }
    }
    
    public override func selectToggleButton(_ toggleButton: ToggleButton) -> Self {
        self
    }
}
