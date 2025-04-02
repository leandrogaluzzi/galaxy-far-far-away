import Foundation

public protocol ReduxAction: Sendable {}
public protocol ReduxState: Equatable, Sendable {}

public typealias Dispatcher = @MainActor (ReduxAction) -> Void
public typealias Reducer<State: ReduxState> = @MainActor (State, ReduxAction) -> State
public typealias Middleware<State: ReduxState> = (State, ReduxAction, Dispatcher) async -> Void

@MainActor
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

    public func dispatch(_ action: ReduxAction) {
        state = reducer(state, action)

        middlewares.forEach { middleware in
            Task {
                await middleware(state, action, dispatch)
            }
        }
    }
}
