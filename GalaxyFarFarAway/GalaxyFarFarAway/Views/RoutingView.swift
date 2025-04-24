import Navigation
import SwiftUI

enum NavigationDestination: Hashable {
    case details(planet: Planet)
}

struct RoutingView: View {
    @EnvironmentObject var router: NavigationRouter

    var body: some View {
        NavigationStack(path: $router.path) {
            MainView()
                .navigationDestination(for: NavigationDestination.self) { destination in
                    switch destination {
                    case let .details(planet):
                        PlanetDetailsView(planet: planet)
                    }
                }
        }
    }
}
