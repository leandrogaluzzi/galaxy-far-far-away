import Foundation
import Redux

func reducer(
    state: State,
    action: ReduxAction
) -> State {
    var state = state
    switch action {
    case let action as SetPlanets:
        state.planets = action.planets
    default:
        break
    }
    return state
}
