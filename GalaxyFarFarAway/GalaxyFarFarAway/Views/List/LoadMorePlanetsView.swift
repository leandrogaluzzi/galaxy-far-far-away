import SwiftUI

struct LoadMorePlanetsView: View {
    @EnvironmentObject private var store: AppStore

    var body: some View {
        Color.clear.frame(height: 1)
            .onAppear {
                store.dispatch(IncrementPage())
                store.dispatch(FetchPlanets())
            }
    }
}

#Preview {
    LoadMorePlanetsView()
}
