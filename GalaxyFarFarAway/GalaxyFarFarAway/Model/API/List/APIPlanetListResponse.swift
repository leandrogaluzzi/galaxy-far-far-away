import Foundation

struct APIPlanetListResponse: Decodable {
    let count: Int
    let next: String
    let results: [APIPlanetListItem]
}

extension APIPlanetListResponse {
    func toModel() -> [PlanetListItem] {
        results.map { $0.toModel() }
    }
}
