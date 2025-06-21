let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
print("\(🐶🐮)")

let `let` = "This is a variable name with backticks"
print("`let` = \(`let`)")

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"
print(friendlyWelcome, 你好, separator: "-----", terminator: "\r\n")
// print("`let` = \(`let`)")
/* This is the start of the first multiline comment.
    /* This is the second, nested multiline comment. */
// fff
This is the end of the first multiline comment. */
let minValue = UInt8.min
let maxValue = UInt8.max
print("minValue = \(minValue), maxValue = \(maxValue)")

let meaningOfLife = 42
let pi = 3.14159
let anotherPi = 3 + 0.14159

let decimalInteger = 17
let binaryInteger = 0b10001  // 17 in binary notation
let octalInteger = 0o21  // 17 in octal notation
let hexadecimalInteger = 0x11  // 17 in hexadecimal notation

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0
// 十进制 12.1875 转换为十六进制的解释:
// 1. 整数部分: 12 转换为十六进制是 C (因为 12 = 12⋅16^0 = C)
// 2. 小数部分: 0.1875 转换为十六进制
//    - 0.1875 × 16 = 3.0 (整数部分为 3，小数部分为 0)
// 3. 所以十进制 12.1875 转换为十六进制是 C.3
// 4. Swift 中的十六进制浮点表示法: 0xC.3p0
//    - 0x 表示十六进制
//    - C.3 是十六进制值
//    - p0 表示 2 的幂次方，即乘以 2^0 (等于 1)

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

// let cannotBeNegative: UInt8 = -1
// UInt8 can't store negative numbers, and so this will report an error
// let tooBig: Int8 = Int8.max + 1
// Int8 can't store a number larger than its maximum value,
// and so this will also report an error、
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

let integerPi = Int(pi)
print(integerPi)

typealias AudioSample = UInt128
var maxAudioSample = AudioSample.max
print(maxAudioSample)

let oranageAreOrange = true
let turnipsAreDilicious = false

if turnipsAreDilicious {
    print("Mmm, tasty turnips")
} else {
    print("Eww, turnips are horrible")

}
let i = 1
// if i{
// }
if i == 1 {

}
let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
print("the status code is \(statusCode)")
print("thes status message is \(statusMessage)")
let (justStatusCode, _) = http404Error
print("the status code is \(justStatusCode)")
print("the status code is \(http404Error.0)")
print("the status message is \(http404Error.0)")

let http200Status = (statusCode: 200, statusMessage: "OK")
print("the status code is \(http200Status.statusCode)")
print("the status message is \(http200Status.statusMessage)")

let possibleNumber = "123"
let convertNumber = Int(possibleNumber)

var serverResponseCode: Int? = 404
serverResponseCode = nil
var surveyAnswer: String?

if convertNumber != nil {
    print("convertedNumber contains some integer value.")
}

if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" couldn't be converted to an integer")
}

let myNumber = Int(possibleNumber)
if let myNumber = myNumber {
    print("My number is \(myNumber)")
}
if let myNumber {
    print("My number is \(myNumber)")
}
if let firstNumber = Int("4"), let secondNumber = Int("42"),
    firstNumber < secondNumber && secondNumber < 100
{
    print("\(firstNumber) < \(secondNumber) < 100")
}
if let firstNumber = Int("4") {
    if let secondNumber = Int("100") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}

let name: String? = nil
let greeting = "Hello \(name ?? "friend")!"
print(greeting)
let possibleNumber1 = "123"
let convertedNumber = Int(possibleNumber1)
let number = convertedNumber!
guard let number = convertedNumber else {
    fatalError("The number was invalid")
}

let possibleString: String? = "An optional string."
let forcedString: String = possibleString!  // Requires explicit unwrapping

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString  // Unwrapped automatically

let optionalString = assumedString
if assumedString != nil {
    print(assumedString!)
}
if let definiteString = assumedString {
    print(definiteString)
}

let age = 3
assert(age >= 0, "A person's age can't be less than zero")

if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age >= 0 {
    print("You can ride the ferris wheel.")
} else {
    assertionFailure("A person's age can't be less than zero.")
}
let index = 2
precondition(index > 0, "Index must be greater than zero.")