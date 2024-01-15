import Venuz

final class MainViewController: ViewController {
    
    private lazy var avatarImage = Avatar()
    
    private lazy var nameLabel = Label(.md)
        .setText("Jhon doe")
    
    private lazy var wellcomeLabel = Label(.xxl)
        .setText("Bem vindo")
    
    private lazy var wellcomeDescriptionLabel = Label(.lg)
        .setText("Gerencia suas tarefas de forma facil e pratica.")
        .setVariant(.mutted)
    
    private lazy var newFeaturesAvaliableAlert = Alert(
        title: "Funcionalidades novas estao chegando...",
        description: "Temos novos componentes como Switch e Checkbox"
    )
    
    private lazy var taskListTitle = Label(.lg)
        .setText("Tarefas")
    
    private lazy var taskList = List()
        .disableScroll()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let container = Stack.Vertical(
            spacing: .lg, 
            Stack.Horizontal(avatarImage, nameLabel)
                .setSpacing(.md),
            
            Stack.Vertical(wellcomeLabel, wellcomeDescriptionLabel)
                .setSpacing(.sm),
            
            newFeaturesAvaliableAlert,
            
            Stack.Vertical(taskListTitle, taskList)
                .setSpacing(.none)
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
            
            self.taskList.addListSection(ListSection(
                headerController: NoListHeaderController(),
                cellsControllers: [
                    SelectListCellController(viewData: SelectListCell.ViewData(
                        taskCode: "TASK-8782",
                        taskDescription: "You can't compress the program without quantifying the open-source SSD pi"
                    )),
                    SelectListCellController(viewData: SelectListCell.ViewData(
                        taskCode: "TASK-7878",
                        taskDescription: "Try to calculate the EXE feed, maybe it will index the multi-byte pixel!"
                    )),
                    SelectListCellController(viewData: SelectListCell.ViewData(
                        taskCode: "TASK-7839",
                        taskDescription: "We need to bypass the neural TCP card!"
                    )),
                ]
            ))
        }
    }
}
