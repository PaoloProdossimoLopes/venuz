import Venuz

final class MainViewController: ViewController {
    
    private lazy var avatarImage = Avatar()
    
    private lazy var nameLabel = Label(.md)
        .setText("Paolo P. Lopes")
    
    private lazy var wellcomeLabel = Label(.xxl)
        .setText("Bem vindo")
    
    private lazy var wellcomeDescriptionLabel = Label(.lg)
        .setText("Gerencia suas tarefas de forma facil e pratica.")
        .setVariant(.mutted)
    
    private lazy var newFeaturesAvaliableAlert = Alert(
        title: "Funcionalidades novas estao chegando...",
        description: "Temos novos componentes como Switch e Checkbox"
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let container = Stack.Vertical(
            Stack.Horizontal(avatarImage, nameLabel)
                .setSpacing(.md),
            
            Stack.Vertical(wellcomeLabel, wellcomeDescriptionLabel)
                .setSpacing(.sm),
            
            newFeaturesAvaliableAlert,
            
            View()
        )
            .setSpacing(.md)
        view.addSubview(container)
        
        container.constraintable
            .fillSafe(on: view, edge: .horizontal(.xl))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if Bool.random() {
                self.avatarImage.setState(.unavailable("P"))
            } else {
                self.avatarImage.setState(.ready(UIImage(named: "AppIcon")!))
            }
        }
    }
}
