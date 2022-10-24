//
//  ViewController.swift
//  Navigation
//
//  Created by Anca Arhip on 23.10.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    let tabBarControler = UITabBarController()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        setup()
        present()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainViewController {
    func setup() {
        let homeVC = HomeViewController()
        let secondVC = SecondViewController()
        
        let homeNC = UINavigationController(rootViewController: homeVC)
        let secondNC = UINavigationController(rootViewController: secondVC)
        
        self.tabBarControler.viewControllers = [homeNC, secondNC]
        
        tabBarControler.tabBar.tintColor = .systemCyan
        tabBarControler.tabBar.backgroundColor = .white
    }
    
    func present() {
        add(tabBarControler)
    }
}

// MARK: - Responder chain
extension MainViewController {
    @objc func mainTapAction(sender: UIButton) {
        print("Main got this")
        
        let existingChildren = children
        
        for child in existingChildren {
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
        
        tabBarControler.selectedIndex = 0
        add(tabBarControler)
    }
}
