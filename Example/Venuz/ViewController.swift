//
//  ViewController.swift
//  Venuz
//
//  Created by PaoloProdossimoLopes on 01/02/2024.
//  Copyright (c) 2024 PaoloProdossimoLopes. All rights reserved.
//

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
            let l = Label(size)
            l.text = "Label (\(size))"
            s.addArrangedSubview(l)
        }
        
        let btn = FillButton(frame: .zero)
        btn.text = "FillButton"
        btn.enable()
        s.addArrangedSubview(btn)
        
        
        
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
