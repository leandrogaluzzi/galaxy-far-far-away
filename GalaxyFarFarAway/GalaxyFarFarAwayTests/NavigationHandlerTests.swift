import Redux
import Testing
@testable import GalaxyFarFarAway

@MainActor
final class NavigationHandlerTests {
    private var state: AppState
    private var sut: Middleware<AppState, AppAction>!
    private var router: Router!

    init() {
        self.state = AppState()
    }

    @Test
    func selectPlanet() async throws {
        // Given
        router = Router()
        sut = navigationHandler(router: router)
        let planet = Planet.Stubs.tatooine
        // When
        let result = await sut(state, .selectPlanet(planet))

        // Then
        #expect(!router.path.isEmpty)
        #expect(result == nil)
    }
}
