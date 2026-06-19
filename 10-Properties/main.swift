//Stored Properties
do {
    struct FixedLengthRange {
        var firstValue: Int
        let length: Int
    }
    var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
    // the range represents integer values 0, 1, and 2
    rangeOfThreeItems.firstValue = 6
    // the range now represents integer values 6, 7, and 8
}

// Lazy Stored Properties
do {
    class DataImporter {
        var filename = "data.txt"
    }

    class DataManager {
        lazy var importer = DataImporter()
        var data: [String] = []
    }
    let manager = DataManager()
    manager.data.append("some data")
    manager.data.append("some more data")

    print("manager: \(manager.data), \(type(of: manager.data))")
    print(manager.importer.filename)
}
// Computed Properties
do {
    struct Point {
        var x = 0.0, y = 0.0
    }
    struct Size {
        var width = 0.0, height = 0.0
    }

    struct Rect {
        var origin = Point()
        var size = Size()
        var center: Point {
            get {
                let centerX = origin.x + size.width / 2
                let centerY = origin.y + size.height / 2
                return Point(x: centerX, y: centerY)
            }

            set(newCenter) {
                origin.x = newCenter.x - (size.width / 2)
                origin.y = newCenter.y - (size.height / 2)
            }
        }

    }
    var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
    let initialSquareCenter = square.center
    print("initialSquareCenter: \(initialSquareCenter)")
    square.center = Point(x: 15.0, y: 15.0)
    print("square.origin is now at (\(square.origin.x), \(square.origin.y))")

}
// property observers
do {
    class StepCounter {
        var totalSteps: Int = 0 {
            willSet(newTotalSteps) {
                print("About to set totalSteps to \(newTotalSteps)")
            }
            didSet {
                if totalSteps > oldValue {
                    print("Added \(totalSteps - oldValue) steps")
                }
            }
        }
    }

    let stepCounter = StepCounter()
    stepCounter.totalSteps = 200
    stepCounter.totalSteps = 360
    stepCounter.totalSteps = 896
}
// property Wrappers
do {
    @propertyWrapper
    struct TwelveOrLess {
        private var number = 0
        var wrappedValue: Int {
            get { return number }
            set { number = min(newValue, 12) }
        }
    }
    struct SmallRectangle {
        @TwelveOrLess var height: Int
        @TwelveOrLess var width: Int
    }
    var rectangle = SmallRectangle()
    print(rectangle.height)

    rectangle.height = 10
    print(rectangle.height)

    rectangle.height = 24
    print(rectangle.height)

    struct TwelveOrLess2 {
        private var number = 0
        var value: Int {
            get { return number }
            set { number = min(newValue, 12) }
        }
    }
    struct SmallRectangle2 {
        private var _height = TwelveOrLess2()
        private var _width = TwelveOrLess2()
        var height: Int {
            get { return _height.value }
            set { _height.value = newValue }
        }
        var width: Int {
            get { return _width.value }
            set { _width.value = newValue }
        }

    }
    var rectangle2 = SmallRectangle2()
    rectangle2.height = 15
    print(rectangle2.height)
}
// Setting Initial Values for Wrapped Properties
do {
    @propertyWrapper
    struct SmallNumber {
        private var maximum: Int
        private var number: Int
        var wrappedValue: Int {
            get { number }
            set { number = min(newValue, maximum) }
        }

        init() {
            self.maximum = 12
            self.number = 0
        }
        init(wrappedValue: Int) {
            self.maximum = 12
            self.number = min(wrappedValue, maximum)
        }
        init(wrappedValue: Int, maximum: Int) {
            self.maximum = maximum
            self.number = min(wrappedValue, maximum)
        }

    }

    struct ZeroRectangle {
        @SmallNumber var height: Int
        @SmallNumber var width: Int
    }

    let zeroRectangle = ZeroRectangle()
    print(zeroRectangle.height, zeroRectangle.width)

    struct UnitRectangle {
        @SmallNumber var height = 1
        @SmallNumber var width = 1
    }
    let unitRectangle = UnitRectangle()
    print(unitRectangle.height, unitRectangle.width)

    struct NarrowRectangle {
        @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
        @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
    }
    var narrowRectangle = NarrowRectangle()
    print(narrowRectangle.height, narrowRectangle.width)
    narrowRectangle.height = 100
    narrowRectangle.width = 100
    print(narrowRectangle.height, narrowRectangle.width)

    struct MixedRectangle {
        @SmallNumber var height: Int = 1
        @SmallNumber(maximum: 9) var width: Int = 2
    }

    var mixedRectangle = MixedRectangle()
    print(mixedRectangle.height)
    // Prints "1"

    mixedRectangle.height = 20
    print(mixedRectangle.height)
}

