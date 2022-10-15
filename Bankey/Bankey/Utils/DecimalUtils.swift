//
//  DecimalUtils.swift
//  Bankey
//
//  Created by Anca Arhip on 16.10.2022.
//

import Foundation

extension Decimal {
    var doubleDecimal: Double {
        return NSDecimalNumber(decimal:self).doubleValue
    }
}
