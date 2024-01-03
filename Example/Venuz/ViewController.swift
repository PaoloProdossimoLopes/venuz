import UIKit
import Venuz

final class MainViewController: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let c = Card(
            Alert()
                .setTitle("Head's up!")
                .setDescription("You can add your description")
        )
        
        c.attach(UIView())
        
        view.addSubview(c)
        NSLayoutConstraint.activate([
            c.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            c.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            c.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            c.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
        ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
