import Foundation
import Redux

struct FetchPlanets: ReduxAction {}

struct SetPlanets: ReduxAction {
    let planets: [PlanetListItem]
}

struct FetchPlanetsError: ReduxAction {}
