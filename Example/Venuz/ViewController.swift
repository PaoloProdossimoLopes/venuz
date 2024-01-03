import UIKit
import Venuz

final class MainViewController: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let c = Card()
        
        FontSize.allCases.forEach { size in
            c.attach(
                Label(size)
                    .setText("Label (\(size))")
                    .setVariant(.standard)
            )
        }
        
        FontSize.allCases.forEach { size in
            c.attach(
                Label(size)
                    .setText("Label (\(size))")
                    .setVariant(.mutted)
            )
        }
        
        c.attach(
            Card(
                Button.Filled()
                    .setText("FillButton")
                    .setEnableState(),
                Button.Filled()
                    .setText("FillButton")
                    .setDisableState(),
                Button.Outline()
                    .setText("OutlineButton")
                    .setEnableState(),
                Button.Outline()
                    .setText("OutlineButton")
                    .setDisableState()
            )
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
