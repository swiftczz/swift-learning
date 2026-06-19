func formatBinary(value: UInt8, bitNum: Int) -> String {
    let binary = String(value, radix: 2)
    return String(repeating: "0", count: bitNum - binary.count) + binary
}

func formatHex(value: UInt32) -> String {
    let hex = String(value, radix: 16)
    return "0x" + hex.uppercased()
}
// Bitwise NOT Operator
let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits
print("NOT Operator Value: \(formatBinary(value: invertedBits, bitNum: 8))")

// Bitwise AND Operator
let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8 = 0b00111111
let andBits = firstSixBits & lastSixBits
print("AND Operator Value: \(formatBinary(value: andBits, bitNum: 8))")

// Bitwise OR Operator
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedbits = someBits | moreBits
print("OR Operator Value: \(formatBinary(value: combinedbits, bitNum: 8))")

// Bitwise XOR Operator
let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits
print("XOR Operator Value: \(formatBinary(value: outputBits, bitNum: 8))")

// Bitwise Left and Right Shift Operators
let shiftBits: UInt8 = 4  // 00000100 in binary
print("shiftBits << 1 : \(formatBinary(value: shiftBits << 1, bitNum: 8))")
print("shiftBits << 2 : \(formatBinary(value: shiftBits << 2, bitNum: 8))")
print("shiftBits << 5 : \(formatBinary(value: shiftBits << 5, bitNum: 8))")
print("shiftBits << 6 : \(formatBinary(value: shiftBits << 6, bitNum: 8))")
print("shiftBits >> 2 : \(formatBinary(value: shiftBits >> 2, bitNum: 8))")

let pink: UInt32 = 0xCC6699
let redComponent = (pink & 0xFF0000) >> 16
print("redComponent dec: \(redComponent), and hex: \(formatHex(value: redComponent))")
let greenComponent = (pink & 0x00FF00) >> 8
print("greenComponent dec: \(greenComponent), and hex: \(formatHex(value: greenComponent))")
let blueComponent = pink & 0x0000FF
print("blueComponent dec: \(blueComponent), and hex: \(formatHex(value: blueComponent))")

// Value Overflow
do {
    var unsignedOverflow = UInt8.max
    print("Unsigned overflow UInt8.max: \(unsignedOverflow)")
    unsignedOverflow = unsignedOverflow &+ 1
    print("Unsigned overflow UInt8.max &+ 1: \(unsignedOverflow)")
}
do {
    var unsignedOverflow = UInt8.min
    print("Unsigned overflow UInt8.min: \(unsignedOverflow)")
    unsignedOverflow = unsignedOverflow &- 1
    print("Unsigned overflow UInt8.min &- 1: \(unsignedOverflow)")

    var signedOverflow = Int8.min
    print("Signed overflow Int8.min: \(signedOverflow)")
    signedOverflow = signedOverflow &- 1
    print("Signed overflow Int8.min &- 1: \(signedOverflow)")
}

struct Vector2D {
    var x: Double
    var y: Double

}
// Binary infix operator.
extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}

let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector
print("Combined Vector: \(combinedVector)")
print("Combined Vector: (\(combinedVector.x), \(combinedVector.y))")

// Prefix and Postfix Operators
extension Vector2D {
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}
let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
print("Negative Vector: \(negative)")
let alsoPositive = -negative
print("Also Positive Vector: \(alsoPositive)")

// Compound Assignment Operators
extension Vector2D {
    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
    }
}
var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd
print("Original Vector after += : \(original)")

// Equivalence Operators

extension Vector2D: Equatable {
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
}
let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
    print("These two vectors are equivalent.")
}

// Custom Operators
prefix operator +++
extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}

var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled
print("After Doubling: \(afterDoubling)")

infix operator +- : AdditionPrecedence
extension Vector2D {
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
}
let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector
print("Plus-Minus Vector: \(plusMinusVector)")

// Result Builders

protocol Drawable {
    func draw() -> String
}
struct Line: Drawable {
    var elements: [Drawable]
    func draw() -> String {
        return elements.map { $0.draw() }.joined(separator: "")
    }
}

struct Text: Drawable {
    var content: String
    init(_ content: String) {
        self.content = content
    }
    func draw() -> String {
        return content
    }
}

struct Space: Drawable {
    func draw() -> String {
        return " "
    }
}

struct Stars: Drawable {
    var length: Int

    func draw() -> String {
        return String(repeating: "*", count: length)
    }
}

struct AllCaps: Drawable {
    var content: Drawable
    func draw() -> String { return content.draw().uppercased() }
}

let name: String? = "Ravi Patel"
let manualDrawing = Line(elements: [
    Stars(length: 3),
    Text("Hello"),
    Space(),
    AllCaps(content: Text((name ?? "World") + "!")),
    Stars(length: 2),
])
print(manualDrawing.draw())

@resultBuilder
struct DrawingBuilder {
    static func buildBlock(_ components: Drawable...) -> Drawable {
        return Line(elements: components)
    }
    static func buildEither(first: Drawable) -> Drawable {
        return first
    }
    static func buildEither(second: Drawable) -> Drawable {
        return second
    }
}

func draw(@DrawingBuilder content: () -> Drawable) -> Drawable {
    return content()
}
func caps(@DrawingBuilder content: () -> Drawable) -> Drawable {
    return AllCaps(content: content())
}

func makeGreeting(for name: String? = nil) -> Drawable {
    let greeting = draw {
        Stars(length: 3)
        Text("Hello")
        Space()
        caps {
            if let name = name {
                Text(name + "!")
            } else {
                Text("World!")
            }
        }
        Stars(length: 2)
    }
    return greeting
}

let genericGreeting = makeGreeting()
print(genericGreeting.draw())

let personalGreeting = makeGreeting(for: "Ravi Patel")
print(personalGreeting.draw())

let capsDrawing = caps {
    let partialDrawing: Drawable
    if let name = name {
        let text = Text(name + "!")
        partialDrawing = DrawingBuilder.buildEither(first: text)
    } else {
        let text = Text("World!")
        partialDrawing = DrawingBuilder.buildEither(second: text)
    }
    return partialDrawing
}

extension DrawingBuilder {
    static func buildArray(_ components: [Drawable]) -> Drawable {
        return Line(elements: components)
    }
}
let manyStars = draw {
    Text("Stars:")
    for length in 1...3 {
        Space()
        Stars(length: length)
    }
}
print(manyStars.draw())