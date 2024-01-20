import Venuz

final class MailViewController: ViewController {
    
    private let viewModel = MailViewModel()
    
    private lazy var searchBar = Input()
        .setPlaceholder("Busque ...")
        .setLeftIcon(.magnifyingglass)
        .setDelegate(self)
    
    private lazy var mailList = List()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Email"
        
        view.addSubview(searchBar)
        searchBar.constraintable
            .anchorEqualTop(atSafeTop: view)
            .anchorEqualLeading(atLeading: view, padding: .md)
            .anchorEqualTrailing(atTrailing: view, padding: .md)
        
        view.addSubview(mailList)
        mailList.constraintable
            .anchorEqualTop(atBottom: searchBar, padding: .md)
            .anchorEqualLeading(atLeading: view, padding: .md)
            .anchorEqualTrailing(atTrailing: view, padding: .md)
            .anchorEqualBottom(atBottom: view, padding: .md)
        
        reloadWithDefault()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func reloadWithDefault() {
        mailList.addListSection(ListSection(
            headerController: NoListHeaderController(),
            cellsControllers: viewModel.mailViewData.map { viewData in
                MailCellController(viewData: MailCell.ViewData(
                    sender: viewData.sender,
                    subject: viewData.subject,
                    content: viewData.content,
                    relativeTime: viewData.relativeTime
                )) { _ in self.showEmail(viewData: viewData) }
            }
        ))
    }
    
    private func showEmail(viewData: MailViewData) {
        let mailDetailViewController = MailDetailViewController(viewData: viewData)
        navigationController?.pushViewController(mailDetailViewController, animated: true)
    }
}

extension MailViewController: InputDelegate {
    private func filterWithTextContaing(text: String) -> ((MailViewData) -> Bool) {
        return { viewData in
            viewData.content.lowercased().contains(text) ||
            viewData.sender.lowercased().contains(text) ||
            viewData.subject.lowercased().contains(text)
        }
    }
    
    private func mapMailViewData(_ viewData: MailViewData) -> MailCellController {
        MailCellController(viewData: MailCell.ViewData(
            sender: viewData.sender,
            subject: viewData.subject,
            content: viewData.content,
            relativeTime: viewData.relativeTime
        ))
    }
    
    func inputReturn(_ input: Input) {
        let text = input.getText().lowercased()
        if text.isEmpty {
            return reloadWithDefault()
        }
        
        mailList.replaceListSections([ListSection(
            headerController: NoListHeaderController(),
            cellsControllers: viewModel.mailViewData
                .filter(filterWithTextContaing(text: text))
                .map(mapMailViewData)
        )])
    }
}

final class MailDetailViewController: ViewController {
    
    private let viewData: MailViewData
    
    private lazy var senderAvatar = Avatar()
        .setState(.unavailable(String(viewData.sender.first!)))
    
    private lazy var senderLabel = Label(.lg)
        .setText(viewData.sender)
    
    private lazy var dateLabel = Label(.sm)
        .setText(viewData.relativeTime)
    
    private lazy var subjectLabel = Label(.md)
        .setText(viewData.subject)
    
    private lazy var topDivider = Divider()
    
    private lazy var contentLabel = Label(.sm)
        .setText(viewData.content)
    
    private lazy var bottomDivider = Divider()
    
    private lazy var messageTextAre = TextArea()
    
    private lazy var sendButton = Button.Filled(title: "enviar")
    
    private lazy var containerStack = Stack.Vertical(spacing: .md)
    
    init(viewData: MailViewData) {
        self.viewData = viewData
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = viewData.sender
        
        view.addSubview(containerStack)
        containerStack.constraintable.fillSafe(on: view, edge: .horizontal(.md))
        
        containerStack.attach(
            Stack.Horizontal(
                spacing: .sm,
                senderAvatar,
                Stack.Vertical(
                    subjectLabel,
                    dateLabel
                )
            )
        )
        
        containerStack.attach(topDivider)
        containerStack.attach(contentLabel)
        containerStack.attach(View())
        containerStack.attach(bottomDivider)
        containerStack.attach(messageTextAre)
        containerStack.attach(Stack.Horizontal(View(), sendButton))
        
        addKeyboardBehaviour()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}
