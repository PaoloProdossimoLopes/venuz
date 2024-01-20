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
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
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
    
    private func reloadWithDefault() {
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
