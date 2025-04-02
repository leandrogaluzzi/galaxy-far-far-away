import Foundation

extension State {
    enum Stubs {
        static let loading = State(
            loadingState: .loading,
            planets: []
        )

        static let loaded = State(
            loadingState: .loaded,
            planets: [
                .Stubs.tatooine,
                .Stubs.alderaan,
                .Stubs.yavin
            ]
        )

        static let error = State(
            loadingState: .error,
            planets: []
        )
    }
}
