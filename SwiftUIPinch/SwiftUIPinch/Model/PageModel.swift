//
//  PageModel.swift
//  SwiftUIPinch
//
//  Created by Anca Arhip on 27.10.2022.
//

import Foundation

struct Page: Identifiable {
    let id: Int
    let imageName: String
}

extension Page {
    var thumbnailName: String {
        return "thumb-" + imageName
    }
}
