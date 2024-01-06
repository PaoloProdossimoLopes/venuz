open class ViewController: UIViewController {
    public init() {
        super.init(nibName: nil, bundle: nil)
        
        view.backgroundColor = theme.token.color.background.uiColor
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) { nil }
}
