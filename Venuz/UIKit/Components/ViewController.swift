open class ViewController: UIViewController {
    
    private let navigationAppearance = UINavigationBarAppearance()
    
    private var color: ColorToken {
        theme.token.color
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) { nil }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = color.background.uiColor
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        defer {
            configureNavigationAppearance()
        }
        
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        configureNavigationBarColor()
        removeNavigationBarDivider()
        configureNavigationBarBackground()
        configureNavigationTitleStyle()
    }
    
    private func configureNavigationBarColor() {
        navigationController?.navigationBar.tintColor = color.accent.uiColor
    }
    
    private func configureNavigationAppearance() {
        navigationItem.standardAppearance = navigationAppearance
        navigationItem.scrollEdgeAppearance = navigationAppearance
    }
    
    private func removeNavigationBarDivider() {
        navigationAppearance.shadowImage = nil
        navigationAppearance.shadowColor = color.transparent.uiColor
    }
    
    private func configureNavigationTitleStyle() {
        let titleColor = color.foreground.uiColor
        navigationAppearance.titleTextAttributes = [.foregroundColor: titleColor]
        navigationAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor]
    }
    
    private func configureNavigationBarBackground() {
        navigationAppearance.backgroundColor = color.background.uiColor
    }
}
