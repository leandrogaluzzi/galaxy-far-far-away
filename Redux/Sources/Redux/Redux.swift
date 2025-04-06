import Foundation

public protocol ReduxState: Equatable, Sendable {}

public typealias Reducer<State: ReduxState, Action: ReduxAction> = @MainActor (State, Action) -> State
public typealias Middleware<State: ReduxState, Action: ReduxAction> = (State, Action) async -> Action?

@MainActor
public final class ReduxStore<State: ReduxState, Action: ReduxAction>: ObservableObject {
    @Published public private(set) var state: State

    private let reducer: Reducer<State, Action>
    private let middlewares: [Middleware<State, Action>]
    private let debugMode: ReduxDebugMode

    public init(
        initialState: State,
        reducer: @escaping Reducer<State, Action>,
        middlewares: [Middleware<State, Action>],
        debugMode: ReduxDebugMode = .noDebug
    ) {
        self.state = initialState
        self.reducer = reducer
        self.middlewares = middlewares
        self.debugMode = debugMode
    }

    public func dispatch(_ action: Action) {
        debugActionReceived(action)
        state = reducer(state, action)

        middlewares.forEach { middleware in
            Task {
                if let action = await middleware(state, action) {
                    await MainActor.run {
                        dispatch(action)
                    }
                }
            }
        }
    }
}

private extension ReduxStore {
    func debugActionReceived(_ action: Action) {
        #if DEBUG
        switch debugMode {
        case .noDebug:
            break
        case .verbose:
            action.debugVerbose()
        case let .verboseLimited(depth):
            action.debugVerbose(maxDepth: depth)
        }
        #endif
    }
}
