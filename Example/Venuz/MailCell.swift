import Venuz

typealias MailCellController = GenericListCellController<MailCell>

final class MailCell: SetupableViewDataCell {
    struct ViewData {
        let sender: String
        let subject: String
        let content: String
        let relativeTime: String
    }
    
    private lazy var cardContainer = Card()
        .disableInteraction()
    
    private lazy var senderLabel = Label(.lg)
    
    private lazy var subjectLabel = Label(.md)
    
    private lazy var contentLabel = Label(.sm)
        .setVariant(.mutted)
        .setMaxLines(3)
    
    private lazy var relativeTimeLabel = Label(.sm)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cardContainer)
        cardContainer.constraintable
            .fill(on: contentView, edge: .bottom(.md))
        
        cardContainer.attach(Stack.Horizontal(senderLabel, View(), relativeTimeLabel))
        cardContainer.attach(subjectLabel)
        cardContainer.attach(contentLabel)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    func setup(viewData: ViewData) {
        senderLabel.setText(viewData.sender)
        subjectLabel.setText(viewData.subject)
        contentLabel.setText(viewData.content)
        relativeTimeLabel.setText(viewData.relativeTime)
    }
}

