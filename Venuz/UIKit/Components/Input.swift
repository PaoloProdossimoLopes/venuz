public protocol InputDelegate: AnyObject {
    func inputReturn(_ input: Input)
}

open class Input: Card {
    
    weak var delegate: InputDelegate?
    
    private lazy var leftImage = Image()
        .setTintColor(theme.token.color.foreground)
        .setScaleAspecToFit()
    
    private lazy var input = TextField()
    
    private lazy var rightImage = Image(.xFilled)
        .setTintColor(theme.token.color.foreground)
        .setScaleAspecToFit()
        .addTapAction(target: self, action: #selector(rightButtonActionHandler))
    
    public init(text: String = String(), placeholder: String = String()) {
        super.init()
        attach(leftImage)
        attach(input)
        attach(rightImage)
        
        setText(text)
        setUnfocusBoarder()
        setRadius(.md)
        setPlaceholder(placeholder)
        
        input.tintColor = theme.token.color.foreground.uiColor
        input.textColor = theme.token.color.foreground.uiColor
        input.keyboardType = .default
        input.returnKeyType = .done
        input.delegate = self
        
        configureRightImage()
        input.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
        
        constraintable.minHeight(44)
    }
    
    private func configureRightImage() {
        hideRightButton()
        input.rightView = rightImage
        input.rightViewMode = .always
        rightImage.constraintable.width(44)
    }
    
    private func configureLeadingImage(icon: Icon) {
        leftImage.setIcon(icon)
        leftImage.constraintable.width(44)
        
        input.leftView = leftImage
        input.leftViewMode = .always
        
        layoutIfNeeded()
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) { nil }
    
    @discardableResult
    public func setPlaceholder(_ newPlaceholder: String) -> Self {
        input.placeholder = newPlaceholder
        input.attributedPlaceholder = NSAttributedString(string: newPlaceholder, attributes: [
            .foregroundColor: theme.token.color.muttedForeground.uiColor,
            .font: UIFont.preferredFont(forTextStyle: .body),
        ])
        
        return self
    }
    
    @discardableResult
    public func setDelegate(_ delegate: InputDelegate) -> Self {
        self.delegate = delegate
        
        return self
    }
    
    @discardableResult
    public func setText(_ newText: String) -> Self {
        input.text = newText
        
        return self
    }
    
    @discardableResult
    public func setLeftIcon(_ icon: Icon) -> Self {
        configureLeadingImage(icon: icon)
        
        return self
    }
    
    public func getText() -> String {
        input.text ?? String()
    }
    
    @objc private func rightButtonActionHandler() {
        input.text = String()
        hideRightButton()
    }
    
    @objc private func textFieldChange(textField: UITextField) {
        guard let text = textField.text else { return }
        text.isEmpty ? hideRightButton() : showRightButton()
    }
    
    private func setFocusBoarder() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn) {
            self.setInputBoarderColor(self.theme.token.color.foreground)
        }
    }
    
    private func setUnfocusBoarder() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut) {
            self.setInputBoarderColor(self.theme.token.color.highlightBackground)
        }
    }
    
    private func setInputBoarderColor(_ rgba: RGBA) {
        setBoader(rgba, lineWidth: .md)
    }
    
    private func showRightButton() {
        guard let text = input.text, !text.isEmpty, rightImage.isHidden else { return }

        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn) {
            self.rightImage.setVisible()
        }
    }
    
    private func hideRightButton() {
        guard !rightImage.isHidden else { return }
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut) {
            self.rightImage.setInvisible()
        }
    }
}

extension Input: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        setFocusBoarder()
        showRightButton()
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        setUnfocusBoarder()
        hideRightButton()
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        delegate?.inputReturn(self)
        return true
    }
}

open class TextField: UITextField { }
