//
//  NextViewController.swift
//  Leak
//
//  Created by Anca Arhip on 22.10.2022.
//

import UIKit

class NextViewController: UIViewController {
    
    let label = UILabel()
    
    var viewComponent: ViewComponent!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewComponent = ViewComponent(parent: self)
        style()
        layout()
    }
}

extension NextViewController {
    func style() {
        self.view.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Leaking view controller"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 25)
        label.textColor = .darkGray
        label.numberOfLines = 0
    }
    
    func layout() {
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
