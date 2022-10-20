//
//  ViewController.swift
//  TextFieldSandbox
//
//  Created by Anca Arhip on 20.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension ViewController {
    func style() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "New password"
        textField.backgroundColor = .systemGray6
        textField.delegate = self
        
        // extra interaction
        textField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        
    }
    
    func layout() {
        view.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: textField.trailingAnchor, multiplier: 2),
        ])
    }
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    
    // return false to disallow editing
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    // become first responder
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    // return true to allow editing to stop and resign the first responder status
    // return false to disallow the editing session to end
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    // if implemented - extra validation?
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    
    // detect key press
    // return false to not change text
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let word = textField.text ?? ""
        let char = string
        print("Default - shouldChangeCharactersIn: \(word) \(char)")
        return true
    }
    
    //calledd when 'clear' button is pressed
    // return false to ignore
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
}

// MARK: - Actions
extension ViewController {
    @objc func textFieldEditingChanged(_ sender: UITextField) {
        print("Extra - editingChanged: \(sender.text)")
    }
}
