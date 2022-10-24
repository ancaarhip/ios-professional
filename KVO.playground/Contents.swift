import UIKit

class ObjectToObserve: NSObject {
    @objc dynamic var aDate = NSDate(timeIntervalSince1970: 0)
    
    func updateDate() {
        aDate = aDate.addingTimeInterval(Double(2 << 30))
    }
}

class ObserverObject: NSObject {
    @objc var toObserve: ObjectToObserve
    var observation: NSKeyValueObservation?
    
    init(objectToObserve: ObjectToObserve) {
        self.toObserve = objectToObserve
        super.init()
        
        observation = observe(\.toObserve.aDate, options: [.old, .new, .prior]) { object, change in
            print("\(change.isPrior)")
            print("\(change.oldValue)")
            print("\(change.newValue)")
        }
    }
    
}

let toObc = ObjectToObserve()
let obs = ObserverObject(objectToObserve: toObc)

toObc.updateDate()

