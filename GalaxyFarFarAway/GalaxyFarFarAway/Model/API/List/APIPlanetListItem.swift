import Foundation

struct APIPlanetListItem: Decodable {
    let name: String
    let climate: String
    let population: String
    let url: String
}

extension APIPlanetListItem {
    func toModel() -> PlanetListItem {
        PlanetListItem(
            name: name
        )
    }
}
