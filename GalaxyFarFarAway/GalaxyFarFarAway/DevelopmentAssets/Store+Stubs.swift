import Foundation

extension AppStore {
    enum Stubs {
        @MainActor
        static let loading = AppStore(
            initialState: .Stubs.loading,
            reducer: appReducer
        )

        @MainActor
        static let loaded = AppStore(
            initialState: .Stubs.loaded,
            reducer: appReducer
        )

        @MainActor
        static let error = AppStore(
            initialState: .Stubs.error,
            reducer: appReducer
        )
    }
}
