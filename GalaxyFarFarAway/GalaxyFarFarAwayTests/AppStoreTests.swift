import Testing
@testable import GalaxyFarFarAway

@MainActor
struct AppStoreTests {
    private let sut: AppStore
    private var state: AppState!
    private var planetsRepository: PlanetsRepositoring!
    private var router: Router!

    init() {
        state = AppState()
        planetsRepository = PlanetsRepositoringSuccessMock()
        sut = AppStore(
            initialState: state,
            reducer: appReducer,
            middlewares: [
                fetchPlanets(repository: planetsRepository),
                navigationHandler(router: router)
            ]
        )
    }

    @Test
    func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }
}
