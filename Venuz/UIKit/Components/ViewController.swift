open class ViewController: UIViewController {
    private lazy var endEditTapGesture = UITapGestureRecognizer(target: view, action: #selector(View.endEditing))
    
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
        
        endEditTapGesture.isEnabled = false
        view.addGestureRecognizer(endEditTapGesture)
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        defer {
            configureNavigationAppearance()
        }
        
        configureNavigationBar()
    }
    
    @discardableResult
    public func removeKeyboardBehaviour() -> Self {
        NotificationCenter.default.removeObserver(self)
        return self
    }
    
    @discardableResult
    public func addKeyboardBehaviour() -> Self {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        return self
    }
    
    @discardableResult
    public func disableKeyboardBehaviour() -> Self {
        endEditTapGesture.isEnabled = false
        return self
    }
    
    @discardableResult
    public func enableKeyboardBehaviour() -> Self {
        endEditTapGesture.isEnabled = true
        return self
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
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
        let keyboardHeight = (keyboardFrame as? NSValue)?.cgRectValue.height
        let viewAreInInitialPosition = view.frame.origin.y == 0
        guard let keyboardHeight, viewAreInInitialPosition else { return }
        
        view.frame.origin.y -= keyboardHeight
        enableKeyboardBehaviour()
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        guard view.frame.origin.y != 0 else { return }
        
        view.frame.origin.y = 0
        disableKeyboardBehaviour()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
