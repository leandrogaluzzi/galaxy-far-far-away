import Foundation
import Redux

func reducer(
    state: State,
    action: ReduxAction
) -> State {
    var state = state
    switch action {
    case _ as FetchPlanets:
        state.loadingState = .loading
    case let action as SetPlanets:
        state.loadingState = .loaded
        state.planets = action.planets
    case _ as FetchPlanetsError:
        state.loadingState = .error
        state.planets = []
    default:
        break
    }
    return state
}
