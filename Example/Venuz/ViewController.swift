import UIKit
import Venuz

final class MainViewController: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let s = UIStackView ()
        s.axis = .vertical
        s.spacing = 10
        s.translatesAutoresizingMaskIntoConstraints = false
        
        FontSize.allCases.forEach { size in
            s.addArrangedSubview(
                Label(size)
                    .setText("Label (\(size))")
                    .setVariant(.standard)
            )
        }
        
        FontSize.allCases.forEach { size in
            s.addArrangedSubview(
                Label(size)
                    .setText("Label (\(size))")
                    .setVariant(.mutted)
            )
        }
        
        s.addArrangedSubview(
            Button.Filled()
                .setText("FillButton")
                .setEnableState()
        )
        
        s.addArrangedSubview(
            Button.Filled()
                .setText("FillButton")
                .setDisableState()
        )
        
        s.addArrangedSubview(
            Button.Outline()
                .setText("OutlineButton")
                .setEnableState()
        )
        
        s.addArrangedSubview(
            Button.Outline()
                .setText("OutlineButton")
                .setDisableState()
        )
        
        s.addArrangedSubview(UIView())
        
        view.addSubview(s)
        NSLayoutConstraint.activate([
            s.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            s.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            s.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            s.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
        ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
