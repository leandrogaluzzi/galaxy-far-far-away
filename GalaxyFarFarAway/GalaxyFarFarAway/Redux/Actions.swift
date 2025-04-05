import Foundation
import Redux

struct FetchPlanets: ReduxAction {}

struct FetchPlanetsError: ReduxAction {}

struct IncrementPage: ReduxAction {}

struct ResetPage: ReduxAction {}

struct SelectPlanet: ReduxAction {
    let planet: Planet
}

struct SetPlanetList: ReduxAction {
    let planetList: PlanetList
}
