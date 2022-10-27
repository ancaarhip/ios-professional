import UIKit

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// Prints "5"

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)
// Prints "5"

print("Now serving \(customerProvider())!")
// Prints "Now serving Chris!"
print(customersInLine.count)
// Prints "4"

func serve(customer customerProvider: () -> String) {
    print(customerProvider())
}

serve {
    customersInLine.remove(at: 0)
}

func serveA(customer customerProvider: @autoclosure () -> String) {
    print(customerProvider())
}

serveA(customer: customersInLine.remove(at: 0))
