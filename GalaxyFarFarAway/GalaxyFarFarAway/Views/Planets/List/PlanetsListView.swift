import SwiftUI

struct PlanetsListView: View {
    @EnvironmentObject private var store: AppStore

    var body: some View {
        VStack {
            switch store.state.planets.loadingState {
            case .loading:
                ProgressView()
            case .loaded:
                list()
            case .error:
                Color.red
            }
        }
        .navigationTitle("In a galaxy far, far away...")
        .navigationBarTitleDisplayMode(.inline)
        .onFirstAppear {
            store.dispatch(.planets(.fetchPlanets))
        }
    }

    private func list() -> some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(store.state.planets.planets, id: \.self) { planet in
                    PlanetCardView(planet: planet)
                        .onTapGesture {
                            store.dispatch(.planets(.selectPlanet(planet)))
                        }
                }
                LoadMorePlanetsView()
            }
            .padding(.horizontal, 20)
        }
        .refreshable {
            store.dispatch(.planets(.resetPage))
            store.dispatch(.planets(.fetchPlanets))
        }
    }
}

#Preview("Loaded") {
    PlanetsListView()
        .environmentObject(AppStore.Stubs.loaded)
}


#Preview("Loading") {
    PlanetsListView()
        .environmentObject(AppStore.Stubs.loading)
}

#Preview("Error") {
    PlanetsListView()
        .environmentObject(AppStore.Stubs.error)
}
