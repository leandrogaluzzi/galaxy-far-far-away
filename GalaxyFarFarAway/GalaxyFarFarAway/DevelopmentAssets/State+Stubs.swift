import Foundation

extension AppState {
    enum Stubs {
        static let loading = AppState(
            planets: .Stubs.loading,
            films: .Stubs.initial
        )

        static let loaded = AppState(
            planets: .Stubs.loaded,
            films: .Stubs.initial
        )

        static let error = AppState(
            planets: .Stubs.error,
            films: .Stubs.initial
        )
    }
}

extension PlanetsState {
    enum Stubs {
        static let loading = PlanetsState(
            planets: [],
            loadingState: .loading,
            page: 1,
            isNextAvailable: true
        )

        static let loaded = PlanetsState(
            planets: [
                .Stubs.tatooine,
                .Stubs.alderaan,
                .Stubs.yavin
            ],
            loadingState: .loaded,
            page: 1,
            isNextAvailable: true
        )

        static let error = PlanetsState(
            planets: [],
            loadingState: .error,
            page: 1,
            isNextAvailable: true
        )
    }
}

extension FilmsState {
    enum Stubs {
        static let initial = FilmsState(
            films: [
                
            ]
        )
    }
}
