import Foundation
import Redux

struct FetchPlanets: ReduxAction {}

struct FetchPlanetsError: ReduxAction {}

struct SelectPlanet: ReduxAction {
    let planet: Planet
}

struct SetPlanets: ReduxAction {
    let planets: [Planet]
}