// Projecting a Value From a Property Wrapper

do {
    @propertyWrapper
    struct SmallNumber {
        private var number: Int
        private(set) var projectedValue: Bool

        var wrappedValue: Int {
            get { return number }
            set {
                if newValue > 12 {
                    number = 12
                    projectedValue = true
                } else {
                    number = newValue
                    projectedValue = false
                }
            }
        }

        init() {
            self.number = 0
            self.projectedValue = false
        }
        init(wrappedValue: Int) {
            self.number = min(wrappedValue, 12)
            self.projectedValue = wrappedValue > 12
        }
    }

    struct SomeStructure {
        @SmallNumber var someNumber: Int
    }
    var someStructure = SomeStructure()

    someStructure.someNumber = 4
    print(someStructure.$someNumber)
    print(someStructure.someNumber)
    // Prints "false"

    someStructure.someNumber = 55
    print(someStructure.$someNumber)
    print(someStructure.someNumber)

    func someFunction() {
        @SmallNumber var myNumber: Int = 1  // 现在可以正常工作了

        myNumber = 10
        print(myNumber)  // 10
        print(_myNumber)  // false

        myNumber = 24
        print(myNumber)  // 12
        print(_myNumber)  // true
    }
    someFunction()

}

// Type Property Syntax
do {
    struct SomeStructure {
        static var storedTypeProperty = "Some value."
        static var computedTypeProperty: Int {
            return 1
        }
    }
    enum SomeEnumeration {
        static var storedTypeProperty = "Some value."
        static var computedTypeProperty: Int {
            return 6
        }
    }
    class SomeClass {
        static var storedTypeProperty = "Some value."
        static var computedTypeProperty: Int {
            return 27
        }
        class var overrideableComputedTypeProperty: Int {
            return 107
        }
    }
    print(SomeStructure.storedTypeProperty)
    // Prints "Some value."
    SomeStructure.storedTypeProperty = "Another value."
    print(SomeStructure.storedTypeProperty)
    // Prints "Another value."
    print(SomeEnumeration.computedTypeProperty)
    // Prints "6"
    print(SomeClass.computedTypeProperty)
    // Prints "27"

}
// Querying and Setting Type Properties

do {
    struct AudioChannel {
        static let thresholdLevel = 10
        static var maxInputLevelForAllChannels = 0
        var currentLevel: Int = 0 {
            didSet {
                if currentLevel > AudioChannel.thresholdLevel {
                    // cap the new audio level to the threshold level
                    currentLevel = AudioChannel.thresholdLevel
                }
                if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                    // store this as the new overall maximum input level
                    AudioChannel.maxInputLevelForAllChannels = currentLevel
                }
            }
        }
    }
    var leftChannel = AudioChannel()
    var rightChannel = AudioChannel()
    leftChannel.currentLevel = 7
    print(leftChannel.currentLevel)
    // Prints "7"
    print(AudioChannel.maxInputLevelForAllChannels)
    // Prints "7"

    rightChannel.currentLevel = 11
    print(rightChannel.currentLevel)
    // Prints "10"
    print(AudioChannel.maxInputLevelForAllChannels)
    // Prints "10"
}
