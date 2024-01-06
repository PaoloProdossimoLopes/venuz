open class AlertDialogViewController: ViewController {
    
    private lazy var closeImage = Image(.x)
        .addTapAction(target: self, action: #selector(closeButtonActionHandler))
        .setScaleAspecToFit()
    
    private lazy var titleLabel = Label(.xl)
    private lazy var descriptionLabel = Label(.md)
    private lazy var buttonsContainer = Stack.Horizontal(spacing: .md, UIView())

    private lazy var cardContainer = Card()
        .attach(
            Stack.Vertical(
                spacing: .sm,
                Stack.Horizontal(closeImage, UIView()),
                titleLabel,
                descriptionLabel
            )
        )
        .attach(buttonsContainer)
    
    public init(title: String, description: String) {
        super.init()
        titleLabel.setText(title)
        descriptionLabel.setText(description)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = theme.token.color.transparent.uiColor
        view.addSubview(cardContainer)
        
        cardContainer.constraintable
            .centerY(on: view)
            .anchorEqualLeading(atLeading: view, padding: .lg)
            .anchorEqualTrailing(atTrailing: view, padding: .lg)
        
        modalPresentationStyle = .overFullScreen
        
        cardContainer.alpha = 0
        cardContainer.isHidden = true
        
        view.alpha = 0
        view.isHidden = true
        
        cardContainer.transform = .init(scaleX: 0, y: 0)
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.3) {
            self.view.backgroundColor = self.theme.token.color.background.uiColor.withAlphaComponent(0.6)
        }
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.2) {
            self.view.alpha = 1
            self.view.isHidden = false
        }
        
        UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: 100, initialSpringVelocity: 0) {
            self.cardContainer.alpha = 1
            self.cardContainer.isHidden = false
            
            self.cardContainer.transform = .init(scaleX: 1, y: 1)
        }
    }
    
    @discardableResult
    public func setTitle(_ text: String) -> Self {
        titleLabel.setText(text)
        return self
    }
    
    @discardableResult
    public func setDescriptino(_ text: String) -> Self {
        descriptionLabel.setText(text)
        return self
    }
    
    @discardableResult
    public func addButton(_ btn: Button) -> Self {
        buttonsContainer.attach(btn)
        return self
    }
    
    @objc private func closeButtonActionHandler() {
        dismiss(animated: true)
    }
}
