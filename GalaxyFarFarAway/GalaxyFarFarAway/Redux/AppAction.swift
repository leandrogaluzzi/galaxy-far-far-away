import Foundation
import Redux

enum AppAction: ReduxAction {
    case fetchPlanets
    case fetchPlanetsError
    case incrementPage
    case resetPage
    case selectPlanet(Planet)
    case setPlanetList(PlanetList)
}
