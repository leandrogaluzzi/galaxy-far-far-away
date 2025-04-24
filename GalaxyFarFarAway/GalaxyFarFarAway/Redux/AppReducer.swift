import Foundation
import Redux

func appReducer(
    state: AppState,
    action: AppAction
) -> AppState {
    var state = state
    switch action {
    case let .planets(action):
        state.planets = planetsReducer(state: state.planets, action: action)
    case let .films(action):
        state.films = filmsReducer(state: state.films, action: action)
    }
    return state
}

func planetsReducer(
    state: PlanetsState,
    action: PlanetsAction
) -> PlanetsState {
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

func filmsReducer(
    state: FilmsState,
    action: FilmsAction
) -> FilmsState {
    var state = state
    switch action {
    case let .setFilms(films):
        state.films = films
    default:
        break
    }
    return state
}
