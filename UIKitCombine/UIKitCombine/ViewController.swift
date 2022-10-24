//
//  ViewController.swift
//  UIKitCombine
//
//  Created by Anca Arhip on 22.10.2022.
//

import UIKit
import Combine

extension Notification.Name {
    static let newPost = Notification.Name("newPost")
}

struct Post {
    let title: String
}

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var newPostField: UITextField!
    @IBOutlet weak var publishButton: UIButton!
    @IBOutlet weak var subscribedLabel: UILabel!
    
    @IBOutlet weak var acceptSwitch: UISwitch!
    @IBOutlet weak var privacySwitch: UISwitch!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    // Published properties
    @Published private var acceptedTerms = false
    @Published private var acceptedPrivacy = false
    @Published private var name = ""
    
    private var validToSubmit: AnyPublisher<Bool, Never> {
        return Publishers.CombineLatest3($acceptedTerms, $acceptedPrivacy, $name)
            .map { terms, privacy, name in
                return terms && privacy && !name.isEmpty
            }
            .eraseToAnyPublisher()
    }
    
    private var buttonSubscriber: AnyCancellable?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Notification publisher
        let publisher = NotificationCenter.Publisher(center: .default, name: .newPost).map { (notification) -> String? in
            return (notification.object as? Post)?.title ?? ""
        }
        
        let subscriber = Subscribers.Assign(object: subscribedLabel, keyPath: \.text)
        
        publisher.subscribe(subscriber)
        
        // Published properties
        nameField.delegate = self
        acceptSwitch.isOn = false
        privacySwitch.isOn = false
        
        buttonSubscriber = validToSubmit
            .receive(on: RunLoop.main)
            .assign(to: \.isEnabled, on: submitButton)
        
    }

    @IBAction func publishButtonTapped(_ sender: Any) {
        let title = newPostField.text ?? "Comming soon"
        let post = Post(title: title)
        NotificationCenter.default.post(name: .newPost, object: post)
    }   
    
    @IBAction func acceptTerms(_ sender: UISwitch) {
        acceptedTerms = sender.isOn
    }
    
    @IBAction func acceptPrivacy(_ sender: UISwitch) {
        acceptedPrivacy = sender.isOn
    }
    
    @IBAction func nameChanged(_ sender: UITextField) {
        name = sender.text ?? ""
    }
    
    @IBAction func submitAction(_ sender: UIButton) {
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

