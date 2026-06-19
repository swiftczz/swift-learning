let divede_line = String(repeating: "-", count: 50)
do {
    struct Dog {
        var name: String
        var age: Int
        init(name: String, age: Int) {
            self.name = name
            self.age = age
        }
    }
    let dog = Dog(name: "dog", age: 12)
    print(dog.name, dog.age)

}

do {
    class Vehicle {
        var numberOfWheels: Int

        // Vehicle 的指定初始化器
        init(numberOfWheels: Int) {
            self.numberOfWheels = numberOfWheels
            print("Vehicle 初始化完成，轮子数量：\(numberOfWheels)")  // 添加打印
        }
    }

    class Car: Vehicle {
        var brand: String
        var topSpeed: Double

        init(brand: String, numberOfWheels: Int, topSpeed: Double) {
            self.brand = brand
            self.topSpeed = topSpeed
            super.init(numberOfWheels: numberOfWheels)
            print("Car 指定初始化器完成，品牌：\(brand)，速度：\(topSpeed)")  // 添加打印
        }
        convenience init(brand: String) {
            self.init(brand: brand, numberOfWheels: 4, topSpeed: 180.0)
            print("通过便利初始化器创建了一辆 \(brand) 汽车。")
        }

        convenience init() {
            // 也可以调用另一个便利初始化器，但最终必须调用一个指定初始化器
            self.init(brand: "Generic", numberOfWheels: 4, topSpeed: 150.0)
            print("通过无参数便利初始化器创建了一辆通用汽车。")
        }
    }

    let myGenericCar = Car()  // 调用无参数便利初始化器
    print(myGenericCar.brand, myGenericCar.numberOfWheels)

    print(divede_line)
    let myBrandCar = Car(brand: "BMW")  // 调用带 brand 参数的便利初始化器
    print(myBrandCar.brand, myBrandCar.numberOfWheels)
    print(divede_line)
    let myCustomCar = Car(brand: "Audi", numberOfWheels: 4, topSpeed: 250.0)  // 调用指定初始化器
    print(myCustomCar.brand, myCustomCar.numberOfWheels)
    print(divede_line)

}
do {
    class Animal {
        var species: String
        init?(species: String) {
            if species.isEmpty {
                return nil
            }
            self.species = species
        }
    }
    let someCreature = Animal(species: "Giraffe")
    if let giraffe = someCreature {
        print("创建了一只长颈鹿：\(giraffe.species)")
    } else {
        print("无法创建长颈鹿实例。")
    }
    let anonymousCreature = Animal(species: "")
    if let anonymous = anonymousCreature {
        print("创建了一只匿名生物：\(anonymous.species)")
    } else {
        print("无法创建匿名生物实例。")
    }
}

// Required Initializers

do {
    class Vehicle {
        var numberOfWheels: Int

        // 必要初始化器
        required init(numberOfWheels: Int) {
            self.numberOfWheels = numberOfWheels
            print("Vehicle 必要初始化器被调用，轮子数量：\(numberOfWheels)")
        }
    }

    class Car: Vehicle {
        var brand: String

        // 子类 Car 必须实现父类的必要初始化器
        // 并且也必须用 required 关键字修饰
        required init(numberOfWheels: Int) {
            self.brand = "Default Brand"  // 初始化子类自己的属性
            super.init(numberOfWheels: numberOfWheels)  // 调用父类的必要初始化器
            print("Car 必要初始化器被调用，品牌：\(self.brand)")
        }

        // Car 也可以有自己的其他指定初始化器
        init(brand: String, numberOfWheels: Int) {
            self.brand = brand
            super.init(numberOfWheels: numberOfWheels)
            print("Car 自定义指定初始化器被调用，品牌：\(self.brand)")
        }
    }

    class Truck: Vehicle {
        var cargoCapacity: Double

        // 子类 Truck 也必须实现父类的必要初始化器
        required init(numberOfWheels: Int) {
            self.cargoCapacity = 0.0  // 初始化子类自己的属性
            super.init(numberOfWheels: numberOfWheels)
            print("Truck 必要初始化器被调用，载货量：\(self.cargoCapacity)")
        }
    }

    let myCar = Car(numberOfWheels: 4)  // 调用 Car 的必要初始化器
    print(divede_line)
    let myTruck = Truck(numberOfWheels: 6)  // 调用 Truck 的必要初始化器
    print(divede_line)
    let customCar = Car(brand: "Tesla", numberOfWheels: 4)  // 调用 Car 的自定义指定初始化器

}
// Initializer Delegation for Value Types
do{
    
}