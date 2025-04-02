import Foundation

extension PlanetListItem {
    enum Stubs {
        static let tatooine = PlanetListItem(
            name: "Tatooine",
            population: "50",
            climates: [
                .arid
            ]
        )

        static let alderaan = PlanetListItem(
            name: "Alderaan",
            population: "100",
            climates: [
                .temperate
            ]
        )

        static let yavin = PlanetListItem(
            name: "Yavin IV",
            population: "200",
            climates: [
                .tropical
            ]
        )
    }
}
