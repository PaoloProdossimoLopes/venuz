import UIKit

open class SimpleListCellController: ListCellController {
    
    private let viewData: SimpleListCell.ViewData
    
    public init(viewData: SimpleListCell.ViewData) {
        self.viewData = viewData
    }
    
    public func list(_ list: List, createListCellAtIndexPath indexPath: IndexPath) -> ReusableListCell {
        let simpleListCell = list.reuse(SimpleListCell.self, at: indexPath)
        simpleListCell.setupViewData(viewData)
        simpleListCell.selectionStyle = .none
        return simpleListCell
    }
}
