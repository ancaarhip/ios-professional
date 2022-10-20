//
//  PasswordCriteria.swift
//  Password
//
//  Created by Anca Arhip on 20.10.2022.
//

import Foundation

struct PasswordCriteria {
    static func lengthCriteraMet(_ text: String) -> Bool {
        text.count > 8 && text.count <= 32
    }
    
    static func noSpaceCriteriaMet(_ text: String) -> Bool {
        text.rangeOfCharacter(from: NSCharacterSet.whitespaces)  == nil
    }
    
    static func lengthAndNoSpaceMet(_ text: String) -> Bool {
        return lengthCriteraMet(text) && noSpaceCriteriaMet(text)
    }
    
    static func upperCaseMet(_ text: String) -> Bool {
        return text.range(of: "[A-Z]+", options: .regularExpression) != nil
    }
    
    static func lowerCaseMet(_ text: String) -> Bool {
        return text.range(of: "[a-z]+", options: .regularExpression) != nil
    }
    
    static func digitMet(_ text: String) -> Bool {
        return text.range(of: "[0-9]+", options: .regularExpression) != nil
    }
    
    static func specialCharMet(_ text: String) -> Bool {
        return text.range(of: "[@#$%^&*():?\\\\]+", options: .regularExpression) != nil
    }
}
