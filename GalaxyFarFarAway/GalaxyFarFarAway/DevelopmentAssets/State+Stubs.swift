import Foundation

extension AppState {
    enum Stubs {
        static let loading = AppState(
            loadingState: .loading,
            planets: []
        )

        static let loaded = AppState(
            loadingState: .loaded,
            planets: [
                .Stubs.tatooine,
                .Stubs.alderaan,
                .Stubs.yavin
            ]
        )

        static let error = AppState(
            loadingState: .error,
            planets: []
        )
    }
}
