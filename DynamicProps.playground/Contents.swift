import UIKit

@dynamicMemberLookup
struct Person: Hashable {
    var propertiesVar: [String: String] = [:]
    subscript(dynamicMember member: String) -> String {
        let properties = propertiesVar
        return properties[member, default: ""]
    }
}



var person = Person(propertiesVar: ["name": "tt", "age": "aa"])

print(person.propertiesVar)
print(person[dynamicMember: "name"])

let dict: [Person: String] = [:]

