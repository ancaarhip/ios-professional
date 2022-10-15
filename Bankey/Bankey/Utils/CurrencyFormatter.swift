//
//  CurrencyFormatter.swift
//  Bankey
//
//  Created by Anca Arhip on 16.10.2022.
//

import UIKit

class CurrencyFormatter {
    func makeAttributedCurrency(_ balance: Decimal) -> NSMutableAttributedString {
        let tuple = breakIntoDollarsAccount(balance)
        return makeBalanceAttributed(dollars: tuple.0, cents: tuple.1)
    }
    
    func breakIntoDollarsAccount(_ amount: Decimal) -> (String, String) {
        let tuple = modf(amount.doubleDecimal)
        
        let dollars = convertDollar(tuple.0)
        let cents = convrtCents(tuple.1)
        
        return (dollars, cents)
    }
    
    func convertDollar(_ dollarPart: Double) -> String {
        let dollarsWithDecimals = dollarsFormatted(dollarPart)
        let formatter = NumberFormatter()
        let decimalSeparator = formatter.decimalSeparator!
        let dollarsComponents = dollarsWithDecimals.components(separatedBy: decimalSeparator)
        var dollars = dollarsComponents.first!
        dollars.removeFirst()
        
        return dollars
    }
    
    func convrtCents(_ centPart: Double) -> String {
        let cents: String
        if centPart == 0 {
            cents = "00"
        } else {
            cents = String(format: "%.0f", centPart * 100)
        }
        return cents
    }
    
    func dollarsFormatted(_ dollars: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        formatter.usesGroupingSeparator = true
        if let result = formatter.string(from: dollars as NSNumber) {
            return result
        }
        
        return ""
    }
    
    private func makeBalanceAttributed(dollars: String, cents: String) -> NSMutableAttributedString {
        let dollarSignAttr: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 8]
        let dollarAttr: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title1)]
        let centAttr: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .footnote), .baselineOffset: 8]
        
        let rootString = NSMutableAttributedString(string: "$", attributes: dollarSignAttr)
        let dollarStr = NSMutableAttributedString(string: dollars, attributes: dollarAttr)
        let centStr = NSMutableAttributedString(string: cents, attributes: centAttr)
        
        rootString.append(dollarStr)
        rootString.append(centStr)
        
        return rootString
    }
}
