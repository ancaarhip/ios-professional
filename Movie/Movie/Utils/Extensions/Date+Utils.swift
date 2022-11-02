//
//  Date+Utils.swift
//  Movie
//
//  Created by Anca Arhip on 31.10.2022.
//

import Foundation

extension Date {
    static var movieDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-DD"
        formatter.calendar = Calendar(identifier: .iso8601)
        return formatter
    }
    
    var year: Int {
        return Calendar.current.dateComponents([.year], from: self)
            .year ?? 1970
    }
    
}
