import Foundation

struct PlanetListItem: Equatable, Hashable {
    let name: String
    let population: String
    let climates: [Climate]
}
