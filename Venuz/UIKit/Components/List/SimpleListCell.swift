import UIKit

open class SimpleListCell: SetupableViewDataCell {
    public func setup(viewData: ViewData) {
        titleLabel.setText(viewData.title)
    }
    
    public struct ViewData {
        let title: String
        
        public init(title: String) {
            self.title = title
        }
    }
    
    private lazy var titleLabel = Label(.lg)
    
    private lazy var detailImage = Image(.chevronRight)
        .setScaleAspecToFit()
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let container = Stack.Vertical(
            Stack.Horizontal(titleLabel, detailImage),
            Divider()
        )
        addSubview(container)
        
        detailImage.constraintable.maxWidth(15)
        
        container.constraintable
            .fillToParrent()
            .minHeight(50)
    }
}
