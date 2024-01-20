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
