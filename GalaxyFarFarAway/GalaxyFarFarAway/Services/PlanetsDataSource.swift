import Foundation
import Network

protocol PlanetsDataSourcing: Sendable {
    func fetchPlanetList(page: Int) async throws -> PlanetList
    func fetchFilms() async throws -> [Film]
}

struct PlanetsDataSource: PlanetsDataSourcing {
    private let apiClient: APIClienting
    
    init(apiClient: APIClienting) {
        self.apiClient = apiClient
    }
    
    func fetchPlanetList(page: Int) async throws -> PlanetList {
        guard var urlComponents = URLComponents(string: "https://swapi.tech/api/planets/") else {
            throw URLError(.badURL)
        }
        urlComponents.queryItems = [URLQueryItem(name: "page", value: "\(page)")]
        
        let response = try await apiClient.request(
            components: urlComponents,
            response: APIPlanetListResponse.self
        )
        
        return response.toModel()
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
