do {
    struct Fahrenheit {
        var temperature: Double
        init() {
            temperature = 32
        }
    }
    let f = Fahrenheit()
    print("The default temperature is \(f.temperature)° Fahrenheit")

    struct Celsius {
        var temperatureInCelsius: Double
        init(fromFahrenheit fahrenheit: Double) {
            temperatureInCelsius = (fahrenheit - 32) / 1.8
        }
        init(fromKelvin kelvin: Double) {
            temperatureInCelsius = kelvin - 273.15
        }
        init(_ celsius: Double) {
            temperatureInCelsius = celsius
        }
    }
    let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
    print(boilingPointOfWater.temperatureInCelsius)
    let freezingPointOfWater = Celsius(fromKelvin: 273.15)
    print(freezingPointOfWater.temperatureInCelsius)

    struct Color {
        var red, green, blue: Double
        init(red: Double, green: Double, blue: Double) {
            self.red = red
            self.green = green
            self.blue = blue
        }
        init(white: Double) {
            self.red = white
            self.green = white
            self.blue = white
        }
    }
    let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
    print(magenta.red)
    let halfGray = Color(white: 0.5)
    print(halfGray.red)
}

do {
    class SurveyQuestion {
        let text: String
        var response: String?
        init(text: String) {
            self.text = text
        }
        func ask() {
            print(text)
        }
    }
    let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
    cheeseQuestion.ask()
    cheeseQuestion.response = "Yes, I do like cheese."

    struct Size {
        var width = 0.0, height = 0.0

    }
    let zeroByTwo = Size(height: 2.0)
    print(zeroByTwo.width, zeroByTwo.height)
}
// Initializer Delegation for Value Types
do {
    struct Size {
        var width = 0.0, height = 0.0
    }
    struct Point {
        var x = 0.0, y = 0.0
    }

    struct Rect {
        var origin = Point()
        var size = Size()
        init() {}
        init(origin: Point, size: Size) {
            self.origin = origin
            self.size = size
        }
        init(center: Point, size: Size) {
            let originX = center.x - (size.width / 2)
            let originY = center.y - (size.height / 2)
            self.init(origin: Point(x: originX, y: originY), size: size)
        }
    }
    let basicRect = Rect()
    print(basicRect.origin, basicRect.size)
    let originRect = Rect(
        origin: Point(x: 2.0, y: 2.0),
        size: Size(width: 5.0, height: 5.0))
    print(originRect.origin, originRect.size)

    let centerRect = Rect(
        center: Point(x: 4.0, y: 4.0),
        size: Size(width: 3.0, height: 3.0))
    print(centerRect.origin, centerRect.size)
}
// Class Inheritance and Initialization
do {

}
