import SwiftUI

struct PlanetsListView: View {
    @EnvironmentObject private var store: AppStore

    var body: some View {
        VStack {
            switch store.state.loadingState {
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
            store.dispatch(FetchPlanets())
        }
    }

    private func list() -> some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(store.state.planets, id: \.self) { planet in
                    PlanetCardView(planet: planet)
                        .onTapGesture {
                            store.dispatch(SelectPlanet(planet: planet))
                        }
                }
            }
            .padding(.horizontal, 20)
        }
        .refreshable {
            store.dispatch(FetchPlanets())
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
