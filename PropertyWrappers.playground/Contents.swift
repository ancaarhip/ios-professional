import UIKit

// Capitalized
@propertyWrapper
struct Capitalized {
    private var value: String
    var wrappedValue: String {
        get { value }
        set { value = newValue.capitalized }
    }
    init(wrappedValue: String) {
        value = wrappedValue.capitalized
    }
}

struct Person {
    @Capitalized var firstName: String
    @Capitalized var lastName: String
}
var person = Person(firstName: "ion", lastName: "ion")
person.firstName = "maria"


// Debuggable
@propertyWrapper
struct Debuggable<Value> {
    private var value: Value
    private let description: String

    init(wrappedValue: Value, description: String = "") {
        print("Initialized '\(description)' with value \(wrappedValue)")
        self.value = wrappedValue
        self.description = description
    }

    var wrappedValue: Value {
        get {
            print("Accessing '\(description)', returning: \(value)")
            return value
        }
        set {
            print("Updating '\(description)', newValue: \(newValue)")
            value = newValue
        }
    }
}

struct OtherPerson{
    @Debuggable(description: "Nea") @Capitalized var name = "ion"
    @Debuggable(description: "Age") var age = 50
}

var otherPerson = OtherPerson()
otherPerson.age = 60
var anotherPerson = OtherPerson()
anotherPerson.name = "maria"
anotherPerson.age = otherPerson.age


// Autolayout
@propertyWrapper
struct UsesAutolayout {
    private var value: UIView
    var wrappedValue: UIView {
        get { value }
        set {
            value = newValue
            value.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    init(wrappedValue: UIView) {
        value = wrappedValue
        value.translatesAutoresizingMaskIntoConstraints = false
    }
}

struct WrappedLabel {
    @UsesAutolayout var uilabel: UIView
}
var newLabel = WrappedLabel(uilabel: UIView())
print (newLabel.uilabel.translatesAutoresizingMaskIntoConstraints)
newLabel.uilabel = UILabel()
print (newLabel.uilabel.translatesAutoresizingMaskIntoConstraints)
