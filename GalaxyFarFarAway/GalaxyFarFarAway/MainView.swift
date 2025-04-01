import SwiftUI

struct MainView: View {
    @EnvironmentObject private var store: GalaxyFarFarAwayStore

    var body: some View {
        Text("A long time ago in a galaxy far, far away...")
    }
}

#Preview {
    MainView()
}
