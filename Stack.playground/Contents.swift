import UIKit

struct Stack<T: Comparable> {
    
    private var elements: [T]
    
    func push(_ element: T) {
        elements.append(elements)
    }
    
    func pop() -> T {
        return elements.removeLast()
    }
    
    func min() -> T {
        return elements.min()
    }
}
