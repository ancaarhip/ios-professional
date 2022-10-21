import UIKit

//Given a set of numbers, determine if there is a pair that equals a given sum.
func hasPairWithSum(_ arr: [Int], _ sum: Int) -> Bool {
    let dict = arr.reduce([Int: [Int]]()) {
        var result = $0
        result[$1] = (result[$1] ?? []) + [$0.count]
        return result
    }
    return dict.first {
        dict[8-$0.key] != nil && (dict[8-$0.key]!.count > 1 || $0.key != 8 - $0.key)
    } != nil
}

hasPairWithSum([1, 2, 4, 9], 8)     // false
hasPairWithSum([1, 3, 4, 5], 8)     // true
hasPairWithSum([1, 2, 4, 4], 8)
hasPairWithSum([], 8) // true


//Given a string, see if you can detect whether it contains only unique chars.
func isUnique(_ text: String) -> Bool {
    var charHash: [Character: Int] = [:]
    for c in text {
        guard charHash[c] == nil else { return false }
        charHash[c] = 1
    }
    return true
}


isUnique("ab")
isUnique("aa")
isUnique("abcdefghijklmnopqrstuvwxyz")


