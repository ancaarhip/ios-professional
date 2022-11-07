import UIKit

func cyclicRotation(k: Int, A: [Int]) -> [Int] {
    
    let n = A.count
    let r = k % n
    
    guard r > 0 && n > 0 else {
        return A
    }
    var B = Array(A[(n - r)..<n]) + Array(A[..<(n - r)])
    print(B)
    
    B = A
    
    for _ in 0..<k {
        let last = B.last!
        B.insert(last, at: 0)
        B.removeLast(1)
    }
    
    print(B)
    
    B = A
    
    for _ in 0..<k {
        let first = B.first!
        B.append(first)
        B.remove(at: 0)
    }
    
    print(B)
    return B
}

//cyclicRotation(k: 1, A: [1,2,3,4,5,6,7,8])

func reverse(_ text: String) -> String {

    return text.reduce("") {
       String($1) + $0
    }

}
//print (reverse("Join Stack Overflow to find the best answer to your technical question, help others answer theirs."))

func isBalanced(_ text: String) -> Bool {
    var buffer = ""
    let pair: [Character: Character] = ["{": "}", "[": "]", "(": ")"]
    for char in text {
        switch char {
        case "[", "(", "{":
            buffer.append(String(char))
        case "]", ")", "}":
            guard let last = buffer.last else { return false }
            let lastPair = pair[last]
            guard char == lastPair else { return false }
            buffer.removeLast()
        default:
            return false
        }
    }
    return true
}

//print(isBalanced("{}()(){}((){})({[[({({(){}{}}){}})]{({()}((())))}()]})(({}(()){[][]}){()}(({}{}))())()[](){{((){})}}()([[]])[][]()({}((([()]{})())[][[()]]())){{}}[]{()}()[][]{}([])[]{({})}{}{{}{[[]]}[]{}}{[()]}[]{(([{{[{[]}]}[{}]}]))}(){}{{}}[]((([])([{(){}[(()[]((()(){})({([]({{{[]{}}[({})()({}{([()])()()[]{}})][{[]}]{{}([]({{{(()(({}[[[{{}}]]{{[()]([[{{}([[]][([{{}}(([])[][({()}())()({}[])]{}[])]())[]]){}}[]]])([]({{[[][]{[]}[]]}}{}(){[]}))}()[]((){{}()[{[[()]]}()]}[()]{})}][]{}))())}(())}{{[]}{}}({[([{[{[[[]]]{()}[]}]{}}()((({{{{({{(){}}}[[()]()[]]())({{{[]}{{[[{{[{}]}}[][]]]([][](()(()[]){{}}))([])}}}}[{}{}])[(){{()()}{(())}()}]{(){{}[]{}[][{[]([[]()]{(){[{}[()]][{}{}]{(){}}}{[]}}{[]}[]){[]}[]}][((){}{}[[[[{{}()[([({{[[][{{()}(([[]][[[[[[[{}]][{}]]]()](())[()[][]({({[][][[]{}][]}{})}{({})([[][]({}{[]})])[([([])][[]{([])(({}))}](()[]){[[]]}({}))]}[])()]]]))([{}()()([([[{}][()]][])])][[[{}][][]({[]})][(({{()}}))]])}]]}})])]}]]]])]}}}}}})))])]})}))}}}))})))]}])))"))


func isUnique(_ text: String) -> Bool {
    
    var repo: Set<Character> = []
    
    for char in text {
        guard repo.insert(char).inserted else { return false }
    }
    return true
}

//print(isUnique(""))

func isPermutation(_ a: String, _ b: String) -> Bool {
    
    guard a.count == b.count else { return false }
    
    var aa = a
    var bb = b
    
    while !aa.isEmpty {
        guard aa.removeLast() == bb.removeFirst() else { return false }
    }
    
    return true
}

//print(isPermutation("asdf", "fdga"))

func urlfy(_ url: String) -> String{
    return url.replacingOccurrences(of: " ", with: "%20")
}

//print(urlfy("jh jkh kjh"))

func oneAway(_ left: String, _ right: String) -> Bool {
    
    guard abs(left.count - right.count) <= 1 else { return false }
    
    var diffs = 0
    
    var a = left
    var b = right
    
    while !a.isEmpty && !b.isEmpty {
        if a.removeFirst() != b.removeFirst() {
            diffs += 1
        
            if a.count > b.count {
                a.removeFirst()
            } else if a.count < b.count {
                b.removeFirst()
            }
        }
        if diffs > 1 {
            return false
        }
    }
    
    if !a.isEmpty || !b.isEmpty {
        diffs += 1
    }
    
    return diffs <= 1
}

//oneAway("pale", "paleXXXX")     // false
//oneAway("pale", "ple")          // true
//oneAway("pales", "pale")        // true
//oneAway("pale", "bale")         // true
//oneAway("pale", "bake")         // false
//oneAway("pale", "bakeerer")     // f

func compress(_ str: String) -> String {
    var compressed = ""
    var buff:[Character] = []
    var current: Character? = nil
    
    for char in str {
        if current != nil && char == current {
            print(char)
            buff.append(char)
        } else {
            if buff.count > 1 {
                compressed.append("\(buff.count)")
            }
            current = char
            buff = [char]
            
            compressed.append(String(char))
            
        }
    }
    if buff.count > 1 {
        compressed.append("\(buff.count)")
    }
    return compressed.count >= str.count ? str : compressed
}

//compress("aaabb")           // a3b2
//compress("aabb")            // aabb
//compress("ab")              // ab
//compress("abc")             // abc
//compress("zzz")             // z3
//compress("aabbaabb")        // aabbaabb (not shorter)

func printLinkedListSimple(_ head: Node?) {
    if head == nil { return }
    
    var node = head
    print(node!.data)
    
    while node?.next != nil {
        print(node!.next!.data)
        node = node?.next
    }
}

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

func removeDuplictates(_ head: Node?) -> Node? {
    
    var node = head
    var repo: Set<Int> = []
    
    while node != nil {
        print(node!.data)
        if let nextNode = node!.next {
            print(nextNode.data)
            if !repo.insert(nextNode.data).inserted  {
//                node?.next = nextNode.next
                print("inserted")
            }
        }
        node = node!.next
    }
    print(repo)
    return head
}

let node3 = Node(3)
let node2 = Node(2, node3)
let node1 = Node(1, node2)
node3.next = Node(1)        // duplicate
printLinkedListSimple(node1)
print("===")
removeDuplictates(node1)
printLinkedListSimple(node1)

var se: Set<Int> = [2, 3]
se.insert(2).inserted
