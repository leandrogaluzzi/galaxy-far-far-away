import Navigation
import Redux
import Testing
@testable import GalaxyFarFarAway

@MainActor
final class NavigationHandlerTests {
    private var sut: Middleware<AppState, AppAction>!
    private var state: AppState
    private var router: NavigationRouter!

    init() {
        self.state = AppState()
    }

    @Test
    func selectPlanet() async throws {
        // Given
        router = NavigationRouter()
        sut = navigationHandler(router: router)
        let planet = Planet.Stubs.tatooine
        // When
        let result = await sut(state, .selectPlanet(planet))

        // Then
        #expect(!router.path.isEmpty)
        #expect(result == nil)
    }
}
