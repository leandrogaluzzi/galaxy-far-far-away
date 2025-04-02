import Foundation

struct APIPlanetDetails: Decodable {
    let name: String
}

extension APIPlanetDetails {
    func toModel() -> PlanetDetails {
        PlanetDetails(
            name: name
        )
    }
}
