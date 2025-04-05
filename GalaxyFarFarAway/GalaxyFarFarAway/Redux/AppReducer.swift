import Foundation
import Redux

func appReducer(
    state: AppState,
    action: AppAction
) -> AppState {
    var state = state
    switch action {
    case .fetchPlanetsError:
        state.loadingState = .error
    case let .setPlanetList(planetList):
        state.loadingState = .loaded
        if state.page == 1 {
            state.planets = planetList.planets
        } else {
            state.planets.append(contentsOf: planetList.planets)
        }
        state.isNextAvailable = planetList.isNextAvailable
    case .incrementPage:
        state.page += 1
    case .resetPage:
        state.page = 1
    default:
        break
    }
    return state
}
