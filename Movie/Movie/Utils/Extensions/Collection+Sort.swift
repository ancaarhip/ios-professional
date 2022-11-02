//
//  Collection+Sort.swift
//  Movie
//
//  Created by Anca Arhip on 01.11.2022.
//

import Foundation

extension Collection {
    func sortedObjects<Value: Comparable>(by keyPath: KeyPath<Element, Value>,
                                   _ comparator: (_ lhs: Value, _ rhs: Value) -> Bool) -> [Element] {
        sorted {
            comparator($0[keyPath: keyPath], $1[keyPath: keyPath])
        }
    }
}

