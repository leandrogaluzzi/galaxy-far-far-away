import Foundation
import Network

protocol PlanetsDataSourcing: Sendable {
    func fetchPlanets() async throws -> [PlanetListItem]
}

struct PlanetsDataSource: PlanetsDataSourcing {
    private let apiClient: APIClienting

    init(apiClient: APIClienting) {
        self.apiClient = apiClient
    }

    func fetchPlanets() async throws -> [PlanetListItem] {
        guard let urlComponents = URLComponents(string: "https://swapi.dev/api/planets/") else {
            throw URLError(.badURL)
        }

        let response = try await apiClient.request(
            components: urlComponents,
            response: APIPlanetListResponse.self
        )

        return response.toModel()
    }
}
