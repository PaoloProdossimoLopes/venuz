import UIKit

open class Image: UIImageView {
    
    private let theme = Theme.shared
    
    public init(_ icon: Icon) {
        super.init(frame: .zero)
        
        setIcon(icon)
        tintColor = theme.token.color.foreground.uiColor
    }
    
    public init(_ img: Img) {
        super.init(frame: .zero)
        
        setImg(img)
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

@frozen public enum Img: String {
    case loader
}

extension Img {
    var value: UIImage {
        UIImage(named: rawValue, in: .venuz, compatibleWith: nil)!
    }
}

extension Bundle {
    static var venuz: Bundle {
        Bundle(for: Venuz.self)
    }
}

open class Loader: Image {
    public var isLoading: Bool {
        didSet { choseState(isLoading: isLoading) }
    }
    
    public init(isLoading: Bool = true) {
        self.isLoading = isLoading
        super.init(.loader)
        setScaleAspecToFit()
        
        choseState(isLoading: isLoading)
        
        constraintable
            .minWidth(20)
            .minHeight(20)
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }
    
    private func choseState(isLoading: Bool) {
        if isLoading {
            startLoading()
        } else {
            stopLoading()
        }
    }
    
    
    @discardableResult
    public func startLoading() -> Self {
        isHidden = false
        
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 1
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        layer.add(rotation, forKey: "rotationAnimation")
        
        return self
    }
    
    
    @discardableResult
    public func stopLoading() -> Self {
        isHidden = true
        
        layer.removeAllAnimations()
        
        return self
    }
}
