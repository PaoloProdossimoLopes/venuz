import Foundation

public extension NSObject {
    typealias WeakfyBlock<T> = ((T) -> Void)
    func weakfy<P>(_ function: @escaping WeakfyBlock<P>) -> WeakfyBlock<P> {
        return { [weak self] param in
            guard self != nil else { return }
            return function(param)
        }
    }
}
