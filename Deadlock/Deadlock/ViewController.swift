//
//  ViewController.swift
//  Deadlock
//
//  Created by Anca Arhip on 06.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView = UIImageView()
    
    var spinner = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        layout()
        
        spinner.startAnimating()
        
        let imageFetcher = ImageFetcher()
        
//        imageFetcher.printName()
        imageFetcher.updateName()
        
        imageFetcher.fetchImage(for: URL(string: "https://picsum.photos/200")!) { image in
            self.imageView.image = image
            self.spinner.stopAnimating()
        }
        
        if !(imageFetcher.hasCachedImage(for: URL(string: "https://picsum.photos/200")!)) {
            self.spinner.startAnimating()
        }
        
    }

    func layout() {
        view.addSubview(spinner)
        view.addSubview(imageView)
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])

    }
}

