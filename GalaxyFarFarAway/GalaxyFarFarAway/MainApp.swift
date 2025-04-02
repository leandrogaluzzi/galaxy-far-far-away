import SwiftUI
import Network
import Redux

@main
struct MainApp: App {
    private let apiClient: APIClienting
    private let planetsDataSource: PlanetsDataSourcing
    private let planetsRepository: PlanetsRepositoring
    private let store: Store

    init() {
        self.apiClient = APIClient()
        self.planetsDataSource = PlanetsDataSource(apiClient: apiClient)
        self.planetsRepository = PlanetsRepository(dataSource: planetsDataSource)
        self.store = Store(
            initialState: State(),
            reducer: reducer,
            middlewares: [
                fetchPlanets(repository: planetsRepository)
            ]
        )
    }

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                PlanetsListView()
            }
            .environmentObject(store)
        }
    }
}
