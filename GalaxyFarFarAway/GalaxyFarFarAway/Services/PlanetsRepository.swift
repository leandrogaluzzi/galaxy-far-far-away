import Foundation

protocol PlanetsRepositoring: Sendable {
    func fetchPlanetList(page: Int) async throws -> PlanetList
}

struct PlanetsRepository: PlanetsRepositoring {
    private let dataSource: PlanetsDataSourcing

    init(dataSource: PlanetsDataSourcing) {
        self.dataSource = dataSource
    }

    func fetchPlanetList(page: Int) async throws -> PlanetList {
        try await dataSource.fetchPlanetList(page: page)
    }
}
