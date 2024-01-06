import UIKit
import Venuz

final class MainViewController: ViewController {
    
    private let avatar = Checkbox()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(avatar)
        avatar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
        ])
    }
}
