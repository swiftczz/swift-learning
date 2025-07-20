do {
    func greet(person: String) -> String {
        let greeting = "Hello, " + person + "!"
        return greeting
    }
    func greetAgain(person: String) -> String {
        return "Hello again, " + person + "!"
    }
    print(greetAgain(person: "Anna"))

    func greet(person: String, alreadyGreeted: Bool) -> String {
        if alreadyGreeted {
            return greetAgain(person: person)
        } else {
            return greet(person: person)
        }
    }
    print(greet(person: "Tim", alreadyGreeted: true))
}

do {
    func printAndCount(string: String) -> Int {
        print(string)
        return string.count
    }
    func printWithoutCounting(string: String) {
        let _ = printAndCount(string: string)
    }

    let count = printAndCount(string: "hello, world")
    print("\(count)")
    printWithoutCounting(string: "hello, world")
}

//Functions with Multiple Return Values
do {
    func minMax(array: [Int]) -> (min: Int, max: Int) {
        var currentMin = array[0]
        var currentMax: Int = array[0]
        for value in array {
            if value < currentMin {
                currentMin = value
            }
            if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)

    }
    let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
    print("min is \(bounds.min) and max is \(bounds.max)")
}

do {
    func minMax(array: [Int]) -> (min: Int, max: Int)? {
        guard !array.isEmpty else {
            return nil
        }
        var currentMin = array[0]
        var currentMax: Int = array[0]
        for value in array {
            if value < currentMin {
                currentMin = value
            }
            if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)

    }
    if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
        print("min is \(bounds.min) and max is \(bounds.max)")
    }

}

// functions with an implicit return
do {
    func greeting(for name: String) -> String {
        "Hello, " + name + "!"
    }
    print(greeting(for: "Dave"))
    func anotherGreeting(for name: String) -> String {
        return "Hello, " + name + "!"
    }
    print(anotherGreeting(for: "Dave"))

}
// a variadic Parameters

do {
    func arithmeticMean(numbers: Double...) -> Double {
        var sum: Double = 0
        for i in numbers {
            sum += i

        }
        return sum / Double(numbers.count)
    }

    print(arithmeticMean(numbers: 1, 2, 3, 4, 5))
    print(arithmeticMean(numbers: -1, 0, 1))

}

// in out Parametes
do {
    func swapTwoInts(a: inout Int, b: inout Int) {
        let temp = a
        a = b
        b = temp

    }

    var a = 1
    var b = 2
    swapTwoInts(a: &a, b: &b)

    print("a is \(a), b is \(b)")

    func swapTwoInts(c: inout String, d: inout String) {
        let temp = c
        c = d
        d = temp

    }
    var c = "hello"
    var d = "world"
    swapTwoInts(c: &c, d: &d)
    print("c is \(c), d is \(d)")

}
// function type
do {
    func addTwoInts(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
        return a * b
    }

    let mathFunction = addTwoInts
    print("mathFunction result is \(mathFunction(1,2))")

    func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
        print("Result: \(mathFunction(a, b))")
    }

    printMathResult(addTwoInts, 3, 5)

}

//Function Types as Return Types
do {
    func stepForward(input: Int) -> Int {
        return input + 1
    }
    func stepBackward(input: Int) -> Int {
        return input - 1
    }

    func chooseStepFunction(backward: Bool) -> (Int) -> Int {
        return backward ? stepBackward : stepForward
    }
    var currentValue = 3
    let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
    print("Counting to zero:")
    // Counting to zero:
    while currentValue != 0 {
        print("\(currentValue)... ")
        currentValue = moveNearerToZero(currentValue)
    }
}

// nested function
do {
    func chooseStepFunction(backward: Bool) -> (Int) -> Int {
        func stepForward(input: Int) -> Int {
            return input + 1
        }
        func stepBackward(input: Int) -> Int {
            return input - 1
        }
        return backward ? stepBackward : stepForward
    }

    var currentValue = 3
    let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
    print("Counting to zero:")
    // Counting to zero:
    while currentValue != 0 {
        print("\(currentValue)... ")
        currentValue = moveNearerToZero(currentValue)
    }
}
