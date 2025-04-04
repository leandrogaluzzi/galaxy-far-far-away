import Foundation

public protocol APIClienting: Sendable {
    func request<T: Decodable>(
        components: URLComponents,
        response: T.Type
    ) async throws -> T
}

public struct APIClient: APIClienting {
    public init() { }

    public func request<T: Decodable>(
        components: URLComponents,
        response: T.Type
    ) async throws(APIError) -> T {
        guard let url = components.url else {
            throw .invalidURL
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
            return decodedResponse
        } catch {
            debugPrint(error)
            throw .genericError(error)
        }
    }
}
