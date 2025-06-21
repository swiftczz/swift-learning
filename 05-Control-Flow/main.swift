// For-In Loops
do {
    for index in 1...5 {
        print("\(index) times 5 is \(index * 5)")
    }

    let minutes = 60
    for tickMark in 0..<minutes {
        // render the tick mark each minute (60 times)
        print("\(tickMark)")

    }
    let minuteInterval = 5
    for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
        print("\(tickMark)")
    }
    let hours = 12
    let hourInterval = 3
    for tickMark in stride(from: 3, through: hours, by: hourInterval) {
        print("\(tickMark)")
    }
}
// While
do {
    let finalSquare = 25
    var board: [Int] = [Int](repeating: 0, count: finalSquare + 1)
    board[03] = +08
    board[06] = +11
    board[09] = +09
    board[10] = +02
    board[14] = -10
    board[19] = -11
    board[22] = -02
    board[24] = -08

    var square = 0
    var diceRoll = 0
    while square < finalSquare {
        // roll the dice
        diceRoll += 1
        if diceRoll == 7 { diceRoll = 1 }
        // move by the rolled amount
        square += diceRoll
        if square < board.count {
            // if we're still on the board, move up or down for a snake or a ladder
            square += board[square]
        }
        print(square)
    }
    print("Game over!")
}

// If
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}
temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's not that cold. Wear a T-shirt.")
}
do {
    temperatureInFahrenheit = 90
    if temperatureInFahrenheit <= 32 {
        print("It's very cold. Consider wearing a scarf.")
    } else if temperatureInFahrenheit >= 86 {
        print("It's really warm. Don't forget to wear sunscreen.")
    } else {
        print("It's not that cold. Wear a T-shirt.")
    }
}

do {
    let temperatureInCelsius = 25
    let weatherAdvice: String
    if temperatureInCelsius <= 0 {
        weatherAdvice = "It's very cold. Consider wearing a scarf."
    } else if temperatureInCelsius >= 30 {
        weatherAdvice = "It's really warm. Don't forget to wear sunscreen."
    } else {
        weatherAdvice = "It's not that cold. Wear a T-shirt."
    }

    print(weatherAdvice)
}

// do {
//     let temperatureInCelsius = 25
//     let weatherAdvice: String
//     if temperatureInCelsius <= 0 {
//         "It's very cold. Consider wearing a scarf."
//     } else if temperatureInCelsius >= 30 {
//         "It's really warm. Don't forget to wear sunscreen."
//     } else {
//         "It's not that cold. Wear a T-shirt."
//     }

//     print(weatherAdvice)
// }

// Switch
do {
    let someCharacter: Character = "z"
    switch someCharacter {
    case "a":
        print("The first letter of the Latin alphabet")
    case "z":
        print("The last letter of the Latin alphabet")
    default:
        print("Some other character")
    }

    let anotherCharacter: Character = "a"
    let message =
        switch anotherCharacter {
        case "a":
            "The first letter of the Latin alphabet"
        case "z":
            "The last letter of the Latin alphabet"
        default:
            "Some other character"

        }
    print(message)

}

// No Implicit Fallthrough
do {
    let anotherCharacter: Character = "a"
    switch anotherCharacter {
    case "a", "A":
        print("The letter A")
    default:
        print("Not the letter A")
    }
}

// Interval Matching
do {
    let approximateCount = 62
    let countedThings = "moons orbiting Saturn"
    let naturalCount: String
    switch approximateCount {
    case 0:
        naturalCount = "no"
    case 1..<5:
        naturalCount = "a few"
    case 5..<12:
        naturalCount = "several"
    case 12..<100:
        naturalCount = "dozens of"
    case 100..<1000:
        naturalCount = "hundreds of"
    default:
        naturalCount = "many"
    }
    print("There are \(naturalCount) \(countedThings).")
}

// Tuples
do {
    let somePoint = (1, 1)
    switch somePoint {
    case (0, 0):
        print("\(somePoint) is not origin")
    case (_, 0):
        print("\(somePoint) is on the x-axis")
    case (0, _):
        print("\(somePoint) is on the y-axis")
    case (-2...2, -2...2):
        print("\(somePoint) is inside the box")
    default:
        print("\(somePoint) is outside of the box")
    }
}

// Value Bindings
do {
    let anotherPoint = (2, 0)
    switch anotherPoint {

    case (let x, 0):
        print("on the x-axis with an x value of \(x)")
    case (0, let y):
        print("on the y-axis with a y value of \(y)")
    case let (x, y):
        print("somewhere else at (\(x), \(y))")
    }
}

// Where
do {
    let yetAnotherPoint = (1, -1)
    switch yetAnotherPoint {

    case let (x, y) where x == y:
        print("(\(x), \(y)) is on the line x == y")
    case let (x, y) where x == -y:
        print("(\(x), \(y)) is on the line x == -y")
    case let (x, y):
        print("(\(x), \(y)) is just some arbitrary point")

    }
}

