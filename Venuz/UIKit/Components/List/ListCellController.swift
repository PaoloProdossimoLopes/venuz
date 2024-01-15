public protocol ListCellController {
    func list(_ list: List, createListCellAtIndexPath indexPath: IndexPath) -> ReusableListCell
    func list(_ list: List, didSelectRowAt indexPath: IndexPath)
}

public extension ListCellController {
    func list(_ list: List, didSelectRowAt indexPath: IndexPath) {
        list.deselectRow(at: indexPath, animated: true)
    }
}
