//
//  MovieModel.swift
//  Movie
//
//  Created by Anca Arhip on 01.11.2022.
//

import Foundation

struct MovieData: Codable {
    let results: [MovieModel]
}

struct MovieModel: Codable {
    let id: Int
    let poster: String
    let releaseDate: Date
    let averageRating: Double

    enum CodingKeys: String, CodingKey {
        case id
        case poster = "poster_path"
        case releaseDate = "release_date"
        case averageRating = "vote_average"
    }
}
