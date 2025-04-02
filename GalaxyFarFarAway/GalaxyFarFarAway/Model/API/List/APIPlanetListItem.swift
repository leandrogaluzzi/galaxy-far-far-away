import Foundation

struct APIPlanetListItem {
    let name: String
    let climate: String
    let population: String
    let url: String
}

extension APIPlanetDetails {
    func toModel() -> PlanetListItem {
        PlanetListItem(
            name: name
        )
    }
}
