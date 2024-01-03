open class Alert: Card {
    
    private lazy var image = Image()
        .setIcon(.bubbleRightFill)
        .setScaleAspecToFit()
    
    private lazy var titleLabel = Label(.xl)
    
    private lazy var descriptinoLabel = Label(.md)
    
    public init(icon: Icon = .bubbleRight, title: String = String(), description: String = String()) {
        super.init()
        
        image.setIcon(icon)
        titleLabel.setText(title)
        descriptinoLabel.setText(description)
        
        let textContainer = Stack.Vertical(titleLabel, descriptinoLabel)
        let iconContainer = Stack.Vertical(image, UIView())
        let alertContainer = Stack.Horizontal(spacing: .md, iconContainer, textContainer)
        
        attach(alertContainer)
        
        image.constraintable.width(26)
        image.constraintable.height(26)
    }
    
    @discardableResult
    public func setTitle(_ title: String) -> Self {
        titleLabel.setText(title)
        
        return self
    }
    
    @discardableResult
    public func setDescription(_ description: String) -> Self {
        descriptinoLabel.setText(description)
        
        return self
    }
    
    @discardableResult
    public func setIcon(_ icon: Icon) -> Self {
        image.setIcon(icon)
        
        return self
    }
}
