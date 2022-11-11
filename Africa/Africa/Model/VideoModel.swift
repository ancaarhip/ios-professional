//
//  VideoModel.swift
//  Africa
//
//  Created by Anca Arhip on 09.11.2022.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline:String
    
    var thumbnail: String {
        "video-\(id)"
    }
}
