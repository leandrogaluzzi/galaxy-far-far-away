import Foundation

public protocol ReduxAction {}
public protocol ReduxState: Equatable {}

public typealias Dispatcher = (ReduxAction) -> Void
public typealias Reducer<State: ReduxState> = (State, ReduxAction) -> State
public typealias Middleware<State: ReduxState> = (State, ReduxAction, Dispatcher) -> Void

// @MainActor
public final class ReduxStore<State: ReduxState>: ObservableObject {
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

    public func dispatch(action: ReduxAction) {
        state = reducer(state, action)

        middlewares.forEach { middleware in
            middleware(state, action, dispatch)
        }
    }
}
