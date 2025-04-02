import Foundation

struct Planet: Equatable, Hashable {
    let name: String
    let population: String
    let climates: [Climate]
}
