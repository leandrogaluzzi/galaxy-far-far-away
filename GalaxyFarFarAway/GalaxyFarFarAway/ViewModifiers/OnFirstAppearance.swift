import SwiftUI

struct OnFirstAppearance: ViewModifier {
    @State private var didFirstAppear = false

    let action: () -> Void

    func body(content: Content) -> some View {
        content
            .onAppear {
                guard !didFirstAppear else { return }
                didFirstAppear = true
                action()
            }
    }
}

extension View {
    func onFirstAppear(perform action: @escaping () -> Void) -> some View {
        modifier(OnFirstAppearance(action: action))
    }
}
