func add(a: Int, b: Int) -> Int {
    return a + b
}

let operation = add
print("operation: \(operation(1, 2))")

let addClosure = {
    (a: Int, b: Int) -> Int in return a + b
}

print("addClosure: \(addClosure(2, 2))")

let numbers = [3, 1, 4, 1, 5]

let descending1 = numbers.sorted(by: { (a: Int, b: Int) -> Bool in
    return a > b
})
print("\(descending1)")

let descending2 = numbers.sorted(by: { a, b in
    return a > b
})
print("\(descending2)")

let descending3 = numbers.sorted(by: { a, b in
    a > b
})
print("\(descending3)")

let descending4 = numbers.sorted(by: { $0 > $1 })
print("\(descending4)")

let descending5 = numbers.sorted { $0 > $1 }
print("\(descending5)")

let filterNumber = numbers.filter { a in a > 2 }
print("\(filterNumber)")

let squareNumber = numbers.map { $0 * $0 }
print("\(squareNumber)")

func makeIncrementer(amount: Int) -> () -> Int {
    var total = 0
    let increment = {
        total += amount
        return total
    }
    return increment
}
let increaseBy5 = makeIncrementer(amount: 5)
print(increaseBy5())  // 返回 5
print(increaseBy5())  // 返回 10
print(increaseBy5())  // 返回 15
let increaseBy10 = makeIncrementer(amount: 10)
increaseBy10()  // 返回多少？
increaseBy10()  // 又返回多少？