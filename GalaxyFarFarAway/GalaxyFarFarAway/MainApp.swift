import SwiftUI
import Network
import Redux

@main
struct MainApp: App {
    
    
    private let apiClient: APIClienting
    private let planetsDataSource: PlanetsDataSourcing
    private let planetsRepository: PlanetsRepositoring
    private let router: Router
    private let store: AppStore

    init() {
        self.apiClient = APIClient()
        self.planetsDataSource = PlanetsDataSource(apiClient: apiClient)
        self.planetsRepository = PlanetsRepository(dataSource: planetsDataSource)
        self.router = Router()

        self.store = AppStore(
            initialState: AppState(),
            reducer: appReducer,
            middlewares: [
                fetchPlanets(repository: planetsRepository),
                navigationHandler(router: router)
            ]
        )
    }

    var body: some Scene {
        WindowGroup {
            RoutingView()
                .environmentObject(store)
                .environmentObject(router)
        }
    }
}
