func oneMore(than number: Int) -> Int {
    return number + 1
}

var myNumber = 1
myNumber = oneMore(than: myNumber)
print(myNumber)

var stepSize = 1

func increment(_ number: inout Int) {
    number += stepSize
}
// increment(&stepSize)
var copyOfStepSize = stepSize
increment(&copyOfStepSize)
print(copyOfStepSize)

func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}
var playerOneScore = 42
var playerTwoScore = 30
balance(&playerOneScore, &playerTwoScore)  // OK
// balance(&playerOneScore, &playerOneScore)

//Conflicting Access to self in Methods
struct Player {
    var name: String
    var health: Int
    var energy: Int

    static let maxHealth = 10
    mutating func restoreHealth() {
        health = Player.maxHealth
    }
}

extension Player {
    mutating func shareHealth(with teammate: inout Player) {
        balance(&teammate.health, &health)
    }
}

var oscar = Player(name: "Oscar", health: 10, energy: 10)
var maria = Player(name: "Maria", health: 5, energy: 10)
oscar.shareHealth(with: &maria)  // OK
print(oscar.energy, oscar.health)
// oscar.shareHealth(with: &oscar)
// Error: Conflicting accesses to oscar.
var playerInformation = (health: 10, energy: 20)
// balance(&playerInformation.health, &playerInformation.energy)

func someFunction() {
    var oscar = Player(name: "Oscar", health: 10, energy: 10)
    balance(&oscar.health, &oscar.energy)  // OK
}