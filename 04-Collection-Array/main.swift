do {
    // array
    var someInts: [Int] = []
    print("someInts is of type [Int] with \(someInts.count) items.")

    // var someInts = [Int]()
    // print("someInts is of type [Int] with \(someInts.count) items.")
    someInts.append(3)

    someInts = []
    let threeDoubles = Array(repeating: 0.0, count: 3)
    print("\(threeDoubles)")

    let anotherThreeDoubles = Array(repeating: 2.5, count: 3)
    let sixDoubles = threeDoubles + anotherThreeDoubles
    print("\(sixDoubles)")
    var shoppingList: [String] = ["Eggs", "Milk"]
    print("The shopping list contains \(shoppingList.count) items.")

    if shoppingList.isEmpty {
        print("The shopping list is empty.")
    } else {
        print("The shopping list isn't empty.")
    }

    shoppingList.append("Flour")
    shoppingList += ["Baking Powder"]
    shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
    print(shoppingList.firstIndex(of: "Cheese")!)
    print("shoppingList is \(shoppingList), and the first element is \"\(shoppingList[0])\"")
    shoppingList[0] = "Six eggs"
    print("shoppingList is \(shoppingList), and the first element is \"\(shoppingList[0])\"")
    shoppingList[4...6] = ["Bananas", "Apples"]
    print("shoppingList is \(shoppingList), and the first element is \"\(shoppingList[0])\"")
    shoppingList.insert("apple", at: 0)
    print(shoppingList)
    let removed_element = shoppingList.remove(at: 0)
    print(shoppingList)
    print(removed_element)
    let apples = shoppingList.removeLast()
    print(apples)
    print(shoppingList)
    let last_one = shoppingList.remove(at: shoppingList.count - 1)
    print(last_one)
    print(shoppingList)
    for (index, value) in shoppingList.enumerated() {
        print("Item \(index + 1): \(value)")
    }

}
do {
    // set

    var letters = Set<Character>()
    print("letters is of type Set<Character> with \(letters.count) items.")
    letters.insert("a")
    letters = []
    var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
    print("\(type(of: favoriteGenres))")
    let mirror = Mirror(reflecting: favoriteGenres)
    print(mirror)
    // var favoriteGenres1: Set = ["Rock", "Classical", "Hip hop"]
    print("I have \(favoriteGenres.count) favorite music genres.")
    if favoriteGenres.isEmpty {
        print("As far as music goes, I'm not picky.")
    } else {
        print("I have particular music preferences.")
    }
    favoriteGenres.insert("Jazz")
    if let removedGenre = favoriteGenres.remove("Rock") {
        print("\(removedGenre)? I'm over it.")
    } else {
        print("I never much cared for that.")
    }
    if favoriteGenres.contains("Funk") {
        print("I get up on the good foot.")
    } else {
        print("It's too funky in here.")
    }
    for genre in favoriteGenres {
        print("\(genre)")
    }
    for genre in favoriteGenres.sorted() {
        print("\(genre)")
    }

    let oddDigits: Set = [1, 3, 5, 7, 9]
    let evenDigits: Set = [0, 2, 4, 6, 8]
    let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
    print(oddDigits.union(evenDigits))
    print(oddDigits.intersection(evenDigits))
    print(oddDigits.subtracting(singleDigitPrimeNumbers).sorted())
    print(oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted())
    let houseAnimals: Set = ["🐶", "🐱"]
    let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
    let cityAnimals: Set = ["🐦", "🐭"]
    print(houseAnimals.isSubset(of: farmAnimals))
    print(farmAnimals.isSuperset(of: houseAnimals))
    print(farmAnimals.isDisjoint(with: cityAnimals))

}
do {
    // dicitionary
    var namesOfIntegers: [Int: String] = [:]
    namesOfIntegers[16] = "sixteen"
    namesOfIntegers[11] = "eleven"
    print(namesOfIntegers)
    var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
    print(airports)
    print("The airports dictionary contains \(airports.count) items.")
    if airports.isEmpty {
        print("The airports dictionary is empty.")
    } else {
        print("The airports dictionary isn't empty.")
    }
    airports["LHR"] = "London"
    print(airports)
    airports["LHR"] = "London Heathrow"
    print(airports)
    if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
        print("The old value for DUB was \(oldValue).")
    }
    if let airportName = airports["DUB"] {
        print("The name of the airport is \(airportName).")
    } else {
        print("That airport isn't in the airports dictionary.")
    }
    airports["APL"] = "Apple International"
    print(airports)
    airports["APL"] = nil
    print(airports)
    if let removedValue = airports.removeValue(forKey: "DUB") {
        print("The removed airport's name is \(removedValue).")
    } else {
        print("The airports dictionary doesn't contain a value for DUB.")
    }

    for (airportCode, airportName) in airports {
        print("\(airportCode): \(airportName)")
    }
    for airportCode in airports.keys {
        print("Airport code: \(airportCode)")
    }

    for airportName in airports.values {
        print("Airport name: \(airportName)")
    }
    let airportCodes = [String](airports.keys.sorted())
    // airportCodes is ["LHR", "YYZ"]
    print(airportCodes)
    let airportNames = [String](airports.values)
    print(airportNames)
    for (index, airport) in airports.enumerated() {
        print("第\(index)个机场: \(airport)")
    }

    // 按照键（key）排序遍历
    print("\n按照键（key）排序遍历:")
    for key in airports.keys.sorted() {
        print("\(key): \(airports[key]!)")
    }

    // 按照值（value）排序遍历
    print("\n按照值（value）排序遍历:")
    for value in airports.values.sorted() {
        // 注意：如果多个键对应相同的值，这种方法可能不会遍历所有键值对
        let keys = airports.filter { $0.value == value }.map { $0.key }
        for key in keys {
            print("\(key): \(value)")
        }
    }

    // 使用sorted(by:)对字典的键值对进行排序后遍历
    print("\n使用sorted(by:)按键排序遍历:")
    for (key, value) in airports.sorted(by: { $0.key < $1.key }) {
        print("\(key): \(value)")
    }

    // 使用sorted(by:)对字典的键值对按值进行排序后遍历
    print("\n使用sorted(by:)按值排序遍历:")
    for (key, value) in airports.sorted(by: { $0.value < $1.value }) {
        print("\(key): \(value)")
    }

}
