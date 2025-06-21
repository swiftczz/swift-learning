do {
    let quotation = """
        The White Rabbit put on his spectacles.  "Where shall I begin,
        please your Majesty?" he asked.

        "Begin at the beginning," the King said gravely, "and go on
        till you come to the end; then stop."
        """
    print(quotation)
    let singleLineString = "These are the same."
    print(singleLineString)
    let multilineString = """
        These are the same.
        """
    print(multilineString)

    let softWrappedQuotation = """
        The White Rabbit put on his spectacles.  "Where shall I begin, \
        please your Majesty?" he asked.

        "Begin at the beginning," the King said gravely, "and go on \
        till you come to the end; then stop."
        """
    print(softWrappedQuotation)
    let lineBreaks = """

        This string starts with a line break.
            It also ends with a line break.

        """
    print(lineBreaks)
}

do {
    // Special Characters in String Literals
    let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
    print(wiseWords)
    let dollarSign = "\u{24}"
    print(dollarSign)
    let blackHeart = "\u{2665}"
    print(blackHeart)
    let sparklingHeart = "\u{1F496}"
    print(sparklingHeart)

    let threeDoubleQuotationMarks = """
        Escaping the first quotation mark \"""
        Escaping all three quotation marks \"\"\"
        """
    print(threeDoubleQuotationMarks)
}
do {
    //Extended String Delimiters
    let threeMoreDoubleQuotationMarks = #"""
        Here are three more double quotes: """
        """#
    print(threeMoreDoubleQuotationMarks)
}
do {
    // Initializing an Empty String
    let emptyString = ""
    if emptyString.isEmpty {
        print("Nothing to see here")
    }
}

do {
    // Character
    let exclamationMark: Character = "!"
    let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
    let catString = String(catCharacters)
    print(catString)
    var welcome = "welcome"
    welcome.append(exclamationMark)
    print(welcome)

    let goodStart = """
        one
        two

        """
    let badStart = """
        one
        two
        """
    let end = """
        three
        """
    let endString = "three"
    print(badStart + end)
    print(goodStart + end)
    print(goodStart + endString)

}
do {
    // String Interpolation
    let multiplier = 3
    let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
    print(message)
    print(#"Write an interpolated string in Swift using \(multiplier)."#)
    print(#"6 times 7 is \#(6 * 7)."#)
}
do {
    let eAcute: Character = "\u{E9}"  // é
    let combinedEAcute: Character = "\u{65}\u{301}"
    print("eacute: \(eAcute)")
    print("combinedEAcute: \(combinedEAcute)")

    let precomposed: Character = "\u{D55C}"  // 한
    let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"

    let cnChar: Character = "\u{6C49}"
    print(precomposed, decomposed)
    print(cnChar)
    let enclosedEAcute: Character = "\u{E9}\u{20DD}"
    print(enclosedEAcute)
    let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
    print(regionalIndicatorForUS)
    let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
    print("unusualMenagerie has \(unusualMenagerie.count) characters")
    var word = "cafe"
    print("the number of characters in \(word) is \(word.count)")
    // Prints "the number of characters in cafe is 4"

    word += "\u{0301}"  // COMBINING ACUTE ACCENT, U+0301

    print("the number of characters in \(word) is \(word.count)")
}
do {
    // Accessing and Modifying a String
    let greeting = "Guten Tag!"
    // print(greeting.index(after: greeting.endIndex))
    print(greeting.endIndex)
    print(greeting[greeting.startIndex])
    print(greeting[greeting.index(after: greeting.startIndex)])
    print(greeting[greeting.index(before: greeting.endIndex)])
    let index = greeting.index(greeting.startIndex, offsetBy: 1)
    print(greeting[index])
    let index2 = greeting.index(greeting.startIndex, offsetBy: 1, limitedBy: greeting.endIndex)
    if let index2 {
        print(index2)
    }
    for index in greeting {
        print("\(index)", terminator: "")
    }
    print()
    for index in greeting.indices {
        print("\(greeting[index]) index: \(index)")
    }

    var welcome = "hello"
    welcome.insert(contentsOf: "!", at: welcome.endIndex)
    print(welcome)
    welcome.insert("!", at: welcome.endIndex)
    print(welcome)
    welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
    print(welcome)
    welcome.remove(at: welcome.index(before: welcome.endIndex))
    // welcome now equals "hello there"
    print(welcome)
    let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
    welcome.removeSubrange(range)
    print(welcome)

    do {
        var greeting = "Hello, world!"
        let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
        let beginning = greeting[..<index]
        // beginning is "Hello"
        print(beginning)
        greeting = "dd"
        print(beginning)

        // Convert the result to a String for long-term storage.
        // let newString = String(beginning)
        // print(newString)
    }

}
do {
    // Comparing Strings
    let quotation = "We're a lot alike, you and I."
    let sameQuotation = "We're a lot alike, you and I."
    if quotation == sameQuotation {
        print("These two strings are considered equal")
    }

    // "Voulez-vous un café?" using LATIN SMALL LETTER E WITH ACUTE
    let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"
    print(eAcuteQuestion)
    // "Voulez-vous un café?" using LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
    let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"
    print(combinedEAcuteQuestion)
    if eAcuteQuestion == combinedEAcuteQuestion {
        print("These two strings are considered equal")
    }

    let latinCapitalLetterA: Character = "\u{41}"
    print(latinCapitalLetterA)
    let cyrillicCapitalLetterA: Character = "\u{0410}"
    print(cyrillicCapitalLetterA)
    if latinCapitalLetterA != cyrillicCapitalLetterA {
        print("These two characters aren't equivalent.")
    }
}
do {
    // Prefix and Suffix Equality
    let romeoAndJuliet = [
        "Act 1 Scene 1: Verona, A public place",
        "Act 1 Scene 2: Capulet's mansion",
        "Act 1 Scene 3: A room in Capulet's mansion",
        "Act 1 Scene 4: A street outside Capulet's mansion",
        "Act 1 Scene 5: The Great Hall in Capulet's mansion",
        "Act 2 Scene 1: Outside Capulet's mansion",
        "Act 2 Scene 2: Capulet's orchard",
        "Act 2 Scene 3: Outside Friar Lawrence's cell",
        "Act 2 Scene 4: A street in Verona",
        "Act 2 Scene 5: Capulet's mansion",
        "Act 2 Scene 6: Friar Lawrence's cell",
    ]
    var act1SceneCount = 0
    for scene in romeoAndJuliet {
        if scene.hasPrefix("Act 1 ") {
            act1SceneCount += 1
        }
    }
    print("There are \(act1SceneCount) scenes in Act 1")

    var mansionCount = 0
    var cellCount = 0
    for scene in romeoAndJuliet {
        if scene.hasSuffix("Capulet's mansion") {
            mansionCount += 1
        } else if scene.hasSuffix("Friar Lawrence's cell") {
            cellCount += 1
        }
    }
    print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")

    let dogString = "Dog‼🐶"
    for codeUnit in dogString.utf8 {
        print("\(codeUnit) ", terminator: "")
    }
    print("")
    for codeUnit in dogString.utf16 {
        print("\(codeUnit) ", terminator: "")
    }
    print("")
    for codeUnit in dogString.unicodeScalars {
        print("\(codeUnit) ", terminator: "")
    }
    print()
    for scalar in dogString.unicodeScalars {
        print("\(scalar.value) ", terminator: "")
    }
    print()
}


let decomposed: String = "\u{1112}\u{1161}\u{11AB}"
print("\(decomposed) length is \(decomposed.count)")