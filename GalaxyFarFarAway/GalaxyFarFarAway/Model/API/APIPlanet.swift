import Foundation

struct APIPlanet: Decodable {
    let name: String
    let climate: String
    let population: String
    let url: String
}

extension APIPlanet {
    func toModel() -> Planet {
        Planet(
            name: name,
            population: population,
            climates: climate.toClimates
        )
    }
}

private extension String {
    var toClimates: [Climate] {
        self.split(separator: ", ").compactMap { "\($0)".toClimate }
    }
}

private extension String {
    var toClimate: Climate? {
        guard let climate = Climate(rawValue: self) else {
            debugPrint("Unhandled climate: \(self)")
            return nil
        }
        return climate
    }
}
