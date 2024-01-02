open class Controller: UIViewController {
    private let theme = Theme.shared
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        
        view.backgroundColor = theme.token.color.background.uiColor
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) { nil }
}
