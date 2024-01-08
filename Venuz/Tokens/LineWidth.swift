import Foundation

@frozen public enum LineWidth: CGFloat {
    case xs = 1
    case sm = 1.5
    case md = 2
    case lg = 3
    
    var value: CGFloat {
        rawValue
    }
}
