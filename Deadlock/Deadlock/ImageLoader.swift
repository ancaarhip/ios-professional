//
//  ImageLoader.swift
//  Deadlock
//
//  Created by Anca Arhip on 06.11.2022.
//

import UIKit

final class ImageFetcher {
    
    private let queue = DispatchQueue(label: "com.test.myqueue")
    
    private var imageCache: [URL: UIImage] = [:]
    
    private lazy var lazyName: String = "Data race"
    private var name: String = "Data race"

    
    // MARK: - deadlock
    func fetchImage(for url: URL, completion: @escaping (UIImage) -> Void) {
        
        queue.async {
            let image =  try! UIImage(data: Data(contentsOf: url))
            self.imageCache[url] = image
            
            DispatchQueue.main.async {
//            DispatchQueue.main.sync { ////!!!!!!
                completion(image!)
            }
        }
    }
    
    func hasCachedImage(for url: URL) -> Bool {
        queue.sync {
            imageCache[url] != nil
        }
    }
    
    // MARK: - data race
//    func printName() {
//        DispatchQueue.global(qos: .background).async {
//            print(self.lazyName)
//        }
//        print(self.lazyName)
//    }
    
    func printName() {
        DispatchQueue.global(qos: .background).async {
            self.queue.async {
                print(self.lazyName)
            }
        }
        self.queue.async {
            print(self.lazyName)
        }
    }
    
//    func updateName() {
//        DispatchQueue.global(qos: .background).async {
//            self.name.append(" update")
//        }
//        print(self.name)
//    }
    
    func updateName() {
        DispatchQueue.global(qos: .background).async {
            self.queue.async {
                self.name.append(" update")
            }
        }
        self.queue.async {
            print(self.name)
        }
    }
}
