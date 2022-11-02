//
//  Constants.swift
//  Movie
//
//  Created by Anca Arhip on 30.10.2022.
//

import Foundation

enum RecommendationType: String, CaseIterable {
    case now_playing = "Now playing",
         popular = "Popular",
         top_rated = "Top Rated",
         upcoming = "Upcomming"
}

enum SortType: String, CaseIterable {
    case ratingAsc = "Rating ascending",
         ratingDesc = "Rating descending",
         releaseAsc = "Release year ascending",
         releaseDesc = "Release year descending",
         none 
}

struct Constants {
    static let baseURL = URL(string: "https://api.themoviedb.org/3")!
    static let baseImageURL = URL(string: "https://image.tmdb.org/t/p/w500/")!
    static let apiKey = "abfabb9de9dc58bb436d38f97ce882bc"
    static let endpoint = "/movie"
}
