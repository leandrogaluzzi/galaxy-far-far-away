import Redux
import Testing
@testable import GalaxyFarFarAway

final class FetchPlanetsTests {
    private var state: AppState
    private var sut: Middleware<AppState, AppAction>
    private var planetsRepository: PlanetsRepositoringMock

    init() {
        self.state = AppState()
        self.planetsRepository = .init()
        self.sut = fetchPlanets(
            repository: planetsRepository
        )
    }

    @Test
    func fetchPlanets_isNextAvailable_false() async throws {
        // Given
        state.isNextAvailable = false
        // When
        let result = await sut(state, .fetchPlanets)
        
        // Then
        #expect(result == nil)
    }

    @Test
    func fetchPlanets_() async throws {
        // Given
        let tatooine = Planet.Stubs.tatooine
        let planetList = PlanetList(
            planets: [
                tatooine
            ],
            isNextAvailable: true
        )

        planetsRepository = PlanetsRepositoringMock(planetList: planetList)

        // When
        let result = await sut(state, .fetchPlanets)
        
        // Then
        #expect(result == .setPlanetList(planetList))
    }
}
