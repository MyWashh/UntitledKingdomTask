import UIKit

enum Colors: String {
    case red
    case purple
    case blue
    case yellow
    case green
    case black

    init(_ rawValue: String) {
        self = Colors(rawValue: rawValue.lowercased()) ?? .black
    }

    var uiColor: UIColor {
        switch self {
        case .red: return .red
        case .black: return .black
        case .purple: return .purple
        case .blue: return .blue
        case .yellow: return .yellow
        case .green: return .green
        }
    }
}
