import Foundation

struct APIPlanet: Decodable {
    let name: String
    let population: String
    let diameter: String
    let gravity: String
    let climate: String
    let terrain: String
}

extension APIPlanet {
    func toModel() -> Planet {
        Planet(
            name: name,
            population: population,
            diameter: diameter,
            gravity: gravity,
            climates: climate.toClimates,
            terrains: terrain.toTerrains
        )
    }
}

private extension String {
    private var toClimate: Climate? {
        guard let climate = Climate(rawValue: self) else {
            debugPrint("Unhandled climate: \(self)")
            return nil
        }
        return climate
    }

    private var toTerrain: Terrain? {
        guard let terrain = Terrain(rawValue: self) else {
            debugPrint("Unhandled terrain: \(self)")
            return nil
        }
        return terrain
    }

    var toClimates: [Climate] {
        self.split(separator: ", ").compactMap { "\($0)".toClimate }
    }
    
    var toTerrains: [Terrain] {
        self.split(separator: ", ").compactMap { "\($0)".toTerrain }
    }
}
