import Foundation

extension State {
    enum Stubs {
        static let loaded = State(
            loadingState: .loaded,
            planets: [
                .Stubs.tatooine,
                .Stubs.alderaan,
                .Stubs.yavin
            ]
        )
    }
}
