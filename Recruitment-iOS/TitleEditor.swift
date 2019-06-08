import Foundation

struct TitleEditor {
    static func modifyTitle(title: String) -> String {
        var newTitle = String()
        for (index, letter) in title.enumerated() {
            let newLetter = index % 2 == 0 ? String(letter).uppercased() : String(letter).lowercased()
            newTitle += newLetter
        }
        return newTitle
    }
}
