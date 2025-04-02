import Foundation
import Redux

struct State: ReduxState {
    var loadingState: LoadingState = .loading
    var planets: [PlanetListItem] = []
}


