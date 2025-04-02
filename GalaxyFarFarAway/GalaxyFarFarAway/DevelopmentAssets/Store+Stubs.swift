import Foundation

extension Store {
    enum Stubs {
        @MainActor
        static let loading = Store(
            initialState: .Stubs.loading,
            reducer: reducer
        )

        @MainActor
        static let loaded = Store(
            initialState: .Stubs.loaded,
            reducer: reducer
        )

        @MainActor
        static let error = Store(
            initialState: .Stubs.error,
            reducer: reducer
        )
    }
}
