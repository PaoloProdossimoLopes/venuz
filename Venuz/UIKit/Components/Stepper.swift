open class Stepper: View {
    private(set) var currentStep: Float
    private let totalSteps: Float
    
    private var percentage: Float {
        currentStep / totalSteps
    }
    
    private lazy var progress = Progressbar()
    
    private lazy var backImage = Image(.chevronLeft)
        .setScaleAspecToFit()
        .addTapAction(target: self, action: #selector(backActionButtonHandler))
        
    private lazy var nextImage = Image(.chevronRight)
        .setScaleAspecToFit()
        .addTapAction(target: self, action: #selector(nextActionButtonHandler))
    
    public init(initial: Int, total: Int) {
        self.currentStep = Float(initial)
        self.totalSteps = Float(total)
        super.init(frame: .zero)
        
        backImage.constraintable.equalSize(26)
        nextImage.constraintable.equalSize(26)
        progress.constraintable.height(10)
        
        addSubview(progress)
        addSubview(backImage)
        addSubview(nextImage)
        
        backImage.constraintable
            .anchorEqualTop(on: self)
            .anchorEqualLeading(atLeading: self)
            .anchorEqualBottom(on: self)
        
        progress.constraintable
            .centerY(on: self)
            .anchorEqualTrailing(atLeading: nextImage, padding: .md)
            .anchorEqualLeading(atTrailing: backImage, padding: .md)
        
        nextImage.constraintable
            .anchorEqualTop(on: self)
            .anchorEqualTrailing(atTrailing: self)
            .anchorEqualBottom(on: self)
                
        updateProgress()
    }
    
    @objc private func backActionButtonHandler() {
        if percentage > 0 {
            currentStep -= 1
            updateProgress()
        }
    }
    
    @objc private func nextActionButtonHandler() {
        if percentage < 1 {
            currentStep += 1
            updateProgress()
        }
    }
    
    private func updateProgress() {
        progress.setProgress(percentage)
    }
}
