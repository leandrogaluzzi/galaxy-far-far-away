import Foundation

struct Planet: Equatable, Hashable {
    let name: String
    let population: String
    let diameter: String
    let gravity: String
    let climates: [Climate]
    let terrains: [Terrain]
}
