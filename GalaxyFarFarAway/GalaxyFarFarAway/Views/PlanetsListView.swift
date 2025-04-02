import SwiftUI

struct PlanetsListView: View {
    @EnvironmentObject private var store: Store

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(store.state.planets, id: \.self) { planet in
                    PlanetCardView(planet: planet)
                }
            }
            .padding(.horizontal, 20)
        }
        .navigationTitle("In a galaxy far, far away...")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            store.dispatch(FetchPlanets())
        }
    }
}

#Preview {
    PlanetsListView()
        .environmentObject(Store.Stubs.loaded)
}
