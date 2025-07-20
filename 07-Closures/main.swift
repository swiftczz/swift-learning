do {
    let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    func backward(_ s1: String, _ s2: String) -> Bool {
        return s1 > s2
    }
    var reversedNames = names.sorted(by: backward)
    print(reversedNames)

    reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 })
    reversedNames = names.sorted(by: { (s1, s2) in return s1 > s2 })
    reversedNames = names.sorted(by: { (s1, s2) in s1 > s2 })
    reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })
    reversedNames = names.sorted(by: { $0 > $1 })
    reversedNames = names.sorted(by: >)
    reversedNames = names.sorted { $0 > $1 }

    print(reversedNames)
}

// trailing closure

do {
    func someFunctionThatTakesAClosure(closure: () -> Void) {
        // function body goes here
    }
    someFunctionThatTakesAClosure(closure: {
        // closure's body goes here
    })
    someFunctionThatTakesAClosure {}
    // trailing closure's body goes here
    let digitNames = [
        0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
        5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine",
    ]
    let numbers = [16, 58, 510]
    let strings = numbers.map { (number) -> String in
        var number = number
        var output = ""
        repeat {
            output = digitNames[number % 10]! + output
            number /= 10
        } while number > 0
        return output
    }
    print(strings)
}
// Capturing Values
do {
    func makeIncrementer(forIncrement amount: Int) -> () -> Int {
        var runningTotal = 0
        func incrementer() -> Int {
            runningTotal += amount
            return runningTotal
        }

        return incrementer
    }

    let incrementByTen = makeIncrementer(forIncrement: 10)
    print(incrementByTen())
    print(incrementByTen())
    print(incrementByTen())

    let incrementBySeven = makeIncrementer(forIncrement: 7)
    print(incrementBySeven())
    print(incrementBySeven())
    print(incrementByTen())
    // Closures Are Reference Types
    let alsoIncrementByTen = incrementByTen
    print(alsoIncrementByTen())
    print(incrementByTen())
}

// Escaping Closures
var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}
do {

    class SomeClass {
        var x = 10
        func doSomething() {
            someFunctionWithEscapingClosure { self.x = 100 }
            someFunctionWithNonescapingClosure { x = 200 }
        }
    }
    let instance = SomeClass()
    instance.doSomething()
    print(instance.x)
    // Prints "200"

    completionHandlers.first?()
    print(instance.x)
    // Prints "100"
    class SomeOtherClass {
        var x = 10
        func doSomething() {
            someFunctionWithEscapingClosure { [self] in x = 100 }
            someFunctionWithNonescapingClosure { x = 200 }
        }
    }
    let otherInstance = SomeOtherClass()
    print(otherInstance.x)
    completionHandlers.first?()
    print(otherInstance.x)

}

// Autoclosures
do {
    var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    print(customersInLine.count)
    // Prints "5"

    let customerProvider = { customersInLine.remove(at: 0) }
    print(customersInLine.count)

    print("Now serving \(customerProvider())!")
    print(customersInLine.count)

    func serve(customer customerProvider: () -> String) {
        print("Now serving \(customerProvider())!")
    }
    serve { customerProvider() }
    serve(customer: { customersInLine.remove(at: 0) })

    func serve(customer customerProvider: @autoclosure () -> String) {
        print("Now serving \(customerProvider())!")
    }
    serve(customer: customersInLine.remove(at: 0))
    serve(customer: { customersInLine.remove(at: 0) })

}

do {
    var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    print(customersInLine.count)
    // Prints "5"

    var customerProviders: [() -> String] = []

    func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
        customerProviders.append(customerProvider)
    }
    collectCustomerProviders(customersInLine.remove(at: 0))
    collectCustomerProviders(customersInLine.remove(at: 0))
    print("Collected \(customerProviders.count) closures.")
    // Prints "Collected 2 closures."
    for customerProvider in customerProviders {
        print("Now serving \(customerProvider())!")
    }
}

do {
    var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    var customerProviders: [String] = []
    func collectCustomerProviders(_ customerProvider: String) {
        customerProviders.append(customerProvider)
    }
    collectCustomerProviders(customersInLine.remove(at: 0))
    collectCustomerProviders(customersInLine.remove(at: 0))
    print("Collected \(customerProviders.count) closures.")
    // Prints "Collected 2 closures."
    for customerProvider in customerProviders {
        print("Now serving \(customerProvider)!")
    }
}
do {
    // 朋友的小本本（待办事项列表）
    var todoList: [() -> Void] = []

    // 朋友的“大脑”
    // 这里必须加 @escaping，因为 task 被存到了 todoList 里
    func handleRequestLater(_ task: @escaping () -> Void) {
        print("朋友：好的，我接电话了。")

        // 把任务记在小本本上
        todoList.append(task)

        print("朋友：我已经记下了，先这样，我挂了。")
    }  // 函数在这里结束（挂电话）

    // 你打电话
    print("我：打电话给朋友...")
    handleRequestLater {
        print("任务：下午5点提醒我开会！")
    }
    print("我：好的，多谢。")

    // ...时间流逝...
    print("\n--- 下午5点了 ---")

    // 朋友查看他的小本本，并执行任务
    for task in todoList {
        task()
    }

}
