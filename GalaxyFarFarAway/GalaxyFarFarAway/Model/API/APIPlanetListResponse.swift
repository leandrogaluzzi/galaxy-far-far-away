import Foundation

struct APIPlanetListResponse: Decodable {
    let results: [APIPlanet]
    let next: String?
}

extension APIPlanetListResponse {
    func toModel() -> PlanetList {
        PlanetList(
            planets: results.map { $0.toModel() },
            isNextAvailable: next != nil
        )
    }
}
