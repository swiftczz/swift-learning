// Enumeration Syntax
do {
    enum CompassPoint {
        case north
        case south
        case east
        case west
    }

    var directionToHead = CompassPoint.west
    directionToHead = CompassPoint.north
    print("\(directionToHead)")

    enum Week {
        case monday
        case tuesday
        case wednesday
        case thursday
        case friday
        case saturday
        case sunday
    }
    func enumCompass(dirction: CompassPoint) {
        switch directionToHead {
        case .north:
            print("Lots of planets have a north")
        case .south:
            print("Watch out for penguins")
        case .east:
            print("Where the sun rises")
        case .west:
            print("Where the skies are blue")
        }
    }
    enumCompass(dirction: directionToHead)

    func enumWeek(week: Week) {
        switch week {
        case .monday:
            print("it is monday")
        case .tuesday:
            print("it is tuesday")
        case .wednesday:
            print("It's hump day!")
        case .thursday:
            print("it is thursday")
        case .friday:
            print("it is friday")
        case .saturday:
            print("it is saturday")
        case .sunday:
            print("it is sunday")
        }
    }
    let week = Week.wednesday

    enumWeek(week: week)

    func isSomeday(week: Week) {
        switch week {
        case .saturday, .sunday:
            print("It's the weekend!")
        default:
            print("Just another workday.")
        }
    }
    isSomeday(week: week)

    func isWednesday(week: Week) {
        switch week {
        case .wednesday:
            print("It's Wednesday!")
        default:
            print("It's not Wednesday.")
        }
    }

    isWednesday(week: week)

}
do {
    enum Barcode {
        case upc(Int, Int, Int, Int)
        case qrCode(String)
    }
    let productBarcode = Barcode.upc(8, 85909, 51226, 3)
    // let anotherBarcode = Barcode.qrCode("ABCDEFGHIJKLMNOP")

    func barcodeType(barcode: Barcode) {
        switch productBarcode {
        case .upc(let numOne, let numTwo, let numThree, let numFour):
            print("upc: \(numOne), \(numTwo), \(numThree), \(numFour)")
        case .qrCode:
            print("qrCode: nothing")
        }
    }
    barcodeType(barcode: productBarcode)

    enum Shape {
        case circle(radius: Double)
        case rectangle(width: Double, height: Double)
    }

    func circleRadius(shape: Shape) {
        switch shape {
        case .circle(let radius):
            print("\(radius)")
        default:
            print("other shape")
        }
    }
    let circleShape = Shape.circle(radius: 10.5)
    circleRadius(shape: circleShape)

}

// raw value
do {
    enum CompassPoint: Character {
        case north = "N"
        case south = "S"
        case east = "E"
        case west = "W"
    }
    print(CompassPoint.north.rawValue)

    let possibleDirection = CompassPoint(rawValue: "N")
    if let possibleDirection {
        print(possibleDirection)
    }
    enum Grade: String {
        case a = "A"
        case b = "B"
        case c = "C"
        case d = "D"
        case f = "F"
    }
    let grade = Grade.b
    print(grade.rawValue)

}

// Recursive Enumerations
do {

}
