import Venuz

final class HomeViewController: ViewController {
    
    private lazy var titleLabel = Label(.xxl)
        .setText("Desenvolva suas interfaces com Venuz")
    
    private lazy var descriptionLabel = Label(.lg)
        .setText("Design acessivel, customizavel e simples")
        .setVariant(.mutted)
    
    private lazy var list = List()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let containerStack = Stack.Vertical(
            spacing: .lg,
            Stack.Vertical(spacing: .md, titleLabel, descriptionLabel),
            list
        )
        view.addSubview(containerStack)
        containerStack.constraintable.fillToSafeParrent(edge: .horizontal(.md))
        
        list.addListSection(ListSection(
            headerController: NoListHeaderController(),
            cellsControllers: [
                SimpleListCellController(viewData: SimpleListCell.ViewData(title: "Documentação")),
                SimpleListCellController(viewData: SimpleListCell.ViewData(title: "Exemplos")),
            ]
        ))
    }
}
