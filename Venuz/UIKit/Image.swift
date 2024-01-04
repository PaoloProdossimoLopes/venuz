import UIKit

open class Image: UIImageView {
    
    private let theme = Theme.shared
    
    public convenience init(_ icon: Icon) {
        self.init()
        setIcon(icon)
    }
    
    public convenience init(_ img: Img) {
        self.init()
        setImg(img)
    }
    
    public init() {
        super.init(frame: .zero)
        tintColor = theme.token.color.foreground.uiColor
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }
    
    @discardableResult
    public func setIcon(_ icon: Icon) -> Self {
        image = icon.img
        return self
    }
    
    @discardableResult
    public func setImg(_ img: Img) -> Self {
        image = img.value
        return self
    }
    
    @discardableResult
    public func setRaw(_ raw: UIImage) -> Self {
        image = raw
        return self
    }
    
    @discardableResult
    public func removeImage() -> Self {
        image = nil
        return self
    }
    
    @discardableResult
    public func setScaleAspecToFit() -> Self {
        contentMode = .scaleAspectFit
        return self
    }
    
    @discardableResult
    public func setScaleAspecToFill() -> Self {
        contentMode = .scaleAspectFill
        return self
    }
}
