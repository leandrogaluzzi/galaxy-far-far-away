import Foundation

protocol PlanetsRepositoring: Sendable {
    func fetchPlanets() async throws -> [PlanetListItem]
}

struct PlanetsRepository: PlanetsRepositoring {
    private let dataSource: PlanetsDataSourcing

    init(dataSource: PlanetsDataSourcing) {
        self.dataSource = dataSource
    }

    func fetchPlanets() async throws -> [PlanetListItem] {
        try await dataSource.fetchPlanets()
    }
}
