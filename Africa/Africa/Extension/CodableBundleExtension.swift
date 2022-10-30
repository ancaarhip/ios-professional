//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Anca Arhip on 29.10.2022.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ file: String) -> [T] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Filed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Filed to load \(file) in bundle")
        }
        
        let decoder = JSONDecoder()
        
        guard let coverImage = try? decoder.decode([T].self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        
        return coverImage
    }
}
