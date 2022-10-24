//
//  SecondViewController.swift
//  Navigation
//
//  Created by Anca Arhip on 23.10.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    let stackView = UIStackView()
    let label = UILabel()
    let button = UIButton()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        title = "Second"
        setTabBarImage(imageName: "globe", title: "Seccond")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        setup()
    }
}

extension SecondViewController {
    func style() {
        view.backgroundColor = .systemMint
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome Second"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Second", for: .normal)
    }
    
    func layout() {
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(button)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func setup() {
        button.addTarget(self, action: #selector(performTapAction), for: .primaryActionTriggered)
        button.addTarget(nil, action: .mainTapAction, for: .primaryActionTriggered)
    }
}

// MARK: - Actions
extension SecondViewController {
    @objc func performTapAction() {
        print("I got this")
    }
}

// MARK: - Sintactic sugar
extension Selector {
    static let mainTapAction = #selector(MainViewController.mainTapAction(sender:))
}
