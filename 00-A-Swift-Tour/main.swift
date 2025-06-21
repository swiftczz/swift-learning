var myVariable: Int = 42
print(myVariable)
myVariable = 50
print(myVariable)
let myConstant: Int = 42
print(myConstant)

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

let label = "The width is "
let width = 94
let widthLabel = label + String(width)
print(widthLabel)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
let quotation = """
    Even though there's whitespace to the left,
    the actual lines aren't indented.
        Except for this line.
    Double quotes (") can appear without being escaped.

    I still have \(apples + oranges) pieces of fruit.
    """
print(quotation)

var fruits = ["strawberries", "limes", "tangerines"]
fruits[1] = "grapes"
print(fruits)
// 删除 grapes
fruits.remove(at: 1)
print(fruits)

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"
print(occupations)
fruits = []
occupations = [:]

let emptyArray: [String] = []
let emptyDictionary: [String: Float] = [:]

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)
let scoreDecoration = if teamScore > 10 { "🎉" } else { "" }
print("Score", teamScore, scoreDecoration)

var optionalString: String? = "Hello"
var optionalName: String? = "John Appleseed"
optionalName = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}
print(greeting)
let nickname: String? = nil
let fullname: String = "John Appleseed"
let informalGreeting = "Hi \(nickname ?? fullname)"
let nickname1: String? = "John"
if let nickname1 {
    print("Hi \(nickname1)")
}
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }

    }
    print(kind, numbers)
}
for (k, v) in [2, 4, 8, 16].enumerated() {
    print(k, v)
}

// while loop
var n = 2
while n < 100 {
    n *= 2
}
print(n)

// repeat-while loop
var m = 2
repeat {
    m *= 2
} while m < 100
print(m)

var total = 0
for i in 0...4 {
    total += i
}
print(total)
func greeting(_ person: String, day: String) -> String {
    return "Hello \(person), today is \(day)"
}

print(greeting("Bob", day: "Thursday"))

func calculateStatistics(Score: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = Score[0]
    var sum = 0
    var max = Score[0]
    for score in Score {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}
let statistics = calculateStatistics(Score: [5, 3, 100, 3, 9])
print(statistics)

print(statistics.sum)

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}

func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
print(increment(7))

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 9, 12]
print(hasAnyMatches(list: numbers, condition: lessThanTen))
var number = numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})
let new_numbers = numbers.map({ (number: Int) -> Int in
    let result = number * 3
    return result

})
print("new numbers: \(new_numbers)")

let new_numbers2 = numbers.map({ x in x * 3 })
// print(number)
print("new numbers: \(new_numbers2)")
numbers.sort { $0 > $1 }
print("numbers sort: \(numbers)")

let new_numbers3 = numbers.sorted { $0 < $1 }
print("numbers sorted: \(new_numbers3)")

// 数组元素乘以2的多种实现方式
let originalNumbers = [1, 2, 3, 4, 5]

// 方法1: 使用map函数
// $0是Swift闭包中的第一个参数的简写，这里代表数组中的每个元素
let doubledNumbers1 = originalNumbers.map { $0 * 2 }
print("方法1(map): \(doubledNumbers1)")
print("说明: $0表示闭包的第一个参数，相当于 { num in num * 2 }")

// 方法2: 使用for循环
var doubledNumbers2 = [Int]()
for num in originalNumbers {
    doubledNumbers2.append(num * 2)
}
print("方法2(for循环): \(doubledNumbers2)")

// 方法3: 使用数组推导式
let doubledNumbers3 = originalNumbers.map { num in num * 2 }
print("方法3(数组推导式): \(doubledNumbers3)")

// 过滤奇数的多种实现方式
let numbersToFilter = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// 方法1: 使用filter函数和取模运算
// Swift中当闭包是函数的最后一个参数时，可以使用尾随闭包语法(trailing closure)
// 这种写法: filter { ... } 等价于 filter({ ... })
let oddNumbers1 = numbersToFilter.filter { $0 % 2 != 0 }
print("\n方法1(filter+%): \(oddNumbers1)")
print("说明: filter函数接受一个闭包参数，当闭包是唯一参数或是最后一个参数时，可以省略小括号")

// 方法2: 使用for循环
var oddNumbers2 = [Int]()
for num in numbersToFilter {
    if num % 2 != 0 {
        oddNumbers2.append(num)
    }
}
print("方法2(for循环): \(oddNumbers2)")

// 方法3: 使用reduce函数
let oddNumbers3 = numbersToFilter.reduce(into: []) { (result, num) in
    if num % 2 != 0 {
        result.append(num)
    }
}
print("方法3(reduce): \(oddNumbers3)")

