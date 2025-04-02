import Foundation

protocol PlanetsRepositoring: Sendable {
    func fetchPlanets() async throws -> [Planet]
}

struct PlanetsRepository: PlanetsRepositoring {
    private let dataSource: PlanetsDataSourcing

    init(dataSource: PlanetsDataSourcing) {
        self.dataSource = dataSource
    }

    func fetchPlanets() async throws -> [Planet] {
        try await dataSource.fetchPlanets()
    }
}
