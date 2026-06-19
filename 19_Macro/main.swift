import Foundation
func myFunction() {
    print("Currently running \(#function)")
    // #warning("Something's wrong")
}

@OptionSet<Int>
struct SundaeToppings {
    private enum Options: Int {
        case nuts
        case cherry
        case fudge
    }
}

// let magicNumber = #fourCharacterCode("ABCD")