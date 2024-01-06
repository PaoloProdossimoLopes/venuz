import UIKit
import Venuz

final class MainViewController: ViewController {
    
    private let avatar = Badge("atual")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(avatar)
        avatar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
        ])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            //self.avatar.setState(.unavailable("PP"))
            let alertDialog = AlertDialogViewController(
                title: "Are you sure?",
                description: "This action cannot be undone. This will permanetily delete your account and remove your data"
            )
            .addButton(
                Button.Outline()
                    .setText("cancel")
            )
            .addButton(
                Button.Filled()
                    .setText("continuar")
            )
            self.present(alertDialog, animated: true)
        }
    }
    
}
