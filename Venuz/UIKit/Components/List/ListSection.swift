public class ListSection {
    let headerController: ListHeaderController
    let cellsControllers: [ListCellController]
    
    public init(headerController: ListHeaderController, cellsControllers: [ListCellController]) {
        self.headerController = headerController
        self.cellsControllers = cellsControllers
    }
}
