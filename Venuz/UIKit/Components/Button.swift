open class Button: UIControl {
    
    public static func Filled(title: String = String()) -> Button {
        let color = Theme.shared.token.color
        let btn = Button(
            background: color.accent,
            backgroundMutted: color.muttedAccent,
            highlightBackground: color.highlightAccent,
            boarder: nil
        ).setText(title)
        return btn
    }
    
    public static func Outline(title: String = String()) -> Button {
        let color = Theme.shared.token.color
        let btn = Button(
            background: color.transparent,
            backgroundMutted: color.transparent,
            highlightBackground: color.highlightBackground,
            boarder: color.highlightBackground
        ).setText(title)
        return btn
    }

    private let background: RGBA
    private let backgroundMutted: RGBA
    private let highlightBackground: RGBA
    private let boarder: RGBA?

    private lazy var label = Label()
        .setFontSize(.lg)
        .setAlignment(.center)
    
    public var text: String {
        get { label.text ?? String() }
        set { label.text = newValue.lowercased() }
    }
    
    init(background: RGBA, backgroundMutted: RGBA, highlightBackground: RGBA, boarder: RGBA? = nil) {
        self.background = background
        self.backgroundMutted = backgroundMutted
        self.highlightBackground = highlightBackground
        self.boarder = boarder
        super.init(frame: .zero)
        
        setEnableState()
        layer.cornerRadius = Radius.sm.value
        
        enableViewCode()
        
        addSubview(label)
        
        label.constraintable
            .fill(on: self, edge: .axis(v: .sm, h: .md))
        
        constraintable
            .minWidth(120)
            .minHeight(40)
        
        addTarget(self, action: #selector(tapButtonActionHandler), for: .touchUpInside)
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }
    
    @discardableResult
    public func setText(_ text: String) -> Self {
        label.setText(text.lowercased())
        
        return self
    }
    
    @discardableResult
    public func setEnableState() -> Self {
        label.setVariant(.standard)
        backgroundColor = background.uiColor
        layer.borderColor = boarder?.uiColor.cgColor
        layer.borderWidth = boarderWidth()
        enableInteraction()
        
        return self
    }
    
    @discardableResult
    public func setDisableState() -> Self {
        label.setVariant(.mutted)
        backgroundColor = backgroundMutted.uiColor
        layer.borderColor = boarder?.uiColor.cgColor
        layer.borderWidth = boarderWidth()
        disableInteraction()
        
        return self
    }
    
    @objc private func tapButtonActionHandler() {
        UIView.animate(withDuration: 0.1, delay: 0, options: .transitionCrossDissolve) {
            self.backgroundColor = self.highlightBackground.uiColor
        }
        
        UIView.animate(withDuration: 0.1, delay: 0.1, options: .transitionCrossDissolve) {
            self.backgroundColor = self.background.uiColor
        }
    }
    
    private func boarderWidth() -> CGFloat {
        boarder != nil ? 1 : 0
    }
}

extension UIView {
    @discardableResult
    func addTapAction(target: Any?, action: Selector?) -> Self {
        let tapGesture = UITapGestureRecognizer(target: target, action: action)
        addGestureRecognizer(tapGesture)
        isUserInteractionEnabled = true
        
        return self
    }
}
