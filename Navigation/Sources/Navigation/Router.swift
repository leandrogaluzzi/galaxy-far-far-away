import SwiftUI

@MainActor
public final class NavigationRouter: ObservableObject {
    @Published public var path = NavigationPath()

    public init() { }

    public func navigate(to destination: any Hashable) {
        path.append(destination)
    }

    public func navigateBack() {
        path.removeLast()
    }
}
