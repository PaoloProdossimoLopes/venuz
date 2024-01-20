public final class SelectListCellController: ListCellController {
    private let viewData: SelectListCell.ViewData
    
    private var selectListCell: SelectListCell!
    
    public init(viewData: SelectListCell.ViewData) {
        self.viewData = viewData
    }
    
    public func list(_ list: List, createListCellAtIndexPath indexPath: IndexPath) -> ListCell {
        selectListCell = SelectListCell()
        selectListCell.setupViewData(viewData)
        selectListCell.selectionStyle = .none
        return selectListCell
    }
}
