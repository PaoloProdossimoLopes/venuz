import UIKit
import Venuz

final class MainViewController: ViewController {
    
    private let avatar = Switch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(avatar)
        avatar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            avatar.widthAnchor.constraint(equalToConstant: 120)
        ])
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.avatar.setProgress(20)
//        }
    }
}
