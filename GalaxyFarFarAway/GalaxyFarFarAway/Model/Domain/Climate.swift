import Foundation

enum Climate: String {
    case arid
    case frozen
    case murky
    case temperate
    case tropical
}

extension Climate {
    var emoji: String {
        switch self {
        case .arid:
            return "🌵"
        case .frozen:
            return "❄️"
        case .murky:
            return "🌫️"
        case .temperate:
            return "🌿"
        case .tropical:
            return "🌴"
        }
    }
}

extension Array where Element == Climate {
    var emoji: String {
        return map(\.emoji).joined(separator: " ")
    }
}
