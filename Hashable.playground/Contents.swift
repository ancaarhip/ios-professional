import UIKit

struct Device: Hashable {
    var name: String
    var serialNumber: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(serialNumber)
        hasher.combine(name)
    }
}

var d1 = Device(name: "iPad", serialNumber: 2143234)
var d2 = Device(name: "iPhone", serialNumber: 989987)
var d3 = Device(name: "Mac", serialNumber: 989987)

print(d1.hashValue)
print(d2.hashValue)
print(d3.hashValue)