// Compound Cases
do {
    let someCharacter: Character = "e"
    switch someCharacter {
    case "a", "e", "i", "o", "u":
        print("\(someCharacter) is a vowel")
    case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
        "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
        print("\(someCharacter) is a consonant")
    default:
        print("\(someCharacter) isn't a vowel or a consonant")
    }
}
do {
    let stillAnotherPoint = (9, 0)
    switch stillAnotherPoint {
    case (let distance, 0), (0, let distance):
        print("On an axis, \(distance) from the origin")
    default:
        print("Not on an axis")
    }
}

// Pattern
do {
    let somePoint: (Int, Int) = (12, 100)
    if case let (x, 100) = somePoint {
        print("Found a point on the y=100 line, at \(x)")
    }

}

do {
    let points = [(10, 0), (30, -30), (-20, 0)]

    for (x, y) in points {
        if y == 0 {
            print("Found a point on the x-axis at \(x)")
        }
    }

}

do {
    let points = [(10, 0), (30, -30), (-20, 0)]
    print("a better way to write pattern matching")
    for case (let x, 0) in points {
        print("Found a point on the x-axis at \(x)")
    }
}
do {
    let points = [(10, 0), (30, -30), (-20, 0), (0, 0)]
    for case let (x, y) in points where x == y || x == -y {
        print("Found (\(x), \(y)) along a line through the origin")
    }
}

// Control Transfer Statements

do {
    let puzzleInput = "great minds think alike"
    var puzzleOutput = ""
    let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
    for chartacter in puzzleInput {
        if charactersToRemove.contains(chartacter) {
            continue
        }
        puzzleOutput.append(chartacter)
    }
    print(puzzleOutput)
}

do {
    let numberSymbol: Character = "三"  // Chinese symbol for the number 3
    var possibleIntegerValue: Int?
    switch numberSymbol {
    case "1", "١", "一", "๑":
        possibleIntegerValue = 1
    case "2", "٢", "二", "๒":
        possibleIntegerValue = 2
    case "3", "٣", "三", "๓":
        possibleIntegerValue = 3
    case "4", "٤", "四", "๔":
        possibleIntegerValue = 4
    default:
        break
    }
    if let integerValue = possibleIntegerValue {
        print("The integer value of \(numberSymbol) is \(integerValue).")
    } else {
        print("An integer value couldn't be found for \(numberSymbol).")
    }
}
do {
    let character: Character = "a"
    switch character {
    case "a", "A":  // 多个值可以匹配同一个case
        print("The first letter of the alphabet")
        fallthrough  // 明确指定贯穿
    case "b", "B":
        print("The second letter of the alphabet")
    default:
        print("Some other letter")
    }

    let integerToDescribe = 5
    var description = "The number \(integerToDescribe) is"
    switch integerToDescribe {
    case 2, 3, 5, 7, 11, 13, 17, 19:
        description += " a prime number, and also"
        fallthrough
    default:
        description += " an integer."
    }
    print(description)
}

// Labeled Statements
do {
    let finalSquare = 25
    var board = [Int](repeating: 0, count: finalSquare + 1)
    board[03] = +08
    board[06] = +11
    board[09] = +09
    board[10] = +02
    board[14] = -10
    board[19] = -11
    board[22] = -02
    board[24] = -08
    var square = 0
    var diceRoll = 0
    gameLoop: while square != finalSquare {
        diceRoll += 1
        if diceRoll == 7 { diceRoll = 1 }
        switch square + diceRoll {
        case finalSquare:
            // diceRoll will move us to the final square, so the game is over
            break gameLoop
        case let newSquare where newSquare > finalSquare:
            // diceRoll will move us beyond the final square, so roll again
            continue gameLoop
        default:
            // this is a valid move, so find out its effect
            square += diceRoll
            square += board[square]
        }
    }
    print("Game over!")
}

// Early Exit
do {
    func greet(person: [String: String]) {
        guard let name = person["name"] else {
            print("not found")
            return
        }
        print("Hello, \(name)")

        guard let location = person["location"] else {
            print("I hope the weather is nice near you.")
            return
        }
        print("I hope the weather is nice in \(location).")
    }
    greet(person: ["name": "John"])
}

//
do {
    var score = 1
    if score < 10 {
        defer {
            print(score)
        }
        score += 5
    }
}
do {
    var score = 3
    if score < 100 {
        score += 100
        defer {
            score -= 100
        }
        // Other code that uses the score with its bonus goes here.
        print(score)
    }
}

do {
    func add(a: Int, b: Int) -> Int {
        defer {
            print("a + b = \(a+b)")
        }
        return a + b
    }
    print("sum is \(add(a: 1, b: 2))")
}
// Checking API Availability

do {
    @available(macOS 15, *)
    struct ColorPreference {
        var bestColor = "blue"
    }

    func chooseColor() -> String {
        guard #available(macOS 16, *) else {
            return "gray"
        }

        let colors = ColorPreference()
        return colors.bestColor
    }
    print(chooseColor())
}
