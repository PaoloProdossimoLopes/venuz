import Foundation

extension Radius {
    var value: CGFloat {
        switch self {
        case .sm:
            return 4
        case .md:
            return 8
        case .full:
            return 9999
        }
    }
}
