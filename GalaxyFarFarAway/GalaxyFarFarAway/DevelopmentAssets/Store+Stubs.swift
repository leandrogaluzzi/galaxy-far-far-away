import Foundation

extension Store {
    enum Stubs {
        @MainActor
        static let loaded = Store(
            initialState: .Stubs.loaded,
            reducer: reducer
        )
    }
}
