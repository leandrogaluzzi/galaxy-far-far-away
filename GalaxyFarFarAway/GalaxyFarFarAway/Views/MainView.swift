import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Tab("Planets", systemImage: "") {
                PlanetsListView()
            }
            Tab("Films", systemImage: "") {
                FilmsView()
            }
        }
    }
}

#Preview {
    MainView()
}
