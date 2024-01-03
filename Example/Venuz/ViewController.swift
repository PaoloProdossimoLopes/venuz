import UIKit
import Venuz

final class MainViewController: ViewController {
    
    private lazy var c = Card(
        Alert()
            .setTitle("Head's up!")
            .setDescription("You can add your description")
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        c.attach(UIView())
        view.addSubview(c)
        c.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            c.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            c.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            c.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            c.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
        ])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
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
