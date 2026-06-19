import Foundation

func countWords(in filePath: String) -> Int {
    let file = URL(filePath: filePath)

    do {
        let content = try Data(contentsOf: file)
        let string = String(decoding: content, as: UTF8.self)
        let count = string.split { $0.isWhitespace }.count
        return count
    } catch {
        print("Error reading file: \(error)")
        return 0
    }

}



let filePath1 = "operator.txt"
let wordCount = countWords(in: filePath1)
print("The file \(filePath1) has \(wordCount) words.")

let filePath2 = "access.txt"
let wordCount2 = countWords(in: filePath2)
print("The file \(filePath2) has \(wordCount2) words.")
