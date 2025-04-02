import SwiftUI

enum NavigationDestination: Hashable {
    case details(planet: Planet)
}

struct RoutingView: View {
    @EnvironmentObject var router: Router

    var body: some View {
        NavigationStack(path: $router.path) {
            PlanetsListView()
                .navigationDestination(for: NavigationDestination.self) { destination in
                    switch destination {
                    case let .details(planet):
                        PlanetDetailsView(planet: planet)
                    }
                }
        }
    }
}
