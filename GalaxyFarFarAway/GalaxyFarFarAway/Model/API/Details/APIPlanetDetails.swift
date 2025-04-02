import Foundation

struct APIPlanetDetails {
    let name: String
}

extension APIPlanetDetails {
    func toModel() -> PlanetDetails {
        PlanetDetails(
            name: name
        )
    }
}
