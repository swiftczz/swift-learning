let a = 10
var b = 5
b = a
let (x, y) = (1, 2)

do {
    var a = 1
    a += 2
}

do {
    let name = "world"
    func foo(name: String) -> String {
        return name == "world" ? "hello world" : "I don't recognize you"
    }
    print(foo(name: name))

    let contentHight = 40
    let hasHeader = true
    let rowHight = contentHight + (hasHeader ? 50 : 20)
    print("rowhight: \(rowHight)")
}
do {
    // Nil-Coalescing Operator
    let defaultColorName = "red"
    var userDefinedColorName: String? = nil
    var colorNameToUse = userDefinedColorName ?? defaultColorName
    print("color name to use: \(colorNameToUse)")
    userDefinedColorName = "green"
    colorNameToUse = userDefinedColorName ?? defaultColorName
    print("color name to use: \(colorNameToUse)")
}

do {
    // Half-Open Range Operator
    let names = ["Anna", "Alex", "Brian", "Jack"]
    let count = names.count
    for i in 0..<count {
        print("Person \(i + 1) is called \(names[i])")
    }
    for (index, item) in names.enumerated() {
        print("Person \(index) is called \(item)")
    }
    for name in names[2...] {
        print("2..: \(name)")
    }
    for name in names[...2] {
        print("..2: \(name)")
    }
    for name in names[..<2] {
        print("..<2: \(name)")
    }

    let ranges = ...5

    print(ranges.contains(7))
    print(ranges.contains(4))
}

do {
    // Logical Operators
    let allowEmpty = false
    if !allowEmpty {
        print("ACCESS DENIED")
    }
    let enteredDoorCode = true
    let passedRetinaScan = false
    if enteredDoorCode && passedRetinaScan {
        print("Welcome!")
    } else {
        print("ACCESS DENIED")
    }

    let hasDoorKey = false
    let knowsOverridePassword = true
    if hasDoorKey || knowsOverridePassword {
        print("Welcome!")
    } else {
        print("ACCESS DENIED")
    }

    if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
        print("Welcome!")
    } else {
        print("ACCESS DENIED")
    }
    
    if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
        print("Welcome!")
    } else {
        print("ACCESS DENIED")
    }
}
