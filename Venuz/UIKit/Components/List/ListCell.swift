import UIKit

open class ListCell: UITableViewCell, Reusable {
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setBackgroundColor(theme.token.color.transparent)
    }
    
    
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }
}
