import UIKit

protocol Togglable {
    mutating func toggle()
}
enum OnOff: Togglable {
    case on, off
    
    mutating func toggle() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
    
}

var a:OnOff = .on
a.toggle()



