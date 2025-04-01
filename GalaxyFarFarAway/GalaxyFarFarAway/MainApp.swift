import SwiftUI

@main
struct MainApp: App {
    private let store = GalaxyFarFarAwayStore(
        initialState: GalaxyFarFarAwayState(),
        reducer: galaxyFarFarAwayReducer
    )

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(store)
        }
    }
}
