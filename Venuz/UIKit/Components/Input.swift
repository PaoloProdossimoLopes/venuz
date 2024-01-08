open class Input: UITextField {
    private let padding = Edge.horizontal(.sm)
    
    private lazy var rightImage = Image(.xFilled)
        .setTintColor(theme.token.color.foreground)
        .setScaleAspecToFit()
        .addTapAction(target: self, action: #selector(rightButtonActionHandler))
    
    public init(text: String = String(), placeholder: String = String()) {
        super.init(frame: .zero)
        
        setText(text)
        setUnfocusBoarder()
        setRadius(.md)
        setPlaceholder(placeholder)
        tintColor = theme.token.color.foreground.uiColor
        textColor = theme.token.color.foreground.uiColor
        keyboardType = .default
        returnKeyType = .done
        delegate = self
        
        configureRightImage()
        addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
        
        constraintable.minHeight(44)
    }
    
    private func configureRightImage() {
        hideRightButton()
        rightView = rightImage
        rightViewMode = .always
        rightImage.constraintable.minWidth(44)
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) { nil }
    
    @discardableResult
    public func setPlaceholder(_ newPlaceholder: String) -> Self {
        placeholder = newPlaceholder
        attributedPlaceholder = NSAttributedString(string: newPlaceholder, attributes: [
            .foregroundColor: theme.token.color.muttedForeground.uiColor,
            .font: UIFont.preferredFont(forTextStyle: .body),
        ])
        
        return self
    }
    
    @discardableResult
    public func setText(_ newText: String) -> Self {
        text = newText
        
        return self
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(padding: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(padding: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(padding: padding)
    }
    
    @objc private func rightButtonActionHandler() {
        text = String()
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
        guard let text, !text.isEmpty, rightImage.isHidden else { return }
        
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
        return true
    }
}

extension CGRect {
    func inset(padding spacing: Edge) -> Self {
        inset(by: spacing.insets)
    }
}

extension Edge {
    var insets: UIEdgeInsets {
        UIEdgeInsets(
            top: top.value,
            left: leading.value,
            bottom: bottom.value,
            right: trailing.value
        )
    }
}
