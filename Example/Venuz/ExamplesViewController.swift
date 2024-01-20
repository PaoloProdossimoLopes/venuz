import Venuz

final class ExamplesViewController: ViewController {
    private lazy var list = List()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(list)
        list.constraintable.fillSafe(on: view, edge: .horizontal(.md))
        
        list.addListSection(ListSection(
            headerController: NoListHeaderController(),
            cellsControllers: [
                SimpleListCellController(title: "Email") { [weak self] _ in
                    guard let self else { return }
                    self.openMail()
                },
                SimpleListCellController(title: "Portal"),
                SimpleListCellController(title: "Tarefas"),
                SimpleListCellController(title: "Configurações"),
                SimpleListCellController(title: "Autenticação"),
            ]
        ))
    }
    
    @objc private func openMail() {
        let mailViewController = MailViewController()
        navigationController?.pushViewController(mailViewController, animated: true)
    }
}

struct MailViewModel {
    let mails = [
        Mail(
            sender: "Ava Taylor",
            subject: "Re: Meeting Agenda",
            content: """
            Here's the agenda for our meeting next week. I've included all the topics we need to cover, as well as time allocations for each.

            If you have any additional items to discuss or any specific points to address, please let me know, and we can integrate them into the agenda.

            It's essential that our meeting is productive and addresses all relevant matters.

            Looking forward to our meeting! Ava
            """,
            date: Calendar.current.date(byAdding: .day, value: 18, to: Date())!
        ),
        Mail(
            sender: "William Smith",
            subject: "Meeting Tomorrow",
            content: """
            Hi, let's have a meeting tomorrow to discuss the project. I've been reviewing the project details and have some ideas I'd like to share. It's crucial that we align on our next steps to ensure the project's success.

            Please come prepared with any questions or insights you may have. Looking forward to our meeting!

            Best regards, William
            """,
            date: Calendar.current.date(byAdding: .month, value: -1, to: Date())!
        ),
        Mail(
            sender: "William Smith",
            subject: "Meeting Tomorrow",
            content: """
            Hi, let's have a meeting tomorrow to discuss the project. I've been reviewing the project details and have some ideas I'd like to share. It's crucial that we align on our next steps to ensure the project's success.

            Please come prepared with any questions or insights you may have. Looking forward to our meeting!

            Best regards, William
            """,
            date: Calendar.current.date(byAdding: .month, value: -3, to: Date())!
        ),
        Mail(
            sender: "Alice Smith",
            subject: "Re: Project Update",
            content: """
            Thank you for the project update. It looks great! I've gone through the report, and the progress is impressive. The team has done a fantastic job, and I appreciate the hard work everyone has put in.

            I have a few minor suggestions that I'll include in the attached document.

            Let's discuss these during our next meeting. Keep up the excellent work!

            Best regards, Alice
            """,
            date: Calendar.current.date(byAdding: .month, value: -5, to: Date())!
        ),
        Mail(
            sender: "Emily Davis",
            subject: "Re: Question about Budget",
            content: """
            I have a question about the budget for the upcoming project. It seems like there's a discrepancy in the allocation of resources.

            I've reviewed the budget report and identified a few areas where we might be able to optimize our spending without compromising the project's quality.

            I've attached a detailed analysis for your reference. Let's discuss this further in our next meeting.

            Thanks, Emily
            """,
            date: Calendar.current.date(byAdding: .month, value: -8, to: Date())!
        ),
        Mail(
            sender: "Michael Wilson",
            subject: "Important Announcement",
            content: """
            I have an important announcement to make during our team meeting. It pertains to a strategic shift in our approach to the upcoming product launch. We've received valuable feedback from our beta testers, and I believe it's time to make some adjustments to better meet our customers' needs.

            This change is crucial to our success, and I look forward to discussing it with the team. Please be prepared to share your insights during the meeting.

            Regards, Michael
            """,
            date: Calendar.current.date(byAdding: .month, value: -10, to: Date())!
        ),
        Mail(
            sender: "William Anderson",
            subject: "Product Launch Update",
            content: """
            The product launch is on track. I'll provide an update during our call. We've made substantial progress in the development and marketing of our new product.

            I'm excited to share the latest updates with you during our upcoming call. It's crucial that we coordinate our efforts to ensure a successful launch. Please come prepared with any questions or insights you may have.

            Let's make this product launch a resounding success!

            Best regards, William
            """,
            date: Calendar.current.date(byAdding: .month, value: -12, to: Date())!
        )
    ]
    
    var mailViewData: [MailViewData] {
        mails.map {
            let formatter = RelativeDateTimeFormatter()
            formatter.unitsStyle = .full
            let relativeTime = formatter.localizedString(for: $0.date, relativeTo: Date())
            return MailViewData(
                sender: $0.sender,
                subject: $0.subject,
                content: $0.content,
                relativeTime: relativeTime
            )
        }
    }
}

struct MailViewData {
    let sender: String
    let subject: String
    let content: String
    let relativeTime: String
}

struct Mail {
    let sender: String
    let subject: String
    let content: String
    let date: Date
}

final class MailViewController: ViewController {
    
    private let viewModel = MailViewModel()
    
    private lazy var searchBar = Input()
        .setPlaceholder("Busque ...")
        .setLeftIcon(.magnifyingglass)
        .setDelegate(self)
    
    private lazy var mailList = List()
        .disableScroll()
    
    private lazy var containerStackView = Stack.Vertical(spacing: .md)
        .attach(searchBar)
        .attach(mailList)
    
    private lazy var mailScroll = Scroll()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Email"
        
        navigationController?.hidesBarsOnSwipe = true
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(mailScroll)
        mailScroll.constraintable
            .fill(on: view, edge: .horizontal(.md))
        
        mailScroll.addSubview(containerStackView)
        containerStackView.constraintable
            .fill(on: mailScroll)
            .height(mailScroll)
            .width(mailScroll)
        
        mailList.addListSection(ListSection(
            headerController: NoListHeaderController(),
            cellsControllers: viewModel.mailViewData.map {
                MailCellController(viewData: MailCell.ViewData(
                    sender: $0.sender,
                    subject: $0.subject,
                    content: $0.content,
                    relativeTime: $0.relativeTime
                ))
            }
        ))
    }
}

extension MailViewController: InputDelegate {
    func inputReturn(_ input: Input) {
        UIView.animate(withDuration: 1) {
            let text = input.getText()
            if text.isEmpty {
                self.mailList.replaceListSections([ListSection(
                    headerController: NoListHeaderController(),
                    cellsControllers: self.viewModel.mailViewData.map {
                        MailCellController(viewData: MailCell.ViewData(
                            sender: $0.sender,
                            subject: $0.subject,
                            content: $0.content,
                            relativeTime: $0.relativeTime
                        ))
                    }
                )])
                return
            }
            
            self.mailList.replaceListSections([ListSection(
                headerController: NoListHeaderController(),
                cellsControllers: self.viewModel.mailViewData
                    .filter {
                        $0.content.contains(text) ||
                        $0.sender.contains(text) ||
                        $0.subject.contains(text)
                    }
                    .map {
                    MailCellController(viewData: MailCell.ViewData(
                        sender: $0.sender,
                        subject: $0.subject,
                        content: $0.content,
                        relativeTime: $0.relativeTime
                    ))
                }
            )])
        }
    }
}

final class MailCell: SetupableViewDataCell {
    struct ViewData { 
        let sender: String
        let subject: String
        let content: String
        let relativeTime: String
    }
    
    private lazy var cardContainer = Card()
    
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

typealias MailCellController = GenericListCellController<MailCell>
