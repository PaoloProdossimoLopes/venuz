import UIKit

open class Loader: Image {
    public var isLoading: Bool {
        didSet { choseState(isLoading: isLoading) }
    }
    
    public init(isLoading: Bool = true) {
        self.isLoading = isLoading
        super.init()
        
        setImg(.loader)
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

