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
    case let action as SetPlanetList:
        state.loadingState = .loaded
        state.planets.append(contentsOf: action.planetList.planets)
        state.isNextAvailable = action.planetList.isNextAvailable
    case _ as IncrementPage:
        state.page += 1
    case _ as ResetPage:
        state.planets = []
        state.page = 1
    default:
        break
    }
    return state
}
