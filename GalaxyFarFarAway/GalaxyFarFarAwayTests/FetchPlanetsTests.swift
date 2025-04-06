import Redux
import Testing
@testable import GalaxyFarFarAway

final class FetchPlanetsTests {
    private var sut: Middleware<AppState, AppAction>!
    private var state: AppState
    private var planetsRepository: PlanetsRepositoring!

    init() {
        self.state = AppState()
    }

    @Test
    func fetchPlanets_isNextAvailable_false() async throws {
        // Given
        state.isNextAvailable = false
        planetsRepository = PlanetsRepositoringSuccessMock()
        sut = fetchPlanets(repository: planetsRepository)
        // When
        let result = await sut(state, .fetchPlanets)
        
        // Then
        #expect(result == nil)
    }

    @Test
    func fetchPlanets_success() async throws {
        // Given
        let planetList = PlanetList.Stubs.stub

        planetsRepository = PlanetsRepositoringSuccessMock(planetList: planetList)
        sut = fetchPlanets(repository: planetsRepository)

        // When
        let result = await sut(state, .fetchPlanets)

        // Then
        #expect(result == .setPlanetList(planetList))
    }

    @Test
    func fetchPlanets_failure() async throws {
        // Given
        planetsRepository = PlanetsRepositoringFailureMock()
        sut = fetchPlanets(repository: planetsRepository)

        // When
        let result = await sut(state, .fetchPlanets)

        // Then
        #expect(result == .fetchPlanetsError)
    }
}
