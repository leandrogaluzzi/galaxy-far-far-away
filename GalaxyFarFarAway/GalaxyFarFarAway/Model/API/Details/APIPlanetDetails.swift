import Foundation

struct APIPlanetDetails: Decodable {
    let name: String
    let climate: String
}

extension APIPlanetDetails {
    func toModel() -> PlanetDetails {
        PlanetDetails(
            name: name,
            climates: climate.toClimates
        )
    }
}
