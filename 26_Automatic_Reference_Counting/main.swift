// ARC in Action
do {
    class Person {
        let name: String
        init(name: String) {
            self.name = name
            print("\(name) is being initialized")
        }
        deinit {
            print("\(name) is being deinitialized")
        }
    }
    var reference1: Person?
    var reference2: Person?
    var reference3: Person?

    reference1 = Person(name: "John Appleseed")
    reference2 = reference1
    reference3 = reference1

    // reference1 = nil
    // reference2 = nil
    // reference3 = nil
    _ = reference1
    _ = reference2
    _ = reference3
    // Strong Reference Cycles Between Class Instances

}
// Weak References
print(String(repeating: "*", count: 40))
do {
    class Person {
        let name: String
        init(name: String) {
            self.name = name
            print("\(name) is being initialized")
        }
        var apartment: Apartment?
        deinit { print("\(name) is being deinitialized") }
    }

    class Apartment {
        let unit: String
        init(unit: String) {
            self.unit = unit
            print("Apartment \(unit) is being initialized")
        }
        weak var tenant: Person?
        deinit { print("Apartment \(unit) is being deinitialized") }
    }

    var john: Person?
    var unit4A: Apartment?

    john = Person(name: "John Appleseed")
    unit4A = Apartment(unit: "4A")

    john!.apartment = unit4A
    unit4A!.tenant = john
    john = nil
    unit4A = nil

}
// Unowned References
print(String(repeating: "*", count: 40))
do {
    class Customer {
        let name: String
        var card: CreditCard?
        init(name: String) {
            self.name = name
            print("\(name) is being initialized")
        }
        deinit { print("\(name) is being deinitialized") }
    }

    class CreditCard {
        let number: UInt64
        unowned let customer: Customer
        init(number: UInt64, customer: Customer) {
            self.number = number
            self.customer = customer
            print("Card #\(number) is being initialized")
        }
        deinit { print("Card #\(number) is being deinitialized") }
    }
    var john: Customer?
    john = Customer(name: "John Appleseed")
    john!.card = CreditCard(number: 1234_5678_9012_3456, customer: john!)
    john = nil
}
// Unowned Optional References
print(String(repeating: "*", count: 40))
do {
    class Department {
        let name: String
        var courses: [Course]
        init(name: String) {
            self.name = name
            self.courses = []
            print("Department \(name) is being initialized")
        }
        deinit {
            print("Department \(name) is being deinitialized")
        }
    }

    class Course {
        let name: String
        unowned let department: Department
        unowned var nextCourse: Course?
        init(name: String, in department: Department) {
            self.name = name
            self.department = department
            self.nextCourse = nil
            print("Course \(name) is being initialized")
        }
        deinit {
            print("Course \(name) is being deinitialized")
        }
    }

    let department = Department(name: "Horticulture")
    let intro = Course(name: "Survey of Plants", in: department)
    let intermediate = Course(name: "Growing Common Herbs", in: department)
    let advanced = Course(name: "Caring for Tropical Plants", in: department)
    intro.nextCourse = intermediate
    intermediate.nextCourse = advanced
    department.courses = [intro, intermediate, advanced]
    print("department\(department.name) has \(department.courses.map{$0.name})")

}

// Unowned References and Implicitly Unwrapped Optional Properties
print(String(repeating: "*", count: 40))
do {
    class Country {
        let name: String
        var capitalCity: City!
        init(name: String, capitalName: String) {
            self.name = name
            self.capitalCity = City(name: capitalName, country: self)
            print("Country \(name) is being initialized")

        }
        deinit {
            print("Country \(name) is being deinitialized")
        }
    }

    class City {
        let name: String
        unowned let country: Country
        init(name: String, country: Country) {
            self.name = name
            self.country = country
            print("City \(name) is being initialized")
        }
        deinit {
            print("City \(name) is being deinitialized")
        }
    }
    let country = Country(name: "Canada", capitalName: "Ottawa")
    print("\(country.name)'s capital city is called \(country.capitalCity.name)")
}

// Strong Reference Cycles for Closures
print(String(repeating: "*", count: 40))

class HTMLElement {
    let name: String
    let text: String?

    lazy var asHTML: () -> String = { [unowned self] () -> String in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("\(name) is being deinitialized")
    }
}
let defaultText = "some default text"
let heading = HTMLElement(name: "h1", text: defaultText)

print(heading.asHTML())

heading.asHTML = {
    return "<\("p1")>\("hello world")</\("p1")>"
}
print(heading.asHTML())

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())
paragraph = nil
