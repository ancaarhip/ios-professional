//
//  ViewController.swift
//  Bankey
//
//  Created by Anca Arhip on 14.10.2022.
//

import UIKit

protocol LogoutDelegate: AnyObject {
    func didLogout()
}

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}

class LoginViewController: UIViewController {
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    weak var delegate: LoginViewControllerDelegate?
    
    var userName: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    // animation
    var edgeOnScreen: CGFloat = 16
    var edgeOffScreen: CGFloat = -1000
    var titleLeadingAnchor: NSLayoutConstraint?
    
    var subtitleLeadingAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        style()
        layout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false
    }

}

extension LoginViewController {
    private func style() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.text = "Bankey"
        titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.alpha = 0
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textAlignment = .center
        subtitleLabel.text = "Your premium source for all things banking!"
        subtitleLabel.numberOfLines = 0
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.alpha = 0
        
        //???
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign in", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.text = "Username / password cannot be blank"
        errorMessageLabel.isHidden = true
    }
    
    private func layout() {
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        // Title label
        NSLayoutConstraint.activate([
            titleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
        titleLeadingAnchor = titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: edgeOffScreen)
        titleLeadingAnchor?.isActive = true
            
        // Subtitle
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3),
            subtitleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
        subtitleLeadingAnchor = subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: edgeOffScreen)
        subtitleLeadingAnchor?.isActive = true

        // LoginView
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subtitleLabel.bottomAnchor, multiplier: 3),
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        // SignInButton
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // ErrorMessageLabel
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor)
        ])


    }
}

// Mark: - Actions
extension LoginViewController {
    @objc func signInTapped() {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = userName, let password = password else {
            assertionFailure("Username / password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage:"Username / password cannot be blank")
            return
        }
        
        if username == "Kevin" && password == "welcome" {
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        } else {
            configureView(withMessage: "Incorrect user / password")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
        shakeButton()
    }
    
    private func shakeButton() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, 0]
        animation.keyTimes = [0, 0.15, 0.5, 0.83, 1]
        animation.duration = 0.4
        
        animation.isAdditive = true
        signInButton.layer.add(animation, forKey: "shake")
    }
}

extension LoginViewController {
    func animate() {
        let animator = UIViewPropertyAnimator(duration: 1, curve: .easeInOut) {
            self.titleLeadingAnchor?.constant = self.edgeOnScreen
            self.view.layoutIfNeeded()
        }
        animator.startAnimation()
        
        let animator2 = UIViewPropertyAnimator(duration: 2, curve: .easeInOut) {
            self.subtitleLeadingAnchor?.constant = self.edgeOnScreen
            self.view.layoutIfNeeded()
        }
        animator2.startAnimation()
        
        let animator3 = UIViewPropertyAnimator(duration: 2, curve: .easeInOut) {
            self.titleLabel.alpha = 1
            self.subtitleLabel.alpha = 1
            self.view.layoutIfNeeded()
        }
        animator3.startAnimation(afterDelay: 0.5)
    }
}

