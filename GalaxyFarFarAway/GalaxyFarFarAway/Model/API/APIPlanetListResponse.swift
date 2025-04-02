import Foundation

struct APIPlanetListResponse: Decodable {
    let count: Int
    let next: String
    let results: [APIPlanet]
}

extension APIPlanetListResponse {
    func toModel() -> [Planet] {
        results.map { $0.toModel() }
    }
}
