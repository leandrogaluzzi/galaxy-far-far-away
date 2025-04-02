import Foundation
import Redux

func appReducer(
    state: AppState,
    action: ReduxAction
) -> AppState {
    var state = state
    switch action {
    case _ as FetchPlanetsError:
        state.loadingState = .error
        state.planets = []
    case let action as SetPlanets:
        state.loadingState = .loaded
        state.planets = action.planets
    default:
        break
    }
    return state
}
