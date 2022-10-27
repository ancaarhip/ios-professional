//
//  ViewController.swift
//  Threads
//
//  Created by Anca Arhip on 24.10.2022.
//

import UIKit

class ViewController: UIViewController {

    var dogs: [String] = []
    
    func fetchDogs() {
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.async {
                self.dogs = ["sdf", "asf", "sfaf", "lkslk"]
                print(self.dogs)
            }
        }
    }
    
    func printDogs() {
        DispatchQueue.main.async {
            print(self.dogs)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        fetchDogs()
        printDogs()
    }
}

