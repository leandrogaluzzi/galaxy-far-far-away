import SwiftUI

@MainActor
final class Router: ObservableObject {
    @Published var path = NavigationPath()

    func navigate(to destination: any Hashable) {
        path.append(destination)
    }

    func navigateBack() {
        path.removeLast()
    }
}
