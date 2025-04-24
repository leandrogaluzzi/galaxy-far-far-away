import SwiftUI

struct LoadMorePlanetsView: View {
    @EnvironmentObject private var store: AppStore

    var body: some View {
        Color.clear.frame(height: 1)
            .onAppear {
                store.dispatch(.planets(.incrementPage))
                store.dispatch(.planets(.fetchPlanets))
            }
    }
}

#Preview {
    LoadMorePlanetsView()
}
