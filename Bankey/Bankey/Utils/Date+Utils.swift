//
//  Date+Utils.swift
//  Bankey
//
//  Created by Anca Arhip on 17.10.2022.
//

import Foundation

extension Date {
    static var bankeyDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "MDT")
        return formatter
    }
    
    var monthDayYearString: String {
        let dateFOrmatter = DateFormatter()
        dateFOrmatter.dateFormat = "MMM d, yyyy"
        return dateFOrmatter.string(from: self)
    }
}
