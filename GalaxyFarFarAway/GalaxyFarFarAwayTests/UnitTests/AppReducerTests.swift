import Redux
import Testing
@testable import GalaxyFarFarAway

final class AppReducerTests {
    private var sut: (AppState, AppAction) -> AppState
    private let state: AppState

    init() {
        self.state = AppState()
        self.sut = appReducer
    }
    
    @Test
    func initialState() async throws {
        #expect(state.loadingState == .loading)
        #expect(state.planets.isEmpty)
        #expect(state.page == 1)
        #expect(state.isNextAvailable)
    }
    
    @Test
    func fetchPlanetsError() async throws {
        // When
        let newState = sut(state, .fetchPlanetsError)
        // Then
        #expect(newState.loadingState == .error)
    }

    @Test
    func setPlanetList_() async throws {
        // Given
        let planetList = PlanetList.Stubs.stub
        // When
        let newState = sut(state, .setPlanetList(planetList))
        // Then
        #expect(newState.loadingState == .loaded)
        #expect(newState.planets == planetList.planets)
        #expect(newState.isNextAvailable == planetList.isNextAvailable)
    }

    @Test
    func incrementPage() async throws {
        // When
        let newState = sut(state, .incrementPage)
        // Then
        #expect(newState.page == 2)
    }

    @Test
    func resetPage() async throws {
        // When
        let newState = sut(state, .resetPage)
        // Then
        #expect(newState.page == 1)
    }
}
