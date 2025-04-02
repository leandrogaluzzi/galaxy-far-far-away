import Foundation

enum Terrain: String {
    case cityscape
    case desert
    case forests
    case gasGiant = "gas giant"
    case grasslands
    case grassyHills = "grassy hills"
    case iceCaves = "ice caves"
    case jungle
    case jungles
    case lakes
    case mountainRanges = "mountain ranges"
    case mountains
    case ocean
    case rainforests
    case swamp
    case swamps
    case tundra
}

extension Terrain {
    var emoji: String {
        switch self {
        case .cityscape:
            return "🏙️"
        case .desert:
            return "🏜️"
        case .forests:
            return "🌲"
        case .gasGiant:
            return "🌌"
        case .grasslands:
            return "🌾"
        case .grassyHills:
            return "🌄"
        case .iceCaves:
            return "❄️"
        case .jungle:
            return "🌿"
        case .jungles:
            return "🌿"
        case .lakes:
            return "🌊"
        case .mountainRanges:
            return "🏔️"
        case .mountains:
            return "🌋"
        case .ocean:
            return "🌊"
        case .rainforests:
            return "🌳"
        case .swamp:
            return "🌿"
        case .swamps:
            return "🌿"
        case .tundra:
            return "❄️"
        }
    }
}

extension Array where Element == Terrain {
    var emoji: String {
        return map(\.emoji).joined(separator: " ")
    }
}
