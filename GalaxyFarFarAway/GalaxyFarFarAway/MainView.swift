import SwiftUI

struct MainView: View {
    @EnvironmentObject private var store: GalaxyFarFarAwayStore

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    MainView()
}
