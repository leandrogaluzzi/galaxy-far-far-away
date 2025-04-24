import SwiftUI
import Navigation
import Network
import Redux

@main
struct MainApp: App {
    private let apiClient: APIClienting
    private let planetsDataSource: PlanetsDataSourcing
    private let planetsRepository: PlanetsRepositoring
    private let filmsDataSource: FilmsDataSourcing
    private let filmsRepository: FilmsRepositoring
    private let router: NavigationRouter
    private let store: AppStore

    init() {
        self.apiClient = APIClient()
        self.planetsDataSource = PlanetsDataSource(apiClient: apiClient)
        self.planetsRepository = PlanetsRepository(dataSource: planetsDataSource)
        self.filmsDataSource = FilmsDataSource(apiClient: apiClient)
        self.filmsRepository = FilmsRepository(dataSource: filmsDataSource)
        self.router = NavigationRouter()

        self.store = AppStore(
            initialState: AppState(),
            reducer: appReducer,
            middlewares: [
                fetchPlanets(repository: planetsRepository),
                fetchFilms(repository: filmsRepository),
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
