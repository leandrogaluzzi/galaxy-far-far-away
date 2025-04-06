@testable import GalaxyFarFarAway

final class PlanetsRepositoringSuccessMock: PlanetsRepositoring {
    let planetList: PlanetList

    init(planetList: PlanetList = PlanetList.Stubs.stub) {
        self.planetList = planetList
    }

    func fetchPlanetList(page: Int) async throws -> GalaxyFarFarAway.PlanetList {
        planetList
    }
}
