import UIKit
import Venuz

final class MainViewController: ViewController {
    
    private let avatar = Progressbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(avatar)
        avatar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            avatar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            avatar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.avatar.setProgress(20)
        }
    }
}
