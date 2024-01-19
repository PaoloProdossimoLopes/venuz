import Venuz

final class HomeViewController: ViewController {
    
    private let viewModel = HomeViewModel()
    
    private lazy var titleLabel = Label(.xxl)
        .setText(viewModel.title)
    
    private lazy var descriptionLabel = Label(.lg)
        .setText(viewModel.description)
        .setVariant(.mutted)
    
    private lazy var examplesButton = Button.Filled(title: viewModel.filledButtonTitle)
        .setRadius(.md)
        .setTarget(self, action: #selector(navigateToExample))
    
    private lazy var documentationsButton = Button.Outline(title: viewModel.outlineButtonTitle)
        .setRadius(.md)
        .setTarget(self, action: #selector(navigateToDocumentation))
    
    private lazy var containerStack = Stack.Vertical(
        spacing: .lg,
        Stack.Vertical(spacing: .md, titleLabel, descriptionLabel),
        View(),
        examplesButton,
        documentationsButton
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureContraints()
    }
    
    private func configureHierarchy() {
        view.addSubview(containerStack)
    }
    
    private func configureContraints() {
        examplesButton.constraintable
            .height(Metric.buttonHeight)
        
        documentationsButton.constraintable
            .height(Metric.buttonHeight)
        
        containerStack.constraintable
            .fillToSafeParrent(edge: .horizontal(.md))
    }
    
    @objc private func navigateToDocumentation() {
        let documentationViewController = DocumentationViewController()
        documentationViewController.title = viewModel.outlineButtonTitle.capitalized
        navigationController?.pushViewController(documentationViewController, animated: true)
    }
    
    @objc private func navigateToExample() {
        let exampleViewController = ExamplesViewController()
        exampleViewController.title = viewModel.filledButtonTitle.capitalized
        navigationController?.pushViewController(exampleViewController, animated: true)
    }
    
    private enum Metric {
        static let buttonHeight = CGFloat(55)
    }
}
