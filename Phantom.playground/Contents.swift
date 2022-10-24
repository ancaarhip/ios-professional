import UIKit

struct Employee<Role>: Equatable {
    var name: String
}
enum Sales {}
enum Programmer {}

let zoe = Employee<Sales>(name: "Zoe")
let otherZoe = Employee<Programmer>(name: "Zoe")

// Compile error
print(zoe != otherZoe)
