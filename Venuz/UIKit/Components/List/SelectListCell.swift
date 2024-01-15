import UIKit

public final class SelectListCell: ReusableListCell {
    public struct ViewData {
        let taskCode: String
        let taskDescription: String
        
        public init(taskCode: String, taskDescription: String) {
            self.taskCode = taskCode
            self.taskDescription = taskDescription
        }
    }
    
    private lazy var taskCheckBox = Checkbox()
    private lazy var taskCode = Label(.lg)
    private lazy var taskDescription = Label(.sm)
    private lazy var detailImage = Image(.chevronRight)
        .setScaleAspecToFit()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setBackgroundColor(theme.token.color.transparent)
        
        let textStack = Stack.Vertical(taskCode, taskDescription)
        let containerStack = Stack.Horizontal(spacing: .sm, {
            let content = View()
            content.addSubview(taskCheckBox)
            taskCheckBox.constraintable
                .anchorEqualLeading(atLeading: content)
                .anchorEqualTrailing(atTrailing: content)
                .anchorEqualTop(atTop: content)
            return content
        }(), textStack, detailImage)
        
        contentView.addSubview(containerStack)
        
        detailImage.constraintable.maxWidth(10)
        containerStack.constraintable.fillToParrent(edge: .vertical(.sm))
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    @discardableResult
    public func setupViewData(_ viewData: ViewData) -> Self {
        taskCode.setText(viewData.taskCode)
        taskDescription.setText(viewData.taskDescription)
        
        return self
    }
}
