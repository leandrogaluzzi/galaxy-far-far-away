import SwiftUI

struct PlanetsListView: View {
    @EnvironmentObject private var store: Store

    var body: some View {
//        Text("A long time ago in a galaxy far, far away...")
        VStack {
            ForEach(store.state.planets, id: \.self) { planet in
                Text(planet.name)
            }
        }
        .onAppear {
            store.dispatch(FetchPlanets())
        }
    }
}

#Preview {
    PlanetsListView()
}
