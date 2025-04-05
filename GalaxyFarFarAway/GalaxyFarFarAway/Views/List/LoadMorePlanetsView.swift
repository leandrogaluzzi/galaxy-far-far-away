import SwiftUI

struct LoadMorePlanetsView: View {
    @EnvironmentObject private var store: AppStore

    var body: some View {
        Color.clear.frame(height: 1)
            .onAppear {
                store.dispatch(.incrementPage)
                store.dispatch(.fetchPlanets)
            }
    }
}

#Preview {
    LoadMorePlanetsView()
}
