import Foundation

extension CGRect {
    func inset(padding spacing: Edge) -> Self {
        inset(by: spacing.insets)
    }
}
