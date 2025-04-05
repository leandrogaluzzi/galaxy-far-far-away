import Foundation

public protocol ReduxAction: Equatable, Sendable {}

public extension ReduxAction {
    func debugVerbose(maxDepth: Int = .max) {
        dump(self, indent: 4, maxDepth: maxDepth)
    }
}

