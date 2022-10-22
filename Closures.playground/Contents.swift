import UIKit

func doSomething(with closure: @escaping(() -> Void )) {
    DispatchQueue.main.async {
        closure()
    }
}

doSomething {
    print("Test")
}


