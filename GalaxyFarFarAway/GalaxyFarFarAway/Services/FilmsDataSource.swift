import Foundation
import Network

protocol FilmsDataSourcing: Sendable {
    func fetchFilms() async throws -> [Film]
}

struct FilmsDataSource: FilmsDataSourcing {
    private let apiClient: APIClienting
    
    init(apiClient: APIClienting) {
        self.apiClient = apiClient
    }
    
    func fetchFilms() async throws -> [Film] {
        guard var urlComponents = URLComponents(string: "https://swapi.tech/api/films/") else {
            throw URLError(.badURL)
        }

        let response = try await apiClient.request(
            components: urlComponents,
            response: APIFilmsResponse.self
        )

        return response.result.map { $0.toModel() }
    }
}