// 方法4: 使用compactMap
let oddNumbers4 = numbersToFilter.compactMap { $0 % 2 != 0 ? $0 : nil }
print("方法4(compactMap): \(oddNumbers4)")

// 方法5: 使用高阶函数组合
let oddNumbers5 = numbersToFilter.filter { !$0.isMultiple(of: 2) }
print("方法5(isMultiple): \(oddNumbers5)")

class Shape {
    var numberOfSides = 0

    func simpleDescription() -> String {
        return "a shape with \(numberOfSides) sides"
    }
}
var shape = Shape()
shape.numberOfSides = 7
print(shape.simpleDescription())

class NameShape {
    var numberOfSides = 0
    var name: String

    init(name: String) {
        self.name = name
    }

    func simpleDescription() -> String {
        return "a shape with \(numberOfSides) sides"
    }
}

class Square: NameShape {
    var sideLength: Double
    // var numberOfSides = 4
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        self.numberOfSides = 4
    }

    func area() -> Double {
        return sideLength * Double(numberOfSides)
    }

    override func simpleDescription() -> String {
        return "a square with sides of length \(sideLength)"
    }
}

let testSquare = Square(sideLength: 5.2, name: "My Square")
print(testSquare.area())
print(testSquare.simpleDescription())

class EquilateralTriangle: NameShape {
    var sideLength = 0.0
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        self.numberOfSides = 3

    }
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }

    override func simpleDescription() -> String {
        "An Equilateral Triangle with sides of \(numberOfSides)"
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.perimeter)
print(triangle.sideLength)

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
// Prints "10.0"
print(triangleAndSquare.triangle.sideLength)
// Prints "10.0"
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)
// Prints "50.0"
print(triangleAndSquare.square.sideLength)

let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength
if let sideLength = sideLength {
    print("side length \(sideLength)")
} else {
    print("side length is nil")
}

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king

    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)

        }
    }
}
let ace = Rank.ace
print("ace value:\(ace)")
print("rank value: \(Rank.two)")
print("rank value: \(Rank.two.rawValue)")

enum Suit {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {

        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        default:
            return "clud"
        }
    }

    func color() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        default:
            return "red"
        }
    }
}

let hearts = Suit.hearts
print("hearts: \(hearts)")
print("hearts desciption: \(hearts.simpleDescription())")
print("hearts color: \(hearts.color())")

enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
}

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
print(threeOfSpadesDescription)

func fetchUserId(from server: String) async -> Int {
    if server == "primary" {
        return 97
    }
    return 501
}

func fetchUserName(from server: String) async -> String {
    let userId = await fetchUserId(from: server)
    if userId == 501 {
        return "John Appleseed"
    }
    return "Guest"
}

func connectUser(to server: String) async {
    async let userID = fetchUserId(from: server)
    async let username = fetchUserName(from: server)
    let greeting = await "Hello \(username), user ID \(userID)"
    print(greeting)
}

Task {
    await connectUser(to: "primary")
}

let userIDs = await withTaskGroup(of: Int.self) { group in
    for server in ["primary", "secondary", "development"] {
        group.addTask {
            return await fetchUserId(from: server)
        }
    }
    var results: [Int] = []
    for await result in group {
        results.append(result)
    }
    return results
}
print(userIDs)

actor ServerConnection {
    var server: String = "primary"
    private var activeUsers: [Int] = []
    func connect() async -> Int {
        let userID = await fetchUserId(from: server)
        activeUsers.append(userID)
        return userID
    }
}

let server = ServerConnection()
let userID = await server.connect()
print("userID: \(userID)")

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "a very simple class"
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}

var a = SimpleClass()
a.adjust()
print(a.simpleDescription)

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
print(b.simpleDescription)

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
var seven = 7
print("7 description \(seven.simpleDescription )")
seven.adjust()
print("7 description \(seven.simpleDescription )")

let protocolValue: any ExampleProtocol = a
print(protocolValue.simpleDescription)

// enum PrinterError: Error {
//     case outOfPaper, noToner, onFire
// }
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}
do {
    let printerResponse = try send(job: 1040, toPrinter: "Big Bang")
    print(printerResponse)
} catch {
    print(error)
}

do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch let error {
    print(error)
}

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }

    let result = fridgeContent.contains(food)
    return result
}
if fridgeContains("banana") {
    print("Found a banana")
}
print(fridgeIsOpen)
// Prints "false"

func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var results: [Item] = []
    for _ in 0..<numberOfTimes {
        results.append(item)
    }
    return results
}
let array = makeArray(repeating: "knock", numberOfTimes: 4)
print(array)

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Element: Equatable, T.Element == U.Element
{
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
   return false
}
print(anyCommonElements([1, 2, 3], [3]))
