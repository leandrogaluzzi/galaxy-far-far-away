import Foundation
import Redux

struct AppState: ReduxState {
    var planets: [Planet] = []
    var loadingState: LoadingState = .loading
    var page: Int = 1
    var isNextAvailable: Bool = true
    
}
