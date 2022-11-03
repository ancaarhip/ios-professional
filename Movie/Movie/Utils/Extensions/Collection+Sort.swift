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


extension Collection<MovieContainer> {
    func sortMovies(by sortType: SortType) -> [MovieContainer] {
        switch sortType {
        case .ratingAsc:
            return sortedObjects(by: \.movie.averageRating, <)
        case .ratingDesc:
            return sortedObjects(by: \.movie.averageRating, >)
        case .releaseAsc:
            return sortedObjects(by: \.movie.releaseYear, <)
        case .releaseDesc:
            return sortedObjects(by: \.movie.releaseYear, >)
        default:
            return self as! [MovieContainer]
        }
    }
}

