import SwiftUI

struct PlanetCardView: View {
    let planet: PlanetListItem
    
    var body: some View {
        Text(planet.name)
    }
}

#Preview {
    PlanetCardView()
}
