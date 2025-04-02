import Foundation

extension Planet {
    enum Stubs {
        static let tatooine = Planet(
            name: "Tatooine",
            population: "50",
            diameter: "10465",
            gravity: "1 standard",
            climates: [
                .arid
            ],
            terrains: [
                .desert
            ]
        )

        static let alderaan = Planet(
            name: "Alderaan",
            population: "100",
            diameter: "10465",
            gravity: "1 standard",
            climates: [
                .temperate
            ],
            terrains: [
                .grasslands
            ]
        )

        static let yavin = Planet(
            name: "Yavin IV",
            population: "200",
            diameter: "10465",
            gravity: "1 standard",
            climates: [
                .tropical
            ],
            terrains: [
                .tundra
            ]
        )
    }
}
