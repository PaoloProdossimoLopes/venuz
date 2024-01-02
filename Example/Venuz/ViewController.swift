//
//  ViewController.swift
//  Venuz
//
//  Created by PaoloProdossimoLopes on 01/02/2024.
//  Copyright (c) 2024 PaoloProdossimoLopes. All rights reserved.
//

import UIKit
import Venuz

final class ViewController: Controller {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let s = UIStackView ()
        s.axis = .vertical
        s.spacing = 10
        s.translatesAutoresizingMaskIntoConstraints = false
        
        FontSizeToken.allCases.forEach { size in
            let l = Label()
            l.text = "Label (\(size))"
            l.setFontSize(size)
            s.addArrangedSubview(l)
        }
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
