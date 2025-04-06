import Foundation

extension AppStore {
    enum Stubs {
        @MainActor
        static let loading = AppStore(
            initialState: .Stubs.loading,
            reducer: appReducer,
            middlewares: []
        )

        @MainActor
        static let loaded = AppStore(
            initialState: .Stubs.loaded,
            reducer: appReducer,
            middlewares: []
        )

        @MainActor
        static let error = AppStore(
            initialState: .Stubs.error,
            reducer: appReducer,
            middlewares: []
        )
    }
}
