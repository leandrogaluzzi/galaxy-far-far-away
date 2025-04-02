import Foundation
import Redux

struct AppState: ReduxState {
    var loadingState: LoadingState = .loading
    var planets: [Planet] = []
}
