import UIKit

open class Avatar: Card {
    public enum State {
        case loading
        case ready(UIImage)
        case unavailable(String)
    }
    
    private let loader = Loader(isLoading: false)
    private let placeholder = Label(.md)
    private let image = Image()
        .setScaleAspecToFill()
    
    public init(state: State = .loading) {
        super.init()
        setToClip()
       
        addSubview(image)
        addSubview(placeholder)
        addSubview(loader)
        
        image.constraintable.fill(on: self)
        placeholder.constraintable
            .centerX(on: self)
            .centerY(on: self)
        loader.constraintable.fill(on: self, edge: .equal(.md))
        
        setState(state)
        
        constraintable.equalSize(44)
    }
    
    @discardableResult
    public func setState(_ state: State) -> Self {
        UIView.animate(withDuration: 0.1) {
            switch state {
            case .loading:
                self.loader.startLoading()
                self.placeholder.isHidden = true
                self.placeholder.setText(String())
                self.image.removeImage()
            case .ready(let uIImage):
                self.loader.stopLoading()
                self.placeholder.isHidden = true
                self.placeholder.setText(String())
                self.image.setRaw(uIImage)
            case .unavailable(let placeholderText):
                self.loader.stopLoading()
                self.placeholder.isHidden = false
                self.placeholder.setText(placeholderText)
                self.image.removeImage()
            }
        }
        
        return self
    }
}
