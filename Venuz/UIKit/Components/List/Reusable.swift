public protocol Reusable {
    static var identifier: String { get }
}

public extension Reusable {
    static var identifier: String {
        String(describing: self)
    }
}
