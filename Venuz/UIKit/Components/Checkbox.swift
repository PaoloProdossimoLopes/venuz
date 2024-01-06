public protocol CheckboxDelegate: AnyObject {
    func checkboxChange(_ checkbox: Checkbox)
}

open class Checkbox: Card {
    public weak var delegate: CheckboxDelegate?
    
    private lazy var image = Image(.checkmark)
        .setTintColor(theme.token.color.foreground)
        .disableInteraction()
    
    private let feedback = UIImpactFeedbackGenerator(style: .soft)
    
    open override var isSelected: Bool {
        get { super.isSelected }
        set {
            setupState(isSelected: isSelected)
            super.isSelected = newValue
        }
    }
    
    public init(isChecked: Bool = false) {
        super.init()
        
        setupState(isSelected: isSelected)
        
        addSubview(image)
        
        image
            .constraintable
            .fillToParrent(edge: .equal(.sm))
        
        constraintable.equalSize(36)
        
        addTarget(self, action: #selector(checkboxTapActionHandler), for: .touchUpInside)
        
        feedback.prepare()
    }
    
    private func setupState(isSelected: Bool) {
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut) { [weak self] in
            isSelected ?
                self?.setupCheckedState() :
                self?.setupUncheckedState()
        }
    }
    
    private func setupCheckedState() {
        setBackgroundColor(theme.token.color.accent)
        image.isHidden = false
        image.alpha = 1
    }
    
    private func setupUncheckedState() {
        setBackgroundColor(theme.token.color.transparent)
        image.isHidden = true
        image.alpha = 0
    }
    
    @objc private func checkboxTapActionHandler() {
        feedback.impactOccurred()
        isSelected.toggle()
    }
}
