import UIKit

public typealias SimpleListCellController = GenericListCellController<SimpleListCell>

public extension SimpleListCellController {
    convenience init(title: String, didTap: BindWith<List>? = nil) {
        let simpleListCellViewData = SimpleListCell.ViewData(title: title)
        self.init(viewData: simpleListCellViewData, didTap: didTap)
    }
}

public protocol ViewDatable {
    associatedtype ViewData
    func setup(viewData: ViewData)
}

public typealias SetupableViewDataCell = ListCell & ViewDatable

public typealias BindWith<T> = (T) -> Void

open class GenericListCellController<Cell: SetupableViewDataCell>: ListCellController {
    
    private let viewData: Cell.ViewData
    private let didTap: BindWith<List>?
    
    public init(viewData: Cell.ViewData, didTap: BindWith<List>? = nil) {
        self.viewData = viewData
        self.didTap = didTap
    }
    
    public func list(_ list: List, createListCellAtIndexPath indexPath: IndexPath) -> ListCell {
        let simpleListCell = list.reuse(Cell.self, at: indexPath)
        simpleListCell.setup(viewData: viewData)
        simpleListCell.selectionStyle = .none
        return simpleListCell
    }
    
    public func list(_ list: List, didSelectRowAt indexPath: IndexPath) {
        didTap?(list)
    }
}
