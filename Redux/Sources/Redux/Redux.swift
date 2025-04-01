import Foundation

public protocol Action {}

public typealias Dispatcher = (Action) -> Void
public typealias Reducer<State> = (State, Action) -> State
public typealias Middleware<State> = (State, Action, Dispatcher) -> Void

// @MainActor
public final class Store<State>: ObservableObject {
    @Published public private(set) var state: State

    private let reducer: Reducer<State>
    private let middlewares: [Middleware<State>]

    public init(
        initialState: State,
        reducer: @escaping Reducer<State>,
        middlewares: [Middleware<State>] = []
    ) {
        self.state = initialState
        self.reducer = reducer
        self.middlewares = middlewares
    }

    public func dispatch(action: Action) {
        state = reducer(state, action)

        middlewares.forEach { middleware in
            middleware(state, action, dispatch)
        }
    }
}
