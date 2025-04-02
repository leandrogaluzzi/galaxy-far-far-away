import Foundation

public enum APIError: Error {
    case invalidURL
    case genericError(Error)
}
