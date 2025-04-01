import SwiftUI

@main
struct MainApp: App {
    private let store = GalaxyFarFarAwayStore(
        initialState: State(),
        reducer: reducer,
        middlewares: [
            
        ]
    )

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(store)
        }
    }
}
