import Foundation

extension AppState {
    enum Stubs {
        static let loading = AppState(
            planets: [],
            loadingState: .loading,
            page: 1,
            isNextAvailable: true
        )

        static let loaded = AppState(
            planets: [
                .Stubs.tatooine,
                .Stubs.alderaan,
                .Stubs.yavin
            ],
            loadingState: .loaded,
            page: 1,
            isNextAvailable: true
        )

        static let error = AppState(
            planets: [],
            loadingState: .error,
            page: 1,
            isNextAvailable: true
        )
    }
}
