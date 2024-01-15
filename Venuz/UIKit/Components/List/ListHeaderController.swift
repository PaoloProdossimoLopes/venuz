public protocol ListHeaderController {
    func list(_ list: List, createListHeaderAtSection section: Int) -> ListHeader?
    func list(_ list: List, heightForHeaderInSection section: Int) -> CGFloat
}

public extension ListHeaderController {
    func list(_ list: List, heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }
}
