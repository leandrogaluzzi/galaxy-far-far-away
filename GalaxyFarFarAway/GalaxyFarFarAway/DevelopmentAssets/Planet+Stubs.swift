import Foundation

extension Planet {
    enum Stubs {
        static let tatooine = Planet(
            name: "Tatooine",
            population: "50",
            climates: [
                .arid
            ]
        )

        static let alderaan = Planet(
            name: "Alderaan",
            population: "100",
            climates: [
                .temperate
            ]
        )

        static let yavin = Planet(
            name: "Yavin IV",
            population: "200",
            climates: [
                .tropical
            ]
        )
    }
}
