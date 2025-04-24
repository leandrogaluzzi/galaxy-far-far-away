import Foundation

protocol PlanetsRepositoring: Sendable {
    func fetchPlanetList(page: Int) async throws -> PlanetList
    func fetchFilms() async throws -> [Film]
}

struct PlanetsRepository: PlanetsRepositoring {
    private let dataSource: PlanetsDataSourcing

    init(dataSource: PlanetsDataSourcing) {
        self.dataSource = dataSource
    }

    func fetchPlanetList(page: Int) async throws -> PlanetList {
        try await dataSource.fetchPlanetList(page: page)
    }

    func fetchFilms() async throws -> [Film] {
        try await dataSource.fetchFilms()
    }
}
