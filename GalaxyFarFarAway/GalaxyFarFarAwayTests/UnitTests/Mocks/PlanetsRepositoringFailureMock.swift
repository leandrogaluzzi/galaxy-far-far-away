import Network
@testable import GalaxyFarFarAway

final class PlanetsRepositoringFailureMock: PlanetsRepositoring {
    func fetchPlanetList(page: Int) async throws -> GalaxyFarFarAway.PlanetList {
        throw APIError.invalidURL
    }
}
