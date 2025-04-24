import Foundation

protocol FilmsRepositoring: Sendable {
    func fetchFilms() async throws -> [Film]
}

struct FilmsRepository: FilmsRepositoring {
    private let dataSource: FilmsDataSourcing

    init(dataSource: FilmsDataSourcing) {
        self.dataSource = dataSource
    }

    func fetchFilms() async throws -> [Film] {
        try await dataSource.fetchFilms()
    }
}
