public final class NoListHeaderController: ListHeaderController {
    public init() { }
    
    public func list(_ list: List, createListHeaderAtSection section: Int) -> ListHeader? {
        nil
    }
    
    public func list(_ list: List, heightForHeaderInSection section: Int) -> CGFloat {
        0
    }
}
