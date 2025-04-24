import Foundation
import Redux

enum AppAction: ReduxAction {
    case planets(PlanetsAction)
    case films(FilmsAction)
}

enum PlanetsAction: ReduxAction {
    case fetchPlanets
    case fetchPlanetsError
    case incrementPage
    case resetPage
    case selectPlanet(Planet)
    case setPlanetList(PlanetList)
}

enum FilmsAction: ReduxAction {
    case fetchFilms
    case setFilms([Film])
}
