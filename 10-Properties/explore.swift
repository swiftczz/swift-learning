import Foundation

do {
    struct Car {
        var brand: String
        let year: Int

        var age: Int {
            return 2024 - year
        }
    }
    let myCar = Car(brand: "Ford", year: 1990)
    print(myCar.age)  // 输出多少？

}
do {
    struct Car {
        var brand: String {
            didSet(oldValue) {  // oldValue 为默认值
                print("品牌从 \(oldValue) 改成了 \(brand)")
            }
        }
        let year: Int

        var age: Int {
            return 2024 - year
        }
    }
    var myCar = Car(brand: "Toyota", year: 2020)
    myCar.brand = "Honda"
}

do {

    struct Car {
        var brand: String
        var year: Int  // 现在改成 var，因为我们要改它

        var age: Int {
            get {
                return 2024 - year
            }
            set(newValue) {  // newValue 为默认值
                year = 2024 - newValue
            }
        }
    }

    var myCar = Car(brand: "BMW", year: 2020)
    print("age: \(myCar.age)")
    print("year: \(myCar.year)")

    print("修改后")
    myCar.age = 10
    print("age: \(myCar.age)")
    print("year: \(myCar.year)")  // 输出？ → ?

}

do {
    struct Rectangle {
        var length: Double {
            didSet {
                print("length \(oldValue) has become \(length)")

            }
        }
        var width: Double {
            didSet {
                print("width \(oldValue) has become \(width)")
            }
        }

        var area: Double {
            get {
                return length * width
            }
            set {
                width = sqrt(newValue / 1.5)
                length = 1.5 * width
            }
        }
    }

    var myRectangle = Rectangle(length: 3, width: 2)
    print("length: \(myRectangle.length), width: \(myRectangle.width), area: \(myRectangle.area)")

    myRectangle.length = 6
    myRectangle.width = 4

    myRectangle.area = 6
    print("length: \(myRectangle.length), width: \(myRectangle.width), area: \(myRectangle.area)")
}

do {
    struct Rectangle {
        var length: Double {
            didSet {
                print("length \(oldValue) has become \(length)")

            }
        }
        var width: Double {
            didSet {
                print("width \(oldValue) has become \(width)")
            }
        }

        var area: Double {
            get {
                return length * width
            }
            set {
                length = newValue / width
            }
        }
        var perimeter: Double {
            return 2 * length * width
        }
    }

    var myRectangle = Rectangle(length: 3, width: 2)

    myRectangle.area = 9
    print("length: \(myRectangle.length), width: \(myRectangle.width), area: \(myRectangle.area)")
}
do {
    struct Rectangle {
        var length: Double {
            willSet { print("马上就要变成 \(newValue) 了！") }
            didSet { print("length \(oldValue) has become \(length)") }
        }
        var width: Double {
            didSet { print("width \(oldValue) has become \(width)") }
        }

        var area: Double {
            get { return length * width }
            set { length = newValue / width }
        }
        var perimeter: Double { return 2 * length * width }
    }

    var myRectangle = Rectangle(length: 5, width: 4)

    // myRectangle.area = 9
    print("\nwillset and didset")
    myRectangle.length = 10

    print("length: \(myRectangle.length), width: \(myRectangle.width), area: \(myRectangle.area)")
}

// lazy property
do{
    struct DataProcessor{
        var data:[Int] = Array(1...10000)
        lazy var summary:String = {
            print("正在生成摘要（这可能需要一点时间）...")
            return "数据共\(data.count), 最大值 \(data.max()!)"
        }()
    }
    var processor = DataProcessor()

    print(processor.summary)
}