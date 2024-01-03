import Foundation

extension Spacing {
    var value: CGFloat {
        switch self {
        case .xs:
            return 4
        case .sm:
            return 8
        case .md:
            return 12
        case .lg:
            return 18
        case .xl:
            return 22
        }
    }
}
