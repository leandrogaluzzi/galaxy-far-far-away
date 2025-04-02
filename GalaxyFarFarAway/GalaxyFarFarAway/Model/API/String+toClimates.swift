import Foundation

extension String {
    var toClimates: [Climate] {
        self.split(separator: ", ").compactMap { "\($0)".toClimate }
    }
}

private extension String {
    var toClimate: Climate? {
        guard let climate = Climate(rawValue: self) else {
            debugPrint("Unhandled climate: \(self)")
            return nil
        }
        return climate
    }
}
