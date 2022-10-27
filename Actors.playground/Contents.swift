import UIKit
import Foundation

actor ChickenFeeder {
    let food = "worms"
    var numberOfEatingChicken: Int = 0
    
    func startEating() {
        numberOfEatingChicken += 1
    }
    
    func stopEating() {
        numberOfEatingChicken -= 1
    }
}

extension ChickenFeeder {
    func notifyObservers() {
        NotificationCenter.default.post(name: "chicken.started.eating", object: numberOfEatingChicken)
    }
}

let feeder = ChickenFeeder()

print(feeder.food)

await feeder.startEating()
print(await feeder.numberOfEatingChicken)
