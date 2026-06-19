struct Item {
    var price: Int
    var count: Int
}

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}
class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11),
    ]

    var coinsDeposited = 0

    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }

        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }

        guard coinsDeposited >= item.price else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }

        coinsDeposited -= item.price
        inventory[name]?.count -= 1
    }

}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}

let vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8

do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
    print("Success! Yum.")
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
    print("Out of Stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
} catch {
    print("Unexpected error: \(error).")
}

func nourish(with item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    } catch is VendingMachineError {
        print("Couldn't buy that from the vending machine.")
    }
}

do {
    try nourish(with: "Beet-Flavored Chips")
} catch {
    print("Unexpected non-vending-machine-related error: \(error)")
}

func eat(item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    } catch VendingMachineError.invalidSelection, VendingMachineError.insufficientFunds,
        VendingMachineError.outOfStock
    {
        print("Invalid selection, out of stock, or not enough money.")
    }
}

do {
    try eat(item: "xxxx")
} catch {
    print("Unexpected non-vending-machine-related error: \(error)")
}
let _ = try! eat(item: "xxxx")

enum StatisticsError: Error {
    case noRatings
    case invalidRating(Int)
}
// 指定函数抛出特定错误类型
func summarize(_ ratings: [Int]) throws(StatisticsError) {
    guard !ratings.isEmpty else {
        throw StatisticsError.noRatings
    }
    var counts = [1: 0, 2: 0, 3: 0]
    for rating in ratings {
        guard rating > 0 && rating <= 3 else { throw .invalidRating(rating) }
        counts[rating]! += 1
    }
    print("*", counts[1]!, "-- **", counts[2]!, "-- ***", counts[3]!)
}

do {

    func someThrowingFunction() throws {
        let ratings = [1, 2, 3, 2, 2, 1]
        try summarize(ratings)
    }
    try! someThrowingFunction()

    // 调用函数不抛出错误
    func nonThrowingFunction() throws(Never) {
        let ratings = [1, 2, 3, 2, 2, 1]
        try! summarize(ratings)
    }
    nonThrowingFunction()

    func nonThrowingFunctionNoError() {
        let ratings = [1, 2, 3, 2, 2, 1]
        try! summarize(ratings)
    }
    nonThrowingFunction()
}

do {
    let ratings: [Int] = []
    do throws(StatisticsError) {
        try summarize(ratings)
    } catch {
        switch error {
        case .noRatings:
            print("No ratings provided.")
        case .invalidRating(let rating):
            print("Invalid rating provided: \(rating). Ratings must be between 1 and 3.")
        }
    }
}

do {
    let ratings: [Int] = []
    do {
        try summarize(ratings)
    } catch {
        switch error {
        case .noRatings:
            print("No ratings provided.")
        case .invalidRating(let rating):
            print("Invalid rating provided: \(rating). Ratings must be between 1 and 3.")
        }
    }
}
