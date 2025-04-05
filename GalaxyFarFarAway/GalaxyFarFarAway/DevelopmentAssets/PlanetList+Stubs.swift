import Foundation

extension PlanetList {
    enum Stubs {
        static let stub = PlanetList(
            planets: [
                Planet.Stubs.tatooine,
                Planet.Stubs.alderaan,
                Planet.Stubs.yavin
            ],
            isNextAvailable: true
        )
    }
}
